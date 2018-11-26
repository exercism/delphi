unit uNthPrime;

interface

function NthPrime(AOrder : integer) : integer;

implementation

uses
  System.SysUtils;

function NthPrime(AOrder : integer) : integer;

  function IsPrime(AInp : integer) : boolean;
  begin
    Result := true;
    for var i := 2 to round(sqrt(AInp)) do
      if Ainp mod i = 0 then
        exit(false);
  end;

begin
  if AOrder < 1 then
    raise EArgumentOutOfRangeException.Create('there is no zeroth prime');

  var i := 2;
  var num := 3;

  if AOrder = 1 then
    Exit(i);

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
