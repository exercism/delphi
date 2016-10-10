unit uBeerSongTests;

interface
uses
  DUnitX.TestFramework;

type

  [TestFixture]
  BeerSongTests = class(TObject)
  public
    [Test]
    [TestCase('verse 8', '8, 0')]
//    [TestCase('verse 2', '2, 1')] //Uncomment to run test case
//    [TestCase('verse 1', '1, 2')] //Uncomment to run test case
//    [TestCase('verse 0', '0, 3')] //Uncomment to run test case
    procedure Verse(const verseNumber: integer; const verseResult: integer);

    [Test]
    [Ignore] //Comment or remove [Ignore] to run this test
    [TestCase('verse 8 to 6','8, 6, 0')]
    [TestCase('verse 3 to 0','3, 0, 1')]
    procedure Sing(const start : Integer;const stop : Integer; singResult: integer);
  end;

implementation
uses System.SysUtils, uBeerSong;

const verseResults: array[0..3] of string = ('8 bottles of beer on the wall, 8 bottles of beer.' + sLineBreak +
                                             'Take one down and pass it around, 7 bottles of beer on the wall.' + sLineBreak,

                                             '2 bottles of beer on the wall, 2 bottles of beer.' + sLineBreak +
                                             'Take one down and pass it around, 1 bottle of beer on the wall.' + sLineBreak,

                                             '1 bottle of beer on the wall, 1 bottle of beer.' + sLineBreak +
                                             'Take it down and pass it around, no more bottles of beer on the wall.' + sLineBreak,

                                             'No more bottles of beer on the wall, no more bottles of beer.' + sLineBreak +
                                             'Go to the store and buy some more, 99 bottles of beer on the wall.' + sLineBreak);

      singResults: array[0..1] of string = ('8 bottles of beer on the wall, 8 bottles of beer.' + sLineBreak +
                                            'Take one down and pass it around, 7 bottles of beer on the wall.' + sLineBreak +
                                            sLineBreak +
                                            '7 bottles of beer on the wall, 7 bottles of beer.' + sLineBreak +
                                            'Take one down and pass it around, 6 bottles of beer on the wall.' + sLineBreak +
                                            sLineBreak +
                                            '6 bottles of beer on the wall, 6 bottles of beer.' + sLineBreak +
                                            'Take one down and pass it around, 5 bottles of beer on the wall.' + sLineBreak +
                                            sLineBreak,

                                            '3 bottles of beer on the wall, 3 bottles of beer.' + sLineBreak +
                                            'Take one down and pass it around, 2 bottles of beer on the wall.' + sLineBreak +
                                            sLineBreak +
                                            '2 bottles of beer on the wall, 2 bottles of beer.' + sLineBreak +
                                            'Take one down and pass it around, 1 bottle of beer on the wall.' + sLineBreak +
                                            sLineBreak +
                                            '1 bottle of beer on the wall, 1 bottle of beer.' + sLineBreak +
                                            'Take it down and pass it around, no more bottles of beer on the wall.' + sLineBreak +
                                            sLineBreak +
                                            'No more bottles of beer on the wall, no more bottles of beer.' + sLineBreak +
                                            'Go to the store and buy some more, 99 bottles of beer on the wall.' + sLineBreak +
                                            sLineBreak);

procedure BeerSongTests.Verse(const verseNumber: integer; const verseResult: integer);
var Expected,
    Actual: string;
begin
  Expected := verseResults[verseResult];
  Actual := Beer.Verse(verseNumber);
  assert.AreEqual(Expected, Actual);
end;

procedure BeerSongTests.Sing(const start : Integer;const stop : Integer; singResult: integer);
var Expected,
    Actual: string;
begin
  Expected := singResults[singResult];
  Actual := Beer.Sing(start, stop);
  assert.AreEqual(Expected, Actual);
end;

initialization
  TDUnitX.RegisterTestFixture(BeerSongTests);
end.
