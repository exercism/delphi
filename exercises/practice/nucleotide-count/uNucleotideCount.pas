unit uNucleotideCount;

interface

uses
  Generics.Collections,
  SysUtils;

type
  EInvalidNucleotideException = class(Exception)
  end;

  TDNA = class
  private
  public
    constructor Create(const aDNA: string);
    function NucleotideCounts: TDictionary<char, integer>;
  end;

implementation

constructor TDNA.Create(const aDNA: string);
begin
  inherited Create;
end;

function TDNA.NucleotideCounts: TDictionary<char, integer>;
begin
  raise Exception.Create('Not yet implemented');
end;

end.
