# CEDAC.jl
CEDAC.jl was designed to allow full low level access by providing wrapper functions to the CEDAC libraries.

This package is a Julia library written for Julia 1.0 and onwards.

## What does full low level access mean?

CEDAC.jl defines C definitions and functions as they would appear in a C project.

## How do I add this Julia package?

Enter the Pkg REPL-mode from the Julia REPL by using the key `]`.

Now add the Julia package by using the `add` command:
```
(v1.0) pkg> add https://github.com/mikhail-j/CEDAC.jl
```

## What should I do if I want to update CEDAC.jl?

The `update` command in Pkg REPL-mode can be used to add recent commits made to CEDAC.jl:
```julia
(v1.0) pkg> update CEDAC
```

## License

The license can be found in [LICENSE](https://github.com/mikhail-j/CEDAC.jl/blob/master/LICENSE).
