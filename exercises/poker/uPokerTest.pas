unit uPokerTest;

interface
uses
  DUnitX.TestFramework;

type

  [TestFixture]
  PokerTest = class(TObject)
  public
    [Test]
    procedure One_hand;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Nothing_vs_one_pair;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Two_pairs;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure One_pair_vs_double_pair;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Two_double_pairs;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Double_pair_vs_three;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Two_threes;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Three_vs_straight;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Two_straights;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Straight_vs_flush;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Two_flushes;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Flush_vs_full;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Two_fulls;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Full_vs_square;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Two_squares;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Square_vs_straight_flush;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Two_straight_flushes;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Three_hand_with_tie;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Straight_to_5_against_a_pair_of_jacks;
  end;

implementation
uses Generics.Collections, uPoker;

procedure PokerTest.One_hand;
const hand: string = '5S 4S 7H 8D JC';
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange(hand);
  expectedHands := TList<string>.Create;
  expectedHands.AddRange(hand);

  ActualHands := Poker.BestHands(inputHands);

  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Nothing_vs_one_pair;
const nothing: string = '4S 5H 6S 8D JH';
      pairOf4: string = '2S 4H 6S 4D JH';
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange([nothing, pairOf4]);
  expectedHands := TList<string>.Create;
  expectedHands.AddRange(pairOf4);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Two_pairs;
const pairOf2: string = '4S 2H 6D 2D JD';
      pairOf4: string = '2S 4H 6S 4D JH';
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.create;
  inputHands.AddRange([pairOf2, pairOf4]);
  expectedHands := TList<string>.Create;
  expectedHands.AddRange(pairOf4);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.One_pair_vs_double_pair;
const pairOf8: string = '2S 8H 6S 8D JH';
      doublePair: string = '4C 5C 4S 8D 5H';
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange([pairOf8, doublePair]);

  expectedHands := TList<string>.Create;
  expectedHands.Add(doublePair);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Two_double_pairs;
const doublePair2And8: string = '2D 8H 2S 8D JH';
      doublePair4And5: string = '4S 5C 4C 8D 5H';
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange([doublePair2And8, doublePair4And5]);

  expectedHands := TList<string>.Create;
  expectedHands.Add(doublePair2And8);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Double_pair_vs_three;
const doublePair2And8: string = '2D 8H 2S 8D JH';
      threeOf4: string = '4D 5H 4S 8D 4H';
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange([doublePair2And8, threeOf4]);

  expectedHands := TList<string>.Create;
  expectedHands.Add(threeOf4);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Two_threes;
const threeOf2: string = '2S 2H 2S 8D JH';
      threeOf1: string = '4S AH AS 8D AH';
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange([threeOf2, threeOf1]);

  expectedHands := TList<string>.Create;
  expectedHands.Add(threeOf1);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Three_vs_straight;
const threeOf4: string = '4S 5D 4C 8D 4H';
      straight: string = '3S 4D 2S 6D 5H';
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange([threeOf4, straight]);

  expectedHands := TList<string>.Create;
  expectedHands.Add(straight);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Two_straights;
const straightTo8: string = '4S 6H 7S 8D 5H';
      straightTo9: string = '5S 7H 8S 9D 6H';
      straightTo1: string = 'AS QH KS TD JH';
      straightTo5: string = '4S AH 3S 2D 5H';
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange([straightTo8, straightTo9]);

  expectedHands := TList<string>.Create;
  expectedHands.Add(straightTo9);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);

  inputHands.Clear;
  inputHands.AddRange([straightTo1, straightTo5]);

  expectedHands.Clear;
  expectedHands.Add(straightTo1);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Straight_vs_flush;
const straightTo8: string = '4S 6H 7S 8D 5H';
      flushTo7: string = '2S 4S 5S 6S 7S';
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange([straightTo8, flushTo7]);

  expectedHands := TList<string>.Create;
  expectedHands.Add(flushTo7);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Two_flushes;
const flushTo8: string = '3H 6H 7H 8H 5H';
      flushTo7: string = '2S 4S 5S 6S 7S';
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange([flushTo8, flushTo7]);

  expectedHands := TList<string>.Create;
  expectedHands.Add(flushTo8);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Flush_vs_full;
const flushTo8: string = '3H 6H 7H 8H 5H';
      full: string = '4S 5H 4S 5D 4H';
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange([flushTo8, full]);

  expectedHands := TList<string>.Create;
  expectedHands.Add(full);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Two_fulls;
const fullOf4By9: string = '4H 4S 4D 9S 9D';
      fullOf5By8: string = '5H 5S 5D 8S 8D';
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange([fullOf4By9, fullOf5By8]);

  expectedHands := TList<string>.Create;
  expectedHands.Add(fullOf5By8);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Full_vs_square;
const full: string = '4S 5H 4S 5D 4H';
      squareOf3: string = '3S 3H 2S 3D 3H';
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange([squareOf3,full]);

  expectedHands := TList<string>.Create;
  expectedHands.Add(squareOf3);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Two_squares;
const squareOf2: string = '2S 2H 2S 8D 2H';
      squareOf5: string = '4S 5H 5S 5D 5H';
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange([squareOf2, squareOf5]);

  expectedHands := TList<string>.Create;
  expectedHands.Add(squareOf5);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Square_vs_straight_flush;
const squareOf5: string = '4S 5H 5S 5D 5H';
      straightFlushTo9: string = '5S 7S 8S 9S 6S';
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange([squareOf5, straightFlushTo9]);

  expectedHands := TList<string>.Create;
  expectedHands.Add(straightFlushTo9);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Two_straight_flushes;
const straightFlushTo8: string = '4H 6H 7H 8H 5H';
      straightFlushTo9: string = '5S 7S 8S 9S 6S';
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange([straightFlushTo8, straightFlushTo9]);

  expectedHands := TList<string>.Create;
  expectedHands.Add(straightFlushTo9);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Three_hand_with_tie;
const spadeStraightTo9: string = '9S 8S 7S 6S 5S';
      diamondStraightTo9: string = '9D 8D 7D 6D 5D';
      threeOf4: string = '4D 4S 4H QS KS';
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange([spadeStraightTo9, threeOf4, diamondStraightTo9]);

  expectedHands := TList<string>.Create;
  expectedHands.AddRange([spadeStraightTo9, diamondStraightTo9]);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Straight_to_5_against_a_pair_of_jacks;
const straightTo5: string = '2S 4D 5C 3S AS';
      twoJacks: string = 'JD 8D 7D JC 5D';
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange([straightTo5, twoJacks]);

  expectedHands := TList<string>.Create;
  expectedHands.AddRange(straightTo5);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;


initialization
  TDUnitX.RegisterTestFixture(PokerTest);
end.
