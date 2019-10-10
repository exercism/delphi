unit uRobotNameTests;

interface
uses
  DUnitX.TestFramework, uRobotName, System.Generics.Collections;

const
  CanonicalVersion = '0.0.0.1';

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
  System.RegularExpressions, System.Classes, SysUtils, Windows;

procedure TRobotNameTest.is_name_persistent;
begin
  Assert.AreEqual(FRobot.Name, FRobot.Name);
end;

procedure TRobotNameTest.name_properly_formated;
begin
  Assert.IsTrue(TRegEx.IsMatch(FRobot.Name, '^[A-Z]{2}\d{3}$'), 'expected format''ssddd'', found ' + FRobot.Name);
end;

procedure TRobotNameTest.Setup;
var
  i, j : char;
  k : integer;
begin
  Names := TList<string>.create;
  for i := 'A' to 'Z' do
    for j := 'A' to 'Z' do
      for k := 0 to 999 do
        Names.Add(i + j + format('%.*d', [3, k]));
  Robots := TObjectList<TRobot>.Create;
  FRobot := TRobot.Create;
end;

procedure TRobotNameTest.TearDown;
begin
  Names.DisposeOf;
  Robots.DisposeOf;
  FRobot.DisposeOf;
end;

procedure TRobotNameTest.each_robot_have_unique_name;
var
  i, ind : integer;
  Rob: TRobot;

  Procedure WriteXY( x , y : Integer; s : string);
  var
   LCoord: TCoord;
   begin
     LCoord.X := x;
     LCoord.Y := y;
     SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), LCoord);
     Write(s);
   end;

begin
  for i := 0 to 20000 do
  begin
    Rob := TRobot.Create;
    Assert.IsTrue(Names.BinarySearch(Rob.Name, ind), format('Robot #: %*.d, named %s is not unique',[5, ind, Rob.Name]));
    Names.Delete(ind);
    Robots.BinarySearch(Rob, ind);
    Robots.Insert(ind, Rob);
    WriteXY(2, 9, format('Robot #: %*.d, named %s, is unique',[5, i, Rob.Name]));
  end;
end;

procedure TRobotNameTest.is_able_to_reset_name;
var
  old : string;
  i : Integer;

begin
  Robots.Add(TRobot.Create);
  old := Robots.Last.Name;
  Names.Remove(old);
  for i := 0 to 10 do
  begin
    Names.Add(old);
    old := Robots.Last.Name;
    Robots.Last.Reset;
    Assert.IsTrue(Names.Contains(Robots.Last.Name), 'Robot name after reset is not unique');
    Names.Remove(Robots.Last.Name);
    Assert.AreNotEqual(old, Robots.Last.Name, 'Robot name after reset is not changed');
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TRobotNameTest);
end.
