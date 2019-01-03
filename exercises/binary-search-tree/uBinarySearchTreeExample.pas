unit uBinarySearchTree;

interface

type
  TBinarySearchTree = class
  private
    FValue : string;
    procedure DoAdd(Aval : string; var ABranch : TBinarySearchTree);
  public
    Left, Right : TBinarySearchTree;
    procedure Add(AVal : string);
    function SortedData : TArray<string>;
    property Data : string read FValue;
    constructor Create(AVal : TArray<string>);
    destructor Destroy; override;
  end;

implementation

uses
  System.Generics.Collections;

{ TBinarySearchTree }

procedure TBinarySearchTree.Add(AVal: string);
begin
  if FValue < AVal then
    DoAdd(AVal, Right)
  else
    DoAdd(AVal, Left);
end;

constructor TBinarySearchTree.Create(AVal: TArray<string>);
var
  I, L: Integer;
begin
  inherited Create;
  L := length(AVal);
  if L > 0 then
  begin
    FValue := AVal[0];
    Left := nil;
    Right := nil;

    for I := 1 to length(AVal) - 1 do
      Add(AVal[i]);
  end;
end;

destructor TBinarySearchTree.Destroy;
begin
  if Assigned(Left) then
    Left.Free;
  if Assigned(Right) then
    Right.Free;
  inherited;
end;

procedure TBinarySearchTree.DoAdd(Aval: string; var ABranch: TBinarySearchTree);
begin
  if Assigned(ABranch) then
    ABranch.Add(AVal)
  else
    ABranch := TBinarySearchTree.Create([AVal]);
end;

function TBinarySearchTree.SortedData: TArray<string>;
var
  List : TList<string>;
begin
  List := TList<string>.Create;
  if Assigned(Left) then
    List.AddRange(left.SortedData);
  List.Add(Data);
  if Assigned(Right) then
    List.AddRange(Right.SortedData);
  Result := List.ToArray;
  List.Free;
end;

end.
