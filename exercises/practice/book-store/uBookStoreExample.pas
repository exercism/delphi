unit uBookStore;

interface

type
  IBasket = interface(IInvokable)
  ['{22B4BAF3-88E6-456D-9DE5-F6BAC743A655}']
    function Total:integer;
  end;

function NewBasket(aBasket: TArray<Integer>): IBasket;

implementation
uses System.SysUtils, System.Generics.collections;

type
  TBasket = class(TInterfacedObject, IBasket)
  private
    const
      cDiscounts: array[1..5] of extended = (1.00,
                                             0.95,
                                             0.90,
                                             0.80,
                                             0.75);
      cSingleBookPrice = 800;
    var
      fRanges: TList<integer>;
    procedure GroupBasket(aBasket: TArray<Integer>);
  public
    function Total:integer;
    constructor Create(aBasket: TArray<Integer>);
    destructor Destroy; override;
  end;

function NewBasket(aBasket: TArray<Integer>): IBasket;
begin
  result := TBasket.Create(aBasket);
end;

constructor TBasket.Create(aBasket: TArray<Integer>);
begin
  GroupBasket(aBasket);
end;

procedure TBasket.GroupBasket(aBasket: TArray<Integer>);

{$region 'Worker Functions'}
  function FindQuantanties: TDictionary<integer, integer>;
  var
    lBook: integer;
  begin
    Result :=  TDictionary<integer, integer>.Create;
    for lBook in aBasket do
      if not Result.ContainsKey(lBook) then
        Result.Add(lBook, 1)
      else
        Result.Items[lBook] := Result.Items[lBook] + 1;
  end;

  function QuantantiesToSets(aQtys : TDictionary<integer, integer>): TList<integer>;
  var
    lQty: TPair<integer, integer>;
  begin
    Result := TList<integer>.Create;
    for lQty in aQtys do
      Result.Add(lQty.Value);
    Result.Sort;
  end;

  function RangeOfSets(aSets : TList<integer>): TList<integer>;
  var
    i, R, Tmp: Integer;
  begin
    Result := TList<integer>.Create;
    if aSets.Count > 0 then
      for i := 0 to aSets.Last - 1 do
      begin
        Tmp := 0;
        for R in ASets do
          if R - i > 0 then
            inc(Tmp);
        Result.Add(Tmp);
      end;
  end;
{$endregion}

var
  lQtys : TDictionary<integer, integer>;
  lSets : TList<integer>;
begin
  lQtys := FindQuantanties;
  lSets := QuantantiesToSets(lQtys);
  FRanges := RangeOfSets(lSets);
  lQtys.DisposeOf;
  lSets.DisposeOf;
end;

function TBasket.Total:integer;

{$region 'Worker Functions'}
  procedure Recombine;
  begin
    if fRanges.First - fRanges.Last > 1 then
    begin
      fRanges[0] := fRanges.First - 1;
      fRanges[fRanges.Count - 1] := fRanges.Last + 1;
      fRanges.Sort;
      fRanges.Reverse;
    end;
  end;

  function computeTotal: integer;
  var
    s: integer;
  begin
    Result := 0;
    for S in fRanges do
      Result := Result + round(S * cSingleBookPrice * cDiscounts[S]);
  end;
{$endregion}

var
  newTotal: integer;
begin
  result := 0;
  if fRanges.Count > 0 then
  begin
    result := computeTotal;
    repeat
      Recombine;
      newTotal := computeTotal;
      if newTotal < Result then
        Result := newTotal;
    until fRanges.First - fRanges.Last <= 1;
  end;
end;

destructor TBasket.Destroy;
begin
  fRanges.DisposeOf;
  inherited;
end;

end.
