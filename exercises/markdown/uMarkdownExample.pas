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
  H : integer;
  IsListStarted : boolean;

  function ParseLine(ALine : string) : string;

    function CheckHeader(AToken : string) : integer;
    var
      c: char;
    begin
      Result := 0;
      for c in AToken do
        if (c = '#') and (Result < 6) then
          inc(Result)
        else
          exit(0);
    end;

    procedure DoFormat;
    var
      i : integer;
    begin
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
    end;

  begin
    Tokens.Clear;
    Tokens.AddRange(ALine.Split([' ']));
    DoFormat;

    H := CheckHeader(Tokens[0]);
    Result := '<p>' + string.Join(' ', Tokens.ToArray) + '</p>';
    if H <> 0 then
    begin
      Tokens.Delete(0);
      Result :=format('<h%d>%s</h%0:d>',[H, string.Join(' ', Tokens.ToArray)]);
    end
    else
      if Tokens[0] = '*' then
      begin
        Tokens.Delete(0);
        Result := '<li>' + string.Join(' ', Tokens.ToArray) + '</li>';
      end
  end;

  procedure OpenList;
  begin
    if NewLine.StartsWith('<li>') then
    begin
      Result := Result + '<ul>' + NewLine;
      IsListStarted := true;
    end
    else
      Result := Result + NewLine
  end;

  procedure CloseList;
  begin
    if not NewLine.StartsWith('<li>') then
    begin
      Result := Result + NewLine + '</ul>';
      IsListStarted := false;
    end;
  end;

begin
  Lines := TList<string>.Create;
  Tokens := TList<string>.Create;
  Result := '';
  IsListStarted := false;
  Lines.AddRange(AInp.Split(['\n']));
  for L in Lines do
  begin
    NewLine := ParseLine(L);
    if not IsListStarted then
      OpenList
    else
      CloseList;
  end;
  if IsListStarted  then
    Result := Result + NewLine + '</ul>';
  Lines.DisposeOf;
  Tokens.DisposeOf;
end;

end.

