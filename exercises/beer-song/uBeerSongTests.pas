unit uBeerSongTests;

interface
uses
  DUnitX.TestFramework;

type

  [TestFixture]
  BeerSongTests = class(TObject)
  public
    [Test]
    procedure Verse_8;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Verse_2;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Verse_0;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Verse_8_to_6;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Verse_3_to_0;
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

procedure BeerSongTests.Verse_8;
var Expected,
    Actual: string;
begin
  Expected := verseResults[0];
  Actual := Beer.Verse(8);
  Assert.AreEqual(Expected, Actual);
end;

procedure BeerSongTests.Verse_2;
var Expected,
    Actual: string;
begin
  Expected := verseResults[1];
  Actual := Beer.Verse(2);
  Assert.AreEqual(Expected, Actual);
end;

procedure BeerSongTests.Verse_0;
var Expected,
    Actual: string;
begin
  Expected := verseResults[3];
  Actual := Beer.Verse(0);
  Assert.AreEqual(Expected, Actual);
end;

procedure BeerSongTests.Verse_8_to_6;
var Expected,
    Actual: string;
begin
  Expected := singResults[0];
  Actual := Beer.Sing(8, 6);
  assert.AreEqual(Expected, Actual);
end;

procedure BeerSongTests.Verse_3_to_0;
var Expected,
    Actual: string;
begin
  Expected := singResults[1];
  Actual := Beer.Sing(3, 0);
  assert.AreEqual(Expected, Actual);
end;

initialization
  TDUnitX.RegisterTestFixture(BeerSongTests);
end.
