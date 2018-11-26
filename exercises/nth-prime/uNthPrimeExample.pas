unit uNthPrime;

interface

function NthPrime(AOrder : integer) : integer;

implementation

uses
  System.SysUtils;

function NthPrime(AOrder : integer) : integer;
var
  i, num : integer;

  function IsPrime(AInp : integer) : boolean;
  var i : integer;
  begin
    Result := true;
    for i := 2 to round(sqrt(AInp)) do
      if Ainp mod I = 0 then
        exit(false);
  end;

begin
  if AOrder < 1 then
    raise EArgumentOutOfRangeException.Create('there is no zeroth prime');

  if AOrder = 1 then
    Exit(2);

  i := 2;
  num := 3;
  Result := 3;

  while i < AOrder do
  begin
    inc(num, 2);
    if IsPrime(num) then
    begin
      Result := num;
      inc(i);
    end;
  end;
end;

end.
