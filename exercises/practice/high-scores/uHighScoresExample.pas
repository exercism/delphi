unit uHighScores;

interface
uses
  System.Generics.Collections;

type
  IScores = interface(IInvokable)
  ['{3D174C80-BA8D-4D92-AB1B-DA29ED0812CE}']
    function Scores: TList<integer>;
    function Latest: integer;
    function Highest: integer;
    function personalTopThree: TList<integer>;
    function Report: string;
  end;

function NewScores(aInputScores: TArray<integer>): IScores;

implementation

uses
  System.SysUtils;

type
  TScores = class(TInterfacedObject, IScores)
  private
    FScores: TList<integer>;
  public
    constructor Create(const aInputScores: TArray<integer>);
    destructor Destroy; override;
    function Scores:  TList<integer>;
    function Latest: integer;
    function Highest: integer;
    function personalTopThree: TList<integer>;
    function Report: string;
  end;

 { TScores }

function NewScores(aInputScores: TArray<integer>): IScores;
begin
  result := TScores.Create(aInputScores);
end;

constructor TScores.Create(const aInputScores: TArray<integer>);
begin
  FScores := TList<integer>.Create;
  FScores.AddRange(aInputScores);
end;

destructor TScores.Destroy;
begin
  FScores.DisposeOf;
  inherited;
end;

function TScores.Highest: integer;
begin
  var lScoresList := TList<integer>.Create;
  lScoresList.AddRange(FScores);
  lScoresList.Sort;
  Result := lScoresList.Last;
  lScoresList.DisposeOf;
end;

function TScores.Latest: integer;
begin
  Result := FScores.Last;
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

function TScores.Scores: TList<integer>;
begin
  Result := FScores;
end;

function TScores.personalTopThree: TList<integer>;
begin
  var lTopThree := TList<integer>.Create;
  lTopThree.AddRange(FScores);
  lTopThree.Sort;
  lTopThree.Reverse;
  if lTopThree.Count > 3 then
    lTopThree.Count := 3;
  Result := lTopThree;
end;

end.
