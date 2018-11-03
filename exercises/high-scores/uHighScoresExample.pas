unit uHighScores;

interface

type
  IScores = interface
    function Input(AInput : TArray<integer>) : ISCores;
    function Scores :  TArray<integer>;
    function Latest : integer;
    function Highest : integer;
    function Top : TArray<integer>;
    function Report : string;
  end;

  TScores = class(TInterfacedObject, IScores)
  private
    FScores : TArray<integer>;
  public
    function Input(AInput : TArray<integer>) : ISCores;
    function Scores :  TArray<integer>;
    function Latest : integer;
    function Highest : integer;
    function Top : TArray<integer>;
    function Report : string;
  end;

implementation

uses
  System.Generics.Collections, System.SysUtils;

{ TScores }

function TScores.Highest: integer;
var l : TList<integer>;
begin
  l := TList<integer>.Create;
  l.AddRange(FScores);
  l.Sort;
  Result := l.Last;
  l.DisposeOf;
end;

function TScores.Input(AInput: TArray<integer>): ISCores;
begin
  FScores := AInput;
  Result := self;
end;

function TScores.Latest: integer;
begin
  Result := FScores[High(FScores)];
end;

function TScores.Report: string;
var L, H  : integer;
begin
  L := Latest;
  H := Highest;
  if L = H then
    Result := format('Your latest score was %d. That''s your personal best!',[L])
  else
    Result := format('Your latest score was %d. That''s %d short of your personal best!',[L, H - L]);
end;

function TScores.Scores: TArray<integer>;
begin
  Result := FScores;
end;

function TScores.Top: TArray<integer>;
var l : TList<integer>;
begin
  l := TList<integer>.Create;
  l.AddRange(FScores);
  l.Sort;
  l.Reverse;
  if l.Count > 3 then
    l.Count := 3;
  Result := l.ToArray;
  l.DisposeOf;
end;

end.
