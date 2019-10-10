unit uMineSweeperTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.1.0.1';

type

  [TestFixture]
  MineSweeperTest = class(TObject)
  private
    class function FormatInput(aInput: array of string): string; static;
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure No_rows;

    [Test]
    [Ignore]
    procedure No_columns;

    [Test]
    [Ignore]
    procedure No_mines;

    [Test]
    [Ignore]
    procedure Board_with_only_mines;

    [Test]
    [Ignore]
    procedure Mine_surrounded_by_spaces;

    [Test]
    [Ignore]
    procedure Space_surrounded_by_mines;

    [Test]
    [Ignore]
    procedure Horizontal_line;

    [Test]
    [Ignore]
    procedure Horizontal_line_mines_at_edges;

    [Test]
    [Ignore]
    procedure Vertical_line;

    [Test]
    [Ignore]
    procedure Vertical_line_mines_at_edges;

    [Test]
    [Ignore]
    procedure Cross;

    [Test]
    [Ignore]
    procedure Large_board;
  end;

implementation
uses System.SysUtils, uMineSweeper;


{ MineSweeperTest }

procedure MineSweeperTest.Board_with_only_mines;
var input,
    expected: array of string;
begin
  SetLength(input, 3);
  input[0] := '***';
  input[1] := '***';
  input[2] := '***';

  SetLength(expected, 3);
  expected[0] := '***';
  expected[1] := '***';
  expected[2] := '***';

  Assert.AreEqual(FormatInput(expected), TMineSweeper.Annotate(FormatInput(input)));
end;

procedure MineSweeperTest.Cross;
var input,
    expected: array of string;
begin
  SetLength(input, 5);
  input[0] := '  *  ';
  input[1] := '  *  ';
  input[2] := '*****';
  input[3] := '  *  ';
  input[4] := '  *  ';

  SetLength(expected, 5);
  expected[0] := ' 2*2 ';
  expected[1] := '25*52';
  expected[2] := '*****';
  expected[3] := '25*52';
  expected[4] := ' 2*2 ';

  Assert.AreEqual(FormatInput(expected), TMineSweeper.Annotate(FormatInput(input)));
end;

procedure MineSweeperTest.Horizontal_line;
var input,
    expected: array of string;
begin
  SetLength(input, 1);
  input[0] := ' * * ';

  SetLength(expected, 1);
  expected[0] := '1*2*1';

  Assert.AreEqual(FormatInput(expected), TMineSweeper.Annotate(FormatInput(input)));
end;

procedure MineSweeperTest.Horizontal_line_mines_at_edges;
var input,
    expected: array of string;
begin
  SetLength(input, 1);
  input[0] := '*   *';

  SetLength(expected, 1);
  expected[0] := '*1 1*';

  Assert.AreEqual(FormatInput(expected), TMineSweeper.Annotate(FormatInput(input)));
end;

procedure MineSweeperTest.Large_board;
var input,
    expected: array of string;
begin
  SetLength(input, 6);
  input[0] := ' *  * ';
  input[1] := '  *   ';
  input[2] := '    * ';
  input[3] := '   * *';
  input[4] := ' *  * ';
  input[5] := '      ';

  SetLength(expected, 6);
  expected[0] := '1*22*1';
  expected[1] := '12*322';
  expected[2] := ' 123*2';
  expected[3] := '112*4*';
  expected[4] := '1*22*2';
  expected[5] := '111111';

  Assert.AreEqual(FormatInput(expected), TMineSweeper.Annotate(FormatInput(input)));
end;

procedure MineSweeperTest.Mine_surrounded_by_spaces;
var input,
    expected: array of string;
begin
  SetLength(input, 3);
  input[0] := '   ';
  input[1] := ' * ';
  input[2] := '   ';

  SetLength(expected, 3);
  expected[0] := '111';
  expected[1] := '1*1';
  expected[2] := '111';

  Assert.AreEqual(FormatInput(expected), TMineSweeper.Annotate(FormatInput(input)));
end;

procedure MineSweeperTest.No_columns;
var input: array of string;
begin
  SetLength(input, 1);
  input[0] := '';
  Assert.AreEqual('', TMineSweeper.Annotate(FormatInput(input)));
end;

procedure MineSweeperTest.No_mines;
var input,
    expected: array of string;
begin
  SetLength(input, 3);
  input[0] := '   ';
  input[1] := '   ';
  input[2] := '   ';

  SetLength(expected, 3);
  expected[0] := '   ';
  expected[1] := '   ';
  expected[2] := '   ';

  Assert.AreEqual(FormatInput(expected), TMineSweeper.Annotate(FormatInput(input)));
end;

procedure MineSweeperTest.No_rows;
begin
  Assert.AreEqual('', TMineSweeper.Annotate(''));
end;

procedure MineSweeperTest.Space_surrounded_by_mines;
var input,
    expected: array of string;
begin
  SetLength(input, 3);
  input[0] := '***';
  input[1] := '* *';
  input[2] := '***';

  SetLength(expected, 3);
  expected[0] := '***';
  expected[1] := '*8*';
  expected[2] := '***';

  Assert.AreEqual(FormatInput(expected), TMineSweeper.Annotate(FormatInput(input)));
end;

procedure MineSweeperTest.Vertical_line;
var input,
    expected: array of string;
begin
  SetLength(input, 5);
  input[0] := ' ';
  input[1] := '*';
  input[2] := ' ';
  input[3] := '*';
  input[4] := ' ';

  SetLength(expected, 5);
  expected[0] := '1';
  expected[1] := '*';
  expected[2] := '2';
  expected[3] := '*';
  expected[4] := '1';

  Assert.AreEqual(FormatInput(expected), TMineSweeper.Annotate(FormatInput(input)));
end;

procedure MineSweeperTest.Vertical_line_mines_at_edges;
var input,
    expected: array of string;
begin
  SetLength(input, 5);
  input[0] := '*';
  input[1] := ' ';
  input[2] := ' ';
  input[3] := ' ';
  input[4] := '*';

  SetLength(expected, 5);
  expected[0] := '*';
  expected[1] := '1';
  expected[2] := ' ';
  expected[3] := '1';
  expected[4] := '*';

  Assert.AreEqual(FormatInput(expected), TMineSweeper.Annotate(FormatInput(input)));
end;

class function MineSweeperTest.FormatInput(aInput: array of string): string;
begin
  result := '';
  result := result.Join('\n',aInput);
end;

Initialization
  TDUnitX.RegisterTestFixture(MineSweeperTest);
end.
