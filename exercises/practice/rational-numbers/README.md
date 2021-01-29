# Rational Numbers

A rational number is defined as the quotient of two integers `a` and `b`, called the numerator and denominator, respectively, where `b != 0`.

The absolute value `|r|` of the rational number `r = a/b` is equal to `|a|/|b|`.

The sum of two rational numbers `r1 = a1/b1` and `r2 = a2/b2` is `r1 + r2 = a1/b1 + a2/b2 = (a1 * b2 + a2 * b1) / (b1 * b2)`.

The difference of two rational numbers `r1 = a1/b1` and `r2 = a2/b2` is `r1 - r2 = a1/b1 - a2/b2 = (a1 * b2 - a2 * b1) / (b1 * b2)`.

The product (multiplication) of two rational numbers `r1 = a1/b1` and `r2 = a2/b2` is `r1 * r2 = (a1 * a2) / (b1 * b2)`.

Dividing a rational number `r1 = a1/b1` by another `r2 = a2/b2` is `r1 / r2 = (a1 * b2) / (a2 * b1)` if `a2 * b1` is not zero.

Exponentiation of a rational number `r = a/b` to a non-negative integer power `n` is `r^n = (a^n)/(b^n)`.

Exponentiation of a rational number `r = a/b` to a negative integer power `n` is `r^n = (b^m)/(a^m)`, where `m = |n|`.

Exponentiation of a rational number `r = a/b` to a real (floating-point) number `x` is the quotient `(a^x)/(b^x)`, which is a real number.

Exponentiation of a real number `x` to a rational number `r = a/b` is `x^(a/b) = root(x^a, b)`, where `root(p, q)` is the `q`th root of `p`.

Implement the following operations:
 - addition, subtraction, multiplication and division of two rational numbers,
 - absolute value, exponentiation of a given rational number to an integer power, exponentiation of a given rational number to a real (floating-point) power, exponentiation of a real number to a rational number.

Your implementation of rational numbers should always be reduced to lowest terms. For example, `4/4` should reduce to `1/1`, `30/60` should reduce to `1/2`, `12/8` should reduce to `3/2`, etc. To reduce a rational number `r = a/b`, divide `a` and `b` by the greatest common divisor (gcd) of `a` and `b`. So, for example, `gcd(12, 8) = 4`, so `r = 12/8` can be reduced to `(12/4)/(8/4) = 3/2`.

Assume that the programming language you are using does not have an implementation of rational numbers.

## Hints
- Operator overloading is being introduced in this exercise.  The [Embarcadero docwiki](http://docwiki.embarcadero.com/RADStudio/Rio/en/Operator_Overloading_(Delphi)) on the subject will be very helpful to you in understanding how overriding class operators is possible along with Implicit and Explicit casting.


## Testing

In order to run the tests for this track, you will need to install
DUnitX. Please see the [installation](http://www.exercism.io/languages/delphi/installation) instructions for more information.

### Loading Exercises into Delphi

If Delphi is properly installed, and `*.dpr` file types have been associated with Delphi, then double clicking the supplied `*.dpr` file will start Delphi and load the exercise/project.  `control + F9` is the keyboard shortcut to compile the project or pressing `F9` will compile and run the project.

Alternatively you may opt to start Delphi and load your project via. the `File` drop down menu.

### When Questions Come Up
We monitor the [Pascal-Delphi](https://gitter.im/exercism/Pascal-Delphi) support room on [gitter.im](https://gitter.im) to help you with any questions that might arise.

### Submitting Exercises

Note that, when trying to submit an exercise, make sure the exercise file you're submitting is in the `exercism/delphi/<exerciseName>` directory.

For example, if you're submitting `ubob.pas` for the Bob exercise, the submit command would be something like `exercism submit <path_to_exercism_dir>/delphi/bob/ubob.pas`.

## Source

Wikipedia [https://en.wikipedia.org/wiki/Rational_number](https://en.wikipedia.org/wiki/Rational_number)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you may request help from a mentor.
