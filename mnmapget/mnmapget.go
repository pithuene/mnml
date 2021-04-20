package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func main() {
	if len(os.Args) != 2 {
		os.Exit(1)
	}
	target := os.Args[1]
	scanner := bufio.NewScanner(os.Stdin)
	prefix := target + ":"

	for scanner.Scan() {
		line := scanner.Text()

		// Find target value
		if strings.HasPrefix(line, prefix) {
			inline_val := strings.TrimPrefix(line, prefix)
			inline_val = strings.TrimPrefix(inline_val, " ")
			if len(inline_val) != 0 {
				// Print the inline value if there is one
				fmt.Println(inline_val)
				os.Exit(0)
			} else {
				// If there is no inline value, print values on the following lines
				printIndentedLines(scanner)
				os.Exit(0)
			}
		}
	}
	// Target key not found
	os.Exit(1)
}

// Print indented and possibly multiline values
func printIndentedLines(scanner *bufio.Scanner) {
	for scanner.Scan() {
		line := scanner.Text()

		if strings.HasPrefix(line, "  ") {
			fmt.Println(strings.TrimPrefix(line, "  "))
		} else {
			break
		}
	}
}
