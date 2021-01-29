unit uSayTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.2.0.1';

type
  [TestFixture]
  TSayTest = class(TObject)
  public
//  Uncomment the test case's attributes to run the test
    [TestCase('Test zero','0,zero')]
//    [TestCase('Test One','1,one')]
    procedure TestDigits(const ANum : int64; const AWord : string );

//    [TestCase('Test fourteen','14,fourteen')]
//    [TestCase('Test twenty','20,twenty')]
//    [TestCase('Test twenty-two','22,twenty-two')]
    procedure Test_two_digit_numbers(const ANum : int64; const AWord : string );

//    [TestCase('Test one hundred','100,one hundred')]
//    [TestCase('Test one hundred twenty-three','123,one hundred twenty-three')]
    procedure Test_hundreds(const ANum : int64; const AWord : string );

//    [TestCase('Test one thousand','1000,one thousand')]
//    [TestCase('Test one thousand two hundred thirty-four','1234,one thousand two hundred thirty-four')]
    procedure Test_thousands(const ANum : int64; const AWord : string );

//    [TestCase('Test one million','1000000,one million')]
//    [TestCase('Test one million two thousand three hundred forty-five','1002345,one million two thousand three hundred forty-five')]
//    [TestCase('Test one billion','1000000000,one billion')]
//    [TestCase('Test a big number','987654321123,nine hundred eighty-seven billion six hundred fifty-four million three hundred twenty-one thousand one hundred twenty-three')]
    procedure Test_millions(const ANum : int64; const AWord : string );

//    [TestCase('Test number_above_999_999_999_999','1000000000000')]
//    [TestCase('Test negative','-1')]
    procedure Test_values_outside_range(const ANum: Int64);
  end;

implementation

uses
  System.SysUtils, uSay;

procedure TSayTest.TestDigits(const ANum: int64; const AWord: string);
begin
  Assert.AreEqual(AWord, Say(Anum));
end;

procedure TSayTest.Test_hundreds(const ANum: int64; const AWord: string);
begin
  Assert.AreEqual(AWord, Say(Anum));
end;

procedure TSayTest.Test_millions(const ANum: int64; const AWord: string);
begin
  Assert.AreEqual(AWord, Say(Anum));
end;

procedure TSayTest.Test_thousands(const ANum: int64; const AWord: string);
begin
  Assert.AreEqual(AWord, Say(Anum));
end;

procedure TSayTest.Test_two_digit_numbers(const ANum: int64;
  const AWord: string);
begin
  Assert.AreEqual(AWord, Say(Anum));
end;

procedure TSayTest.Test_values_outside_range(const ANum: Int64);
begin
  Assert.WillRaiseWithMessage(procedure
    begin
      Say(Anum);
    end, EArgumentOutOfRangeException, 'input out of range');
end;

initialization
  TDUnitX.RegisterTestFixture(TSayTest);
end.
