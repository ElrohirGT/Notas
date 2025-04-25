# Intermediate Go Concepts

## Context

Context has various rules to follow:

1. Incoming requests to a server should create a Context.
1. Outgoing calls to servers should accept a Context.
1. The chain of function calls between them must propagate a Context. You can
   _replace it_ using: `WithContext`, `WithDeadline`, `WithTimeout`,
   `WithValue`.
1. Never store a context in a struct, always pass it as the first argument to a
   function that needs it.

Canceling a parent context cancels all the child contexts it may have.

You can add a `Cause` to a context using the `WithCancelCause`,
`WithDeadlineCause` among others to cancel a context. This makes it so that
`ctx.Err()` now contains an error specified.

### Best Practices

- **NEVER PASS A NIL CONTEXT** Use `context.TODO` if you're unsure about which
  context to use.
- Use context values only for request-scoped data that transits processes and
  APIs, not for passing optional parameters to functions.
- The same Context may be passed to functions running in different goroutines;
  Contexts are safe for simultaneous use by multiple goroutines.

### Examples

Generate integers and stop once a certain number has been reached:

```go
package main

import (
    "context"
    "fmt"
)

func main() {
    gen := func(ctx context.Context) <-chan int {
        dst := make(chan int)
        n := 1
        go func() {
            for {
                select {
                    case <-ctx.Done():
                        return
                    case dst <- n:
                        n++
                }
            }
        }()
        return dst
    }

    ctx, cancel := context.WithCancel(context.Background())
    defer cancel()

    for n := range gen(ctx) {
        fmt.Println(n)
        // Since cancel is gonna be called once this for ends, we stop at 5
        if n == 5 {
            break
        }
    }
}
```

## Type Assertions

If you have a variable like so:

```go
var i interface{} = "Hello!"
```

You can check if its of type string by:

```go
// If `i` is a string then ok == True and s will contain the value as a string.
s, ok := i.(string)
```

You can omit the second return value, if you do, then a panic will be thrown if
`i` is not a string.

A type switch is something like this:

```go
switch v := i.(type) {
    case int:
        // Do something in case is an int
    case string:
        // Do something in case is a string
    default:
        // Do something if neither
}
```

## Panic and Recover

Recover only makes sense to use it inside a defer statement, if used normally
returns nil and never executes. Here's an example:

```go
package main

import "fmt"

func main() {
    f()
    fmt.Println("Returned normally from f.")
}

func f() {
    defer func() {
        if r := recover(); r != nil {
           fmt.Println("Recovered in f", r) 
        }
    }()

    fmt.Println("Calling g.")
    g(0)
    fmt.Println("Returned normally from g.")
}

func g(i int) {
    if i > 3 {
        fmt.Println("Panicking!")
        panic(fmt.Sprintf("%v", i))
    }

    defer fmt.Println("Defer in g", i)
    fmt.Println("Printing in g", i)
    g(i + 1)
}
```

## Channels

Channels are lightweight processes, this means they are user level threads,
which are more more lightweight that processes and a little more than kernel
level threads.

All channels must be initialized before using them:

```go
// Blocks when no message is available/when a message is already in it
chann := make(chan int)
// Blocks when the buffer is empty/full depending on read/write.
bufChan := make(chan int, 10)
```

If you want to use a channel you use the operator:

```go
// send value to the channel
chann <- value

// Receive data from a channel
// isOpen is false if the channel is closed by the writer.
v, isOpen := <- chann
```

You can also iterate a channel until no more values are available:

```go
for i := range chann {
    // Iterate over i values of the channel
}
```

YOU DON'T TECHNICALLY NEED TO CLOSE A CHANNEL! They are not like files, but it's
best practice to do so.

## Synchronization

### Once

Once is an object that will perform an operation exactly once.

**DON'T COPY ONCE AFTER THE FIRST USE.**

An example would be:

```go
package main

import (
	"fmt"
	"sync"
)

func main() {
	var once sync.Once
	onceBody := func() {
		fmt.Println("Only once")
	}
	done := make(chan bool)
	for i := 0; i < 10; i++ {
		go func() {
			once.Do(onceBody)
			done <- true
		}()
	}
	for i := 0; i < 10; i++ {
		<-done
	}
}

// Outputs:
// Only once
```

Special considerations:

- If `f` calls once.Do again, it will deadlock.
- If `f` panics, Do considers it to have returned; future calls of Do return
  without calling `f`. **The program still panics!**

### Wait Groups

If you need to wait for a bunch of go routines to start a task, simply use a
`sync.WaitGroup`.

For example:

```go
package main

import (
    "fmt"
    "sync"
    "time"
)

func worker(id int) {
    fmt.Printf("Worker %d starting\n", id)

    time.Sleep(time.Second)
    fmt.Printf("Worker %d done\n", id)
}

func main() {

    var wg sync.WaitGroup

    for i := 1; i <= 5; i++ {
        wg.Add(1)

        go func() {
            defer wg.Done()
            worker(i)
        }()
    }

    wg.Wait()

}
```
