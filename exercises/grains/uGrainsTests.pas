unit uGrainsTests;

interface
uses
  DUnitX.TestFramework;

type
  [TestFixture]
  TgrainsTests = class(TObject)
  public
    [Test]
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
var expected: UInt64;
begin
  expected := 1;
  Assert.AreEqual(expected, Grains.Square(1));
end;

procedure TgrainsTests.Test_square_2;
var expected: UInt64;
begin
  expected := 2;
  Assert.AreEqual(expected, Grains.Square(2));
end;

procedure TgrainsTests.Test_square_3;
var expected: UInt64;
begin
  expected := 4;
  Assert.AreEqual(expected, Grains.Square(3));
end;

procedure TgrainsTests.Test_square_4;
var expected: UInt64;
begin
  expected := 8;
  Assert.AreEqual(expected, Grains.Square(4));
end;

procedure TgrainsTests.Test_square_16;
var expected: UInt64;
begin
  expected := 32768;
  Assert.AreEqual(expected, Grains.Square(16));
end;

procedure TgrainsTests.Test_square_32;
var expected: UInt64;
begin
  expected := 2147483648;
  Assert.AreEqual(expected, Grains.Square(32));
end;

procedure TgrainsTests.Test_square_64;
var expected: UInt64;
begin
  expected := 9223372036854775808;
  Assert.AreEqual(expected, Grains.Square(64));
end;

procedure TgrainsTests.Square_0_raises_an_exception;
var MyProc: TTestLocalMethod;
begin
  MyProc := procedure
            begin
              Grains.Square(0);
            end;

  Assert.WillRaise(MyProc, ERangeError);
end;

procedure TgrainsTests.Negative_square_raises_an_exception;
var MyProc: TTestLocalMethod;
begin
  MyProc := procedure
            begin
              Grains.Square(-1);
            end;

  Assert.WillRaise(MyProc, ERangeError);
end;

procedure TgrainsTests.Square_greater_than_64_raises_an_exception;
var MyProc: TTestLocalMethod;
begin
  MyProc := procedure
            begin
              Grains.Square(65);
            end;

  Assert.WillRaise(MyProc, ERangeError);
end;

procedure TgrainsTests.Test_total_grains;
var expected: UInt64;
begin
  expected := 18446744073709551615;
  Assert.AreEqual(expected, Grains.Total);
end;

initialization
  TDUnitX.RegisterTestFixture(TgrainsTests);
end.
