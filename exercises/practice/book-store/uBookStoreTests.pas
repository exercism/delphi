unit uBookStoreTests;

interface
uses
  DUnitX.TestFramework;

const
   CanonicalVersion = '1.4.0';

type
  [TestFixture]
  hpTests = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure only_a_single_book;

    [Test]
    [Ignore]
    procedure two_of_the_same_book;

    [Test]
    [Ignore]
    procedure empty_basket;

    [Test]
    [Ignore]
    procedure two_different_books;

    [Test]
    [Ignore]
    procedure three_different_books;

    [Test]
    [Ignore]
    procedure four_different_books;

    [Test]
    [Ignore]
    procedure five_different_books;

    [Test]
    [Ignore]
    procedure two_groups_of_four_is_cheaper_than_group_of_five_plus_group_of_three;

    [Test]
    [Ignore]
    procedure two_groups_of_four_is_cheaper_than_groups_of_five_and_three;

    [Test]
    [Ignore]
    procedure group_of_four_plus_group_of_two_is_cheaper_than_two_groups_of_three;

    [Test]
    [Ignore]
    procedure two_each_of_first_4_books_and_1_copy_each_of_rest;

    [Test]
    [Ignore]
    procedure two_copies_of_each_book;

    [Test]
    [Ignore]
    procedure three_copies_of_first_book_and_2_each_of_remaining;

    [Test]
    [Ignore]
    procedure three_each_of_first_2_books_and_2_each_of_remaining_books;

    [Test]
    [Ignore]
    procedure four_groups_of_four_are_cheaper_than_two_groups_each_of_five_and_three;
  end;

implementation
uses System.SysUtils, uBookStore;

procedure hpTests.only_a_single_book;
var Basket: TArray<integer>;
    fBasket: IBasket;
    Expected: integer;
begin
  SetLength(Basket, 1);
  Basket[0] := 1;
  Expected := 800;

  fBasket := NewBasket(Basket);
  assert.AreEqual(Expected, fBasket.Total, format('Total should be %d cents',[Expected]));
end;

procedure hpTests.two_of_the_same_book;
var Basket: TArray<integer>;
    fBasket: IBasket;
    Expected: integer;
begin
  SetLength(Basket, 2);
  Basket[0] := 2;
  Basket[1] := 2;
  Expected := 1600;

  fBasket := NewBasket(Basket);
  assert.AreEqual(Expected, fBasket.Total, format('Total should be %d cents',[Expected]));
end;

procedure hpTests.empty_basket;
var Basket: TArray<integer>;
    fBasket: IBasket;
    Expected: integer;
begin
  SetLength(Basket, 0);
  Expected := 0;

  fBasket := NewBasket(Basket);
  assert.AreEqual(Expected, fBasket.Total, format('Total should be %d cents',[Expected]));
end;

procedure hpTests.two_different_books;
var Basket: TArray<integer>;
    fBasket: IBasket;
    Expected: integer;
begin
  SetLength(Basket, 2);
  Basket[0] := 1;
  Basket[1] := 2;
  Expected := 1520;

  fBasket := NewBasket(Basket);
  assert.AreEqual(Expected, fBasket.Total, format('Total should be %d cents',[Expected]));
end;

procedure hpTests.three_different_books;
var Basket: TArray<integer>;
    fBasket: IBasket;
    Expected: integer;
begin
  SetLength(Basket, 3);
  Basket[0] := 1;
  Basket[1] := 2;
  Basket[2] := 3;
  Expected := 2160;

  fBasket := NewBasket(Basket);
  assert.AreEqual(Expected, fBasket.Total, format('Total should be %d cents',[Expected]));
end;

procedure hpTests.four_groups_of_four_are_cheaper_than_two_groups_each_of_five_and_three;
var Basket: TArray<integer>;
    fBasket: IBasket;
    Expected: integer;
begin
  SetLength(Basket, 16);
  Basket[0] := 1;
  Basket[1] := 1;
  Basket[2] := 2;
  Basket[3] := 2;
  Basket[4] := 3;
  Basket[5] := 3;
  Basket[6] := 4;
  Basket[7] := 5;
  Basket[8] := 1;
  Basket[9] := 1;
  Basket[10] := 2;
  Basket[11] := 2;
  Basket[12] := 3;
  Basket[13] := 3;
  Basket[14] := 4;
  Basket[15] := 5;
  Expected := 10240;

  fBasket := NewBasket(Basket);
  assert.AreEqual(Expected, fBasket.Total, format('Total should be %d cents',[Expected]));
end;

procedure hpTests.group_of_four_plus_group_of_two_is_cheaper_than_two_groups_of_three;
var Basket: TArray<integer>;
    fBasket: IBasket;
    Expected: integer;
begin
  SetLength(Basket, 6);
  Basket[0] := 1;
  Basket[1] := 1;
  Basket[2] := 2;
  Basket[3] := 2;
  Basket[4] := 3;
  Basket[5] := 4;
  Expected := 4080;

  fBasket := NewBasket(Basket);
  assert.AreEqual(Expected, fBasket.Total, format('Total should be %d cents',[Expected]));
end;

procedure hpTests.four_different_books;
var Basket: TArray<integer>;
    fBasket: IBasket;
    Expected: integer;
begin
  SetLength(Basket, 4);
  Basket[0] := 1;
  Basket[1] := 2;
  Basket[2] := 3;
  Basket[3] := 4;
  Expected := 2560;

  fBasket := NewBasket(Basket);
  assert.AreEqual(Expected, fBasket.Total, format('Total should be %d cents',[Expected]));
end;

procedure hpTests.five_different_books;
var Basket: TArray<integer>;
    fBasket: IBasket;
    Expected: integer;
begin
  SetLength(Basket, 5);
  Basket[0] := 1;
  Basket[1] := 2;
  Basket[2] := 3;
  Basket[3] := 4;
  Basket[4] := 5;
  Expected := 3000;

  fBasket := NewBasket(Basket);
  assert.AreEqual(Expected, fBasket.Total, format('Total should be %d cents',[Expected]));
end;

procedure hpTests.two_groups_of_four_is_cheaper_than_group_of_five_plus_group_of_three;
var Basket: TArray<integer>;
    fBasket: IBasket;
    Expected: integer;
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
  Expected := 5120;

  fBasket := NewBasket(Basket);
  assert.AreEqual(Expected, fBasket.Total, format('Total should be %d cents',[Expected]));
end;

procedure hpTests.two_groups_of_four_is_cheaper_than_groups_of_five_and_three;
var Basket: TArray<integer>;
    fBasket: IBasket;
    Expected: integer;
begin
  SetLength(Basket, 8);
  Basket[0] := 1;
  Basket[1] := 1;
  Basket[2] := 2;
  Basket[3] := 3;
  Basket[4] := 4;
  Basket[5] := 4;
  Basket[6] := 5;
  Basket[7] := 5;
  Expected := 5120;

  fBasket := NewBasket(Basket);
  assert.AreEqual(Expected, fBasket.Total, format('Total should be %d cents',[Expected]));
end;

procedure hpTests.two_each_of_first_4_books_and_1_copy_each_of_rest;
var Basket: TArray<integer>;
    fBasket: IBasket;
    Expected: integer;
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
  Expected := 5560;

  fBasket := NewBasket(Basket);
  assert.AreEqual(Expected, fBasket.Total, format('Total should be %d cents',[Expected]));
end;

procedure hpTests.two_copies_of_each_book;
var Basket: TArray<integer>;
    fBasket: IBasket;
    Expected: integer;
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
  Expected := 6000;

  fBasket := NewBasket(Basket);
  assert.AreEqual(Expected, fBasket.Total, format('Total should be %d cents',[Expected]));
end;

procedure hpTests.three_copies_of_first_book_and_2_each_of_remaining;
var Basket: TArray<integer>;
    fBasket: IBasket;
    Expected: integer;
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
  Expected := 6800;

  fBasket := NewBasket(Basket);
  assert.AreEqual(Expected, fBasket.Total, format('Total should be %d cents',[Expected]));
end;

procedure hpTests.three_each_of_first_2_books_and_2_each_of_remaining_books;
var Basket: TArray<integer>;
    fBasket: IBasket;
    Expected: integer;
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
  Expected := 7520;

  fBasket := NewBasket(Basket);
  assert.AreEqual(Expected, fBasket.Total, format('Total should be %d cents',[Expected]));
end;

initialization
  TDUnitX.RegisterTestFixture(hpTests);
end.
