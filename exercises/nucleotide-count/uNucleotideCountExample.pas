unit uNucleotideCount;

interface
uses SysUtils, System.Generics.Collections;

type
  EInvalidNucleotideException = class(Exception);

  TDNA = class
  private
    fNucleotideCounts: TDictionary<char, integer>;
    function GetNucleotideCounts: TDictionary<char, integer>;
  public
    constructor create(aSequence: string);
    destructor destroy;
    function Count(aChar: char): integer;
    property NucleotideCounts: TDictionary<char, integer> read GetNucleotideCounts;
  end;

implementation


constructor TDNA.create(aSequence: string);
var NucleotideList: TList<TPair<char, integer>>;
    charInSequence: char;
    count: integer;
begin
  NucleotideList := TList<TPair<char, integer>>.Create;
  NucleotideList.Add(TPair<char, integer>.Create('A', 0));
  NucleotideList.Add(TPair<char, integer>.Create('T', 0));
  NucleotideList.Add(TPair<char, integer>.Create('C', 0));
  NucleotideList.Add(TPair<char, integer>.Create('G', 0));
  fNucleotideCounts := TDictionary<char, integer>.create(NucleotideList);

  for charInSequence in aSequence do
  begin
    if fNucleotideCounts.ContainsKey(charInSequence) then
    begin
      count := fNucleotideCounts[charInSequence];
      inc(count);
      fNucleotideCounts[charInSequence] := count;
    end;
  end;
end;

destructor TDNA.Destroy;
begin
  fNucleotideCounts.Free;
end;

function TDNA.GetNucleotideCounts: TDictionary<char, integer>;
begin
  result := fNucleotideCounts;
end;

function TDNA.Count(aChar: Char): integer;
begin
  result := 0;
  if not fNucleotideCounts.TryGetValue(aChar, result) then
    raise EInvalidNucleotideException.Create('Invalid Nucleotide');
end;

end.
