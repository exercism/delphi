unit uPhoneNumber;

interface

type
  IPhoneNumber = interface
  ['{3A145E3E-6B94-443A-BEC2-986F137C512E}']
    function Clean: string;
    function Area: string;
    function Exchange: string;
    function ToString: string;
  end;

function NewPhoneNumber(const aPhoneNum: string): IPhoneNumber;

implementation

uses
  SysUtils;

function NewPhoneNumber(const aPhoneNum: string): IPhoneNumber;
begin
  raise Exception.Create('Not yet implemented');
end;

end.
