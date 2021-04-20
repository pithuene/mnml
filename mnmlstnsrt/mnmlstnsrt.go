package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	if len(os.Args) != 3 {
		os.Exit(1)
	}
	target_idx, err := strconv.Atoi(os.Args[1])
	if err != nil {
		os.Exit(1)
	}
	value := os.Args[2]

	scanner := bufio.NewScanner(os.Stdin)
	idx := 0
	for scanner.Scan() {
		if idx == target_idx {
			printValue(value)
			printRemainingLines(scanner)
			os.Exit(0)
		}
		line := scanner.Text()
		if strings.HasPrefix(line, "- ") {
			idx += 1
		}
		fmt.Println(line)
	}
	os.Exit(1)
}

func printRemainingLines(scanner *bufio.Scanner) {
	for scanner.Scan() {
		line := scanner.Text()
		fmt.Println(line)
	}
}

func printValue(value string) {
	if !strings.ContainsRune(value, '\n') {
		// Single line
		fmt.Println("- " + value)
	} else {
		// Multi line
		lines := strings.Split(value, "\n")
		fmt.Println("- " + lines[0])
		for _, line := range lines[1:] {
			fmt.Println("  " + line)
		}
	}
}
