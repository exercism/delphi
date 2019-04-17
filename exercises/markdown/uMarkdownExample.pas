unit uMarkdown;

interface

type
  TMarkdown = class
    class function Parse(input: String): String;
  end;

implementation

uses
  System.Sysutils, RegularExpressions;

class function TMarkdown.Parse(input: String): String;
var
  isNormalText: Boolean;
  Lines: TArray<String>;

  procedure ParseBold(var line: String);
  begin
    while TRegEx.IsMatch(line, '\_\_(.)+\_\_') do
    begin
      line := line.Replace('__', '<strong>', []);
      line := line.Replace('__', '</strong>', []);
    end;
  end;

  procedure ParseItalic(var line: String);
  begin
    while TRegEx.IsMatch(line, '\_(.)+\_') do
    begin
      line := line.Replace('_', '<em>', []);
      line := line.Replace('_', '</em>', []);
    end;
  end;

  function ParseHeaders(var line: String): Boolean;
  begin
    var HeaderLevel := 0;
    for var ch in line do
      if ch = '#' then
        inc(HeaderLevel)
      else
        break;
    if (HeaderLevel = 0) then
      Exit(False)
    else
    begin
      line := Format('<h%0:d>' + line.Remove(0, HeaderLevel).TrimLeft +
        '</h%0:d>', [HeaderLevel]);
      Exit(True);
    end;
  end;

  function ParseLI(var line: String): Boolean;
  begin
    Result := False;
    if line.TrimLeft.StartsWith('*') then
    begin
      Result := True;
      line := line.TrimLeft.Remove(0, 1);
      line := '<li>' + line.Trim + '</li>';
    end;
  end;

  procedure WrapUL(var Str: String);
  begin
    Str := TRegEx.Replace(Str, '<li>.*?<\/li>(?!<li>)', '<ul>$0</ul>');
  end;

begin
  Lines := input.Split(['\n'], TStringSplitOptions.ExcludeEmpty);

  for var i := Low(Lines) to High(Lines) do
  begin
    isNormalText := True;
    ParseBold(Lines[i]);
    ParseItalic(Lines[i]);
    isNormalText := not ParseHeaders(Lines[i]);
    isNormalText := not ParseLI(Lines[i]) and isNormalText;

    if isNormalText then
      Result := Result + '<p>' + Lines[i] + '</p>'
    else
      Result := Result + Lines[i];
  end;

  WrapUL(Result);

end;

end.
