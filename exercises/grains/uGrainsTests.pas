unit uBookStoreTests;

interface
uses
  DUnitX.TestFramework;

type
  [TestFixture]
  TgrainsTests = class(TObject)
  public
    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Test_square_1;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Test_square_2;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Test_square_3;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Test_square_4;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Test_square_16;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Test_square_32;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Test_square_64;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Square_0_raises_an_exception;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Negative_square_raises_an_exception;

    [Test]
    [Ignore('Comment this line to run the test')]
    procedure Square_greater_than_64_raises_an_exception;

    [Test]
    [Ignore('Comment this line to run this test')]
    procedure Test_total_grains;
  end;

implementation
uses System.SysUtils, uGrains;

procedure TgrainsTests.Test_square_1;
begin
  Assert.AreEqual(1, Grains.Square(1));
end;

procedure TgrainsTests.Test_square_2;
begin
  Assert.AreEqual(2, Grains.Square(2));
end;

procedure TgrainsTests.Test_square_3;
begin
  Assert.AreEqual(3, Grains.Square(3));
end;

procedure TgrainsTests.Test_square_4;
begin
  Assert.AreEqual(8, Grains.Square(4));
end;

procedure TgrainsTests.Test_square_16;
begin
  Assert.AreEqual(32768, Grains.Square(16));
end;

procedure TgrainsTests.Test_square_32;
begin
  Assert.AreEqual(2147483648, Grains.Square(32));
end;

procedure TgrainsTests.Test_square_64;
begin
  Assert.AreEqual(9223372036854775808, Grains.Square(64));
end;

procedure TgrainsTests.Test_total_grains;
begin
  Assert.AreEqual(18446744073709551615, Grains.Total);
end;

procedure TgrainsTests.Square_0_raises_an_exception;
begin

end;

procedure TgrainsTests.Negative_square_raises_an_exception;
begin

end;

procedure TgrainsTests.Square_greater_than_64_raises_an_exception;
begin

end;

procedure TgrainsTests.Test_total_grains;
begin
  Assert.AreEqual(18446744073709551615, Grains.Total);
end;

initialization
  TDUnitX.RegisterTestFixture(hpTests);
end.
