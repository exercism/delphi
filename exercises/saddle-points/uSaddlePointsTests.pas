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

type

  [TestFixture]
  TSaddlePointTests = class(TObject)
  public
    [Test]
//  [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure Readme_example;

    [Test]
    [Ignore]
    procedure No_saddle_point;

    [Test]
    [Ignore]
    procedure Saddle_point;

    [Test]
    [Ignore]
    procedure Another_saddle_point;

    [Test]
    [Ignore]
    procedure Multiple_saddle_points;

    [Test]
    [Ignore]
    procedure Five_by_five_matrix;
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

procedure TSaddlePointTests.Readme_example;
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

procedure TSaddlePointTests.No_saddle_point;
var SaddlePoints: ISaddlePoints;
    values: TArray<TArray<integer>>;
    expected: TArray<TTuple<integer,integer>>;
begin
  SetLength(values, 2, 2);
  values[0,0] := 2; values[0,1] := 1;
  values[1,0] := 1; values[1,1] := 2;

  SaddlePoints := newSaddlePoints(values);

  SetLength(expected, 0);
  Assert.AreEqual(expected,SaddlePoints.Calculate);
end;

procedure TSaddlePointTests.Saddle_point;
var SaddlePoints: ISaddlePoints;
    values: TArray<TArray<integer>>;
    expected: TArray<TTuple<integer,integer>>;
begin
  SetLength(values, 2, 2);
  values[0,0] := 1; values[0,1] := 2;
  values[1,0] := 3; values[1,1] := 4;

  SaddlePoints := newSaddlePoints(values);

  SetLength(expected, 1);
  expected[0] := TTuple<integer,integer>.Create(0,1);
  Assert.AreEqual(expected,SaddlePoints.Calculate);
end;

procedure TSaddlePointTests.Another_saddle_point;
var SaddlePoints: ISaddlePoints;
    values: TArray<TArray<integer>>;
    expected: TArray<TTuple<integer,integer>>;
begin
  SetLength(values, 3, 5);
  values[0,0] := 18; values[0,1] := 3;  values[0,2] := 39; values[0,3] := 19; values[0,4] := 91;
  values[1,0] := 38; values[1,1] := 10; values[1,2] := 8;  values[1,3] := 77; values[1,4] := 320;
  values[2,0] := 3;  values[2,1] := 4;  values[2,2] := 8;  values[2,3] := 6;  values[2,4] := 7;

  SaddlePoints := newSaddlePoints(values);

  SetLength(expected, 1);
  expected[0] := TTuple<integer,integer>.Create(2,2);
  Assert.AreEqual(expected,SaddlePoints.Calculate);
end;

procedure TSaddlePointTests.Multiple_saddle_points;
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

procedure TSaddlePointTests.Five_by_five_matrix;
var SaddlePoints: ISaddlePoints;
    values: TArray<TArray<integer>>;
    expected: TArray<TTuple<integer,integer>>;
begin
  SetLength(values, 5, 5);
  values[0,0] := 34; values[0,1] := 21; values[0,2] := 61; values[0,3] := 41; values[0,4] := 25;
  values[1,0] := 14; values[1,1] := 42; values[1,2] := 60; values[1,3] := 14; values[1,4] := 31;
  values[2,0] := 54; values[2,1] := 45; values[2,2] := 55; values[2,3] := 42; values[2,4] := 23;
  values[3,0] := 33; values[3,1] := 15; values[3,2] := 61; values[3,3] := 31; values[3,4] := 35;
  values[4,0] := 21; values[4,1] := 52; values[4,2] := 63; values[4,3] := 13; values[4,4] := 23;

  SaddlePoints := newSaddlePoints(values);

  SetLength(expected, 1);
  expected[0] := TTuple<integer,integer>.Create(2,2);
  Assert.AreEqual(expected, SaddlePoints.Calculate);
end;

initialization
  TDUnitX.RegisterTestFixture(TSaddlePointTests);
end.
