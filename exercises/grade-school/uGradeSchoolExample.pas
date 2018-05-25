unit uGradeSchool;

interface
uses System.Generics.Collections;

type
  TRoster = TList<string>;

  ISchool = interface(IInterface)
    ['{8C6DC96D-E56E-4726-B045-F4AFE95DBEB5}']
    procedure Add(aStudent: string; aGrade: integer);
    function Roster: TRoster;
    function Grade(aGrade: integer): TRoster;
  end;

function NewSchool: ISchool;

implementation
uses
  SysUtils;

{ TSchool }
type
  TSchool = class(TInterfacedObject, ISchool)
  private
    fRoster: TDictionary<integer, TRoster>;
    fLowGrade: integer;
    fHighGrade: integer;
  public
    constructor create;
    destructor destroy; override;
    procedure Add(aStudent: string; aGrade: integer);
    function Roster: TRoster;
    function Grade(aGrade: integer): TRoster;
  end;

function NewSchool: ISchool;
begin
  result := TSchool.create;
end;

procedure TSchool.Add(aStudent: string; aGrade: integer);

    function highGrade: integer;
    var
      lItem: TPair<integer, TRoster>;
    begin
      result := 0;
      if fRoster.Count > 0 then
      begin
        result := integer.MinValue;
        for lItem in fRoster do
          if lItem.Key > result then
            result := lItem.Key;
      end;
    end;

    function lowGrade: integer;
    var
      lItem: TPair<integer, TRoster>;
    begin
      result := 0;
      if fRoster.Count > 0 then
      begin
        result := integer.MaxValue;
        for lItem in fRoster do
          if lItem.Key < result then
            result := lItem.Key;
      end;
    end;

    procedure UpdateHighAndLowGrades;
    begin
      fLowGrade := lowGrade;
      fHighGrade := highGrade;
    end;

begin
  if not fRoster.ContainsKey(aGrade) then
    fRoster.Add(aGrade, TRoster.Create);
  fRoster[aGrade].Add(aStudent);
  fRoster[aGrade].Sort;
  UpdateHighAndLowGrades;
end;

constructor TSchool.create;
begin
  inherited create;
  fRoster := TDictionary<integer, TRoster>.Create;
  fLowGrade := 0;
  fHighGrade := 0;
end;

destructor TSchool.destroy;
var
  lGrade: TPair<integer, TRoster>;
begin
  if assigned(fRoster) then
  begin
    if fRoster.Count > 0 then
    begin
      for lGrade in fRoster do
      begin
        lGrade.Value.Clear;
        lGrade.Value.DisposeOf;
      end;
    end;
    fRoster.DisposeOf;
  end;
  inherited;
end;

function TSchool.Grade(aGrade: integer): TRoster;
var
  lStudents: TRoster;
begin
  result := TRoster.Create;
  if fRoster.TryGetValue(aGrade, lStudents) then
    result.AddRange(lStudents.ToArray);
end;

function TSchool.Roster: TRoster;
var
  lGrade: TPair<integer, TRoster>;
  lRoster: TRoster;
  idxGrade: integer;
begin
  result := TRoster.Create;
  for idxGrade := fLowGrade to fHighGrade do
    if fRoster.TryGetValue(idxGrade, lRoster) then
      result.AddRange(lRoster.ToArray);
end;

end.
