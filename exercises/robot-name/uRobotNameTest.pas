unit uRobotNameTest;

interface
uses
  DUnitX.TestFramework, uRobotName;

const
  CanonicalVersion = '0.0.0';

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
    procedure each_robot_have_unique_name;
  end;

implementation

uses
  System.RegularExpressions, System.Classes, Generics.Collections, SysUtils;

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

procedure TRobotNameTest.each_robot_have_unique_name;
var Names : TList<string>;
  Robots : TObjectList<TRobot>;
  i, j: char;
  k : integer;
begin
  Names := TList<string>.create;
  Robots := TObjectList<TRobot>.Create;
  for i := 'A' to 'Z' do
    for j := 'A' to 'Z' do
      for k := 0 to 999 do
        Names.Add(i + j + format('%.*d', [3, k]));
  for k := 1 to 1000 do
  begin
    Robots.Add(TRobot.Create);
    Assert.IsTrue(Names.Contains(Robots.Last.Name), Robots.Last.Name);
    Names.Remove(Robots.Last.Name);
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
