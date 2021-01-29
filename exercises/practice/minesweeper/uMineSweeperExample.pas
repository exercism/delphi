unit uMineSweeper;

interface

type
  TMineSweeper = class
  private
    class function GetCountForSquare(board: array of string; x, y: integer): integer; static;
  public
    class function Annotate(aInput: string): string; static;
  end;

implementation
uses System.Generics.Collections, System.StrUtils, System.SysUtils;

class function TMineSweeper.Annotate(aInput: string): string;
var lResults: TList<string>;
    Board: TArray<string>;
    lwrkResult: string;
    i, j: integer;
    numMines: integer;
begin
  result := '';
  lResults := TList<string>.Create;
  Board := aInput.Split(['\n'],none);
  if length(Board) > 0 then
  begin
    for i := 0 to length(Board) - 1 do
    begin
      lwrkResult := '';
      for j := 1 to length(Board[0]) do
      begin
        if board[i,j] = '*' then
          lwrkResult := lwrkResult + '*'
        else
        begin
          numMines := GetCountForSquare(Board, i, j);
          lwrkResult := lwrkResult +  ifthen(numMines = 0, ' ', numMines.ToString);
        end;
      end;
      lResults.Add(lwrkResult);
    end;
    result := result.Join('\n',lResults.ToArray);
  end;
end;

class function TMineSweeper.GetCountForSquare(board: array of string; x, y: integer): integer;
var i, j: integer;
begin
  result := 0;
  for i := -1 to 1 do
    for j := -1 to 1 do
      try
        {$IFOPT R-}
          {$DEFINE CKRANGEOFF}
          {$R+}
        {$ENDIF}
        if board[x + i, y + j] = '*' then
          inc(result);
        {$IFDEF CKRANGEOFF}
          {$UNDEF CKRANGEOFF}
          {$R-}
        {$ENDIF}
      except
        on ERangeError do
          continue;
      end;
end;

end.
