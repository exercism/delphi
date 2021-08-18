                                              unit uGradeSchool;

interface

uses
  Generics.Collections;

type
  TRoster = TList<string>;
  TGrades = TDictionary<Integer, TRoster>;

  ISchool = interface
    procedure Add(const aName: string; aGrade: integer);
    function Grade(aGrade: integer): TRoster;
    function Roster: TRoster;
  end;

  TSchool = class(TInterfacedObject, ISchool)
  private
    procedure Add(const aName: string; aGrade: integer);
    function Grade(aGrade: integer): TRoster;
    function Roster: TRoster;
  end;

function NewSchool: ISchool;

implementation

uses
  SysUtils;

function NewSchool: ISchool;
begin
  raise Exception.Create('Not yet implemented');
end;

{ TSchool }

procedure TSchool.Add(const aName: string; aGrade: integer);
begin
  raise Exception.Create('Not yet implemented');
end;

function TSchool.Grade(aGrade: integer): TRoster;
begin
  raise Exception.Create('Not yet implemented');
end;

function TSchool.Roster: TRoster;
begin
  raise Exception.Create('Not yet implemented');
end;

end.