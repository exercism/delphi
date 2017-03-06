unit uHammingTests;

interface
uses
  DUnitX.TestFramework;

type

  [TestFixture]
  HammingTests = class(TObject) 
  public
    [Test]
//  [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure test_identical_strands;

    [Test]
    [Ignore]
    procedure test_long_identical_strands;

    [Test]
    [Ignore]
    procedure test_complete_distance_in_single_nucleotide_strands;

    [Test]
    [Ignore]
    procedure test_complete_distance_in_small_strands;

    [Test]
    [Ignore]
    procedure test_small_distance_in_small_strands;

    [Test]
    [Ignore]
    procedure test_small_distance;

    [Test]
    [Ignore]
    procedure test_small_distance_in_long_strands;

    [Test]
    [Ignore]
    procedure test_non_unique_character_in_first_strand;

    [Test]
    [Ignore]
    procedure test_non_unique_character_in_second_strand;

    [Test]
    [Ignore]
    procedure test_same_nucleotides_in_different_positions;

    [Test]
    [Ignore]
    procedure test_large_distance;

    [Test]
    [Ignore]
    procedure test_large_distance_in_off_by_one_strand;

    [Test]
    [Ignore]
    procedure test_empty_strands;

    [Test]
    [Ignore]
    procedure test_disallow_first_strand_longer;

    [Test]
    [Ignore]
    procedure test_disallow_second_strand_longer;
  end;

implementation
uses System.SysUtils, uHamming;

procedure HammingTests.test_identical_strands;
begin
  assert.AreEqual(0,THamming.compute('A','A'));
end;

procedure HammingTests.test_long_identical_strands;
begin
  assert.AreEqual(0, THamming.compute('GGACTGA', 'GGACTGA'));
end;

procedure HammingTests.test_complete_distance_in_single_nucleotide_strands;
begin
  assert.AreEqual(1, THamming.compute('A', 'G'));
end;

procedure HammingTests.test_complete_distance_in_small_strands;
begin
  assert.AreEqual( 2, THamming.compute('AG', 'CT'));
end;

procedure HammingTests.test_small_distance_in_small_strands;
begin
  assert.AreEqual(1, THamming.compute('AT', 'CT'));
end;

procedure HammingTests.test_small_distance;
begin
  assert.AreEqual(1, THamming.compute('GGACG', 'GGTCG'));
end;

procedure HammingTests.test_small_distance_in_long_strands;
begin
  assert.AreEqual(2, THamming.compute('ACCAGGG', 'ACTATGG'));
end;

procedure HammingTests.test_non_unique_character_in_first_strand;
begin
  assert.AreEqual(1, THamming.compute('AGA', 'AGG'));
end;

procedure HammingTests.test_non_unique_character_in_second_strand;
begin
  assert.AreEqual(1, THamming.compute('AGG', 'AGA'));
end;

procedure HammingTests.test_same_nucleotides_in_different_positions;
begin
  assert.AreEqual(2, THamming.compute('TAG', 'GAT'));
end;

procedure HammingTests.test_large_distance;
begin
  assert.AreEqual(4, THamming.compute('GATACA', 'GCATAA'));
end;

procedure HammingTests.test_large_distance_in_off_by_one_strand;
begin
  assert.AreEqual(9, THamming.compute('GGACGGATTCTG', 'AGGACGGATTCT'));
end;

procedure HammingTests.test_empty_strands;
begin
  assert.AreEqual(0, THamming.compute('', ''));
end;

procedure HammingTests.test_disallow_first_strand_longer;
var MyProc: TTestLocalMethod;
begin
  MyProc := procedure
            begin
              THamming.compute('AATG', 'AAA');
            end;
  assert.WillRaise(MyProc, EArgumentException);
  MyProc := nil;
end;

procedure HammingTests.test_disallow_second_strand_longer;
var MyProc: TTestLocalMethod;
begin
  MyProc := procedure
            begin
              THamming.compute('ATA', 'AGTG');
            end;
  assert.WillRaise(MyProc, EArgumentException);
  MyProc := nil;
end;

initialization
  TDUnitX.RegisterTestFixture(HammingTests);
end.
