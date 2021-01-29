unit uSecretHandshake;

interface
uses Generics.Collections;

type
  TSecretHandshake = class
  private
    class var CommandValues: TList<TPair<integer, string>>;
    class procedure BuildCommandValues;
    class function ShouldReverse(aCommandValue: integer): Boolean;
  public
    class function commands(aInput: integer): TArray<string>;
  end;

implementation
uses SysUtils;

{ TSecretHandshake }

class procedure TSecretHandshake.BuildCommandValues;
begin
  if not assigned(CommandValues) then
  begin
    CommandValues := TList<TPair<integer, string>>.Create;
    CommandValues.Add(TPair<integer,string>.Create(1, 'wink'));
    CommandValues.Add(TPair<integer,string>.Create(2, 'double blink'));
    CommandValues.Add(TPair<integer,string>.Create(4, 'close your eyes'));
    CommandValues.Add(TPair<integer,string>.Create(8, 'jump'));
  end;
end;

class function TSecretHandshake.commands(aInput: integer): TArray<string>;
var lCommands: TList<string>;
    lKeyValue: TPair<integer,string>;
begin
  BuildCommandValues;
  lCommands := TList<string>.Create;

  for lKeyValue in CommandValues do
  begin
    if aInput and lKeyValue.Key <> 0 then
      lCommands.Add(lKeyValue.Value);
  end;

  if ShouldReverse(aInput) then
    lCommands.Reverse;
  result := lCommands.ToArray;
end;

class function TSecretHandshake.ShouldReverse(aCommandValue: integer): Boolean;
begin
  result := (aCommandValue and 16) <> 0;
end;

end.
