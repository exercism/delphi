unit uTriangleTests;
 
interface 
uses 
  DUnitX.TestFramework; 
  
const CanonicalVersion = '1.2.1.1';

type
  [TestFixture('Equilateral Triangle')]
  EquilateralTests = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure AllSidesAreEqual;

    [Test]
    [Ignore]
    procedure AnySideIsUnequal;

    [Test]
    [Ignore]
    procedure NoSidesAreEqual;

    [Test]
    [Ignore]
    procedure AllZeroSidesIsNotATriangle;

    [Test]
    [Ignore]
    procedure Sides_may_be_floats;
  end;

  [TestFixture('Isosceles Triangle')]
  IsoscelesTests = class(TObject)
  public
    [Test]
    [Ignore]
    procedure LastTwoSidesAreEqual;

    [Test]
    [Ignore]
    procedure FirstTwoSidesAreEqual;

    [Test]
    [Ignore]
    procedure FirstAndLastSidesAreEqual;

    [Test]
    [Ignore]
    procedure EquilateralTrianglesAreAlsoIsosceles;

    [Test]
    [Ignore]
    procedure NoSidesAreEqual;

    [Test]
    [Ignore]
    procedure FirstTriangleInequalityViolation;

    [Test]
    [Ignore]
    procedure SecondTriangleInequalityViolation;

    [Test]
    [Ignore]
    procedure ThirdTriangleInequalityViolation;

    [Test]
    [Ignore]
    procedure Sides_may_be_floats;
  end;

  [TestFixture('Scalene Triangle')]
  ScaleneTests = class(TObject)
  public
    [Test]
    [Ignore]
    procedure NoSidesAreEqual;

    [Test]
    [Ignore]
    procedure AllSidesAreEqual;

    [Test]
    [Ignore]
    procedure TwoSidesAreEqual;

    [Test]
    [Ignore]
    procedure MayNotViolateTriangleInequality;

    [Test]
    [Ignore]
    procedure Sides_may_be_floats;
  end;

implementation
uses uTriangle; 
 
{$region 'EquilateralTests'} 
procedure EquilateralTests.AllSidesAreEqual;
begin 
  Assert.AreEqual(true, Triangle.Sides(Equilateral, 2, 2, 2)); 
end; 
 
procedure EquilateralTests.AnySideIsUnequal;
begin 
  Assert.AreEqual(false, Triangle.Sides(Equilateral, 2, 3, 2)); 
end; 
 
procedure EquilateralTests.NoSidesAreEqual;
begin
  Assert.AreEqual(false, Triangle.Sides(Equilateral, 5, 4, 6));
end;

procedure EquilateralTests.AllZeroSidesIsNotATriangle;
begin
  Assert.AreEqual(false, Triangle.Sides(Equilateral, 0, 0, 0)); 
end; 
 
procedure EquilateralTests.Sides_may_be_floats; 
begin 
  Assert.AreEqual(true, Triangle.Sides(Equilateral, 0.5, 0.5, 0.5)); 
end; 
{$endregion} 

{$region'IsoscelesTests'} 
procedure IsoscelesTests.LastTwoSidesAreEqual;
begin 
  Assert.AreEqual(true, Triangle.Sides(Isosceles, 3, 4, 4)); 
end;

procedure IsoscelesTests.FirstTwoSidesAreEqual;
begin
  Assert.AreEqual(true, Triangle.Sides(Isosceles, 4, 4, 3));
end;

procedure IsoscelesTests.FirstAndLastSidesAreEqual;
begin
  Assert.AreEqual(true, Triangle.Sides(Isosceles, 4, 3, 4));
end;

procedure IsoscelesTests.EquilateralTrianglesAreAlsoIsosceles;
begin
  Assert.AreEqual(true, Triangle.Sides(Isosceles, 4, 4, 4));
end;

procedure IsoscelesTests.NoSidesAreEqual;
begin
  Assert.AreEqual(false, Triangle.Sides(Isosceles, 2, 3, 4));
end;

procedure IsoscelesTests.FirstTriangleInequalityViolation;
begin
  Assert.AreEqual(false, Triangle.Sides(Isosceles, 1, 1, 3));
end;

procedure IsoscelesTests.SecondTriangleInequalityViolation;
begin
  Assert.AreEqual(false, Triangle.Sides(Isosceles, 1, 3, 1));
end;

procedure IsoscelesTests.ThirdTriangleInequalityViolation;
begin
  Assert.AreEqual(false, Triangle.Sides(Isosceles, 3, 1, 1));
end;

procedure IsoscelesTests.Sides_may_be_floats;
begin 
  Assert.AreEqual(true, Triangle.Sides(Isosceles, 0.5, 0.4, 0.5)); 
end; 
{$endregion} 
 
{$region 'ScaleneTests'} 
procedure ScaleneTests.NoSidesAreEqual;
begin 
  Assert.AreEqual(true, Triangle.Sides(Scalene, 5, 4, 6)); 
end; 
 
procedure ScaleneTests.AllSidesAreEqual;
begin 
  Assert.AreEqual(false, Triangle.Sides(Scalene, 4, 4, 4)); 
end; 
 
procedure ScaleneTests.TwoSidesAreEqual;
begin 
  Assert.AreEqual(false, Triangle.Sides(Scalene, 4, 4, 3)); 
end; 
 
procedure ScaleneTests.MayNotViolateTriangleInequality;
begin 
  Assert.AreEqual(false, Triangle.Sides(Scalene, 7, 3, 2)); 
end; 
 
procedure ScaleneTests.Sides_may_be_floats; 
begin 
  Assert.AreEqual(true, Triangle.Sides(Scalene, 0.5, 0.4, 0.6)); 
end; 
{$endregion} 

initialization 
  TDUnitX.RegisterTestFixture(EquilateralTests); 
  TDUnitX.RegisterTestFixture(IsoscelesTests); 
  TDUnitX.RegisterTestFixture(ScaleneTests); 
end. 