# Roots

Simple learning exercise program that can be used to find real roots of a polynomial.
It uses Newton's method for root finding.

Just take a polynomial of such form:

**a_1**x^3 + **a_2**x^2 + **a_3**x + **a_4**

and convert it to `[a_1, a_2, a_3, a_4]`.

for example:

```
2x^2 - x - 6    =>    [2, -1, -6]
```

and pass it ot `Roots.roots/1`

```elixir
iex(1)> Roots.roots [2, -1, -6]
[-1.5, 2.0]
```
