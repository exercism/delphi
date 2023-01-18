unit uAnagram;

interface

type
  TAnagram = class
  public
    constructor Create(const aTapper: string);
    function findAnagram(aChars: TArray<string>): TArray<string>;
  end;

implementation

uses
  SysUtils;

constructor TAnagram.Create(const aTapper: string);
begin
  inherited Create;
end;

function TAnagram.findAnagram(aChars: TArray<string>): TArray<string>;
begin
  raise Exception.Create('Not yet implemented');
end;

end.
