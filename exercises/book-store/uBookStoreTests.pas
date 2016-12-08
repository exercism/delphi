unit uBookStoreTests;

interface
uses
  DUnitX.TestFramework, uBookStore;

type

  [TestFixture]
  hpTests = class(TObject)
  private
    fHP: Ihp;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    [Ignore('Comment this line to perform this test')]
    procedure TestSingleBookPrice;

    [Test]
    [Ignore('Comment this line to perform this test')]
    procedure TestBasketContainsMyBooks;

    [Test]
    [Ignore('Comment this line to perform this test')]
    procedure TestTotalBasketPriceSingleBook;

    [Test]
    [Ignore('Comment this line to perform this test')]
    procedure TestTotalBasketPriceTwoofSameBook;

    [Test]
    [Ignore('Comment this line to perform this test')]
    procedure TestTotalBasketPriceEmptyBasket;

    [Test]
    [Ignore('Comment this line to perform this test')]
    procedure TestBasketWith2DifferentBooks;

    [Test]
    [Ignore('Comment this line to perform this test')]
    procedure TestBasketWith3DifferentBooks;

    [Test]
    [Ignore('Comment this line to perform this test')]
    procedure TestBasketWith4DifferentBooks;

    [Test]
    [Ignore('Comment this line to perform this test')]
    procedure TestBasketWith5DifferentBooks;

    [Test]
    [Ignore('Comment this line to perform these test cases')]
    [TestCase('basket 11223345', '11223345, 51.20')]
    [TestCase('basket 112233445', '112233445, 55.60')]
    [TestCase('basket 1122334455', '1122334455, 60.00')]
    [TestCase('basket 11223344551', '11223344551, 68.00')]
    [TestCase('basket 112233445512', '112233445512, 75.20')]
    procedure SeveralBasketTestCases(aBasket: string; Expected: extended);
  end;

implementation
uses System.SysUtils;

const MinDelta = 0.005; //cents

procedure hpTests.Setup;
begin
  fHP := NewHPBasket;
end;

procedure hpTests.TearDown;
begin
  fHP := nil;
end;

procedure hpTests.TestSingleBookPrice;
begin
  assert.AreEqual(8.0, Fhp.SingleBookPrice,'Incorrect single book price');
end;

procedure hpTests.TestBasketContainsMyBooks;
var MyBasket: string;
begin
  MyBasket := '3'; //one copy of book three
  fHP.Basket := MyBasket;
  assert.AreEqual(MyBasket, fHP.Basket,'The basket isn''t correct');
end;

procedure hpTests.TestTotalBasketPriceSingleBook;
begin
  fHP.Basket := '1'; //one copy of book one
  assert.AreEqual(8.0, fHP.BasketTotal, MinDelta, 'Basket total incorrect');
end;

procedure hpTests.TestTotalBasketPriceTwoofSameBook;
begin
  fHP.Basket := '22'; //two copies of book two
  assert.AreEqual(16.0, fHP.BasketTotal, MinDelta, 'Basket total incorrect');
end;

procedure hpTests.TestTotalBasketPriceEmptyBasket;
begin
  fHP.Basket := '';
  assert.AreEqual(0.0, fHP.BasketTotal, 'Total should be zero');
end;

procedure hpTests.TestBasketWith2DifferentBooks;
begin
  fHP.Basket := '12'; //one copy of book one and one copy of book two
  assert.AreEqual(15.2, fHP.BasketTotal, 'Total should be 15.2');
end;

procedure hpTests.TestBasketWith3DifferentBooks;
begin
  fHP.Basket := '123'; //one copy of book 1, one copy of book 2, one copy of book 3
  assert.AreEqual(21.60, fHP.BasketTotal, 'Total should be 21.60');
end;

procedure hpTests.TestBasketWith4DifferentBooks;
begin
  Fhp.Basket := '1234'; //one copy of book one, one copy book two, one copy of book three, and one copy of book four
  assert.AreEqual(25.60,Fhp.BasketTotal, MinDelta,'Total should be 25.60');
end;

procedure hpTests.TestBasketWith5DifferentBooks;
begin
  Fhp.Basket := '12345'; //one copy of book one, one copy book two, one copy of book three, one copy of book four, and one of book five
  assert.AreEqual(30.00,Fhp.BasketTotal,MinDelta,'Total should be 30.00');
end;

procedure hpTests.SeveralBasketTestCases(aBasket: string; Expected: extended);
begin
  Fhp.Basket := aBasket;
  assert.AreEqual(Expected, Fhp.BasketTotal, MinDelta, format('Total should be %0.2f',[Expected]));
end;

initialization
  TDUnitX.RegisterTestFixture(hpTests);
end.
