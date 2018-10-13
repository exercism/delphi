unit uRobotNameTest;

interface
uses
  DUnitX.TestFramework, uRobotName, System.Generics.Collections;

const
  CanonicalVersion = '0.0.0';

type
  [TestFixture]
  TRobotNameTest = class(TObject)
  private
    FRobot : TRobot;
    Names : TList<string>;
    Robots : TObjectList<TRobot>;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

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
    procedure each_robot_have_unique_name;
  end;

implementation

uses
  System.RegularExpressions, System.Classes, SysUtils;

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

procedure TRobotNameTest.Setup;
var i, j : char;
  k : integer;
begin
  Names := TList<string>.create;
  for i := 'A' to 'Z' do
    for j := 'A' to 'Z' do
      for k := 0 to 999 do
        Names.Add(i + j + format('%.*d', [3, k]));
  Robots := TObjectList<TRobot>.Create;
end;

procedure TRobotNameTest.TearDown;
begin
  Names.DisposeOf;
  Robots.DisposeOf;
end;

procedure TRobotNameTest.each_robot_have_unique_name;
var
  k : integer;
begin
  for k := 1 to 1000 do
  begin
    Robots.Add(TRobot.Create);
    Assert.IsTrue(Names.Contains(Robots.Last.Name), 'Robot name is not unique');
    Names.Remove(Robots.Last.Name);
  end;
end;

procedure TRobotNameTest.is_able_to_reset_name;
var
  old : string;
  i, changeCount : Integer;

begin
  Robots.Add(TRobot.Create);
  old := Robots.Last.Name;
  Names.Remove(old);
  changeCount := 0;
  for i := 0 to 10 do
  begin
    Names.Add(old);
    old := Robots.Last.Name;
    Robots.Last.Reset;
    Assert.IsTrue(Names.Contains(Robots.Last.Name), 'Robot name after reset is not unique');
    Names.Remove(Robots.Last.Name);
    if old <> Robots.Last.Name then
      inc(changeCount);
  end;
  Assert.AreNotEqual(0, changeCount, 'Robot name after reset is not changed');
end;

initialization
  TDUnitX.RegisterTestFixture(TRobotNameTest);
end.
