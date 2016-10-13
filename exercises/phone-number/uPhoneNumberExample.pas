unit uPhoneNumber;

interface
uses RegularExpressions;

type
   IPhoneNumber = interface(IInvokable)
   ['{2415B863-E2D7-4E13-BDEF-F7FE9B3E0788}']
     function GetNumber: string;
     function GetAreaCode: string;
     function ToString: string;
     property Number: string read GetNumber;
     property AreaCode: string read GetAreaCode;
   end;

   TPhoneNumber = class(TInterfacedObject, IPhoneNumber)
   private
     fDigitsOnly: TRegex;
     fNumber: string;
     fAreaCode: string;
     function GetNumber: string;
     function GetAreaCode: string;
     function GetValidatedPhoneNumber(aPhoneNumber: string): string;
     function StripOutNonNumerics(aValue: string): string;
     function IsInvalidPhoneNumber(aPhoneNumber: string): Boolean;
     function GetInvalidPhoneNumberReplacement(aPhoneNumber: string): string;
     function IsPhoneNumberwithUSAreaCode(aValue: string): Boolean;
   public
     constructor Create(aPhoneNumber: string);
     function ToString: string;
     property Number: string read GetNumber;
     property AreaCode: string read GetAreaCode;
   end;


implementation
uses System.SysUtils, System.StrUtils;

constructor TPhoneNumber.Create(aPhoneNumber: string);
begin
  fDigitsOnly := TRegEx.Create('[^\d]');
  fNumber := GetValidatedPhoneNumber(aPhoneNumber);
  fAreaCode := fNumber.Substring(0, 3);
end;

function TPhoneNumber.GetNumber: string;
begin
  result := fNumber;
end;

function TPhoneNumber.GetAreaCode: string;
begin
  result := fAreaCode;
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
  result := fDigitsOnly.Replace(aValue, '');
end;

function TPhoneNumber.IsInvalidPhoneNumber(aPhoneNumber: string): Boolean;
begin
  result := aPhoneNumber.Length <> 10;
end;

function TPhoneNumber.GetInvalidPhoneNumberReplacement(aPhoneNumber: string): string;
begin
  result := ifthen(IsPhoneNumberwithUSAreaCode(aPhoneNumber), aPhoneNumber.Substring(1), '0000000000');
end;

function TPhoneNumber.IsPhoneNumberwithUSAreaCode(aValue: string): Boolean;
begin
  result := (aValue.Length = 11) and aValue.StartsWith('1');
end;

function TPhoneNumber.ToString: string;
begin
  result := Format('(%s) %s-%s',[AreaCode, Number.Substring(3, 3), Number.Substring(6)]);
end;

end.
