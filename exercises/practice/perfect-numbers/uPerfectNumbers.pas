unit uPerfectNumbers;

interface

uses
  SysUtils;

type
  TPerfectTypes = (Deficient, Perfect, Abundant);

  PerfectNumber = class
  public
    class function Classify(aNumber: integer): TPerfectTypes;
  end;

  ENotNaturalNumber = class(Exception)

  end;

implementation

class function PerfectNumber.Classify(aNumber: integer): TPerfectTypes;
begin
  raise Exception.Create('Not yet implemented');
end;

end.
