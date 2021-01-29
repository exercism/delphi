unit uProverb;

interface

type
  IProverb = interface(IInterface)
  ['{98C2D34D-1073-4E6D-B548-689745C22D2D}']
    function recite: TArray<string>;
  end;


function Proverb(aPieces: array of string): IProverb;

implementation
uses SysUtils;

type
  TProverb = class(TInterfacedObject, IProverb)
  private
    fPieces: Array of string;
  public
    constructor create(aPieces: array of string);
    function recite: TArray<string>;
  end;

function Proverb(aPieces: array of string): IProverb;
begin
  result := TProverb.create(aPieces);
end;

{ TProverb }

constructor TProverb.create(aPieces: array of string);
var
  i: integer;
begin
  SetLength(fPieces, length(aPieces));
  if length(aPieces) > 0 then
    for i := Low(aPieces) to High(aPieces) do
      fPieces[i] := aPieces[i];
end;

function TProverb.recite: TArray<string>;
var
  lineIndex: integer;
  lengthPieces: integer;
begin
  lengthPieces := Length(fPieces);
  SetLength(result, lengthPieces);
  if lengthPieces > 0 then
    for lineIndex := 1 to lengthPieces do
    begin
      if lineIndex = lengthPieces then
        result[lineIndex-1] := format('And all for the want of a %s.',[fPieces[Low(fPieces)]])
      else
        result[lineIndex-1] := format('For want of a %s the %s was lost.',[fPieces[lineIndex - 1], fPieces[lineIndex]]);
    end;
end;

end.
