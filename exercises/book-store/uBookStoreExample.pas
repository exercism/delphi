unit uBookStore;

interface

type
  Ihp = interface(IInvokable)
  ['{22B4BAF3-88E6-456D-9DE5-F6BAC743A655}']
    function BasketTotal:extended;
    function NumberOfDifferentBooks(inStr : string):integer;
    function GroupBasket:TArray<String>;
    function GetSingleBookPrice: extended;
    function GetBasket: string;
    procedure SetBasket(aValue: string);
    property Basket: string read GetBasket write SetBasket;
    property SingleBookPrice: extended read GetSingleBookPrice;
  end;

function NewHPBasket: Ihp;

implementation
uses System.SysUtils;

const
  hpBooks = '123456';
  cNumberOfBooks = 5;
  cDiscounts: array[1..cNumberOfBooks] of extended = (1.00,
                                                      0.95,
                                                      0.90,
                                                      0.80,
                                                      0.75);

type
  Thp = class(TInterfacedObject, Ihp)
  private
    fSingleBookPrice: extended;
    fBasket: string;
    Group: TArray<String>;
    class function Head(inStr: string): string; static;
    class function Tail(inStr: string): string; static;
    function GetSingleBookPrice: extended;
    function DiscountPercentage(inStr : string): extended;
    procedure SetBasket(aValue: string);
    function GetBasket: string;
  public
    function BasketTotal:extended;
    function NumberOfDifferentBooks(inStr : string):integer;
    function GroupBasket:TArray<String>;
    property SingleBookPrice: extended read GetSingleBookPrice;
    property Basket: string read GetBasket write SetBasket;
    constructor Create;
  end;

function NewHPBasket: Ihp;
begin
  result := Thp.Create;
end;

class function Thp.Head(inStr : string):string;
begin
  result := inStr.Remove(1);
end;

class function Thp.Tail(inStr : string):string;
begin
  result := inStr.Remove(0,1);
end;

constructor Thp.Create;
begin
  fSingleBookPrice := 8;
  fBasket := '';
end;

function Thp.GetSingleBookPrice;
begin
  result := fSingleBookPrice;
end;

procedure Thp.SetBasket(aValue: string);
begin
  fBasket := aValue;
end;

function Thp.GetBasket: string;
begin
  result := fBasket;
end;

function Thp.GroupBasket:TArray<String>;
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

function Thp.BasketTotal:extended;
var hpBook      : char;
    totalBooks  : integer;
    subBaskets  : TArray<String>;
    wrkSubBasket: string;
    subTotal    : extended;
begin
  subBaskets := GroupBasket;
  result := 0;
  for wrkSubBasket in subBaskets do
  begin
    totalBooks := wrkSubBasket.Length;
    subTotal := totalBooks * (fSingleBookPrice * DiscountPercentage(wrkSubBasket));
    result := result + subTotal;
  end;
end;

function Thp.DiscountPercentage(inStr : string):extended;
var numDiffBooks: integer;
begin
  result := 1;
  numDiffBooks := NumberOfDifferentBooks(inStr);
  result := CDiscounts[numDiffBooks];
end;

function Thp.NumberOfDifferentBooks(inStr : string):integer;
var hpBook: char;
begin
  result := 0;
  for hpBook in hpBooks do
    if inStr.Contains(hpBook) then
      inc(result);
end;

end.
