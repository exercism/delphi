//******************************************************************
// Hint: You will be using TTuple in your solution.  TTuple is
// declared in this unit.  It will be necessary for you to add
// a uses statement in the interface section of uSaddlePoints.pas.
//
// For more guidance as you work on this exercise, see
// GETTING_STARTED.md.
//******************************************************************

unit uSaddlePointsTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.1.0';

type

  [TestFixture]
  TSaddlePointTests = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure Can_identify_single_saddle_point;

    [Test]
    [Ignore]
    procedure Can_identify_that_empty_matrix_has_no_saddle_points;

    [Test]
    [Ignore]
    procedure Can_identify_lack_of_saddle_points_when_there_are_none;

    [Test]
    [Ignore]
    procedure Can_identify_multiple_saddle_points;

    [Test]
    [Ignore]
    procedure Can_identify_saddle_point_in_bottom_right_corner;
  end;

  TTuple<T1, T2> = record
  private
    fValue1: T1;
    fValue2: T2;
  public
    constructor Create(Value1: T1; Value2: T2);
    property Value1 : T1 read fValue1;
    property Value2 : T2 read fValue2;
  end;

implementation
uses uSaddlePoints;

constructor TTuple<T1, T2>.Create(Value1: T1; Value2: T2);
begin
  fValue1 := Value1;
  fValue2 := Value2;
end;

procedure TSaddlePointTests.Can_identify_single_saddle_point;
var SaddlePoints: ISaddlePoints;
    values: TArray<TArray<integer>>;
    expected: TArray<TTuple<integer,integer>>;
begin
  SetLength(values, 3, 3);
  values[0,0] := 9; values[0,1] := 8; values[0,2] := 7;
  values[1,0] := 5; values[1,1] := 3; values[1,2] := 2;
  values[2,0] := 6; values[2,1] := 6; values[2,2] := 7;

  SaddlePoints := newSaddlePoints(values);

  SetLength(expected, 1);
  expected[0] := TTuple<integer,integer>.Create(1,0);
  Assert.AreEqual(expected,SaddlePoints.Calculate);
end;

procedure TSaddlePointTests.Can_identify_that_empty_matrix_has_no_saddle_points;
var SaddlePoints: ISaddlePoints;
    values: TArray<TArray<integer>>;
    expected: TArray<TTuple<integer,integer>>;
begin
  SetLength(values, 0, 0);

  SaddlePoints := newSaddlePoints(values);

  SetLength(expected, 0);
  Assert.AreEqual(expected,SaddlePoints.Calculate);
end;

procedure TSaddlePointTests.Can_identify_lack_of_saddle_points_when_there_are_none;
var SaddlePoints: ISaddlePoints;
    values: TArray<TArray<integer>>;
    expected: TArray<TTuple<integer,integer>>;
begin
  SetLength(values, 3, 3);
  values[0,0] := 1; values[0,1] := 2; values[0,2] := 3;
  values[1,0] := 3; values[1,1] := 1; values[1,2] := 2;
  values[2,0] := 2; values[2,1] := 3; values[2,2] := 1;

  SaddlePoints := newSaddlePoints(values);

  SetLength(expected, 0);
  Assert.AreEqual(expected,SaddlePoints.Calculate);
end;

procedure TSaddlePointTests.Can_identify_multiple_saddle_points;
var SaddlePoints: ISaddlePoints;
    values: TArray<TArray<integer>>;
    expected: TArray<TTuple<integer,integer>>;
begin
  SetLength(values, 3, 3);
  values[0,0] := 4; values[0,1] := 5; values[0,2] := 4;
  values[1,0] := 3; values[1,1] := 5; values[1,2] := 5;
  values[2,0] := 1; values[2,1] := 5; values[2,2] := 4;

  SaddlePoints := newSaddlePoints(values);

  SetLength(expected, 3);
  expected[0] := TTuple<integer,integer>.Create(0,1);
  expected[1] := TTuple<integer,integer>.Create(1,1);
  expected[2] := TTuple<integer,integer>.Create(2,1);
  Assert.AreEqual(expected,SaddlePoints.Calculate);
end;

procedure TSaddlePointTests.Can_identify_saddle_point_in_bottom_right_corner;
var SaddlePoints: ISaddlePoints;
    values: TArray<TArray<integer>>;
    expected: TArray<TTuple<integer,integer>>;
begin
  SetLength(values, 3, 3);
  values[0,0] := 8; values[0,1] := 7; values[0,2] := 9;
  values[1,0] := 6; values[1,1] := 7; values[1,2] := 6;
  values[2,0] := 3; values[2,1] := 2; values[2,2] := 5;

  SaddlePoints := newSaddlePoints(values);

  SetLength(expected, 1);
  expected[0] := TTuple<integer,integer>.Create(2,2);
  Assert.AreEqual(expected,SaddlePoints.Calculate);
end;

initialization
  TDUnitX.RegisterTestFixture(TSaddlePointTests);
end.
