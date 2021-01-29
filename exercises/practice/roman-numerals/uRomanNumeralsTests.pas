unit uRomanNumeralsTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.2.0.1';

type

  [TestFixture]
  RomanNumeralsTest = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure One_is_a_single_I;

    [Test]
    [Ignore]
    procedure Two_is_two_I_s;

    [Test]
    [Ignore]
    procedure Three_is_three_I_s;

    [Test]
    [Ignore]
    procedure Four_being_5_minus_1_is_IV;

    [Test]
    [Ignore]
    procedure Five_is_a_single_V;

    [Test]
    [Ignore]
    procedure Six_being_5_plus_1_is_VI;

    [Test]
    [Ignore]
    procedure Nine_being_10_minus_1_is_IX;

    [Test]
    [Ignore]
    procedure Twenty_is_two_X_s;

    [Test]
    [Ignore]
    procedure Fourty_eight_is_not_50_minus_2_but_rather_40_plus_8;

    [Test]
    [Ignore]
    procedure Fourty_nine_is_not_40_plus_5_plus_4_but_rather_50_minus_10_plus_10_minus_1;

    [Test]
    [Ignore]
    procedure Fifty_is_a_single_L;

    [Test]
    [Ignore]
    procedure Ninety_being_100_minus_10_is_XC;

    [Test]
    [Ignore]
    procedure One_hundred_is_a_single_C;

    [Test]
    [Ignore]
    procedure Sixety_being_50_plus_10_is_LX;

    [Test]
    [Ignore]
    procedure Four_hundred_being_500_minus_100_is_CD;

    [Test]
    [Ignore]
    procedure Five_hundred_is_a_single_D;

    [Test]
    [Ignore]
    procedure Nine_hundred_being_1000_minus_100_is_CM;

    [Test]
    [Ignore]
    procedure One_thousand_is_a_single_M;

    [Test]
    [Ignore]
    procedure Three_thousand_is_three_M_s;
  end;

implementation
uses uRomanNumerals;

procedure RomanNumeralsTest.One_is_a_single_I;
var arabicNumeral: integer;
begin
  arabicNumeral := 1;
  Assert.AreEqual('I', arabicNumeral.ToRoman);
end;

procedure RomanNumeralsTest.Two_is_two_I_s;
var arabicNumeral: integer;
begin
  arabicNumeral := 2;
  Assert.AreEqual('II', arabicNumeral.ToRoman);
end;

procedure RomanNumeralsTest.Three_is_three_I_s; 
var arabicNumeral: integer;
begin
  arabicNumeral := 3;
  Assert.AreEqual('III', arabicNumeral.ToRoman);
end;

procedure RomanNumeralsTest.Four_being_5_minus_1_is_IV;
var arabicNumeral: integer;
begin
  arabicNumeral := 4;
  Assert.AreEqual('IV', arabicNumeral.ToRoman);
end;

procedure RomanNumeralsTest.Five_is_a_single_V;
var arabicNumeral: integer;
begin
  arabicNumeral := 5;
  Assert.AreEqual('V', arabicNumeral.ToRoman);
end;

procedure RomanNumeralsTest.Six_being_5_plus_1_is_VI;
var arabicNumeral: integer;
begin
  arabicNumeral := 6;
  Assert.AreEqual('VI', arabicNumeral.ToRoman);
end;

procedure RomanNumeralsTest.Nine_being_10_minus_1_is_IX;
var arabicNumeral: integer;
begin
  arabicNumeral := 9;
  Assert.AreEqual('IX', arabicNumeral.ToRoman);
end;

procedure RomanNumeralsTest.Twenty_is_two_X_s;
var arabicNumeral: integer;
begin
  arabicNumeral := 20;
  Assert.AreEqual('XX', arabicNumeral.ToRoman);
end;

procedure RomanNumeralsTest.Fourty_eight_is_not_50_minus_2_but_rather_40_plus_8;
var arabicNumeral: integer;
begin
  arabicNumeral := 48;
  Assert.AreEqual('XLVIII', arabicNumeral.ToRoman);
end;

procedure RomanNumeralsTest.Fourty_nine_is_not_40_plus_5_plus_4_but_rather_50_minus_10_plus_10_minus_1;
var arabicNumeral: integer;
begin
  arabicNumeral := 49;
  Assert.AreEqual('XLIX',arabicNumeral.ToRoman);
end;

procedure RomanNumeralsTest.Fifty_is_a_single_L;
var arabicNumeral: integer;
begin
  arabicNumeral := 50;
  Assert.AreEqual('L', arabicNumeral.ToRoman);
end;

procedure RomanNumeralsTest.Ninety_being_100_minus_10_is_XC;
var arabicNumeral: integer;
begin
  arabicNumeral := 90;
  Assert.AreEqual('XC', arabicNumeral.ToRoman);
end;

procedure RomanNumeralsTest.One_hundred_is_a_single_C;
var arabicNumeral: integer;
begin
  arabicNumeral := 100;
  Assert.AreEqual('C', arabicNumeral.ToRoman);
end;

procedure RomanNumeralsTest.Sixety_being_50_plus_10_is_LX;
var arabicNumeral: integer;
begin
  arabicNumeral := 60;
  Assert.AreEqual('LX', arabicNumeral.ToRoman);
end;

procedure RomanNumeralsTest.Four_hundred_being_500_minus_100_is_CD;
var arabicNumeral: integer;
begin
  arabicNumeral := 400;
  Assert.AreEqual('CD', arabicNumeral.ToRoman);
end;

procedure RomanNumeralsTest.Five_hundred_is_a_single_D;
var arabicNumeral: integer;
begin
  arabicNumeral := 500;
  Assert.AreEqual('D', arabicNumeral.ToRoman);
end;

procedure RomanNumeralsTest.Nine_hundred_being_1000_minus_100_is_CM;
var arabicNumeral: integer;
begin
  arabicNumeral := 900;
  Assert.AreEqual('CM', arabicNumeral.ToRoman);
end;

procedure RomanNumeralsTest.One_thousand_is_a_single_M;
var arabicNumeral: integer;
begin
  arabicNumeral := 1000;
  Assert.AreEqual('M', arabicNumeral.ToRoman);
end;

procedure RomanNumeralsTest.Three_thousand_is_three_M_s;
var arabicNumeral: integer;
begin
  arabicNumeral := 3000;
  Assert.AreEqual('MMM', arabicNumeral.ToRoman);
end;

initialization
  TDUnitX.RegisterTestFixture(RomanNumeralsTest);
end.
