# Bare-bones Elm-MathJax Example


This is a bare-bones example of how to use MathJax in Elm. To run it, do `sh make.sh`, then open
`assets/index.html` in a browser.   The `sh make.sh` command compiles `./src/Main.elm` to `./main.js`
which is referenced by `./assets/index.html`.


Please note that this demo project has no concept 
of paragraphs.


The organization of the project is as follows.  


## Module Expression

Module `Expression` defines the `Expr` type and uses it to parse and render plain text with 
math elements of the form `$ ... $` or `$$ ... $$`.

```elm
type Expr
    = Text String
    | InlineMath String
    | DisplayMath String
    
exprListParser : Parser (List Expr)   

parse : String -> Maybe (List Expr)

render : Expr -> Html msg

compile : String -> Html msg
```


## Module MathJax

The `render` function calls on the module `MathJax` to render inline and displayed mathematical
text via the functions

```elm
inline : String -> Html msg

display : Int -> String -> Html msg
```

The first argument of `display` defines the width of the displayed math element.
The functions `inline` and `display` call on the function `mathText` which is 
the interface to KaTeX via a custom element of the same file defined in 
`assets/katex.js`.  That file is referenced in `./assets/index.html` which 
in turn calls on `./main.js` to run the app.

## Module Main

This module defines a very simple app which renders plain text with LaTeX-style formulas.  This text is hard-wired
in module `Data:`

```text
initialText =
    """
Pythagoras sez: $a^2 + b^2 = c^2$.  Extremely cool!

This will be on the test:

$$
\\int_0^1 x^n dx = \\frac{1}{n+ 1}
$$

Study hard!

"""
```