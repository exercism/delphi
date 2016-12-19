unit uBookStoreTests;

interface
uses
  DUnitX.TestFramework;

type
  [TestFixture]
  hpTests = class(TObject)
  private
    class function ConvertStrToIntArray(aString: string): TArray<Integer>; static;
  public
    [Test]
    [TestCase('Test total basket price single book',                                     '1, 8.0')]
//    [TestCase('Test total basket Price two of same book',                                '2|2, 16.0')]
//    [TestCase('Test total basket price empty basket',                                    ', 0.0')]
//    [TestCase('Test basket with two different books',                                    '1|2, 15.2')]
//    [TestCase('Test basket with three different books',                                  '1|2|3, 21.6')]
//    [TestCase('Test basket with four different books',                                   '1|2|3|4, 25.6')]
//    [TestCase('Test basket with five different books',                                   '1|2|3|4|5, 30.0')]
//    [TestCase('Test basket w/2 copies of books 1..3 and one copy of books 4 and 5',      '1|1|2|2|3|3|4|5, 51.20')]
//    [TestCase('Test basket w/2 copies of books 1..4 and one copy of book 5',             '1|1|2|2|3|3|4|4|5, 55.60')]
//    [TestCase('Test basket w/2 copies of each book',                                     '1|1|2|2|3|3|4|4|5|5, 60.00')]
//    [TestCase('Test basket w/2 copies of each book plus one more copy of book 1',        '1|1|2|2|3|3|4|4|5|5|1, 68.00')]
//    [TestCase('Test basket w/2 copies of each book plus one more copy of books 1 and 2', '1|1|2|2|3|3|4|4|5|5|1|2, 75.20')]
    procedure SeveralBasketTestCases(const aBasket: string; const Expected: extended);
  end;

implementation
uses System.SysUtils, uBookStore;

const MinDelta = 0.005; //cents

class function hpTests.ConvertStrToIntArray(aString: string): TArray<Integer>;
var splitStr: TArray<string>;
    i: integer;
begin
  result := nil;
  splitStr := aString.Split(['|']);
  SetLength(result, length(splitStr));
  for i := Low(splitStr) to High(splitStr) do
    result[i] := splitStr[i].ToInteger;
end;

procedure hpTests.SeveralBasketTestCases(const aBasket: string; const Expected: extended);
var Basket: TArray<integer>;
    fBasket: IBasket;
begin
  Basket := ConvertStrToIntArray(aBasket);
  fBasket := NewBasket(Basket);
  assert.AreEqual(Expected, FBasket.Total, MinDelta, format('Total should be %0.2f',[Expected]));
end;

initialization
  TDUnitX.RegisterTestFixture(hpTests);
end.
