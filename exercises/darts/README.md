# Darts

Write a function that returns the earned points in a single toss of a Darts game.

[Darts](https://en.wikipedia.org/wiki/Darts) is a game where players
throw darts to a [target](https://en.wikipedia.org/wiki/Darts#/media/File:Darts_in_a_dartboard.jpg).

In our particular instance of the game, the target rewards with 4 different amounts of points, depending on where the dart lands:

* If the dart lands outside the target, player earns no points (0 points).
* If the dart lands in the outer circle of the target, player earns 1 point.
* If the dart lands in the middle circle of the target, player earns 5 points.
* If the dart lands in the inner circle of the target, player earns 10 points.

The outer circle has a radius of 10 units (This is equivalent to the total radius for the entire target), the middle circle a radius of 5 units, and the inner circle a radius of 1. Of course, they are all centered to the same point (That is, the circles are [concentric](http://mathworld.wolfram.com/ConcentricCircles.html)) defined by the coordinates (0, 0).

Write a function that given a point in the target (defined by its `real` cartesian coordinates `x` and `y`), returns the correct amount earned by a dart landing in that point.
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

Inspired by an excersie created by a professor Della Paolera in Argentina

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you may receive assistance from a mentor.
