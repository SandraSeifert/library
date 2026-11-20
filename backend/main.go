package main

import "fmt"

type Author struct {
	Name string
}

type Book struct {
	Title    string
	ISBN     string
	Owned    bool
	Read     bool
	Wishlist bool
	Authors  []Author
}

func main() {
	books := []Book{
		{
			Title:   "KI Genesis",
			ISBN:    "9783689320089",
			Owned:   true,
			Authors: []Author{{"Henry Kissinger"}, {"Eric Schmidt"}, {"Craig Mundie"}},
		},
		{
			Title:   "Disruption",
			ISBN:    "9783421070562",
			Read:    true,
			Authors: []Author{{"Jannis Brühl"}},
		},
		{
			Title: "Testbuch ohne ISBN",
			Owned: true,
		},
	}

	for _, b := range books {
		fmt.Printf("%s (ISBN: %q) %d Autor(en)\n", b.Title, b.ISBN, len(b.Authors))
	}

	for _, isbn := range []string{"9783421070562", "9783421070563", "123", "", "97834210705X2"} {
		if err := ValidateISBN13(isbn); err != nil {
			fmt.Println("Fehler:", err)
		} else {
			fmt.Printf("OK: %q\n", isbn)
		}
	}

	for _, raw := range []string{"0-306-40615-2", "9783421070562", "978-3-421-07056-2", "0306406153", ""} {
		n, err := NormalizeISBN(raw)
		fmt.Printf("%q -> %q, Fehler: %v\n", raw, n, err)
	}
}
