unit uBeerSongTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '2.0.0';

type

  [TestFixture('single verse')]
  SingleVerseTests = class(TObject)
  public
    [TestCase('single verse','99,1')]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure first_generic_verse(const startBottles: integer; const takeDown: integer);

    [TestCase('last generic verse','3,1')]
    [Ignore]
    procedure last_generic_verse(const startBottles: integer; const takeDown: integer);

    [TestCase('verse with 2 bottles','2,1')]
    [Ignore]
    procedure verse_with_2_bottles(const startBottles: integer; const takeDown: integer);

    [TestCase('verse with 1 bottle','1,1')]
    [Ignore]
    procedure verse_with_1_bottle(const startBottles: integer; const takeDown: integer);

    [TestCase('verse with 0 bottles','0,1')]
    [Ignore]
    procedure verse_with_0_bottles(const startBottles: integer; const takeDown: integer);
  end;

  [TextFixture('multiple verses')]
  MultipleVersesTests = class(TObject)
  public
    [TestCase('first two verses','99,2')]
    [Ignore]
    procedure first_two_verses(const startBottles: integer; const takeDown: integer);

    [TestCase('last three verses','2,3')]
    [Ignore]
    procedure last_three_verses(const startBottles: integer; const takeDown: integer);

    [TestCase('all verses','99,100')]
    [Ignore]
    procedure all_verses(const startBottles: integer; const takeDown: integer);
  end;

implementation
uses System.SysUtils, System.Classes, uBeerSong;

var inputFile: TStringlist;

{$region 'single verse'}

procedure SingleVerseTests.first_generic_verse(const startBottles: integer; const takeDown: integer);
var Expected,
    Actual: string;
begin
  Expected := inputFile[0];
  Actual := Beer.Recite(startBottles,takeDown);
  Assert.AreEqual(Expected, Actual);
end;

procedure SingleVerseTests.verse_with_1_bottle(const startBottles: integer; const takeDown: integer);
var Expected,
    Actual: string;
begin
  Expected := inputFile[4];
  Actual := Beer.Recite(startBottles,takeDown);
  Assert.AreEqual(Expected, Actual);
end;

procedure SingleVerseTests.verse_with_2_bottles(const startBottles: integer; const takeDown: integer);
var Expected,
    Actual: string;
begin
  Expected := inputFile[2];
  Actual := Beer.Recite(startBottles,takeDown);
  Assert.AreEqual(Expected, Actual);
end;

procedure SingleVerseTests.last_generic_verse(const startBottles: integer; const takeDown: integer);
var Expected,
    Actual: string;
begin
  Expected := inputFile[3];
  Actual := Beer.Recite(startBottles,takeDown);
  Assert.AreEqual(Expected, Actual);
end;

procedure SingleVerseTests.verse_with_0_bottles(const startBottles: integer; const takeDown: integer);
var Expected,
    Actual: string;
begin
  Expected := inputFile[5];
  Actual := Beer.Recite(startBottles,takeDown);
  Assert.AreEqual(Expected, Actual);
end;
{$endregion}

{$region 'multiple verses'}

procedure MultipleVersesTests.first_two_verses(const startBottles: integer; const takeDown: integer);
var Expected,
    Actual: string;
begin
  Expected := inputFile[7];
  Actual := Beer.Recite(startBottles,takeDown);
  assert.AreEqual(Expected, Actual);
end;

procedure MultipleVersesTests.last_three_verses(const startBottles: integer; const takeDown: integer);
var Expected,
    Actual: string;
begin
  Expected := inputFile[6];
  Actual := Beer.Recite(startBottles,takeDown);
  assert.AreEqual(Expected, Actual);
end;

procedure MultipleVersesTests.all_verses(const startBottles: integer; const takeDown: integer);
var Expected,
    Actual: string;
begin
  Expected := inputFile[8];
  Actual := Beer.Recite(startBottles,takeDown);
  assert.AreEqual(Expected, Actual);
end;

{$endregion}

function loadInputData: TStringlist;
begin
  result := TStringlist.Create;
  result.LoadFromFile('inputdata.txt');
end;

initialization
  inputFile := loadInputData;
  TDUnitX.RegisterTestFixture(SingleVerseTests);
  TDUnitX.RegisterTestFixture(MultipleVersesTests);

finalization
  inputFile.DisposeOf;
end.
