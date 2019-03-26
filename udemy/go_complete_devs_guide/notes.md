# Section 2

## CLI

To run one or two files:

```
$ go run main.go state.go
```

To build and compile the code or project:

```
$ go build main.go
```

To run all tests in a package:

```
$ go test
```

## Concepts

Package: project or workspace. Every file should declare at the very first line what package it belongs to.

There is two types of packages: Executable and Reusable

`main` packages generate executable files. Must have a func called `main`

`import` is used to load packages

# Section 3

## Basic Types

bool - true, false
string - "Hi!", "Hello"
int - 0, -100, 9999
float or float64 - 10.03

## List of records

Every element must be of the same type

Array - Fixed length
Slice - Variable length

```
frutis := []string{"Foo", "Bar", "Baz'}
fruits[:2]
```

## Custom types and Receivers

Receivers set up method on variables that we create

## Type conversion

```
[]byte("Hi there!")
```

# Section 4

## Struct

Collection of types. Variables without assingnment on Go are initialize with Zero values

## Pointers

Go is a pass by value language.

From address to value, do `*address`
From value to address, do `&value`

Slice is Reference Type
