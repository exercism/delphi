unit uBeerSongTests;

interface
uses
  DUnitX.TestFramework;

type

  [TestFixture('Return 1 verse')]
  VerseTests = class(TObject)
  public
    [Test]
//  [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure First_verse;

    [Test]
    [Ignore]
    procedure Middle_verse;

    [Test]
    [Ignore]
    procedure Third_to_last_verse;

    [Test]
    [Ignore]
    procedure Penultimate_verse;

    [Test]
    [Ignore]
    procedure Last_verse;
  end;

  [TextFixture('Return multiple verses')]
  LyricsTests = class(TObject)
  public
    [Test]
    [Ignore]
    procedure Last_4_verses;

    [Test]
    [Ignore]
    procedure All_verses;
  end;

implementation
uses System.SysUtils, System.Classes, uBeerSong;

var inputFile: TStringlist;

{$region 'Return 1 verse'}

procedure VerseTests.First_verse;
var Expected,
    Actual: string;
begin
  Expected := inputFile[0];
  Actual := Beer.Verse(99);
  Assert.AreEqual(Expected, Actual);
end;

procedure VerseTests.Middle_verse;
var Expected,
    Actual: string;
begin
  Expected := inputFile[1];
  Actual := Beer.Verse(44);
  Assert.AreEqual(Expected, Actual);
end;

procedure VerseTests.Third_to_last_verse;
var Expected,
    Actual: string;
begin
  Expected := inputFile[2];
  Actual := Beer.Verse(2);
  Assert.AreEqual(Expected, Actual);
end;

procedure VerseTests.Penultimate_verse;
var Expected,
    Actual: string;
begin
  Expected := inputFile[3];
  Actual := Beer.Verse(1);
  assert.AreEqual(Expected, Actual);
end;

procedure VerseTests.Last_verse;
var Expected,
    Actual: string;
begin
  Expected := inputFile[4];
  Actual := Beer.Verse(0);
  assert.AreEqual(Expected, Actual);
end;
{$endregion}

{$region 'Return multiple verses'}

procedure LyricsTests.Last_4_verses;
var Expected,
    Actual: string;
begin
  Expected := inputFile[5];
  Actual := Beer.Verses(3,0);
  assert.AreEqual(Expected, Actual);
end;

procedure LyricsTests.All_verses;
var Expected,
    Actual: string;
begin
  Expected := inputFile[6];
  Actual := Beer.Verses(99,0);
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
