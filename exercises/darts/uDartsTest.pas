unit uDartsTest;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.0.0';

type
  [TestFixture]
  TDartsTest = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure A_dart_lands_outside_the_target;

    [Test]
    [Ignore]
    procedure A_dart_lands_just_in_the_border_of_the_target;

    [Test]
    [Ignore]
    procedure A_dart_lands_in_the_middle_circle;

    [Test]
    [Ignore]
    procedure A_dart_lands_right_in_the_border_between_outside_and_middle_circles;

    [Test]
    [Ignore]
    procedure A_dart_lands_in_the_inner_circle;
  end;

implementation

uses
  uDarts;

procedure TDartsTest.A_dart_lands_in_the_inner_circle;
begin
    Assert.AreEqual(10, TDarts.Score(0, 0));
end;

procedure TDartsTest.A_dart_lands_in_the_middle_circle;
begin
    Assert.AreEqual(5, TDarts.Score(3.0, 3.7));
end;

procedure TDartsTest.A_dart_lands_just_in_the_border_of_the_target;
begin
  Assert.AreEqual(1, TDarts.Score(10, 0));
end;

procedure TDartsTest.A_dart_lands_outside_the_target;
begin
  Assert.AreEqual(0, TDarts.Score(15.3, 13.2));
end;

procedure TDartsTest.A_dart_lands_right_in_the_border_between_outside_and_middle_circles;
begin
  Assert.AreEqual(5, TDarts.Score(0, 5));
end;

initialization
  TDUnitX.RegisterTestFixture(TDartsTest);
end.
