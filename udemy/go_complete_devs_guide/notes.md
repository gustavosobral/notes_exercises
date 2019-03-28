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

Method receivers set up method on variables that we create

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

# Section 5

## Map

Map is a collection of key value pairs. The set of key and the values have to be from the same type.

# Section 6

## Interfaces

There is Concrete Types and Interface Types. 
Interfaces are not generic types.
Interfaces are implicit.
If we specify an interface as a value inside of a struct, the value can have any value so long it fullfills the interface.

```
type Response struct {
    Body io.ReadCloser
}

type ReadCloser interface {
    Reader
    Closer
}

type Reader interface {
    Read(p []byte) (n int, err error)
}
```

`Reader` and `Writer` interfaces are good interfaces examples on Go
