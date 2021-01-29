unit uTournament;

interface

uses
  System.Generics.Collections, System.Generics.Defaults;

type
  TRank = record
    Name : string;
    GamesPlayed : integer;
    Won : integer;
    Draw : integer;
    Lost : integer;
    Points : integer;
    function ToString : string;
  end;

  TRankComparer = class(TComparer<TRank>)
    function Compare(const Left, Right: TRank): Integer; override;
  end;

  TTournament = class
  public
    class function Tally(AGames : TArray<string>) : TArray<string>;
  end;

implementation

uses
  System.SysUtils;

{ TTournament }

class function TTournament.Tally(AGames: TArray<string>): TArray<string>;

var FRanks : TDictionary<string, TRank>;

  function InitClub(AClub : string) : TRank;
  const InitRec : TRank =
    (GamesPlayed : 0;
     Won : 0;
     Lost : 0;
     Points : 0;);
  var c : TRank;
  begin
    if not FRanks.ContainsKey(AClub) then
    begin
      c := InitRec;
      c.Name := AClub;
      FRanks.Add(AClub, c);
    end;
  end;

  function Win(AClub : string) : TRank;
  var c : TRank;
  begin
    InitClub(AClub);
    c := FRanks.Items[AClub];
    with c do
    begin
      inc(GamesPlayed);
      inc(Won);
      Inc(Points, 3);
    end;
    FRanks.AddOrSetValue(AClub, c);
  end;

  procedure Draw(AClub : string);
  var c : TRank;
  begin
    InitClub(AClub);
    c := FRanks.Items[AClub];
    with c do
    begin
      inc(GamesPlayed);
      inc(Draw);
      Inc(Points, 1);
    end;
    FRanks.AddOrSetValue(AClub, c);
  end;

  procedure Loose(AClub : string);
  var c : TRank;
  begin
    InitClub(AClub);
    c := FRanks.Items[AClub];
    with c do
    begin
      inc(GamesPlayed);
      inc(Lost);
    end;
    FRanks.AddOrSetValue(AClub, c);
  end;

  procedure GetResults(AMatch : string);
  const Outcomes : Array [1..3] of string = ('loss', 'draw', 'win');
  var ws : TArray<string>;
  begin
    ws := AMatch.Split([';']);
    if ws[2] = 'loss' then
    begin
      Loose(ws[0]);
      Win(ws[1]);
    end;
    if ws[2] = 'draw' then
    begin
      Draw(ws[0]);
      Draw(ws[1]);
    end;
    if ws[2] = 'win' then
    begin
      Win(ws[0]);
      Loose(ws[1]);
    end;
  end;

var
  g: string;
  L : TList<TRank>;
  LS : TList<string>;
  r: TRank;
begin
  Result := ['Team                           | MP |  W |  D |  L |  P'];
  FRanks := TDictionary<string, TRank>.Create;
  for g in AGames do
  begin
    GetResults(g);
  end;

  L := TList<TRank>.Create;
  L.AddRange(FRanks.Values.ToArray);
  L.Sort(TRAnkComparer.Create);
  L.Reverse;

  LS := TList<string>.Create;
  for r in L do
    LS.Add(r.ToString);

  Result := Result + LS.ToArray;

  L.DisposeOf;
  LS.DisposeOf;
  FRanks.DisposeOf;
end;

{ TRankComparer }

function TRankComparer.Compare(const Left, Right: TRank): Integer;
begin
  Result := 0;
  if Left.Points > Right.Points then
    Exit(1);
  if Left.Points < Right.Points then
    Exit(-1);
  if Left.Points = Right.Points then
  begin
    if Left.Name > Right.Name then
      Exit(-1);
    if Left.Name < Right.Name then
      Result := 1;
  end;
end;

{ TRank }

function TRank.ToString: string;
begin
  Result := Format('%-31s|%3d |%3d |%3d |%3d |%3d',[Name, GamesPlayed, Won, Draw, Lost, Points]);
end;

end.
