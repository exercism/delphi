unit uCollatzconjecture;

interface

uses
  SysUtils;

type
  EIllegalNumber = class(Exception)

  end;

function collatzSteps(aNumber: integer): integer;

implementation

function collatzSteps(aNumber: integer): integer;
begin
  raise Exception.Create('Not yet implemented');
end;

end.
