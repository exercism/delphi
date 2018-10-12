unit uRobotNameTest;

interface
uses
  DUnitX.TestFramework, uRobotName;

type
  [TestFixture]
  TRobotNameTest = class(TObject)
  private
    FRobot : TRobot;
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure name_properly_formated;

    [Test]
    [Ignore]
    procedure is_name_persistent;

    [Test]
    [Ignore]
    procedure is_able_to_reset_name;

    [Test]
    [Ignore]
    procedure different_robots_have_different_names;
  end;

implementation

uses
  System.RegularExpressions, System.Classes, Generics.Collections;

procedure TRobotNameTest.is_name_persistent;
begin
  FRobot := TRobot.Create;
  Assert.AreEqual(FRobot.Name, FRobot.Name);
  FRobot.DisposeOf;
end;

procedure TRobotNameTest.name_properly_formated;
begin
  FRobot := TRobot.Create;
  Assert.IsTrue(TRegEx.IsMatch(FRobot.Name, '^[A-Z]{2}\d{3}$'), 'expected format''ssddd'', found ' + FRobot.Name);
  FRobot.DisposeOf;
end;

procedure TRobotNameTest.different_robots_have_different_names;
var Names : TList<string>;
  Robots : TObjectList<TRobot>;
  i: Integer;
begin
  Names := TList<string>.create;
  Robots := TObjectList<TRobot>.Create;
  for i := 1 to 10000 do
  begin
    Robots.Add(TRobot.Create);
    Assert.IsFalse(Names.Contains(Robots.Last.Name));
    Names.Add(Robots.Last.Name);
  end;
  Names.DisposeOf;
  Robots.DisposeOf;
end;

procedure TRobotNameTest.is_able_to_reset_name;
var
  Old: string;
begin
  FRobot := TRobot.Create;
  Old := FRobot.Name;
  FRobot.Reset;
  Assert.IsTrue(TRegEx.IsMatch(FRobot.Name, '^[A-Z]{2}\d{3}$'), 'expected format''ssddd'', found ' + FRobot.Name);
  FRobot.DisposeOf;
end;

initialization
  TDUnitX.RegisterTestFixture(TRobotNameTest);
end.
