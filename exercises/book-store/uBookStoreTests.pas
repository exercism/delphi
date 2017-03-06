unit uBookStoreTests;

interface
uses
  DUnitX.TestFramework;

type
  [TestFixture]
  hpTests = class(TObject)
  public
    [Test]
//  [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure A_basket_containing_only_a_single_book;

    [Test]
    [Ignore]
    procedure A_basket_containing_only_two_of_the_same_book;

    [Test]
    [Ignore]
    procedure No_charge_to_carry_around_an_empty_basket;

    [Test]
    [Ignore]
    procedure A_basket_containing_only_two_different_books;

    [Test]
    [Ignore]
    procedure A_basket_with_three_different_books;

    [Test]
    [Ignore]
    procedure A_basket_with_four_different_books;

    [Test]
    [Ignore]
    procedure A_basket_with_five_different_books;

    [Test]
    [Ignore]
    procedure A_basket_containing_eight_books_consisting_of_a_pair_each_of_the_first_three_books_plus_one_copy_each_of_the_last_two_books;

    [Test]
    [Ignore]
    procedure A_basket_containing_nine_books_consisting_of_a_pair_each_of_the_first_four_books_plus_one_of_the_last_book;

    [Test]
    [Ignore]
    procedure A_basket_containing_ten_books_consisting_of_two_copies_of_each_book_in_the_series;

    [Test]
    [Ignore]
    procedure A_basket_containing_eleven_books_consisting_of_three_copies_of_the_first_book_plus_two_each_of_the_remaing_four_bookes_in_the_series;

    [Test]
    [Ignore]
    procedure A_basket_containing_twelve_books_consisting_of_three_copies_of_the_first_two_books_plus_two_each_of_the_remaining_three_books_in_the_series;
  end;

implementation
uses System.SysUtils, uBookStore;

const MinDelta = 0.005; //cents

procedure hpTests.A_basket_containing_only_a_single_book;
var Basket: TArray<integer>;
    fBasket: IBasket;
    Expected: double;
begin
  SetLength(Basket, 1);
  Basket[0] := 1;
  Expected := 8.0;

  fBasket := NewBasket(Basket);
  assert.AreEqual(Expected, fBasket.Total, MinDelta, format('Total should be %0.2f',[Expected]));
end;

procedure hpTests.A_basket_containing_only_two_of_the_same_book;
var Basket: TArray<integer>;
    fBasket: IBasket;
    Expected: double;
begin
  SetLength(Basket, 2);
  Basket[0] := 2;
  Basket[1] := 2;
  Expected := 16.0;

  fBasket := NewBasket(Basket);
  assert.AreEqual(Expected, fBasket.Total, MinDelta, format('Total should be %0.2f',[Expected]));
end;

procedure hpTests.No_charge_to_carry_around_an_empty_basket;
var Basket: TArray<integer>;
    fBasket: IBasket;
    Expected: double;
begin
  SetLength(Basket, 0);
  Expected := 0.0;

  fBasket := NewBasket(Basket);
  assert.AreEqual(Expected, fBasket.Total, MinDelta, format('Total should be %0.2f',[Expected]));
end;

procedure hpTests.A_basket_containing_only_two_different_books;
var Basket: TArray<integer>;
    fBasket: IBasket;
    Expected: double;
begin
  SetLength(Basket, 2);
  Basket[0] := 1;
  Basket[1] := 2;
  Expected := 15.2;

  fBasket := NewBasket(Basket);
  assert.AreEqual(Expected, fBasket.Total, MinDelta, format('Total should be %0.2f',[Expected]));
end;

procedure hpTests.A_basket_with_three_different_books;
var Basket: TArray<integer>;
    fBasket: IBasket;
    Expected: double;
begin
  SetLength(Basket, 3);
  Basket[0] := 1;
  Basket[1] := 2;
  Basket[2] := 3;
  Expected := 21.6;

  fBasket := NewBasket(Basket);
  assert.AreEqual(Expected, fBasket.Total, MinDelta, format('Total should be %0.2f',[Expected]));
end;

procedure hpTests.A_basket_with_four_different_books;
var Basket: TArray<integer>;
    fBasket: IBasket;
    Expected: double;
begin
  SetLength(Basket, 4);
  Basket[0] := 1;
  Basket[1] := 2;
  Basket[2] := 3;
  Basket[3] := 4;
  Expected := 25.6;

  fBasket := NewBasket(Basket);
  assert.AreEqual(Expected, fBasket.Total, MinDelta, format('Total should be %0.2f',[Expected]));
end;

procedure hpTests.A_basket_with_five_different_books;
var Basket: TArray<integer>;
    fBasket: IBasket;
    Expected: double;
begin
  SetLength(Basket, 5);
  Basket[0] := 1;
  Basket[1] := 2;
  Basket[2] := 3;
  Basket[3] := 4;
  Basket[4] := 5;
  Expected := 30.0;

  fBasket := NewBasket(Basket);
  assert.AreEqual(Expected, fBasket.Total, MinDelta, format('Total should be %0.2f',[Expected]));
end;

procedure hpTests.A_basket_containing_eight_books_consisting_of_a_pair_each_of_the_first_three_books_plus_one_copy_each_of_the_last_two_books;
var Basket: TArray<integer>;
    fBasket: IBasket;
    Expected: double;
begin
  SetLength(Basket, 8);
  Basket[0] := 1;
  Basket[1] := 1;
  Basket[2] := 2;
  Basket[3] := 2;
  Basket[4] := 3;
  Basket[5] := 3;
  Basket[6] := 4;
  Basket[7] := 5;
  Expected := 51.20;

  fBasket := NewBasket(Basket);
  assert.AreEqual(Expected, fBasket.Total, MinDelta, format('Total should be %0.2f',[Expected]));
end;

procedure hpTests.A_basket_containing_nine_books_consisting_of_a_pair_each_of_the_first_four_books_plus_one_of_the_last_book;
var Basket: TArray<integer>;
    fBasket: IBasket;
    Expected: double;
begin
  SetLength(Basket, 9);
  Basket[0] := 1;
  Basket[1] := 1;
  Basket[2] := 2;
  Basket[3] := 2;
  Basket[4] := 3;
  Basket[5] := 3;
  Basket[6] := 4;
  Basket[7] := 4;
  Basket[8] := 5;
  Expected := 55.60;

  fBasket := NewBasket(Basket);
  assert.AreEqual(Expected, fBasket.Total, MinDelta, format('Total should be %0.2f',[Expected]));
end;

procedure hpTests.A_basket_containing_ten_books_consisting_of_two_copies_of_each_book_in_the_series;
var Basket: TArray<integer>;
    fBasket: IBasket;
    Expected: double;
begin
  SetLength(Basket, 10);
  Basket[0] := 1;
  Basket[1] := 1;
  Basket[2] := 2;
  Basket[3] := 2;
  Basket[4] := 3;
  Basket[5] := 3;
  Basket[6] := 4;
  Basket[7] := 4;
  Basket[8] := 5;
  Basket[9] := 5;
  Expected := 60.00;

  fBasket := NewBasket(Basket);
  assert.AreEqual(Expected, fBasket.Total, MinDelta, format('Total should be %0.2f',[Expected]));
end;

procedure hpTests.A_basket_containing_eleven_books_consisting_of_three_copies_of_the_first_book_plus_two_each_of_the_remaing_four_bookes_in_the_series;
var Basket: TArray<integer>;
    fBasket: IBasket;
    Expected: double;
begin
  SetLength(Basket, 11);
  Basket[0] := 1;
  Basket[1] := 1;
  Basket[2] := 2;
  Basket[3] := 2;
  Basket[4] := 3;
  Basket[5] := 3;
  Basket[6] := 4;
  Basket[7] := 4;
  Basket[8] := 5;
  Basket[9] := 5;
  Basket[10] := 1;
  Expected := 68.00;

  fBasket := NewBasket(Basket);
  assert.AreEqual(Expected, fBasket.Total, MinDelta, format('Total should be %0.2f',[Expected]));
end;

procedure hpTests.A_basket_containing_twelve_books_consisting_of_three_copies_of_the_first_two_books_plus_two_each_of_the_remaining_three_books_in_the_series;
var Basket: TArray<integer>;
    fBasket: IBasket;
    Expected: double;
begin
  SetLength(Basket, 12);
  Basket[0] := 1;
  Basket[1] := 1;
  Basket[2] := 2;
  Basket[3] := 2;
  Basket[4] := 3;
  Basket[5] := 3;
  Basket[6] := 4;
  Basket[7] := 4;
  Basket[8] := 5;
  Basket[9] := 5;
  Basket[10] := 1;
  Basket[11] := 2;
  Expected := 75.20;

  fBasket := NewBasket(Basket);
  assert.AreEqual(Expected, fBasket.Total, MinDelta, format('Total should be %0.2f',[Expected]));
end;

initialization
  TDUnitX.RegisterTestFixture(hpTests);
end.
