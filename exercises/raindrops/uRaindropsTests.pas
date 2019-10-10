unit uRaindropsTests;

interface
uses
  DUnitX.TestFramework;
  
const
  CanonicalVersion = '1.1.0.1';

type

  [TestFixture]
  RaindropsTest = class(TObject)
  public
    [Test]
//  [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure the_sound_for_1_is_1;

    [Test]
    [Ignore]
    procedure the_sound_for_3_is_Pling;

    [Test]
    [Ignore]
    procedure the_sound_for_5_is_Plang;

    [Test]
    [Ignore]
    procedure the_sound_for_7_is_Plong;

    [Test]
    [Ignore]
    procedure the_sound_for_6_is_Pling_as_it_has_a_factor_3;

    [Test]
    [Ignore]
    procedure _2_to_the_power_3_does_not_make_a_raindrop_sound_as_3_is_the_exponent_not_the_base;

    [Test]
    [Ignore]
    procedure the_sound_for_9_is_Pling_as_it_has_a_factor_3;

    [Test]
    [Ignore]
    procedure the_sound_for_10_is_Plang_as_it_has_a_factor_5;

    [Test]
    [Ignore]
    procedure the_sound_for_14_is_Plong_as_it_has_a_factor_of_7;

    [Test]
    [Ignore]
    procedure the_sound_for_15_is_PlingPlang_as_it_has_factors_3_and_5;

    [Test]
    [Ignore]
    procedure the_sound_for_21_is_PlingPlong_as_it_has_factors_3_and_7;

    [Test]
    [Ignore]
    procedure the_sound_for_25_is_Plang_as_it_has_a_factor_5;

    [Test]
    [Ignore]
    procedure the_sound_for_27_is_Pling_as_it_has_a_factor_3;

    [Test]
    [Ignore]
    procedure the_sound_for_35_is_PlangPlong_as_it_has_factors_5_and_7;

    [Test]
    [Ignore]
    procedure the_sound_for_49_is_Plong_as_it_has_a_factor_7;

    [Test]
    [Ignore]
    procedure the_sound_for_52_is_52;

    [Test]
    [Ignore]
    procedure the_sound_for_105_is_PlingPlangPlong_as_it_has_factors_3_5_7;

    [Test]
    [Ignore]
    procedure the_sound_for_3125_is_Plang_as_it_has_a_factor_5;
  end;

implementation
uses uRaindrops;

procedure RaindropsTest.the_sound_for_1_is_1;
begin
  Assert.AreEqual('1', Raindrops.Convert(1));
end;

procedure RaindropsTest.the_sound_for_3_is_Pling; 
begin
  Assert.AreEqual('Pling', Raindrops.Convert(3));
end;

procedure RaindropsTest.the_sound_for_5_is_Plang; 
begin
  Assert.AreEqual('Plang', Raindrops.Convert(5));
end;

procedure RaindropsTest.the_sound_for_7_is_Plong; 
begin
  Assert.AreEqual('Plong', Raindrops.Convert(7));
end;

procedure RaindropsTest.the_sound_for_6_is_Pling_as_it_has_a_factor_3; 
begin
  Assert.AreEqual('Pling', Raindrops.Convert(6));
end;

procedure RaindropsTest._2_to_the_power_3_does_not_make_a_raindrop_sound_as_3_is_the_exponent_not_the_base;
begin
  Assert.AreEqual('8', Raindrops.Convert(8));
end;

procedure RaindropsTest.the_sound_for_9_is_Pling_as_it_has_a_factor_3;
begin
  Assert.AreEqual('Pling', Raindrops.Convert(9));
end;

procedure RaindropsTest.the_sound_for_10_is_Plang_as_it_has_a_factor_5; 
begin
  Assert.AreEqual('Plang', Raindrops.Convert(10));
end;

procedure RaindropsTest.the_sound_for_14_is_Plong_as_it_has_a_factor_of_7;
begin
  Assert.AreEqual('Plong', Raindrops.Convert(14));
end;

procedure RaindropsTest.the_sound_for_15_is_PlingPlang_as_it_has_factors_3_and_5;
begin
  Assert.AreEqual('PlingPlang', Raindrops.Convert(15));
end;

procedure RaindropsTest.the_sound_for_21_is_PlingPlong_as_it_has_factors_3_and_7;
begin
  Assert.AreEqual('PlingPlong', Raindrops.Convert(21));
end;

procedure RaindropsTest.the_sound_for_25_is_Plang_as_it_has_a_factor_5; 
begin
  Assert.AreEqual('Plang', Raindrops.Convert(25));
end;

procedure RaindropsTest.the_sound_for_27_is_Pling_as_it_has_a_factor_3;
begin
  Assert.AreEqual('Pling', Raindrops.Convert(27));
end;

procedure RaindropsTest.the_sound_for_35_is_PlangPlong_as_it_has_factors_5_and_7;
begin
  Assert.AreEqual('PlangPlong', Raindrops.Convert(35));
end;

procedure RaindropsTest.the_sound_for_49_is_Plong_as_it_has_a_factor_7;
begin
  Assert.AreEqual('Plong', Raindrops.Convert(49));
end;

procedure RaindropsTest.the_sound_for_52_is_52;
begin
  Assert.AreEqual('52', Raindrops.Convert(52));
end;

procedure RaindropsTest.the_sound_for_105_is_PlingPlangPlong_as_it_has_factors_3_5_7;
begin
  Assert.AreEqual('PlingPlangPlong', Raindrops.Convert(105));
end;

procedure RaindropsTest.the_sound_for_3125_is_Plang_as_it_has_a_factor_5;
begin
  Assert.AreEqual('Plang', Raindrops.Convert(3125));
end;

initialization
  TDUnitX.RegisterTestFixture(RaindropsTest);
end.
