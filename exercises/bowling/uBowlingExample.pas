unit uBowling;

interface

type
   IBowlingGame = interface(IInvokable)
   ['{D4A292B6-BC15-48ED-AE04-2D34759017CB}']
     procedure Roll(aPins: integer);
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
   public
     constructor create;
     function Score: integer;
     procedure Roll(aPins: integer);
   end;

function NewBowlingGame: IBowlingGame;
begin
  result := TBowlingGame.create;
end;

constructor TBowlingGame.create;
begin
  fRolls := TList<integer>.Create;
end;

procedure TBowlingGame.Roll(aPins: Integer);
begin
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
    for i := 1 to fNumberOfFrames do
    begin
      if fRolls.Count <= lFrameIndex then
        raise EArgumentException.Create('Not a proper game');

      if IsStrike(lFrameIndex) then
      begin
        if (fRolls.Count <= lFrameIndex + 2) then
          raise EArgumentException.Create('Not a proper game');

        lStrikeBonus := StrikeBonus(lFrameIndex);
        if (lStrikeBonus > fMaximumFrameScore) and not IsStrike(lFrameIndex + 1) then
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

function TBowlingGame.CorrectNumberOfRolls(aFrameIndex: Integer): boolean;
begin
  result := aFrameIndex = fRolls.Count;
end;

end.
