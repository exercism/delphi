unit uKindergartenGarden;

interface

uses
  System.Generics.Collections;

type
  TGarden = class
  private
    FArr : TArray<string>;
    FStudents : TList<string>;
    FPlants : TDictionary<char, string>;

  public
    constructor Create(AGarden : string);
    destructor Destroy; override;
    function Plants(AStudent : string) : TArray<string>;
  end;

implementation

uses
  System.SysUtils;

{ TGarden }

constructor TGarden.Create(AGarden: string);
begin
  FArr := AGarden.Split(['\n']);
  FStudents := TList<string>.Create;
  FStudents.AddRange(['Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Fred', 'Ginny',
    'Harriet', 'Ileana', 'Joseph', 'Kincaid', 'Larry']);
  FPlants := TDictionary<char, string>.Create;
  FPlants.Add('G', 'grass');
  FPlants.Add('C', 'clover');
  FPlants.Add('R', 'radishes');
  FPlants.Add('V', 'violets');
end;

destructor TGarden.Destroy;
begin
  FStudents.DisposeOf;
  FPlants.DisposeOf;
end;

function TGarden.Plants(AStudent: string): TArray<string>;
var
  P : TList<string>;
  i, j: Integer;
begin
  P := TList<string>.Create;
  i := FStudents.IndexOf(AStudent);
  if i > -1 then
    for j := 0 to 1 do
      P.AddRange([FPlants.Items[FArr[j, i * 2 + 1]], FPlants.Items[FArr[j, i * 2 + 2]]]);
  Result := p.ToArray;
  P.DisposeOf;
end;

end.
