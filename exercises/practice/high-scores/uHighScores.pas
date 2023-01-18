unit uHighScores;

interface

uses
  Generics.Collections;

type
  IScores = interface
    ['{F94C72E0-2B61-4934-B9D6-8A7F08751917}']
    function Highest: Integer;
    function Latest: Integer;
    function GetScores: TList<integer>;
    function GetpersonalTopThree: TList<integer>;
    function GetReport: string;
    property Scores: TList<integer> read GetScores;
    property personalTopThree: TList<integer> read GetpersonalTopThree;
    property Report: string read GetReport;
  end;

function NewScores(aSerie: TArray<integer>): IScores;

implementation

uses
  SysUtils;

function NewScores(aSerie: TArray<integer>): IScores;
begin
  raise Exception.Create('Not yet implemented');
end;

end.