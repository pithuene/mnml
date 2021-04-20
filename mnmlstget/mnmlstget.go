package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	if len(os.Args) != 2 {
		os.Exit(1)
	}
	target_idx, err := strconv.Atoi(os.Args[1])
	if err != nil {
		os.Exit(1)
	}
	scanner := bufio.NewScanner(os.Stdin)
	idx := -1
	for scanner.Scan() {
		line := scanner.Text()

		// Find target value
		if idx != target_idx {
			if strings.HasPrefix(line, "- ") {
				idx += 1
				// Print the remainder of the matching line
				if idx == target_idx {
					fmt.Println(strings.TrimPrefix(line, "- "))
				}
			}
			continue
		}

		// Print all lines belonging to target value
		if strings.HasPrefix(line, "  ") {
			fmt.Println(strings.TrimPrefix(line, "  "))
			continue
		} else {
			// End of target value
			os.Exit(0)
		}
	}
	if idx != target_idx {
		os.Exit(1)
	}
}
