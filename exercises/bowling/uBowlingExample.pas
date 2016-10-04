unit uBowling;

interface
uses System.Generics.Collections;

type
   IBowlingGame = interface(IInvokable)
   ['{D4A292B6-BC15-48ED-AE04-2D34759017CB}']
     procedure Roll(aPins: integer);
     function Score: integer;
   end;

   function NewBowlingGame: IBowlingGame;

implementation

type
   TBowlingGame = class(TInterfacedObject, IBowlingGame)
   private
     fRolls: TList<integer>;
     fNumberOfFrames: integer;
     fMaximumFrameScore: integer;
     function IsStrike(aFrameIndex: integer): Boolean;
     function IsSpare(aFrameIndex: integer): Boolean;
     function StrikeBonus(aFrameIndex: integer): integer;
     function SpareBonus(aFrameIndex: integer): integer;
     function SumOfPinsInFrame(aFrameIndex: integer): integer;
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
  fNumberOfFrames := 10;
  fMaximumFrameScore := 10;
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
begin
  lScore := 0;
  lFrameIndex := 0;
  for i := 0 to fNumberOfFrames - 1 do
  begin
    if IsStrike(lFrameIndex) then
    begin
      lScore := lScore + 10 + StrikeBonus(lFrameIndex);
      inc(lFrameIndex);
    end
    else
    if IsSpare(lFrameIndex) then
    begin
      lScore := lScore + 10 + SpareBonus(lFrameIndex);
      inc(lFrameIndex, 2);
    end
    else
    begin
      lScore := lScore + SumOfPinsInFrame(lFrameIndex);
      inc(lFrameIndex, 2);
    end;
  end;
  result := lScore;
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

end.
