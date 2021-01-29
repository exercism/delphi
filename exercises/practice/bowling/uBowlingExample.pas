unit uBowling;

interface

type
   IBowlingGame = interface(IInvokable)
   ['{D4A292B6-BC15-48ED-AE04-2D34759017CB}']
     function Roll(aPins: integer): Boolean;
     function Score: integer;
   end;

   function NewBowlingGame: IBowlingGame;

implementation
uses System.SysUtils, System.Math, System.Generics.Collections;

type
   TBowlingGame = class(TInterfacedObject, IBowlingGame)
   private
     var
       fRolls: TList<integer>;
     const
       fNumberOfFrames = 10;
       fMaximumFrameScore = 10;
     function IsStrike(aFrameIndex: integer): Boolean;
     function IsSpare(aFrameIndex: integer): Boolean;
     function StrikeBonus(aFrameIndex: integer): integer;
     function SpareBonus(aFrameIndex: integer): integer;
     function SumOfPinsInFrame(aFrameIndex: integer): integer;
     function CorrectNumberOfRolls(aFrameIndex: integer): boolean;
     function ValidInput(aPin: integer): Boolean;
   public
     constructor create;
     function Score: integer;
     function Roll(aPins: integer): Boolean;
   end;

function NewBowlingGame: IBowlingGame;
begin
  result := TBowlingGame.create;
end;

constructor TBowlingGame.create;
begin
  fRolls := TList<integer>.Create;
end;

function TBowlingGame.Roll(aPins: Integer): Boolean;
begin
  if not ValidInput(aPins) then
    exit(false);

  fRolls.Add(aPins);
end;

function TBowlingGame.Score: integer;
var lFrameIndex: integer;
    i: integer;
    lScore: integer;
    lStrikeBonus: integer;
    lFrameScore: integer;
begin
  lScore := 0;
  lFrameIndex := 0;
  try
    if (fRolls.Count < 12) or (fRolls.Count > 21) then
      raise EArgumentException.Create('Not a proper game');
    for i := 1 to fNumberOfFrames do
    begin
      if fRolls.Count <= lFrameIndex then
        raise EArgumentException.Create('Not a proper game');

      if IsStrike(lFrameIndex) then
      begin
        if (fRolls.Count <= lFrameIndex + 2) then
          raise EArgumentException.Create('Not a proper game');

        lStrikeBonus := StrikeBonus(lFrameIndex);
        if (lStrikeBonus > fMaximumFrameScore) and not IsStrike(lFrameIndex + 1) or (lStrikeBonus > 20) then
          raise EArgumentException.Create('Not a proper game');

        lScore := lScore + 10 + lStrikeBonus;
        inc(lFrameIndex, ifthen(i = fNumberOfFrames, 3, 1));
      end
      else
      if IsSpare(lFrameIndex) then
      begin
        if (fRolls.Count <= lFrameIndex + 2) then
          raise EArgumentException.Create('Not a proper game');

        lScore := lScore + 10 + SpareBonus(lFrameIndex);
        inc(lFrameIndex, ifthen(i = fNumberOfFrames, 3, 2));
      end
      else
      begin
        lFrameScore := SumOfPinsInFrame(lFrameIndex);
        if (lFrameScore < 0) or (lFrameScore > 10) then
          raise EArgumentException.Create('Not a proper game');

        lScore := lScore + lFrameScore;
        inc(lFrameIndex, 2);
      end;
    end;
    result := ifthen(CorrectNumberOfRolls(lFrameIndex), lScore, -1);
  except
    result := -1;
  end;
end;

function TBowlingGame.IsStrike(aFrameIndex: Integer): Boolean;
begin
  result := fRolls[aFrameIndex] = fMaximumFrameScore;
end;

function TBowlingGame.IsSpare(aFrameIndex: Integer): Boolean;
begin
  result := fRolls[aFrameIndex] + fRolls[aFrameIndex + 1] = FMaximumFrameScore;
end;

function TBowlingGame.StrikeBonus(aFrameIndex: Integer): integer;
begin
  result := fRolls[aFrameIndex + 1] + fRolls[aFrameIndex + 2];
end;

function TBowlingGame.SpareBonus(aFrameIndex: Integer): integer;
begin
  result := fRolls[aFrameIndex + 2];
end;

function TBowlingGame.SumOfPinsInFrame(aFrameIndex: Integer): integer;
begin
  result := fRolls[aFrameIndex] + fRolls[aFrameIndex + 1];
end;

function TBowlingGame.ValidInput(aPin: integer): Boolean;
begin
  result := true;
  if (fRolls.Count >= 21) or (aPin < 0) or (aPin > 10) or
      ((fRolls.Count + 1) mod 2 = 0) and (fRolls[fRolls.Count - 1] <> 10) and ((fRolls[fRolls.Count - 1] + aPin) > 10) then
    exit(false);

  if (fRolls.Count = 20) then
  begin
    if (fRolls[18] <> 10) and (fRolls[18] + fRolls[19] <> 10) then
      exit(false);

    if (aPin = 10) and ((fRolls[18] <> 10) or (fRolls[19] <> 10) or (fRolls[19] + aPin > 10) and (fRolls[19] + aPin <> 20)) and
        (fRolls[18] + fRolls[19] <> 10) then
      exit(false);

    if (aPin <> 10) and (fRolls[19] + aPin > 10) and (fRolls[19] <> 10) then
      exit(false);
  end;
end;

function TBowlingGame.CorrectNumberOfRolls(aFrameIndex: Integer): boolean;
begin
  result := aFrameIndex = fRolls.Count;
end;

end.
