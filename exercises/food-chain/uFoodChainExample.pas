unit uFoodChain;

interface

type
  TFoodChain = class
    class function Recite(AStart, AEnd : integer) : string;
  end;

implementation

uses
  system.SysUtils;

{ TFoodChain }

class function TFoodChain.Recite(AStart, AEnd: integer): string;
const
  Parts : TArray<string> = ['fly.',
      'spider.\nIt wriggled and jiggled and tickled inside her.',
      'bird.\nHow absurd to swallow a bird!',
      'cat.\nImagine that, to swallow a cat!',
      'dog.\nWhat a hog, to swallow a dog!',
      'goat.\nJust opened her throat and swallowed a goat!',
      'cow.\nI don''t know how she swallowed a cow!'];
  Layer : TArray<string> = ['',
      'She swallowed the spider to catch the fly.\n',
      'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.\n',
      'She swallowed the cat to catch the bird.\n',
      'She swallowed the dog to catch the cat.\n',
      'She swallowed the goat to catch the dog.\n',
      'She swallowed the cow to catch the goat.\n'];
var
  P : string;
  i: Integer;

  function Rhyme(AInp : integer) : string;
  var
    W, B : string;
    i : integer;
  begin
    Result := '';
    if AInp = 8 then
      Exit('I know an old lady who swallowed a horse.\nShe''s dead, of course!');

    if AInp in [1..7] then
    begin
      B := Parts[AInp - 1] + '\n';
      for i := 1 to AInp do
        W := Layer[i - 1] + W;
    end;
    result := format('I know an old lady who swallowed a %s%sI don''t know why she swallowed the fly. Perhaps she''ll die.', [B, W]);
  end;

begin
  for i := AStart to AEnd do
    if Result = '' then
      Result := Result + Rhyme(i)
    else
      Result := Result + '\n\n' + Rhyme(i);
end;

end.