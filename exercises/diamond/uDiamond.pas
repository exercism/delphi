unit uDiamond;

interface

type
// This is a minimum class with just enough to satisfy the test interface
  TDiamond = class
    function Rows(const aLetter: Char): string;
  end;

implementation

{ TDiamond }

function TDiamond.Rows(const aLetter: Char): string;
begin

end;

end.
