mnml
====

> **m**i**n**imal **m**arkup **l**anguage

A very minimal markup language to add structured data to markdown style notes. Inspired by YAML, but only has a very narrow subset of the features.

- No data types. Every value is a string. If parsing is required, it needs to happen externally.
- Maps and lists
- Two spaces indentation

Example
-------

```
- A list entry
- A multiline
  list
  entry
- key1: First map value
  key2: Second value of this nested map
  key3: 
    - List as a map value
    - Another entry in the nested list
- List
  - List entry one
  - List entry two
```

Programs
--------

This repository includes programs to interact with data in the format described above. All programs expect input from `stdin` and print to `stdout` so they can be chained. To read from file you need to `cat` it yourself.

- `mnmapget <key>` — Get value <u>key</u> from a map
- `mnmlstget <n>` — Get the <u>n</u>-th entry from a list
- `mnmlstnsrt <index> <value>` — Insert <u>value</u> into a list at <u>index</u>
- `mnmlgetpth <key | index>...` — Get the value at a given path from a nested document

