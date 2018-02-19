unit uHammingTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '2.1.0';

type

  [TestFixture]
  HammingTests = class(TObject)
  public
    [Test]
//  [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure empty_strands;

    [Test]
    [Ignore]
    procedure identical_strands;

    [Test]
    [Ignore]
    procedure long_identical_strands;

    [Test]
    [Ignore]
    procedure complete_distance_in_single_nucleotide_strands;

    [Test]
    [Ignore]
    procedure complete_distance_in_small_strands;

    [Test]
    [Ignore]
    procedure small_distance_in_small_strands;

    [Test]
    [Ignore]
    procedure small_distance;

    [Test]
    [Ignore]
    procedure small_distance_in_long_strands;

    [Test]
    [Ignore]
    procedure non_unique_character_in_first_strand;

    [Test]
    [Ignore]
    procedure non_unique_character_in_second_strand;

    [Test]
    [Ignore]
    procedure same_nucleotides_in_different_positions;

    [Test]
    [Ignore]
    procedure large_distance;

    [Test]
    [Ignore]
    procedure large_distance_in_off_by_one_strand;

    [Test]
    [Ignore]
    procedure disallow_first_strand_longer;

    [Test]
    [Ignore]
    procedure disallow_second_strand_longer;
  end;

implementation
uses System.SysUtils, uHamming;

procedure HammingTests.empty_strands;
begin
  Assert.AreEqual(0,THamming.Distance('',''));
end;

procedure HammingTests.identical_strands;
begin
  Assert.AreEqual(0,THamming.Distance('A','A'));
end;

procedure HammingTests.long_identical_strands;
begin
  Assert.AreEqual(0, THamming.Distance('GGACTGA', 'GGACTGA'));
end;

procedure HammingTests.complete_distance_in_single_nucleotide_strands;
begin
  Assert.AreEqual(1, THamming.Distance('A', 'G'));
end;

procedure HammingTests.complete_distance_in_small_strands;
begin
  Assert.AreEqual( 2, THamming.Distance('AG', 'CT'));
end;

procedure HammingTests.small_distance_in_small_strands;
begin
  Assert.AreEqual(1, THamming.Distance('AT', 'CT'));
end;

procedure HammingTests.small_distance;
begin
  Assert.AreEqual(1, THamming.Distance('GGACG', 'GGTCG'));
end;

procedure HammingTests.small_distance_in_long_strands;
begin
  Assert.AreEqual(2, THamming.Distance('ACCAGGG', 'ACTATGG'));
end;

procedure HammingTests.non_unique_character_in_first_strand;
begin
  Assert.AreEqual(1, THamming.Distance('AAG', 'AAA'));
end;

procedure HammingTests.non_unique_character_in_second_strand;
begin
  Assert.AreEqual(1, THamming.Distance('AAA', 'AAG'));
end;

procedure HammingTests.same_nucleotides_in_different_positions;
begin
  Assert.AreEqual(2, THamming.Distance('TAG', 'GAT'));
end;

procedure HammingTests.large_distance;
begin
  Assert.AreEqual(4, THamming.Distance('GATACA', 'GCATAA'));
end;

procedure HammingTests.large_distance_in_off_by_one_strand;
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
