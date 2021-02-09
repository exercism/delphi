unit uPhoneNumber;

interface

type
   IPhoneNumber = interface(IInvokable)
   ['{2415B863-E2D7-4E13-BDEF-F7FE9B3E0788}']
     function GetCleanNumber: string;
     function GetAreaCode: string;
     function GetExchangeCode: string;
     function ToString: string;
     property Clean: string read GetCleanNumber;
     property Area: string read GetAreaCode;
     property Exchange: string read GetExchangeCode;
   end;

function NewPhoneNumber(aPhoneNumber: string): IPhoneNumber;

implementation
uses RegularExpressions, System.SysUtils, System.StrUtils;

type
   TPhoneNumber = class(TInterfacedObject, IPhoneNumber)
   private
     fDigitsOnly: TRegex;
     fContainsLetters: TRegex;
     fNumber: string;
     fAreaCode: string;
     fExchangeCode: string;
     function GetCleanNumber: string;
     function GetAreaCode: string;
     function GetExchangeCode: string;
     function GetValidatedPhoneNumber(aPhoneNumber: string): string;
     function StripOutNonNumerics(aValue: string): string;
     function IsInvalidPhoneNumber(aPhoneNumber: string): Boolean;
     function GetInvalidPhoneNumberReplacement(aPhoneNumber: string): string;
     function IsPhoneNumberwithUSAreaCode(aValue: string): Boolean;
     function IsValidCode(aCode: string): Boolean;
   public
     constructor Create(aPhoneNumber: string);
     function ToString: string;
     property Clean: string read GetCleanNumber;
     property Area: string read GetAreaCode;
     property Exchange: string read GetExchangeCode;
   end;

function NewPhoneNumber(aPhoneNumber: string): IPhoneNumber;
begin
  result := TPhoneNumber.Create(aPhoneNumber);
end;

constructor TPhoneNumber.Create(aPhoneNumber: string);
begin
  fDigitsOnly := TRegEx.Create('[^\d]');
  fContainsLetters := TRegEx.Create('[a-zA-Z]');
  fNumber := GetValidatedPhoneNumber(aPhoneNumber);
  if not fNumber.IsEmpty then
  begin
    fAreaCode := fNumber.Substring(0, 3);
    fExchangeCode := fNumber.Substring(3,3);
  end;
end;

function TPhoneNumber.GetCleanNumber: string;
begin
  result := ifthen(IsValidCode(fAreaCode) and IsValidCode(fExchangeCode),fNumber,'');
end;

function TPhoneNumber.GetAreaCode: string;
begin
  result := ifthen(IsValidCode(fAreaCode),fAreaCode,'');
end;

function TPhoneNumber.GetExchangeCode: string;
begin
  result := ifthen(IsValidCode(fExchangeCode),fExchangeCode,'');
end;

function TPhoneNumber.GetValidatedPhoneNumber(aPhoneNumber: string):string;
var stripped: string;
begin
  stripped := StripOutNonNumerics(aPhoneNumber);
  if IsInvalidPhoneNumber(stripped) then
    result := GetInvalidPhoneNumberReplacement(stripped)
  else
    result := stripped;
end;

function TPhoneNumber.StripOutNonNumerics(aValue: string): string;
begin
  if fContainsLetters.IsMatch(aValue) then
    result := ''
  else
    result := fDigitsOnly.Replace(aValue, '');
end;

function TPhoneNumber.IsInvalidPhoneNumber(aPhoneNumber: string): Boolean;
begin
  result := aPhoneNumber.Length <> 10;
end;

function TPhoneNumber.GetInvalidPhoneNumberReplacement(aPhoneNumber: string): string;
begin
  result := ifthen(IsPhoneNumberwithUSAreaCode(aPhoneNumber), aPhoneNumber.Substring(1), '');
end;

function TPhoneNumber.IsPhoneNumberwithUSAreaCode(aValue: string): Boolean;
begin
  result := (aValue.Length = 11) and aValue.StartsWith('1');
end;

function TPhoneNumber.IsValidCode(aCode: string): Boolean;
begin
  result := (not aCode.IsEmpty) and (aCode[1] in ['2'..'9']);
end;

function TPhoneNumber.ToString: string;
begin
  result := Format('(%s) %s-%s',[Area, Exchange, Clean.Substring(6)]);
end;

end.
