unit uProteinTranslation;

interface

uses
  System.Generics.Collections;

type
  TProteinTranslation = class
  private
    class var FCodons : TDictionary<string, string>;
    class constructor Create;
    class destructor Destroy;
  public
    class function Proteins(AInp : string) : TArray<string>;
  end;

implementation

uses System.SysUtils;

{ TProteinTranslation }

class constructor TProteinTranslation.Create;
begin
  FCodons := TDictionary<string, string>.Create;
  FCodons.Add('AUG', 'Methionine');
  FCodons.Add('UUU', 'Phenylalanine');
  FCodons.Add('UUC', 'Phenylalanine');
  FCodons.Add('UUA', 'Leucine');
  FCodons.Add('UUG', 'Leucine');
  FCodons.Add('UCU', 'Serine');
  FCodons.Add('UCC', 'Serine');
  FCodons.Add('UCA', 'Serine');
  FCodons.Add('UCG', 'Serine');
  FCodons.Add('UAU', 'Tyrosine');
  FCodons.Add('UAC', 'Tyrosine');
  FCodons.Add('UGU', 'Cysteine');
  FCodons.Add('UGC', 'Cysteine');
  FCodons.Add('UGG', 'Tryptophan');
  FCodons.Add('UAA', 'STOP');
  FCodons.Add('UAG', 'STOP');
  FCodons.Add('UGA', 'STOP');
end;

class destructor TProteinTranslation.Destroy;
begin
  FCodons.DisposeOf;
end;

class function TProteinTranslation.Proteins(AInp: string): TArray<string>;
var
  i: Integer;
  L: TList<string>;
  Prot: string;
begin
  L := TList<string>.Create;
  i := 0;
  while i < length(Ainp) div 3 do
  begin
    Prot := FCodons.items[AInp.Substring(i * 3, 3)];
    if Prot <> 'STOP' then
      L.Add(Prot)
    else
      break;
    inc(i);
  end;
  Result := L.ToArray;
  L.DisposeOf;
end;

end.
