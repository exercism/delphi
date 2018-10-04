unit uMarkdown;

interface

type
  TMarkdown = class
    class function Parse(AInp : string) : string;
  end;

implementation

uses
  System.Generics.Collections, System.SysUtils;

{ TMarkdown }

class function TMarkdown.Parse(AInp : string): string;
var
  Lines, Tokens : TList<string>;
  L, NewLine: string;
  H, i : integer;
  IsListStarted : boolean;

begin
  Lines := TList<string>.Create;
  Tokens := TList<string>.Create;
  Result := '';
  H := 0;
  IsListStarted := false;
  Lines.AddRange(AInp.Split(['\n']));
  for L in Lines do
  begin
    Tokens.Clear;
    Tokens.AddRange(L.Split([' ']));
    for i := 0 to Tokens.Count - 1 do
    begin
      if Tokens[i].StartsWith('__') then
        Tokens[i] := '<strong>' + Tokens[i].Substring(2);
      if Tokens[i].EndsWith('__') then
        Tokens[i] := Copy(Tokens[i], 0, High(Tokens[i]) - 2) + '</strong>';
      if Tokens[i].StartsWith('_') then
        Tokens[i] := '<em>' + Tokens[i].Substring(1);
      if Tokens[i].EndsWith('_') then
        Tokens[i] := Copy(Tokens[i], 0, High(Tokens[i]) - 1) + '</em>';
    end;

    for i := 1 to Length(Tokens[0]) do
      if Tokens[0][i] = '#' then
        if H < 6 then
          H := H + 1
        else
      else
      begin
        H := 0;
        break;
      end;

    if H <> 0 then
    begin
      Tokens.Delete(0);
      NewLine :=format('<h%d>%s</h%0:d>',[H, string.Join(' ', Tokens.ToArray)]);
    end
    else
      if Tokens[0] = '*' then
      begin
        Tokens.Delete(0);
        NewLine := '<li>' + string.Join(' ', Tokens.ToArray) + '</li>';
      end
      else
      begin
        NewLine := '<p>' + string.Join(' ', Tokens.ToArray) + '</p>';
      end;

    if not IsListStarted then
      if NewLine.StartsWith('<li>') then
      begin
        Result := Result + '<ul>' + NewLine;
        IsListStarted := true;
      end
      else
      begin
        Result := Result + NewLine;
      end
    else
      if not NewLine.StartsWith('<li>') then
      begin
        Result := Result + NewLine + '</ul>';
        IsListStarted := false;
      end;
  end;
  if IsListStarted  then
    Result := Result + NewLine + '</ul>';
  Lines.DisposeOf;
  Tokens.DisposeOf;
end;

end.

