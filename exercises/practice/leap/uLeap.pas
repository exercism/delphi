unit uLeap;

interface

type
  TYear = class
    class function IsLeap(aYear: integer): Boolean;
  end;

implementation

{ TYear }

class function TYear.IsLeap(aYear: integer): Boolean;
begin
  Result := true;
end;

end.