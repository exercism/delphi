unit uLeap;

interface

type
  TYear = class
  public
    class function IsLeap(aYear: integer): Boolean; static;
  end;
implementation

class function TYear.IsLeap(aYear: integer): Boolean;
begin
  result := ((aYear mod 400) = 0) or (((aYear mod 4) = 0) and ((aYear mod 100) <> 0));
end;

end.
