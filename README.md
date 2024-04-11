
<p align="center">
    <img src="https://modular-assets.s3.amazonaws.com/images/mojo_github_logo_bg.png">
</p>

## Introduction to Mojo Programming Language 🔥

Mojo represents a revolutionary leap forward in programming languages, seamlessly blending the elegance of Python's syntax with the power of systems programming and metaprogramming. This unique amalgamation empowers developers to craft high-performance, portable code that surpasses traditional languages like C, all while seamlessly integrating with the extensive Python ecosystem.

## History and Background

Mojo emerged from the visionary mind of [Chris Lattner](https://twitter.com/clattner_llvm?lang=en), CEO, and co-founder of [Modular AI](https://www.modular.com). With a storied history of groundbreaking contributions to Swift, Clang, and LLVM, Lattner's influence permeates Mojo's DNA.

### The Genesis of Mojo

Rooted in Modular AI's mission to democratize AI programming, Mojo addresses the dual challenges of performance and accessibility. By marrying the efficiency of C with the accessibility of Python, Mojo aims to usher in a new era of AI development, where innovation knows no bounds.

### Performance Prowess

Mojo's performance is nothing short of astonishing, boasting a remarkable 35,000x speed improvement over Python. Leveraging advanced techniques such as Multi-Level Intermediate Representation (MLIR) and the LLVM toolchain, Mojo redefines the boundaries of what's possible, setting new standards for performance-driven programming.

## Domain of Mojo

### AI Development

In the realm of AI development, Mojo shines as a beacon of simplicity and power. By abstracting away the complexities of languages like C++, Mojo empowers developers to focus on what truly matters: innovation. With MLIR under the hood, Mojo enables developers to push the boundaries of AI without being bogged down by cumbersome syntax.

### Microservices and Cloud Computing

Mojo's lightweight syntax and built-in concurrency support make it the ideal choice for microservices development in modern cloud architectures. Its seamless scalability and fault tolerance ensure that Mojo-powered applications can handle anything thrown their way, making it a cornerstone of resilient distributed systems.

### Emerging Technologies

In the rapidly evolving landscape of emerging technologies, Mojo stands tall as a versatile and adaptable solution. From AI and machine learning to the Internet of Things (IoT), Mojo's performance, scalability, and interoperability make it the go-to choice for developers tackling the challenges of tomorrow.

## Paradigms

Mojo's multi-paradigm approach empowers developers to tackle any problem with ease, offering the flexibility of imperative, functional, and object-oriented programming paradigms.

### Imperative Programming

Mojo supports imperative programming, allowing developers to write code that specifies the sequence of operations to be performed. This paradigm is well-suited for tasks that require step-by-step execution. For example, the following code snippet demonstrates an imperative approach to calculating the sum of an array of numbers using the Kahan summation algorithm:

```mojo
# Source: https://github.com/modularml/mojo/blob/main/examples/reduce.mojo

from tensor import Tensor

# Simple summation of the array elements
fn naive_reduce_sum[size: Int](array: Tensor[type]) -> Float32:
    var A = array
    var my_sum = array[0]
    var c: Float32 = 0.0
    for i in range(array.dim(0)):
        var y = array[i] - c
        var t = my_sum + y
        c = (t - my_sum) - y
        my_sum = t
    return my_sum
```

### Functional Programming

Mojo's support for functional programming enables developers to write concise, expressive code that emphasizes immutability and pure functions. This paradigm is well-suited for tasks that involve transformations on data structures and parallel processing. However, due to the unmaturity of the functional programming paradigm in Mojo, the language does not yet support higher-order functions, currying, or monads. Nevertheless, developers can still leverage functional programming principles to write elegant and efficient code. For example, Mojo provides `map` functions that allows developers to maps a function over a range from 0 to size:

```mojo
from algorithm import map

fn double(x: Int) -> Int:
    return x * 2

fn main():
 var arr = InlinedFixedVector[Int, 9](9)
 var doubled = map(arr, double)
 print(doubled)
```

### Object-Oriented Programming

Mojo's support for object-oriented programming elevates the language to new heights, empowering developers to conceptualize real-world entities as objects with attributes and methods. This paradigm fosters code organization, reusability, and modularity, facilitating the creation of scalable and maintainable software solutions.

#### Struct

A cornerstone of Mojo's object-oriented capabilities is the struct, a versatile data structure that encapsulates both fields and methods operating on an abstraction, such as a data type or an object. Fields represent variables holding data relevant to the struct, while methods, functions housed within a struct, typically act upon this field data. For instance, consider the following illustrative code snippet, showcasing an object-oriented approach to defining a Planet class with attributes and methods:

```mojo
# Source: https://github.com/modularml/mojo/blob/main/examples/nbody.mojo

@value
struct Planet:
    var pos: SIMD[DType.float64, 4]
    var velocity: SIMD[DType.float64, 4]
    var mass: Float64

    fn __init__(
        inout self,
        pos: SIMD[DType.float64, 4],
        velocity: SIMD[DType.float64, 4],
        mass: Float64,
    ):
        self.pos = pos
        self.velocity = velocity
        self.mass = mass
```

#### Trait

In addition to structs, Mojo boasts robust support for inheritance through traits. A trait, akin to a contract, delineates a set of requirements that a type must fulfill. Comparable to Java interfaces, C++ concepts, Swift protocols, and Rust traits, Mojo's traits offer a flexible mechanism for defining shared behavior among types. Consider the following example of a trait in Mojo:

```mojo
trait Quackable:
    fn quack(self):
        ...
```

Traits, introduced by the trait keyword, consist of method signatures, each denoted by three dots (...) to indicate their unimplemented status. Leveraging traits, developers can create reusable components that adhere to a defined set of behaviors. For instance, Mojo allows the creation of structs conforming to the Quackable trait:

```mojo
@value
struct Duck(Quackable):
    fn quack(self):
        print("Quack")

@value
struct StealthCow(Quackable):
    fn quack(self):
        print("Moo!")
```

Moreover, Mojo facilitates trait inheritance, enabling the creation of hierarchical trait structures. Traits can inherit from other traits, thereby inheriting all requirements declared by their parent traits:

```mojo
trait Animal:
    fn make_sound(self):
        ...

# Bird inherits from Animal
trait Bird(Animal):
    fn fly(self):
        ...

# Inherit from multiple traits
trait Duck(Bird, Quackable):
    ...
```

This hierarchical trait system empowers developers to create expressive and composable abstractions, fostering code that is both flexible and maintainable.

## Standard library

Mojo's standard library is a treasure trove of functionality, offering a rich assortment of modules and utilities to streamline development. From mathematical operations to file I/O and networking, the standard library equips developers with the tools they need to build robust and performant applications. Some of the key modules in Mojo's standard library include:

- [`tensor`](https://docs.modular.com/mojo/stdlib/tensor/): A module for tensor operations, enabling efficient manipulation of multi-dimensional arrays.
- [`python`](https://docs.modular.com/mojo/stdlib/python/): A module for interacting with Python code and data structures, facilitating seamless integration with the Python ecosystem.
- [`algorithm`](https://docs.modular.com/mojo/stdlib/algorithm/): A module containing common algorithms and data structures, such as sorting and functional programming utilities.
- [`collections`](https://docs.modular.com/mojo/stdlib/collections/): A module for working with collections, including lists, sets, and dictionaries.
- [`math`](https://docs.modular.com/mojo/stdlib/math/): A module providing mathematical functions such as polynomial evaluation and bit manipulation.

The current Mojo version includes about 20 modules in its standard library, with plans for further expansion and enhancement in future releases.

## Value Life Cycle

Mojo has no built-in data types with special privileges. All data types in the standard library (such as `Bool`, `Int`, and `String`) are implemented as `structs`. You can actually write your own replacements for these types by using low-level primitives provided by [MLIR dialects](https://docs.modular.com/mojo/notebooks/BoolMLIR.html).

The life of a value in Mojo begins when a variable is initialized and continues up until the value is last used, at which point Mojo destroys it. Mojo destroys every value/object as soon as it's no longer used, using an “as soon as possible” (ASAP) destruction policy that runs after every sub-expression.

### Copy, move constructors, and destructors

Mojo provides a copy constructor, move constructor, and destructor for every struct. The copy constructor is called when a struct is passed by value or returned by value. Below is an example of a struct with copy, move constructors, and a destructor of `HeapArray`:

```mojo
# Source: https://docs.modular.com/mojo/manual/lifecycle/life

struct HeapArray:
    var data: Pointer[Int]
    var size: Int

    fn __init__(inout self, size: Int, val: Int):
        self.size = size
        self.data = Pointer[Int].alloc(self.size)
        for i in range(self.size):
            self.data.store(i, val)

    fn __copyinit__(inout self, existing: Self):
        # Deep-copy the existing value
        self.size = existing.size
        self.data = Pointer[Int].alloc(self.size)
        for i in range(self.size):
            self.data.store(i, existing.data.load(i))

    fn __moveinit__(inout self, owned existing: Self):
        print("move")
        # Shallow copy the existing value
        self.size = existing.size
        self.data = existing.data
        # Then the lifetime of `existing` ends here, but
        # Mojo does NOT call its destructor

    fn __del__(owned self):
        self.data.free()

    fn dump(self):
        print("[", end="")
        for i in range(self.size):
            if i > 0:
                print(", ", end="")
            print(self.data.load(i), end="")
        print("]")
```

## Modules and Package

Mojo provides a packaging system that allows you to organize and compile code libraries into importable files. This page introduces the necessary concepts about how to organize your code into modules and packages (which is a lot like Python), and shows you how to create a packaged binary with the [mojo package](https://docs.modular.com/mojo/cli/package.html) command.

### Modules

A Mojo module is a single Mojo source file that includes code suitable for use by other files that import it. For example, you can create a module to define a struct such as this one:

```mojo
# Source: https://docs.modular.com/mojo/manual/packages

struct MyPair:
    var first: Int
    var second: Int

    fn __init__(inout self, first: Int, second: Int):
        self.first = first
        self.second = second

    fn dump(self):
        print(self.first, self.second)
```

Notice that this code has no `main()` function, so you can't execute `mymodule.mojo`. However, you can import this into another file with a `main()` function and use it there.

### Packages

A Mojo package is just a collection of Mojo modules in a directory that includes an `__init__.mojo` file. By organizing modules together in a directory, you can then import all the modules together or individually. Optionally, you can also compile the package into a `.mojopkg` or `.📦` file that's easier to share and still compatible with other system architectures.

You can import a package and its modules either directly from source files or from a compiled `.mojopkg/.📦` file. It makes no real difference to Mojo which way you import a package. When importing from source files, the directory name works as the package name, whereas when importing from a compiled package, the filename is the package name (which you specify with the [mojo package](https://docs.modular.com/mojo/cli/package.html) command—it can differ from the directory name).

## References

- [Modular AI](https://www.modular.com)
- [Mojo Documentation](https://docs.modular.com/mojo/)
- [Mojo GitHub Repository](https://github.com/modularml/mojo)
- [Mojo - A New Programming Language for AI](https://refine.dev/blog/mojo-programming-language/#assembling-your-magic-code)
