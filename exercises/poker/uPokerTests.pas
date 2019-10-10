unit uPokerTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.1.0.1';

type

  [TestFixture]
  PokerTest = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure Single_hand_always_wins;

    [Test]
    [Ignore]
    procedure Highest_card_out_of_all_hands_wins;

    [Test]
    [Ignore]
    procedure A_tie_has_multiple_winners;

    [Test]
    [Ignore]
    procedure Multiple_hands_with_the_same_high_cards_tie_compares_next_highest_ranked_down_to_last_card;

    [Test]
    [Ignore]
    procedure One_pair_beats_high_card;

    [Test]
    [Ignore]
    procedure Highest_pair_wins;

    [Test]
    [Ignore]
    procedure Two_pairs_beats_one_pair;

    [Test]
    [Ignore]
    procedure Both_hands_have_two_pairs_highest_ranked_pair_wins;

    [Test]
    [Ignore]
    procedure Both_hands_have_two_pairs_with_the_same_highest_ranked_pair_tie_goes_to_low_pair;

    [Test]
    [Ignore]
    procedure Both_hands_have_two_identically_ranked_pairs_tie_goes_to_remaining_card_kicker;

    [Test]
    [Ignore]
    procedure Three_of_a_kind_beats_two_pair;

    [Test]
    [Ignore]
    procedure Both_hands_have_three_of_a_kind_tie_goes_to_highest_ranked_triplet;

    [Test]
    [Ignore]
    procedure With_multiple_decks_two_players_can_have_same_three_of_a_kind_ties_go_to_highest_remaining_cards;

    [Test]
    [Ignore]
    procedure A_straight_beats_three_of_a_kind;

    [Test]
    [Ignore]
    procedure Aces_can_end_a_straight_10_J_Q_K_A;

    [Test]
    [Ignore]
    procedure Aces_can_start_a_straight_A_2_3_4_5;

    [Test]
    [Ignore]
    procedure Both_hands_with_a_straight_tie_goes_to_highest_ranked_card;

    [Test]
    [Ignore]
    procedure Even_though_an_ace_is_usually_high_a_5_high_straight_is_the_lowest_scoring_straight;

    [Test]
    [Ignore]
    procedure Flush_beats_a_straight;

    [Test]
    [Ignore]
    procedure Both_hands_have_a_flush_tie_goes_to_high_card_down_to_the_last_one_if_necessary;

    [Test]
    [Ignore]
    procedure Full_house_beats_a_flush;

    [Test]
    [Ignore]
    procedure Both_hands_have_a_full_house_tie_goes_to_highest_ranked_triplet;

    [Test]
    [Ignore]
    procedure With_multiple_decks_both_hands_have_a_full_house_with_the_same_triplet_tie_goes_to_the_pair;

    [Test]
    [Ignore]
    procedure Four_of_a_kind_beats_a_full_house;

    [Test]
    [Ignore]
    procedure Both_hands_have_four_of_a_kind_tie_goes_to_high_quad;

    [Test]
    [Ignore]
    procedure With_multiple_decks_both_hands_with_identical_four_of_a_kind_tie_determined_by_kicker;

    [Test]
    [Ignore]
    procedure Straight_flush_beats_four_of_a_kind;

    [Test]
    [Ignore]
    procedure Both_hands_have_straight_flush_tie_goes_to_highest_ranked_card;
  end;

implementation
uses Generics.Collections, uPoker;

procedure PokerTest.Single_hand_always_wins;
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange(['5S 4S 7H 8D JC']);
  expectedHands := TList<string>.Create;
  expectedHands.AddRange(['5S 4S 7H 8D JC']);

  ActualHands := Poker.BestHands(inputHands);

  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Highest_card_out_of_all_hands_wins;
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange(['4D 5S 6S 8D 3C', 
                       '2S 4C 7S 9H 10H',
                       '3S 4S 5D 6H JH']);
  expectedHands := TList<string>.Create;
  expectedHands.AddRange(['3S 4S 5D 6H JH']);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.A_tie_has_multiple_winners;
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.create;
  inputHands.AddRange(['4D 5S 6S 8D 3C',
                       '2S 4C 7S 9H 10H',
                       '3S 4S 5D 6H JH',
                       '3H 4H 5C 6C JD']);
  expectedHands := TList<string>.Create;
  expectedHands.AddRange(['3S 4S 5D 6H JH',
                          '3H 4H 5C 6C JD']);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Multiple_hands_with_the_same_high_cards_tie_compares_next_highest_ranked_down_to_last_card;
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange(['3S 5H 6S 8D 7H',
                       '2S 5D 6D 8C 7S']);

  expectedHands := TList<string>.Create;
  expectedHands.AddRange(['3S 5H 6S 8D 7H']);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.One_pair_beats_high_card;
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange(['4S 5H 6C 8D KH',
                       '2S 4H 6S 4D JH']);

  expectedHands := TList<string>.Create;
  expectedHands.AddRange(['2S 4H 6S 4D JH']);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Highest_pair_wins;
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange(['4S 2H 6S 2D JH',
                       '2S 4H 6C 4D JD']);

  expectedHands := TList<string>.Create;
  expectedHands.AddRange(['2S 4H 6C 4D JD']);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Two_pairs_beats_one_pair;
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange(['2S 8H 6S 8D JH',
                       '4S 5H 4C 8C 5C']);

  expectedHands := TList<string>.Create;
  expectedHands.AddRange(['4S 5H 4C 8C 5C']);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Both_hands_have_two_pairs_highest_ranked_pair_wins;
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange(['2S 8H 2D 8D 3H',
                       '4S 5H 4C 8S 5D']);

  expectedHands := TList<string>.Create;
  expectedHands.AddRange(['2S 8H 2D 8D 3H']);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Both_hands_have_two_pairs_with_the_same_highest_ranked_pair_tie_goes_to_low_pair;
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange(['2S QS 2C QD JH',
                       'JD QH JS 8D QC']);

  expectedHands := TList<string>.Create;
  expectedHands.AddRange(['JD QH JS 8D QC']);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Both_hands_have_two_identically_ranked_pairs_tie_goes_to_remaining_card_kicker;
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange(['JD QH JS 8D QC',
                       'JS QS JC 2D QD']);

  expectedHands := TList<string>.Create;
  expectedHands.AddRange(['JD QH JS 8D QC']);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Three_of_a_kind_beats_two_pair;
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange(['2S 8H 2H 8D JH',
                       '4S 5H 4C 8S 4H']);

  expectedHands := TList<string>.Create;
  expectedHands.AddRange(['4S 5H 4C 8S 4H']);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Both_hands_have_three_of_a_kind_tie_goes_to_highest_ranked_triplet;
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange(['2S 2H 2C 8D JH',
                       '4S AH AS 8C AD']);

  expectedHands := TList<string>.Create;
  expectedHands.AddRange(['4S AH AS 8C AD']);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.With_multiple_decks_two_players_can_have_same_three_of_a_kind_ties_go_to_highest_remaining_cards;
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange(['4S AH AS 7C AD',
                       '4S AH AS 8C AD']);

  expectedHands := TList<string>.Create;
  expectedHands.AddRange(['4S AH AS 8C AD']);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.A_straight_beats_three_of_a_kind;
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange(['4S 5H 4C 8D 4H',
                       '3S 4D 2S 6D 5C']);

  expectedHands := TList<string>.Create;
  expectedHands.AddRange(['3S 4D 2S 6D 5C']);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Aces_can_end_a_straight_10_J_Q_K_A;
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange(['4S 5H 4C 8D 4H',
                       '10D JH QS KD AC']);

  expectedHands := TList<string>.Create;
  expectedHands.AddRange(['10D JH QS KD AC']);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Aces_can_start_a_straight_A_2_3_4_5;
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange(['4S 5H 4C 8D 4H',
                       '4D AH 3S 2D 5C']);

  expectedHands := TList<string>.Create;
  expectedHands.AddRange(['4D AH 3S 2D 5C']);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Both_hands_with_a_straight_tie_goes_to_highest_ranked_card;
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange(['4S 6C 7S 8D 5H',
                       '5S 7H 8S 9D 6H']);

  expectedHands := TList<string>.Create;
  expectedHands.AddRange(['5S 7H 8S 9D 6H']);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Even_though_an_ace_is_usually_high_a_5_high_straight_is_the_lowest_scoring_straight;
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange(['2H 3C 4D 5D 6H',
                       '4S AH 3S 2D 5H']);

  expectedHands := TList<string>.Create;
  expectedHands.AddRange(['2H 3C 4D 5D 6H']);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Flush_beats_a_straight;
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange(['4C 6H 7D 8D 5H',
                       '2S 4S 5S 6S 7S']);

  expectedHands := TList<string>.Create;
  expectedHands.AddRange(['2S 4S 5S 6S 7S']);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Both_hands_have_a_flush_tie_goes_to_high_card_down_to_the_last_one_if_necessary;
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange(['4H 7H 8H 9H 6H',
                       '2S 4S 5S 6S 7S']);

  expectedHands := TList<string>.Create;
  expectedHands.AddRange(['4H 7H 8H 9H 6H']);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Full_house_beats_a_flush;
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange(['3H 6H 7H 8H 5H',
                       '4S 5H 4C 5D 4H']);

  expectedHands := TList<string>.Create;
  expectedHands.AddRange(['4S 5H 4C 5D 4H']);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Both_hands_have_a_full_house_tie_goes_to_highest_ranked_triplet;
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange(['4H 4S 4D 9S 9D',
                       '5H 5S 5D 8S 8D']);

  expectedHands := TList<string>.Create;
  expectedHands.AddRange(['5H 5S 5D 8S 8D']);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.With_multiple_decks_both_hands_have_a_full_house_with_the_same_triplet_tie_goes_to_the_pair;
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange(['5H 5S 5D 9S 9D',
                       '5H 5S 5D 8S 8D']);

  expectedHands := TList<string>.Create;
  expectedHands.AddRange(['5H 5S 5D 9S 9D']);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Four_of_a_kind_beats_a_full_house;
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange(['4S 5H 4D 5D 4H',
                       '3S 3H 2S 3D 3C']);

  expectedHands := TList<string>.Create;
  expectedHands.AddRange(['3S 3H 2S 3D 3C']);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Both_hands_have_four_of_a_kind_tie_goes_to_high_quad;
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange(['2S 2H 2C 8D 2D',  //708
                       '4S 5H 5S 5D 5C']); //705

  expectedHands := TList<string>.Create;
  expectedHands.AddRange(['4S 5H 5S 5D 5C']);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.With_multiple_decks_both_hands_with_identical_four_of_a_kind_tie_determined_by_kicker;
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange(['3S 3H 2S 3D 3C',
                       '3S 3H 4S 3D 3C']);

  expectedHands := TList<string>.Create;
  expectedHands.AddRange(['3S 3H 4S 3D 3C']);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Straight_flush_beats_four_of_a_kind;
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange(['4S 5H 5S 5D 5C',
                       '7S 8S 9S 6S 10S']);

  expectedHands := TList<string>.Create;
  expectedHands.AddRange(['7S 8S 9S 6S 10S']);

  ActualHands := Poker.BestHands(inputHands);

  expectedHandsArray := expectedHands.ToArray;
  ActualHandsArray := ActualHands.ToArray;
  Assert.AreEqual(expectedHands.Count,ActualHands.Count);
  for i := Low(expectedHandsArray) to High(expectedHandsArray) do
    Assert.AreEqual(expectedHandsArray[i], ActualHandsArray[i]);
end;

procedure PokerTest.Both_hands_have_straight_flush_tie_goes_to_highest_ranked_card;
var expectedHands,
    inputHands: TList<string>;
    ActualHands: TList<string>;
    expectedHandsArray,
    ActualHandsArray: TArray<string>;
    i: integer;
begin
  inputHands := TList<string>.Create;
  inputHands.AddRange(['4H 6H 7H 8H 5H',
                       '5S 7S 8S 9S 6S']);

  expectedHands := TList<string>.Create;
  expectedHands.AddRange(['5S 7S 8S 9S 6S']);

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
