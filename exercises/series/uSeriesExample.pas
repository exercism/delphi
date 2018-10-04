unit uSeries;

interface

type
  TSlice = class
  private
    FSerie : string;
  public
    constructor Create(AInp : string);
    function slices(ALenght : integer) : TArray<string>;
  end;
implementation

uses System.SysUtils, System.Generics.Collections;

{ TSlice }

constructor TSlice.Create(AInp: string);
begin
  FSerie := AInp;
end;

function TSlice.slices(ALenght: integer): TArray<string>;
var
  i: Integer;
  L : TList<string>;
begin
  if (FSerie = '') then
    raise EArgumentException.Create('series cannot be empty');
  case ALenght of
    low(integer) .. -1 : raise EArgumentOutOfRangeException.Create('slice length cannot be negative');
     0 : raise EArgumentOutOfRangeException.Create('slice length cannot be zero');
    else
      if (Length(FSerie) < ALenght) then
        raise EArgumentOutOfRangeException.Create('slice length cannot be greater than series length');
  end;

  L := TList<string>.Create;
  for i := 0 to Length(FSerie) - ALenght do
    L.Add(FSerie.Substring(i, ALenght));
  Result := L.ToArray;
  L.DisposeOf;
end;

end.
