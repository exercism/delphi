unit uHammingTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '2.3.0';

type
  [TestFixture]
  HammingTests = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure empty_strands;

    [Test]
    [Ignore]
    procedure single_letter_identical_strands;

    [Test]
    [Ignore]
    procedure single_letter_different_strands;

    [Test]
    [Ignore]
    procedure long_identical_strands;

    [Test]
    [Ignore]
    procedure long_different_strands;

    [Test]
    [Ignore]
    procedure disallow_first_strand_longer;

    [Test]
    [Ignore]
    procedure disallow_second_strand_longer;

    [Test]
    [Ignore]
    procedure disallow_left_empty_strand;

    [Test]
    [Ignore]
    procedure disallow_right_empty_strand;
  end;

implementation
uses System.SysUtils, uHamming;

procedure HammingTests.empty_strands;
begin
  Assert.AreEqual(0,THamming.Distance('',''));
end;

procedure HammingTests.single_letter_identical_strands;
begin
  Assert.AreEqual(0,THamming.Distance('A','A'));
end;

procedure HammingTests.single_letter_different_strands;
begin
  Assert.AreEqual(1, THamming.Distance('G', 'T'));
end;

procedure HammingTests.long_identical_strands;
begin
  Assert.AreEqual( 0, THamming.Distance('GGACTGAAATCTG', 'GGACTGAAATCTG'));
end;

procedure HammingTests.long_different_strands;
begin
  Assert.AreEqual(9, THamming.Distance('GGACGGATTCTG', 'AGGACGGATTCT'));
end;

procedure HammingTests.disallow_first_strand_longer;
var MyProc: TTestLocalMethod;
begin
  MyProc := procedure
            begin
              THamming.Distance('AATG', 'AAA');
            end;
  Assert.WillRaiseWithMessage(MyProc, EArgumentException, 'error: left and right strands must be of equal length');
end;

procedure HammingTests.disallow_left_empty_strand;
var MyProc: TTestLocalMethod;
begin
  MyProc := procedure
            begin
              THamming.Distance('', 'G');
            end;
  Assert.WillRaiseWithMessage(MyProc, EArgumentException, 'error: left strand must not be empty');
end;

procedure HammingTests.disallow_right_empty_strand;
var MyProc: TTestLocalMethod;
begin
  MyProc := procedure
            begin
              THamming.Distance('G', '');
            end;
  Assert.WillRaiseWithMessage(MyProc, EArgumentException, 'error: right strand must not be empty');
end;

procedure HammingTests.disallow_second_strand_longer;
var MyProc: TTestLocalMethod;
begin
  MyProc := procedure
            begin
              THamming.Distance('ATA', 'AGTG');
            end;
  Assert.WillRaiseWithMessage(MyProc, EArgumentException, 'error: left and right strands must be of equal length');
end;

initialization
  TDUnitX.RegisterTestFixture(HammingTests);
end.
