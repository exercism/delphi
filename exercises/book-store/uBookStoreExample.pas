unit uBookStore;

interface

type
  IBasket = interface(IInvokable)
  ['{22B4BAF3-88E6-456D-9DE5-F6BAC743A655}']
    function Total:extended;
  end;

function NewBasket(aBasket: TArray<Integer>): IBasket;

implementation
uses System.SysUtils, System.Generics.collections, System.Math;

const
  seriesBooks = '12345';
  cNumberOfBooks = 5;
  cDiscounts: array[1..cNumberOfBooks] of extended = (1.00,
                                                      0.95,
                                                      0.90,
                                                      0.80,
                                                      0.75);

type
  TBasket = class(TInterfacedObject, IBasket)
  private
    fSingleBookPrice: extended;
    fBasket: string;
    fIntList: TList<integer>;
    class function Head(inStr: string): string; static;
    class function Tail(inStr: string): string; static;
    class function ConvertIntArrayToString(const aIntArray: TArray<Integer>): string; static;
    function DiscountPercentage(inStr : string): extended;
    function GroupBasket:TArray<String>;
    function NumberOfDifferentBooks(inStr : string):integer;
  public
    function Total:extended;
    constructor Create(aBasket: TArray<Integer>);
  end;

function NewBasket(aBasket: TArray<Integer>): IBasket;
begin
  result := TBasket.Create(aBasket);
end;

class function TBasket.Head(inStr : string):string;
begin
  result := inStr.Remove(1);
end;

class function TBasket.Tail(inStr : string):string;
begin
  result := inStr.Remove(0,1);
end;

class function TBasket.ConvertIntArrayToString(const aIntArray: TArray<Integer>): string;
var arrayItem: integer;
begin
  result := '';
  if length(aIntArray) > 0 then
    for arrayItem in aIntArray do
      result := result + arrayItem.ToString;
end;

constructor TBasket.Create(aBasket: TArray<Integer>);
begin
  fSingleBookPrice := 8;
  fIntList := TList<integer>.Create;
  fIntList.AddRange(aBasket);
  fIntList.Sort;
  fBasket := ConvertIntArrayToString(aBasket);
end;

function TBasket.GroupBasket:TArray<String>;
var lStrArray: TArray<String>;
    wrkBasket: string;
    tmpStr   : string;
    thisBook : string;
    Index    : integer;
    StrCount : integer;
begin
  wrkBasket := fBasket;
  StrCount := 1;
  SetLength(lStrArray,StrCount);
  thisBook := Head(wrkBasket);
  while wrkBasket.Length > 0 do
  begin
    Index := 0;
    repeat
      tmpStr := lStrArray[Index];
      if thisBook.Length > 0 then
      begin
        if not tmpStr.Contains(thisBook) then
        begin
          tmpStr := tmpStr + thisBook;
          lStrArray[Index] := tmpStr;
          wrkBasket := Tail(wrkBasket);
          thisBook := Head(wrkBasket);
        end
        else
        if (Index = StrCount - 1) then
        begin
          inc(StrCount);
          SetLength(lStrArray,StrCount);
        end;
        inc(Index);
      end;
    until (Index = StrCount) or wrkBasket.IsEmpty;
  end;
  result := lStrArray;
end;

function TBasket.Total:extended;
var
    subBaskets    : TArray<String>;
    subResult     : array[0..1] of extended;
    lSortedBasket : TArray<integer>;

    function computeTotal: extended;
    var wrkSubBasket: string;
        totalBooks  : integer;
        subTotal    : extended;
    begin
      result := 0;
      for wrkSubBasket in subBaskets do
      begin
        totalBooks := wrkSubBasket.Length;
        subTotal := totalBooks * (fSingleBookPrice * DiscountPercentage(wrkSubBasket));
        Result := Result + subTotal;
      end;
    end;

begin
  fillchar(subResult, sizeof(extended), #0);

  subBaskets := GroupBasket;
  subResult[0] := computeTotal;

  lSortedBasket := fIntList.ToArray;
  fBasket := ConvertIntArrayToString(lSortedBasket);
  subBaskets := GroupBasket;
  subResult[1] := computeTotal;

  result := min(subResult[0], subResult[1]);
end;

function TBasket.DiscountPercentage(inStr : string):extended;
var numDiffBooks: integer;
begin
  numDiffBooks := NumberOfDifferentBooks(inStr);
  result := CDiscounts[numDiffBooks];
end;

function TBasket.NumberOfDifferentBooks(inStr : string):integer;
var Book: char;
begin
  result := 0;
  for Book in seriesBooks do
    if inStr.Contains(Book) then
      inc(result);
end;

end.
