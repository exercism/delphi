unit uSpaceAgeTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.2.0';

type

  [TestFixture]
  SpaceAgeTests = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure Age_on_earth;

    [Test]
    [Ignore]
    procedure Age_on_mercury;

    [Test]
    [Ignore]
    procedure Age_on_venus;

    [Test]
    [Ignore]
    procedure Age_on_mars;

    [Test]
    [Ignore]
    procedure Age_on_jupiter;

    [Test]
    [Ignore]
    procedure Age_on_saturn;

    [Test]
    [Ignore]
    procedure Age_on_uranus;

    [Test]
    [Ignore]
    procedure Age_on_neptune;
  end;

implementation
uses uSpaceAge;

{ SpaceAgeTests }

procedure SpaceAgeTests.Age_on_earth;
var
  MyAge: ISpaceAge;
  expectedAge: double;
begin
  MyAge := NewSpaceAge(1000000000);
  expectedAge := 31.69;
  Assert.AreEqual(expectedAge, MyAge.OnEarth);
end;

procedure SpaceAgeTests.Age_on_jupiter;
var
  MyAge: ISpaceAge;
  expectedAge: double;
begin
  MyAge := NewSpaceAge(901876382);
  expectedAge := 2.41;
  Assert.AreEqual(expectedAge, MyAge.OnJupiter);
end;

procedure SpaceAgeTests.Age_on_mars;
var
  MyAge: ISpaceAge;
  expectedAge: double;
begin
  MyAge := NewSpaceAge(2129871239);
  expectedAge := 35.88;
  Assert.AreEqual(expectedAge, MyAge.OnMars);
end;

procedure SpaceAgeTests.Age_on_mercury;
var
  MyAge: ISpaceAge;
  expectedAge: double;
begin
  MyAge := NewSpaceAge(2134835688);
  expectedAge := 280.88;
  Assert.AreEqual(expectedAge, MyAge.OnMercury);
end;

procedure SpaceAgeTests.Age_on_neptune;
var
  MyAge: ISpaceAge;
  expectedAge: double;
begin
  MyAge := NewSpaceAge(1821023456);
  expectedAge := 0.35;
  Assert.AreEqual(expectedAge, MyAge.OnNeptune);
end;

procedure SpaceAgeTests.Age_on_saturn;
var
  MyAge: ISpaceAge;
  expectedAge: double;
begin
  MyAge := NewSpaceAge(2000000000);
  expectedAge := 2.15;
  Assert.AreEqual(expectedAge, MyAge.OnSaturn);
end;

procedure SpaceAgeTests.Age_on_uranus;
var
  MyAge: ISpaceAge;
  expectedAge: double;
begin
  MyAge := NewSpaceAge(1210123456);
  expectedAge := 0.46;
  Assert.AreEqual(expectedAge, MyAge.OnUranus);
end;

procedure SpaceAgeTests.Age_on_venus;
var
  MyAge: ISpaceAge;
  expectedAge: double;
begin
  MyAge := NewSpaceAge(189839836);
  expectedAge := 9.78;
  Assert.AreEqual(expectedAge, MyAge.OnVenus);
end;

initialization
  TDUnitX.RegisterTestFixture(SpaceAgeTests);
end.
