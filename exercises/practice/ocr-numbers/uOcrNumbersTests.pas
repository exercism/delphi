unit uOcrNumbersTests;

interface
uses
  DUnitX.TestFramework, uOcrNumbers;

const
  CanonicalVersion = '1.2.0.1';

type
  [TestFixture('Binary digit test')]
  TBinaryDigitTest = class(TObject)
  public
    [Test]
//  [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure Recognizes_0;

    [Test]
    [Ignore]
    procedure Recognizes_1;

    [Test]
    [Ignore]
    procedure Unreadable_but_correctly_sized_inputs_return_question_mark;

    [Test]
    [Ignore]
    procedure Input_with_a_number_of_lines_that_is_not_a_multiple_of_four_raises_an_error;

    [Test]
    [Ignore]
    procedure Input_with_a_number_of_columns_that_is_not_a_multiple_of_three_raises_an_error;

    [Test]
    [Ignore]
    procedure Recognizes_110101100;

    [Test]
    [Ignore]
    procedure Garbled_numbers_in_a_string_are_replaced_with_question_mark;

    [Test]
    [Ignore]
    procedure Recognizes_2;

    [Test]
    [Ignore]
    procedure Recognizes_3;

    [Test]
    [Ignore]
    procedure Recognizes_4;

    [Test]
    [Ignore]
    procedure Recognizes_5;

    [Test]
    [Ignore]
    procedure Recognizes_6;

    [Test]
    [Ignore]
    procedure Recognizes_7;

    [Test]
    [Ignore]
    procedure Recognizes_8;

    [Test]
    [Ignore]
    procedure Recognizes_9;

    [Test]
    [Ignore]
    procedure Recognizes_string_of_decimal_numbers;

    [Test]
    [Ignore]
    procedure Numbers_separated_by_empty_lines_are_recognized_Lines_are_joined_by_commas;
  end;

implementation

uses System.SysUtils;

procedure TBinaryDigitTest.Garbled_numbers_in_a_string_are_replaced_with_question_mark;
var
  rows: TArray<string>;
begin
  rows := ['       _     _           _ ',
           '  |  || |  || |     || || |',
           '  |  | _|  ||_|  |  ||_||_|',
           '                           '];
  Assert.AreEqual('11?10?1?0', TOcrNumbers.convert(rows));
end;

procedure TBinaryDigitTest.Input_with_a_number_of_columns_that_is_not_a_multiple_of_three_raises_an_error;
var
  rows: TArray<string>;
  MyProc: TTestLocalMethod;
begin
  MyProc := procedure
            begin
              TOcrNumbers.convert(rows)
            end;

  rows := ['    ',
           '   |',
           '   |',
           '    '];
  Assert.WillRaiseWithMessage(MyProc, EArgumentException,
    'Number of input columns is not a multiple of three');
end;

procedure TBinaryDigitTest.Input_with_a_number_of_lines_that_is_not_a_multiple_of_four_raises_an_error;
var
  rows: TArray<string>;
  MyProc: TTestLocalMethod;
begin
  MyProc := procedure
            begin
              TOcrNumbers.convert(rows)
            end;

  rows := [' _ ',
           '| |',
           '   '];
  Assert.WillRaiseWithMessage(MyProc, EArgumentException,
    'Number of input lines is not a multiple of four');
end;

procedure TBinaryDigitTest.Recognizes_0;
var
  rows: TArray<string>;
begin
  rows := [' _ ',
           '| |',
           '|_|',
           '   '];
  Assert.AreEqual('0', TOcrNumbers.convert(rows));
end;

procedure TBinaryDigitTest.Recognizes_1;
var
  rows: TArray<string>;
begin
  rows := ['   ',
           '  |',
           '  |',
           '   '];
  Assert.AreEqual('1', TOcrNumbers.convert(rows));
end;

procedure TBinaryDigitTest.Unreadable_but_correctly_sized_inputs_return_question_mark;
var
  rows: TArray<string>;
begin
  rows := ['   ',
           '  _',
           '  |',
           '   '];
  Assert.AreEqual('?', TOcrNumbers.convert(rows));
end;

procedure TBinaryDigitTest.Recognizes_110101100;
var
  rows: TArray<string>;
begin
  rows := ['       _     _        _  _ ',
           '  |  || |  || |  |  || || |',
           '  |  ||_|  ||_|  |  ||_||_|',
           '                           '];
  Assert.AreEqual('110101100', TOcrNumbers.convert(rows));
end;

procedure TBinaryDigitTest.Recognizes_2;
var
  rows: TArray<string>;
begin
  rows := [' _ ',
           ' _|',
           '|_ ',
           '   '];
  Assert.AreEqual('2', TOcrNumbers.convert(rows));
end;

procedure TBinaryDigitTest.Recognizes_3;
var
  rows: TArray<string>;
begin
  rows := [' _ ',
           ' _|',
           ' _|',
           '   '];
  Assert.AreEqual('3', TOcrNumbers.convert(rows));
end;

procedure TBinaryDigitTest.Recognizes_4;
var
  rows: TArray<string>;
begin
  rows := ['   ',
           '|_|',
           '  |',
           '   '];
  Assert.AreEqual('4', TOcrNumbers.convert(rows));
end;

procedure TBinaryDigitTest.Recognizes_5;
var
  rows: TArray<string>;
begin
  rows := [' _ ',
           '|_ ',
           ' _|',
           '   '];
  Assert.AreEqual('5', TOcrNumbers.convert(rows));
end;

procedure TBinaryDigitTest.Recognizes_6;
var
  rows: TArray<string>;
begin
  rows := [' _ ',
           '|_ ',
           '|_|',
           '   '];
  Assert.AreEqual('6', TOcrNumbers.convert(rows));
end;

procedure TBinaryDigitTest.Recognizes_7;
var
  rows: TArray<string>;
begin
  rows := [' _ ',
           '  |',
           '  |',
           '   '];
  Assert.AreEqual('7', TOcrNumbers.convert(rows));
end;

procedure TBinaryDigitTest.Recognizes_8;
var
  rows: TArray<string>;
begin
  rows := [' _ ',
           '|_|',
           '|_|',
           '   '];
  Assert.AreEqual('8', TOcrNumbers.convert(rows));
end;

procedure TBinaryDigitTest.Recognizes_9;
var
  rows: TArray<string>;
begin
  rows := [' _ ',
           '|_|',
           ' _|',
           '   '];
  Assert.AreEqual('9', TOcrNumbers.convert(rows));
end;



procedure TBinaryDigitTest.Recognizes_string_of_decimal_numbers;
var
  rows: TArray<string>;
begin
  rows := ['    _  _     _  _  _  _  _  _ ',
           '  | _| _||_||_ |_   ||_||_|| |',
           '  ||_  _|  | _||_|  ||_| _||_|',
           '                              '];
  Assert.AreEqual('1234567890', TOcrNumbers.convert(rows));
end;

procedure TBinaryDigitTest.Numbers_separated_by_empty_lines_are_recognized_Lines_are_joined_by_commas;
var
  rows: TArray<string>;
begin
  rows := ['    _  _ ',
           '  | _| _|',
           '  ||_  _|',
           '         ',
           '    _  _ ',
           '|_||_ |_ ',
           '  | _||_|',
           '         ',
           ' _  _  _ ',
           '  ||_||_|',
           '  ||_| _|',
           '         '];
  Assert.AreEqual('123,456,789', TOcrNumbers.convert(rows));
end;

initialization
  TDUnitX.RegisterTestFixture(TBinaryDigitTest);
end.

