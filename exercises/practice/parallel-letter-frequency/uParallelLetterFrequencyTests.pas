unit uParallelLetterFrequencyTests;

interface
uses
  DUnitX.TestFramework,
  System.Generics.Collections;

const
  CanonicalVersion = '1.0.0.2';

type
  [TestFixture]
  ParallelLetterFrequencyTests = class(TObject)
  private
    fActual: TDictionary<char, integer>;
    // Poem by Friedrich Schiller. The corresponding music is the European Anthem.
    const OdeAnDieFreude =
        'Freude schöner Götterfunken' + sLineBreak +
        'Tochter aus Elysium,' + sLineBreak +
        'Wir betreten feuertrunken,' + sLineBreak +
        'Himmlische, dein Heiligtum!' + sLineBreak +
        'Deine Zauber binden wieder' + sLineBreak +
        'Was die Mode streng geteilt;' + sLineBreak +
        'Alle Menschen werden Brüder,' + sLineBreak +
        'Wo dein sanfter Flügel weilt.';

    // Dutch national anthem
    const Wilhelmus =
        'Wilhelmus van Nassouwe' + sLineBreak +
        'ben ik, van Duitsen bloed,' + sLineBreak +
        'den vaderland getrouwe' + sLineBreak +
        'blijf ik tot in den dood.' + sLineBreak +
        'Een Prinse van Oranje' + sLineBreak +
        'ben ik, vrij, onverveerd,' + sLineBreak +
        'den Koning van Hispanje' + sLineBreak +
        'heb ik altijd geëerd.';

    // American national anthem
    const StarSpangledBanner =
        'O say can you see by the dawn''s early light,' + sLineBreak +
        'What so proudly we hailed at the twilight''s last gleaming,' + sLineBreak +
        'Whose broad stripes and bright stars through the perilous fight,' + sLineBreak +
        'O''er the ramparts we watched, were so gallantly streaming?' + sLineBreak +
        'And the rockets'' red glare, the bombs bursting in air,' + sLineBreak +
        'Gave proof through the night that our flag was still there;' + sLineBreak +
        'O say does that star-spangled banner yet wave,' + sLineBreak +
        'O''er the land of the free and the home of the brave?'+ sLineBreak;
  public
    [TearDown]
    procedure TearDown;
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure No_texts_mean_no_letters;

    [Test]
    [Ignore]
    procedure One_letter;

    [Test]
    [Ignore]
    procedure Case_insensitivity;

    [Test]
    [Ignore]
    procedure Many_empty_texts_still_mean_no_letters;

    [Test]
    [Ignore]
    procedure Many_times_the_same_text_gives_a_predictable_result;

    [Test]
    [Ignore]
    procedure Punctuation_doesnt_count;

    [Test]
    [Ignore]
    procedure Numbers_dont_count;

    [Test]
    [Ignore]
    procedure All_three_anthems_together;
  end;

implementation

uses
  SysUtils,
  uParallelLetterFrequency;

type
  Assert = class(DUnitX.TestFramework.Assert)
    class procedure AreEqual(const expected, actual: TDictionary<char, integer>); overload;
  end;

{ ParallelLetterFrequencyTests }

procedure ParallelLetterFrequencyTests.All_three_anthems_together;
var
  Input: string;
begin
  Input := OdeAnDieFreude + Wilhelmus + StarSpangledBanner;
  fActual := TParallelLetterFrequency.Calculate(Input);
  Assert.AreEqual(49, fActual['a']);
  Assert.AreEqual(56, fActual['t']);
  Assert.AreEqual(2, fActual['ü']);
end;

procedure ParallelLetterFrequencyTests.Case_insensitivity;
var
  Input: string;
  Expected: TDictionary<char, integer>;
begin
  Input := 'aA';
  Expected := TDictionary<char, integer>.Create;
  Expected.AddOrSetValue('a', 2);
  fActual := TParallelLetterFrequency.Calculate(Input);
  Assert.AreEqual(Expected, fActual);
end;

procedure ParallelLetterFrequencyTests.Many_empty_texts_still_mean_no_letters;
var
  Input: string;
  i: integer;
begin
  Input := '';
  for i := 1 to 10000 do
    Input := Input + ' ';
  fActual := TParallelLetterFrequency.Calculate(Input);
  Assert.AreEqual(0, fActual.Count);
end;

procedure ParallelLetterFrequencyTests.Many_times_the_same_text_gives_a_predictable_result;
var
  Input: string;
  Expected: TDictionary<char, integer>;
  i: integer;
begin
  Input := '';
  for i := 1 to 1000 do
    Input := Input + 'abc';
  Expected := TDictionary<char, integer>.Create;
  try
    Expected.AddOrSetValue('a', 1000);
    Expected.AddOrSetValue('b', 1000);
    Expected.AddOrSetValue('c', 1000);
    fActual := TParallelLetterFrequency.Calculate(Input);
    Assert.AreEqual(Expected, fActual);
  finally
    FreeAndNil(Expected);
  end;
end;

procedure ParallelLetterFrequencyTests.No_texts_mean_no_letters;
var
  Input: string;
  Expected: TDictionary<char, integer>;
begin
  Input := '';
  Expected := TDictionary<char, integer>.Create;
  try
    fActual := TParallelLetterFrequency.Calculate(Input);
    Assert.AreEqual(Expected, fActual);
  finally
    FreeAndNil(Expected);
  end;
end;

procedure ParallelLetterFrequencyTests.Numbers_dont_count;
var
  Input: string;
begin
  Input := 'Testing, 1, 2, 3';
  fActual := TParallelLetterFrequency.Calculate(Input);
  Assert.IsFalse(fActual.ContainsKey('1'));
end;

procedure ParallelLetterFrequencyTests.One_letter;
var
  Input: string;
  Expected: TDictionary<char, integer>;
begin
  Input := 'a';
  Expected := TDictionary<char, integer>.Create;
  try
    Expected.AddOrSetValue('a', 1);
    fActual := TParallelLetterFrequency.Calculate(Input);
    Assert.AreEqual(Expected, fActual);
  finally
    FreeAndNil(Expected);
  end;
end;

procedure ParallelLetterFrequencyTests.Punctuation_doesnt_count;
var
  Input: string;
begin
  Input := OdeAnDieFreude;
  fActual := TParallelLetterFrequency.Calculate(Input);
  Assert.IsFalse(fActual.ContainsKey(','));
end;

procedure ParallelLetterFrequencyTests.TearDown;
begin
  FreeAndNil(fActual);
end;

class procedure Assert.AreEqual(const expected, actual: TDictionary<char, integer>);
var
  ExpectedItem: TPair<char, integer>;
begin
  Assert.AreEqual(expected.Count, actual.Count);
  for ExpectedItem in expected do
  begin
    Assert.IsTrue(actual.ContainsKey(ExpectedItem.Key));
    Assert.AreEqual(ExpectedItem.Value, actual[ExpectedItem.Key]);
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(ParallelLetterFrequencyTests);
end.
