unit uAllergies;

interface
uses System.Generics.Collections;

type
   IAllergies = interface(IInvokable)
   ['{0A1F6B96-4CDC-4D7C-BE50-6B466CA27EB0}']
     function GetAllergyList: TList<string>;
     function AllergicTo(allergy: string): Boolean;
     property IList: TList<string> read GetAllergyList;
   end;

   TAllergies = class(TInterfacedObject, IAllergies)
   private
     fScore: integer;
     fAvailableAllergies: TDictionary<string, integer>;
     fAllergyList: TList<string>;
     function IsInAllergyScore(allergyvalue: integer): Boolean;
     function GetAllergyList: TList<string>;
   public
     constructor create(aScore: integer);
     function AllergicTo(allergy: string): Boolean;
     property IList: TList<string> read GetAllergyList;
   end;

implementation

constructor TAllergies.create(aScore: Integer);
begin
  fScore := aScore;
  fAvailableAllergies := TDictionary<string, integer>.create;
  with fAvailableAllergies do
  begin
    Add('eggs', 1);
    Add('peanuts', 2);
    Add('shellfish', 4);
    Add('strawberries', 8);
    Add('tomatoes', 16);
    Add('chocolate', 32);
    Add('pollen', 64);
    Add('cats', 128);
  end; //with
end;

function TAllergies.IsInAllergyScore(allergyvalue: Integer): Boolean;
begin
  result := (fScore and allergyvalue) = allergyvalue;
end;

function TAllergies.GetAllergyList: TList<string>;
var aPair: TPair<string, integer>;
begin
   result := TList<string>.create;
   for aPair in fAvailableAllergies do
   begin
     if IsInAllergyScore(aPair.Value) then
       result.Add(aPair.Key);
   end;
end;

function TAllergies.AllergicTo(allergy: string): Boolean;
begin
  result := IsInAllergyScore(fAvailableAllergies[allergy]);
end;

end.
