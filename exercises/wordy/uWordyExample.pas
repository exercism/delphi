unit uWordy;

interface
uses System.SysUtils, RegularExpressions, System.Generics.Collections;

type
  EInvalidProblem = Class(Exception);

  TWordy = Class
  private
    type
      TParsedProblem = record
        X: integer;
        Operation1: string;
        Y: integer;
        Operation2: string;
        Z: integer;
        constructor create(parsedGroups: TGroupCollection);
      end;
    class var Operations: TDictionary<string, TFunc<integer, integer, integer>>;
    class var VariableAndOperatorGroupsRegex: TRegex;
    class procedure buildOperations;
    class procedure buildVariableAndOperatorGroupsRegex;
    class function ParseProblem(aProblem: string): TParsedProblem;
  public
    class function Answer(aQuestion: string): integer;
  end;

implementation
uses Math;

{ TWordy }

class function TWordy.Answer(aQuestion: string): integer;
var ParsedProblem: TParsedProblem;
    Operation: TFunc<integer, integer, integer>;
    firstPass: integer;
begin
  if not assigned(Operations) then
  begin
    buildOperations;
    buildVariableAndOperatorGroupsRegex;
  end;

  ParsedProblem := ParseProblem(aQuestion);
  Operation := Operations[ParsedProblem.Operation1];
  firstPass := Operation(ParsedProblem.X, ParsedProblem.Y);
  if ParsedProblem.Operation2.IsEmpty then
    result := firstPass
  else
  begin
    Operation := Operations[ParsedProblem.Operation2];
    result := Operation(firstPass, ParsedProblem.Z);
  end;
end;

class procedure TWordy.BuildOperations;
begin
  Operations := TDictionary<string, TFunc<integer, integer, integer>>.Create;
  Operations.Add('plus',
    function(X: integer; Y: integer): integer
    begin
      result := X + Y;
    end);

  Operations.Add('minus',
    function(X: integer; Y: integer): integer
    begin
      result := X - Y;
    end);

  Operations.Add('multiplied by',
    function(X: integer; Y: integer): integer
    begin
      result := X * Y;
    end);

  Operations.Add('divided by',
    function(X: integer; Y: integer): integer
    begin
      result := X div Y;
    end);
end;

class procedure TWordy.buildVariableAndOperatorGroupsRegex;
begin
  VariableAndOperatorGroupsRegex := TRegex.Create(format('%0:s %1:s %0:s\s*%1:s*\s*%0:s*',
    ['(-?\d+)','(plus|minus|multiplied by|divided by)']));
end;

class function TWordy.ParseProblem(aProblem: string): TParsedProblem;
var Match: TMatch;
begin
  Match := VariableAndOperatorGroupsRegex.Match(aProblem);
  if Match.Groups.Count = 0 then
    raise EInvalidProblem.Create('Invalid Problem');

  result := TParsedProblem.create(Match.Groups);
end;

{ TWordy.TParsedProblem }

constructor TWordy.TParsedProblem.create(parsedGroups: TGroupCollection);
var i: integer;
    parsedItems: TList<string>;
    parsedItemsArray: TArray<string>;
begin
  parsedItems := TList<string>.Create;
  for i := 1 to parsedGroups.Count - 1 do
  begin
    if parsedGroups[i].Success then
      parsedItems.Add(parsedGroups[i].Value)
    else
      parsedItems.Add('');
  end;

  parsedItemsArray := parsedItems.ToArray;
  Setlength(parsedItemsArray, 5);

  X := parsedItemsArray[0].ToInteger;
  Operation1 := parsedItemsArray[1];
  Y := parsedItemsArray[2].ToInteger;
  Operation2 := parsedItemsArray[3];
  if parsedItemsArray[4] <> '' then
    Z := parsedItemsArray[4].ToInteger
  else
    Z := 0;
end;

end.
