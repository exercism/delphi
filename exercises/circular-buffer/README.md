# Circular Buffer

A circular buffer, cyclic buffer or ring buffer is a data structure that
uses a single, fixed-size buffer as if it were connected end-to-end.

A circular buffer first starts empty and of some predefined length. For
example, this is a 7-element buffer:

    [ ][ ][ ][ ][ ][ ][ ]

Assume that a 1 is written into the middle of the buffer (exact starting
location does not matter in a circular buffer):

    [ ][ ][ ][1][ ][ ][ ]

Then assume that two more elements are added — 2 & 3 — which get
appended after the 1:

    [ ][ ][ ][1][2][3][ ]

If two elements are then removed from the buffer, the oldest values
inside the buffer are removed. The two elements removed, in this case,
are 1 & 2, leaving the buffer with just a 3:

    [ ][ ][ ][ ][ ][3][ ]

If the buffer has 7 elements then it is completely full:

    [6][7][8][9][3][4][5]

When the buffer is full an error will be raised, alerting the client
that further writes are blocked until a slot becomes free.

The client can opt to overwrite the oldest data with a forced write. In
this case, two more elements — A & B — are added and they overwrite the
3 & 4:

    [6][7][8][9][A][B][5]

Finally, if two elements are now removed then what would be returned is
not 3 & 4 but 5 & 6 because A & B overwrote the 3 & the 4 yielding the
buffer with:

    [ ][7][8][9][A][B][ ]

## Testing

In order to run the tests for this track, you will need to install
DUnitX. Please see the [installation](http://www.exercism.io/languages/delphi/installing) instructions for more information.

### Loading Exercises into Delphi

If Delphi is properly installed, and `*.dpr` file types have been associated with Delphi, then double clicking the supplied `*.dpr` file will start Delphi and load the exercise/project.  `control + F9` is the keyboard shortcut to compile the project or pressing `F9` will compile and run the project.

Alternatively you may opt to start Delphi and load your project via. the `File` drop down menu.

### When Questions Come Up
We monitor the [Pascal-Delphi](https://gitter.im/exercism/Pascal-Delphi) support room on [gitter.im](https://gitter.im) to help you with any questions that might arise.

### Submitting Exercises

Note that, when trying to submit an exercise, make sure the exercise file you're submitting is in the `exercism/delphi/<exerciseName>` directory.

For example, if you're submitting `ubob.pas` for the Bob exercise, the submit command would be something like `exercism submit <path_to_exercism_dir>/delphi/bob/ubob.pas`.

## Source

Wikipedia [http://en.wikipedia.org/wiki/Circular_buffer](http://en.wikipedia.org/wiki/Circular_buffer)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
