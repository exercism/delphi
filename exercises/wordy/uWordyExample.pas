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
        constructor create(parsedGroups: TGroupCollection); overload;
        constructor create(aXValue: integer); overload;
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
  if ParsedProblem.Operation1.IsEmpty then
  begin
    result := ParsedProblem.X;
  end
  else
  begin
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

    function TryGetTrailingValue(out aTrailingValue: integer): boolean;
    var
      stripPunc: string;
      splitProb: TArray<string>;
    begin
      stripPunc := aProblem.Replace('?','');
      splitProb := stripPunc.Split([' ']);
      try
        aTrailingValue := splitProb[high(splitProb)].ToInteger;
        result := true;
      except
        result := false;
      end;
    end;

    function ContainsValidOperations: boolean;
    begin
      result := TRegex.IsMatch(aProblem, '(plus|minus|multiplied by|divided by)')
    end;

    function ContainsDoubledUpOperations: boolean;
    var
      lMatch: TMatch;
    begin
      result := false;
      lMatch := TRegex.Match(aProblem, '(plus|minus|multiplied by|divided by)');
      result := lMatch.Groups.Count > 1;
    end;

var
  lTrailingValue: integer;
begin
  Match := VariableAndOperatorGroupsRegex.Match(aProblem);
  if Match.Groups.Count = 0 then
  begin
    if not ContainsDoubledUpOperations and aProblem.StartsWith('What is') and TryGetTrailingValue(lTrailingValue) then
      exit(TParsedProblem.create(lTrailingValue))
    else
    if ContainsValidOperations then
      raise EInvalidProblem.Create('syntax error')
    else
      raise EInvalidProblem.Create('unknown operation');
  end;

  result := TParsedProblem.create(Match.Groups);
end;

{ TWordy.TParsedProblem }

constructor TWordy.TParsedProblem.create(aXValue: integer);
begin
  X := aXValue;
end;

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
  if (parsedItemsArray[4] <> '') then
  begin
    if Operation2.IsEmpty then
      raise EInvalidProblem.Create('syntax error');

    Z := parsedItemsArray[4].ToInteger
  end;
end;

end.
