unit uAllergies;

interface

uses
  Generics.Collections;

type
  IAllergies = interface
    ['{57899356-9EFA-4D8F-AB2C-978A87E577D2}']
    function AllergicTo(const aItem: string): Boolean;
    function GetList: TList<string>;
    property List: TList<string> read GetList;
  end;

  TAllergies = class(TInterfacedObject, IAllergies)
  private
    function AllergicTo(const aItem: string): Boolean;
    function GetList: TList<string>;
  public
    constructor Create(aID: integer);
  end;

implementation

uses
  SysUtils;

function TAllergies.AllergicTo(const aItem: string): Boolean;
begin
  raise Exception.Create('Not yet implemented');
end;

constructor TAllergies.Create(aID: integer);
begin
  raise Exception.Create('Not yet implemented');
end;

function TAllergies.GetList: TList<string>;
begin
  raise Exception.Create('Not yet implemented');
end;

end.