unit uHighScores;

interface

type
  IScores = interface(IInvokable)
  ['{3D174C80-BA8D-4D92-AB1B-DA29ED0812CE}']
    function Input(AInput: TArray<integer>): ISCores;
    function Scores:  TArray<integer>;
    function Latest: integer;
    function Highest: integer;
    function personalTopThree: TArray<integer>;
    function Report: string;
  end;

function NewScores: IScores;

implementation

uses
  System.Generics.Collections, System.SysUtils;

type

  TScores = class(TInterfacedObject, IScores)
  private
    FScores: TArray<integer>;
  public
    function Input(AInput: TArray<integer>): ISCores;
    function Scores:  TArray<integer>;
    function Latest: integer;
    function Highest: integer;
    function personalTopThree: TArray<integer>;
    function Report: string;
  end;

 { TScores }

function NewScores: IScores;
begin
  result := TScores.Create;
end;

function TScores.Highest: integer;
begin
  var l := TList<integer>.Create;
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
begin
  var L := Latest;
  var H := Highest;
  if L = H then
    Result := format('Your latest score was %d. That''s your personal best!',[L])
  else
    Result := format('Your latest score was %d. That''s %d short of your personal best!',[L, H - L]);
end;

function TScores.Scores: TArray<integer>;
begin
  Result := FScores;
end;

function TScores.personalTopThree: TArray<integer>;
begin
  var l := TList<integer>.Create;
  l.AddRange(FScores);
  l.Sort;
  l.Reverse;
  if l.Count > 3 then
    l.Count := 3;
  Result := l.ToArray;
  l.DisposeOf;
end;

end.
