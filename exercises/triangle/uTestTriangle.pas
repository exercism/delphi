unit uTestTriangle; 
 
interface 
uses 
  DUnitX.TestFramework; 
  
const CanonicalVersion = '1.1.0';

type
  [TestFixture('Equilateral')] 
  EquilateralTests = class(TObject) 
  public 
    [Test] 
//  [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure True_if_all_sides_are_equal; 
 
    [Test] 
    [Ignore] 
    procedure False_if_any_side_is_unequal; 
 
    [Test] 
    [Ignore] 
    procedure False_if_no_sides_are_equal; 
 
    [Test] 
    [Ignore] 
    procedure All_zero_sides_are_illegal_so_the_triangle_is_not_equilateral; 
 
    [Test] 
    [Ignore] 
    procedure Sides_may_be_floats; 
  end; 
 
  [TestFixture('Isosceles')] 
  IsoscelesTests = class(TObject) 
  public 
    [Test] 
    [Ignore] 
    procedure True_if_last_two_sides_are_equal; 
 
    [Test] 
    [Ignore] 
    procedure True_if_first_two_sides_are_equal; 
 
    [Test] 
    [Ignore] 
    procedure True_if_first_and_last_sides_are_equal; 
 
    [Test] 
    [Ignore] 
    procedure Equilateral_triangles_are_also_isosceles; 
 
    [Test] 
    [Ignore] 
    procedure False_if_no_sides_are_equal; 
 
    [Test] 
    [Ignore] 
    procedure Sides_that_violate_triangle_inequality_are_not_isosceles_even_if_two_are_equal; 
 
    [Test] 
    [Ignore] 
    procedure Sides_may_be_floats; 
  end; 
 
  [TestFixture('Scalene')] 
  ScaleneTests = class(TObject) 
  public 
    [Test] 
    [Ignore] 
    procedure True_if_no_sides_are_equal; 
 
    [Test] 
    [Ignore] 
    procedure False_if_all_sides_are_equal; 
 
    [Test] 
    [Ignore] 
    procedure False_if_two_sides_are_equal; 
 
    [Test] 
    [Ignore] 
    procedure Sides_that_violate_triangle_inequality_are_not_scalene_even_if_they_are_all_different; 
 
    [Test] 
    [Ignore] 
    procedure Sides_may_be_floats; 
  end; 
 
implementation 
uses uTriangle; 
 
{$region 'EquilateralTests'} 
procedure EquilateralTests.True_if_all_sides_are_equal; 
begin 
  Assert.AreEqual(true, Triangle.Sides(Equilateral, 2, 2, 2)); 
end; 
 
procedure EquilateralTests.False_if_any_side_is_unequal; 
begin 
  Assert.AreEqual(false, Triangle.Sides(Equilateral, 2, 3, 2)); 
end; 
 
procedure EquilateralTests.False_if_no_sides_are_equal; 
begin 
  Assert.AreEqual(false, Triangle.Sides(Equilateral, 5, 4, 6)); 
end; 
 
procedure EquilateralTests.All_zero_sides_are_illegal_so_the_triangle_is_not_equilateral; 
begin 
  Assert.AreEqual(false, Triangle.Sides(Equilateral, 0, 0, 0)); 
end; 
 
procedure EquilateralTests.Sides_may_be_floats; 
begin 
  Assert.AreEqual(true, Triangle.Sides(Equilateral, 0.5, 0.5, 0.5)); 
end; 
{$endregion} 
 
{$region'IsoscelesTests'} 
procedure IsoscelesTests.True_if_last_two_sides_are_equal; 
begin 
  Assert.AreEqual(true, Triangle.Sides(Isosceles, 3, 4, 4)); 
end; 
 
procedure IsoscelesTests.True_if_first_two_sides_are_equal; 
begin 
  Assert.AreEqual(true, Triangle.Sides(Isosceles, 4, 4, 3)); 
end; 
 
procedure IsoscelesTests.True_if_first_and_last_sides_are_equal; 
begin 
  Assert.AreEqual(true, Triangle.Sides(Isosceles, 4, 3, 4)); 
end; 
 
procedure IsoscelesTests.Equilateral_triangles_are_also_isosceles; 
begin 
  Assert.AreEqual(true, Triangle.Sides(Isosceles, 4, 4, 4)); 
end; 
 
procedure IsoscelesTests.False_if_no_sides_are_equal; 
begin 
  Assert.AreEqual(false, Triangle.Sides(Isosceles, 2, 3, 4)); 
end; 
 
procedure IsoscelesTests.Sides_that_violate_triangle_inequality_are_not_isosceles_even_if_two_are_equal; 
begin 
  Assert.AreEqual(false, Triangle.Sides(Isosceles, 1, 1, 3)); 
end; 
 
procedure IsoscelesTests.Sides_may_be_floats; 
begin 
  Assert.AreEqual(true, Triangle.Sides(Isosceles, 0.5, 0.4, 0.5)); 
end; 
{$endregion} 
 
{$region 'ScaleneTests'} 
procedure ScaleneTests.True_if_no_sides_are_equal; 
begin 
  Assert.AreEqual(true, Triangle.Sides(Scalene, 5, 4, 6)); 
end; 
 
procedure ScaleneTests.False_if_all_sides_are_equal; 
begin 
  Assert.AreEqual(false, Triangle.Sides(Scalene, 4, 4, 4)); 
end; 
 
procedure ScaleneTests.False_if_two_sides_are_equal; 
begin 
  Assert.AreEqual(false, Triangle.Sides(Scalene, 4, 4, 3)); 
end; 
 
procedure ScaleneTests.Sides_that_violate_triangle_inequality_are_not_scalene_even_if_they_are_all_different; 
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