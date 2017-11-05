unit uBeerSongTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '2.0.0';

type

  [TestFixture('single verse')]
  VerseTests = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure first_generic_verse;

    [Test]
    [Ignore]
    procedure last_generic_verse;

    [Test]
    [Ignore]
    procedure verse_with_2_bottles;

    [Test]
    [Ignore]
    procedure verse_with_1_bottle;

    [Test]
    [Ignore]
    procedure verse_with_0_bottles;
  end;

  [TextFixture('multiple verses')]
  LyricsTests = class(TObject)
  public
    [Test]
    [Ignore]
    procedure first_two_verses;

    [Test]
    [Ignore]
    procedure last_three_verses;

    [Test]
    [Ignore]
    procedure all_verses;
  end;

implementation
uses System.SysUtils, System.Classes, uBeerSong;

var inputFile: TStringlist;

{$region 'single verse'}

procedure VerseTests.first_generic_verse;
var Expected,
    Actual: string;
begin
  Expected := inputFile[0];
  Actual := Beer.Recite(99,1);
  Assert.AreEqual(Expected, Actual);
end;

procedure VerseTests.verse_with_1_bottle;
var Expected,
    Actual: string;
begin
  Expected := inputFile[3];
  Actual := Beer.Recite(1,1);
  Assert.AreEqual(Expected, Actual);
end;

procedure VerseTests.verse_with_2_bottles;
var Expected,
    Actual: string;
begin
  Expected := inputFile[2];
  Actual := Beer.Recite(2,1);
  Assert.AreEqual(Expected, Actual);
end;

procedure VerseTests.last_generic_verse;
var Expected,
    Actual: string;
begin
  Expected := inputFile[3];
  Actual := Beer.Recite(1,1);
  Assert.AreEqual(Expected, Actual);
end;

procedure VerseTests.verse_with_0_bottles;
var Expected,
    Actual: string;
begin
  Expected := inputFile[4];
  Actual := Beer.Recite(0,1);
  Assert.AreEqual(Expected, Actual);
end;
{$endregion}

{$region 'multiple verses'}

procedure LyricsTests.first_two_verses;
var Expected,
    Actual: string;
begin
  Expected := inputFile[6];
  Actual := Beer.Recite(99,2);
  assert.AreEqual(Expected, Actual);
end;

procedure LyricsTests.last_three_verses;
var Expected,
    Actual: string;
begin
  Expected := inputFile[5];
  Actual := Beer.Recite(2,3);
  assert.AreEqual(Expected, Actual);
end;

procedure LyricsTests.all_verses;
var Expected,
    Actual: string;
begin
  Expected := inputFile[7];
  Actual := Beer.Recite(99,100);
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
  TDUnitX.RegisterTestFixture(VerseTests);
  TDUnitX.RegisterTestFixture(LyricsTests);

finalization
  inputFile.DisposeOf;
end.
