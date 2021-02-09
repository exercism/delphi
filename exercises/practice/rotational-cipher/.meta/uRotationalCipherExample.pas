unit uRotationalCipher;

interface

type
  RotationalCipher = class
  private
    const
      cLowerCase = 'abcdefghijklmnopqrstuvwxyz';
      cUppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    class function rotate(aLetter: char; aShiftKey: integer; aKey: string): char; overload;
    class function rotate(aLetter: char; aShiftKey: integer): char; overload;
  public
    class function rotate(aPhrase: string; aShiftKey: integer): string; overload;
  end;

implementation
uses
  System.SysUtils, Character, StrUtils;


{ RotationalCipher }

class function RotationalCipher.rotate(aLetter: char; aShiftKey: integer;
  aKey: string): char;
begin
  var LetterIndex := Pos(aLetter, aKey);
  var KeyLength := High(aKey);

  var lIndex := LetterIndex + aShiftKey mod KeyLength;
  if lIndex < Low(aKey) then
    inc(lIndex, KeyLength);
  if lIndex > KeyLength then
    dec(lIndex, KeyLength);
  result := aKey[lIndex];
end;

class function RotationalCipher.rotate(aLetter: char; aShiftKey: integer): char;
begin
  if aLetter.IsLetter then
    result := rotate(aLetter, aShiftKey, ifthen(aLetter.IsUpper, cUppercase, cLowercase))
  else
    result := aLetter;
end;

class function RotationalCipher.rotate(aPhrase: string;
  aShiftKey: integer): string;
begin
  result := '';
  for var aLetter in aPhrase do
    result := result + rotate(aLetter, aShiftKey);
end;

end.
