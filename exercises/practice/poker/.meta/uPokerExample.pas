unit uPoker;

interface
uses Generics.Collections;

type

  Poker = class
  private
    type
      Card = record
               Rank,
               Suit: integer;
             end;
      Scores = record
                 Score: integer;
                 TieBreakerScore: integer;
      end;
      Hand = record
               Input: string;
               handResult: Scores;
             end;
    class function ParseHand(aHand: string): Hand;
    class function ParseCards(aHand: string): TArray<Card>;
    class function ParseCard(aCard: string): Card;
    class function ParseRank(aCard: string): integer;
    class function ParseSuit(aCard: string): integer;
    class function ScoreHand(aCards: TArray<Card>): Scores;
  public
    class function BestHands(aHands: TList<String>): TList<string>;
  end;

implementation
uses SysUtils, Math, Generics.Defaults, Spring.Collections;

class function Poker.BestHands(aHands: TList<String>): TList<string>;

{$region 'BestHands workers'}
  function MaxScore(aList: IList<Hand>): integer;
  var lResult: integer;
      aItem: Hand;
  begin
    lResult := 0;
    for aItem in aList do
      if aItem.handResult.Score > lResult then
        lResult := aItem.handResult.Score;
    result := lResult;
  end;

  function ScoreHands(aList: TList<string>): IList<Hand>;
  var aItem: string;
  begin
    Result := TCollections.CreateList<Hand>;
    for aItem in aList do
      result.Add(ParseHand(aItem));
  end;

  function ListOfWinningHands(const aTarget: integer; aList: IList<Hand>): IList<string>;

    function MaxTieBreakerScore: integer;
    var
      aItem: Hand;
      lResult: integer;
    begin
      lResult := 0;
      for aItem in aList do
        if aItem.handResult.TieBreakerScore > lResult then
          lResult := aItem.handResult.TieBreakerScore;
      result := lResult;
    end;

  var aItem: Hand;
      lmaxTieBreakerScore: integer;
  begin
    result := TCollections.CreateList<string>;
    lmaxTieBreakerScore := MaxTieBreakerScore;
    for aItem in aList do
      if aItem.handResult.TieBreakerScore = lmaxTieBreakerScore then
        result.Add(aItem.Input);
  end;

  function MaxHands(aScoredHands: IList<Hand>; aMaxScore: integer): IList<Hand>;
  var
    lHand: Hand;
  begin
    result := TCollections.CreateList<Hand>;
    for lHand in aScoredHands do
      if lHand.handResult.Score = aMaxScore then
        result.Add(lHand);
  end;
{$endregion}

var scoredHands: IList<Hand>;
    lmaxScore: integer;
    lmaxHands: IList<Hand>;
begin
  scoredHands := ScoreHands(aHands);
  lMaxScore := MaxScore(scoredHands);
  lmaxHands := MaxHands(scoredHands, lMaxScore);

  result := TList<string>.Create;
  result.AddRange(ListOfWinningHands(lMaxScore, lmaxHands).ToArray);
end;

class function Poker.ParseHand(aHand: string): Hand;
begin
  result.Input := aHand;
  result.handResult := ScoreHand(ParseCards(aHand));
end;

class function Poker.ParseCards(aHand: string): TArray<Card>;
var lhand: TArray<string>;
    lhandReplace10: string;
    lCardStr: string;
    lParsedHand: IList<Card>;
begin
  lParsedHand := TCollections.CreateList<Card>(
    function(const left, right: Card): integer
    begin
      result := TComparer<integer>.Default.Compare(left.Rank, right.Rank);
    end);

  lhandReplace10 := aHand.Replace('10', 'T');
  lhand := lhandReplace10.Split([' ']);
  for lCardStr in lhand do
    lParsedHand.Add(ParseCard(lCardStr));
  lParsedHand.Sort;
  lParsedhand.Reverse;
  result := lParsedHand.ToArray;
end;

class function Poker.ParseCard(aCard: string): Card;
begin
  result.Rank := ParseRank(aCard);
  result.Suit := ParseSuit(aCard);
end;

class function Poker.ParseRank(aCard: string): integer;
var lRanks: IList<char>;
    lCard: TArray<char>;
begin
  lCard := aCard.ToCharArray;
  lRanks := TCollections.CreateList<char>;
  lRanks.AddRange(['.','.','2','3','4','5','6','7','8','9','T','J','K','Q','A']);
  result := lRanks.IndexOf(lCard[low(lCard)]);
end;

class function Poker.ParseSuit(aCard: string): integer;
var lSuits: IList<char>;
    lCard: TArray<char>;
begin
  lCard := aCard.ToCharArray;
  lSuits := TCollections.CreateList<char>;
  lSuits.AddRange(['.','H','S','D','C']);
  result := lSuits.IndexOf(lCard[high(lCard)]);
end;

class function Poker.ScoreHand(aCards: TArray<Card>): Scores;

{$region 'ScoreHand Workers'}
    function CardsByRankOccurance: IList<integer>;
    var rank: integer;
        lRankOccurence: TArray<integer>;
        aCard: Card;
        currentOccurenceCount: integer;
    begin
      SetLength(lRankOccurence, 15);
      for aCard in aCards do
        inc(lRankOccurence[aCard.Rank]);
      currentOccurenceCount := 0;
      result := TCollections.CreateList<integer>;
      result.Add(0);
      for rank := High(lRankOccurence) downto Low(lRankOccurence) + 2 do
      begin
        if (lRankOccurence[rank] >= currentOccurenceCount) then
        begin
          result.Insert(0,rank);
          currentOccurenceCount := lRankOccurence[rank];
        end
        else
          if lRankOccurence[rank] > 0 then
            result.Insert(1,rank);
      end;
    end;

    function CountRanks: IList<integer>;
    var rankCount: integer;
        i: integer;
    begin
      result := TCollections.CreateList<integer>;
      rankCount := 1;
      for i := low(aCards) to high(aCards) - 1 do
      begin
        if aCards[i].Rank = aCards[i+1].Rank then
          inc(rankCount)
        else
        begin
          result.Add(rankCount);
          rankCount := 1;
        end;
      end;
      result.Add(rankCount);
      result.Sort;
      result.Reverse;
    end;

    procedure SelectRankAndSuits(out Suits, Ranks: IList<integer>);
    var aCard: Card;
    begin
      Suits := TCollections.CreateList<integer>;
      Ranks := TCollections.CreateList<integer>;

      for aCard in aCards do
      begin
        Suits.Add(aCard.Suit);
        Ranks.Add(aCard.Rank);
      end;
      Suits.Sort;
      Suits.Reverse;
      Ranks.Sort;
      Ranks.Reverse;
      if Ranks.EqualsTo([14,5,4,3,2]) then
      begin //Ace is worth one when hand is straight to five
        Ranks.Remove(14);
        Ranks.Add(1);
      end;
    end;

    function Distinct(aList: IList<integer>): integer;
    var prevItem: integer;
        ItemCount: integer;
        item: integer;
    begin
      ItemCount := 0;
      prevItem := 0;
      for item in aList do
        if item <> prevItem then
        begin
          inc(ItemCount);
          prevItem := item;
        end;
      result := ItemCount;
    end;
{$endregion}

var listOfCardsByRank: IList<integer>;
    listOfRankCounts: IList<integer>;
    Ranks: IList<integer>;
    Suits: IList<integer>;
    flush: boolean;
    straight: boolean;
begin
  listOfCardsByRank := CardsByRankOccurance;
  listOfRankCounts := CountRanks;

  SelectRankAndSuits(Suits, Ranks);

  flush := Distinct(Suits) = 1;
  straight := (Distinct(Ranks) = 5) and ((Ranks[0] - Ranks[4]) = 4);

  fillchar(result, SizeOf(Scores), #0);
  if straight and flush then
    result.Score := 800 + Ranks.First
  else
    if listOfRankCounts.EqualsTo([4,1]) then   // 4 of a kind
    begin
      result.Score := 700 + listOfCardsByRank[0];
      result.TieBreakerScore := listOfCardsByRank[1];
    end
    else
      if listOfRankCounts.EqualsTo([3,2]) then // full house
      begin
        result.Score := 600 + listOfCardsByRank[0];
        result.TieBreakerScore := listofCardsByRank[1];
      end
      else
        if flush then
          result.Score := 500 + Ranks.First
        else
          if straight then
            result.Score := 400 + Ranks.First
          else
            if listOfRankCounts.EqualsTo([3,1,1]) then  //3 of a kind
            begin
              result.Score := 300 + listOfCardsByRank[0];
              result.TieBreakerScore := listOfCardsByRank[2];
            end
            else
              if listOfRankCounts.EqualsTo([2,2,1]) then  // 2 pair
              begin
                result.Score := 200 + listOfCardsByRank[0] + listOfCardsByRank[1];
                result.TieBreakerScore := Ranks.Min;
              end
              else
                if listOfRankCounts.EqualsTo([2,1,1,1]) then // 1 pair
                begin
                  result.Score := 100 + listOfCardsByRank[0];
                  result.TieBreakerScore := 0;
                end
                else
                begin
                  result.Score := Ranks.Max;  // high card
                  result.TieBreakerScore := Ranks.Min;
                end;

end;

end.
