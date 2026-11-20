package main

import (
	"errors"
	"fmt"
	"strconv"
	"strings"
)

var ErrISBNLength = errors.New("ISBN muss 13 Ziffern haben")

// ValidateISBN13 prüft Länge, Ziffern und Prüfziffer.
// Eine leere ISBN ist erlaubt (ältere Bücher haben keine)
func ValidateISBN13(isbn string) error {
	if isbn == "" {
		return nil
	}
	if len(isbn) != 13 {
		return ErrISBNLength
	}

	sum := 0

	for i, r := range isbn {
		if r < '0' || r > '9' {
			return fmt.Errorf("ISBN %q enthält ein ungültiges Zeichen %q", isbn, r)
		}
		digit := int(r - '0')
		if i < 12 {
			if i%2 == 0 {
				sum += digit
			} else {
				sum += digit * 3
			}
		} else {
			check := (10 - sum%10) % 10
			if digit != check {
				return fmt.Errorf("ISBN %q: Prüfziffer %d, erwartet %d", isbn, digit, check)
			}
		}
	}

	return nil

}

func NormalizeISBN(raw string) (string, error) {
	s := strings.ToUpper(strings.NewReplacer("-", "", " ", "").Replace(raw))
	switch len(s) {
	case 0:
		return "", nil
	case 13:
		if err := ValidateISBN13(s); err != nil {
			return "", err
		}
		return s, nil
	case 10:
		return isbn10To13(s)
	default:
		return "", fmt.Errorf("ISBN %q hat %d Zeichen, erwartet 10 oder 13", raw, len(s))
	}
}

func isbn10To13(s string) (string, error) {
	sum := 0
	for i, r := range s {
		var v int
		switch {
		case r >= '0' && r <= '9':
			v = int(r - '0')
		case r == 'X' && i == 9:
			v = 10
		default:
			return "", fmt.Errorf("ISBN %q enthält ein ungültiges Zeichen %q", s, r)
		}
		sum += v * (10 - i)
	}
	if sum%11 != 0 {
		return "", fmt.Errorf("ISBN %q: Prüfsumme stimmt nicht", s)
	}

	body := "978" + s[:9]
	sum13 := 0
	for i, r := range body {
		d := int(r - '0')
		if i%2 == 0 {
			sum13 += d
		} else {
			sum13 += 3 * d
		}
	}
	return body + strconv.Itoa((10-sum13%10)%10), nil
}
