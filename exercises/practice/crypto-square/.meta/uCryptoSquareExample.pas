unit uCryptoSquare;

interface

type
  TCryptoSquare = class
    class function ciphertext(AInp : string) : string;
  end;

implementation

uses
  System.SysUtils,System.RegularExpressions, System.Generics.Collections,
  System.Math;

{ TCryptoSquare }

class function TCryptoSquare.ciphertext(AInp: string): string;
var Norm, s : string;
  C : single;
  Cols, Rows, ind : integer;
  i, j, len: Integer;
begin
  if AInp.IsEmpty then
    exit('');
  Norm := TRegEx.Replace(AInp,'\W', '').ToLowerInvariant;
  len := Length(Norm);
  C := sqrt(len);
  Cols := Trunc(C) + Sign(Frac(C));
  Rows := len div Cols + Sign(len mod Cols);
  for i := 0 to Cols - 1 do
  begin
    for j:= 0 to Rows - 1 do
    begin
      ind := j * Cols + i + 1;
      if ind <= len then
        s := s + Norm[ind]
      else
        s := s + ' ';
    end;
    if Result.IsEmpty then
      Result := s
    else
      Result := Result + ' ' + s;
    s := '';
  end;
end;

end.
