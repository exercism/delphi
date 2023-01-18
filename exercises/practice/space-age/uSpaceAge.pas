unit uSpaceAge;

interface

type
  ISpaceAge = interface
    ['{DA6C1C87-D1E5-4C8D-A797-AD008915179C}']
    function OnEarth: double;
    function OnJupiter: double;
    function OnMars: double;
    function OnMercury: double;
    function OnNeptune: double;
    function OnSaturn: double;
    function OnUranus: double;
    function OnVenus: double;
  end;

function NewSpaceAge(Age: Integer): ISpaceAge;

implementation

uses
  SysUtils;

function NewSpaceAge(Age: Integer): ISpaceAge;
begin
  raise Exception.Create('Not yet implemented');
end;

end.