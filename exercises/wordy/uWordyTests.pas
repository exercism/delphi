unit uWordyTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.5.0';

type

  [TestFixture]
  WordyTests = class(TObject)
  public
//   [Ignore('Comment the "[Ignore]" statement to run the test')]
   [TestCase('a number', 'What is 5?,5')]
   procedure just_a_number(const aInput: string; const aExpected: integer);

   [Ignore]
   [TestCase('addition', 'What is 1 plus 1?,2')]
   procedure Addition(const aInput: string; const aExpected: integer);

   [Ignore]
   [TestCase('more addition', 'What is 53 plus 2?,55')]
   procedure More_Addition(const aInput: string; const aExpected: integer);

   [Ignore]
   [TestCase('addition with negative numbers', 'What is -1 plus -10?,-11')]
   procedure Addition_with_negative_numbers(const aInput: string; const aExpected: integer);

   [Ignore]
   [TestCase('large addition', 'What is 123 plus 45678?,45801')]
   procedure Large_addition(const aInput: string; const aExpected: integer);

   [Ignore]
   [TestCase('subtraction', 'What is 4 minus -12?,16')]
   procedure Subtraction(const aInput: string; aExpected: integer);

   [Ignore]
   [TestCase('multiplication', 'What is -3 multiplied by 25?,-75')]
   procedure Multiplication(const aInput: string; aExpected: integer);

   [Ignore]
   [TestCase('division', 'What is 33 divided by -3?,-11')]
   procedure Division(const aInput: string; aExpected: integer);

   [Ignore]
   [TestCase('multiple additions', 'What is 1 plus 1 plus 1?,3')]
   procedure Multiple_additions(const aInput: string; aExpected: integer);

   [Ignore]
   [TestCase('addition and subtraction', 'What is 1 plus 5 minus -2?,8')]
   procedure Addition_and_subtraction(const aInput: string; const aExpected: integer);

   [Ignore]
   [TestCase('multiple subtraction', 'What is 20 minus 4 minus 13?,3')]
   procedure Multiple_subtraction(const aInput: string; const aExpected: integer);

   [Ignore]
   [TestCase('subtraction then addition', 'What is 17 minus 6 plus 3?,14')]
   procedure Subtraction_then_addition(const aInput: string; const aExpected: integer);

   [Ignore]
   [TestCase('multiple multiplication', 'What is 2 multiplied by -2 multiplied by 3?,-12')]
   procedure Multiple_multiplication(const aInput: string; aExpected: integer);

   [Ignore]
   [TestCase('addition and multiplication', 'What is -3 plus 7 multiplied by -2?,-8')]
   procedure Addition_and_multiplication(const aInput: string; aExpected: integer);

   [Ignore]
   [TestCase('multiple division', 'What is -12 divided by 2 divided by -3?,2')]
   procedure Multiple_division(const aInput: string; aExpected: integer);

   [Ignore]
   [TestCase('unknown operation', 'What is 52 cubed?,unknown operation')]
   procedure Unknown_operation(const aInput: string; aExpected: string);

   [Ignore]
   [TestCase('Non math question', 'Who is the President of the United States?,unknown operation')]
   procedure Non_math_question(const aInput: string; aExpected: string);

   [Ignore]
   [TestCase('reject problem missing an operand', 'What is 1 plus?,syntax error')]
   procedure problem_missing_an_operand(const aInput: string; aExpected: string);

   [Ignore]
   [TestCase('reject problem with no operands or operators', 'What is?,syntax error')]
   procedure problem_with_no_operands_or_operators(const aInput: string; aExpected: string);

   [Ignore]
   [TestCase('reject two operations in a row', 'What is 1 plus plus 2?,syntax error')]
   procedure reject_two_operations_in_a_row(const aInput: string; aExpected: string);

   [Ignore]
   [TestCase('reject two numbers in a row', 'What is 1 plus 2 1?,syntax error')]
   procedure reject_two_numbers_in_a_row(const aInput: string; aExpected: string);

   [Ignore]
   [TestCase('reject postfix notation', 'What is 1 2 plus?,syntax error')]
   procedure reject_postfix_notation(const aInput: string; aExpected: string);

   [Ignore]
   [TestCase('reject prefix notation', 'What is plus 1 2?,syntax error')]
   procedure reject_prefix_notation(const aInput: string; aExpected: string);
  end;

implementation
uses uWordy;

procedure WordyTests.Addition(const aInput: string; const aExpected: integer);
begin
  Assert.AreEqual(aExpected, TWordy.Answer(aInput));
end;

procedure WordyTests.Addition_and_multiplication(const aInput: string;
  aExpected: integer);
begin
  Assert.AreEqual(aExpected, TWordy.Answer(aInput));
end;

procedure WordyTests.Addition_and_subtraction(const aInput: string;
  const aExpected: integer);
begin
  Assert.AreEqual(aExpected, TWordy.Answer(aInput));
end;

procedure WordyTests.Addition_with_negative_numbers(const aInput: string;
  const aExpected: integer);
begin
  Assert.AreEqual(aExpected, TWordy.Answer(aInput));
end;

procedure WordyTests.Division(const aInput: string; aExpected: integer);
begin
  Assert.AreEqual(aExpected, TWordy.Answer(aInput));
end;

procedure WordyTests.problem_missing_an_operand(const aInput: string;
  aExpected: string);
var MyProc: TTestLocalMethod;
begin
  MyProc := procedure
            begin
              TWordy.Answer(aInput);
            end;

  Assert.WillRaiseWithMessage(MyProc, EInvalidProblem, aExpected);
end;

procedure WordyTests.just_a_number(const aInput: string;
  const aExpected: integer);
begin
  Assert.AreEqual(aExpected, TWordy.Answer(aInput));
end;

procedure WordyTests.Large_addition(const aInput: string;
  const aExpected: integer);
begin
  Assert.AreEqual(aExpected, TWordy.Answer(aInput));
end;

procedure WordyTests.More_Addition(const aInput: string;
  const aExpected: integer);
begin
  Assert.AreEqual(aExpected, TWordy.Answer(aInput));
end;

procedure WordyTests.Multiple_additions(const aInput: string;
  aExpected: integer);
begin
  Assert.AreEqual(aExpected, TWordy.Answer(aInput));
end;

procedure WordyTests.Multiple_division(const aInput: string;
  aExpected: integer);
begin
  Assert.AreEqual(aExpected, TWordy.Answer(aInput));
end;

procedure WordyTests.Multiple_multiplication(const aInput: string;
  aExpected: integer);
begin
  Assert.AreEqual(aExpected, TWordy.Answer(aInput));
end;

procedure WordyTests.Multiple_subtraction(const aInput: string;
  const aExpected: integer);
begin
  Assert.AreEqual(aExpected, TWordy.Answer(aInput));
end;

procedure WordyTests.Multiplication(const aInput: string; aExpected: integer);
begin
  Assert.AreEqual(aExpected, TWordy.Answer(aInput));
end;

procedure WordyTests.Subtraction(const aInput: string; aExpected: integer);
begin
  Assert.AreEqual(aExpected, TWordy.Answer(aInput));
end;

procedure WordyTests.Subtraction_then_addition(const aInput: string;
  const aExpected: integer);
begin
  Assert.AreEqual(aExpected, TWordy.Answer(aInput));
end;

procedure WordyTests.Unknown_operation(const aInput: string; aExpected: string);
var MyProc: TTestLocalMethod;
begin
  MyProc := procedure
            begin
              TWordy.Answer(aInput);
            end;

  Assert.WillRaiseWithMessage(MyProc, EInvalidProblem, aExpected);
end;

procedure WordyTests.problem_with_no_operands_or_operators(const aInput: string; aExpected: string);
var MyProc: TTestLocalMethod;
begin
  MyProc := procedure
            begin
              TWordy.Answer(aInput);
            end;

  Assert.WillRaiseWithMessage(MyProc, EInvalidProblem, aExpected);
end;

procedure WordyTests.Non_math_question(const aInput: string; aExpected: string);
var MyProc: TTestLocalMethod;
begin
  MyProc := procedure
            begin
              TWordy.Answer(aInput);
            end;

  Assert.WillRaiseWithMessage(MyProc, EInvalidProblem, aExpected);
end;

procedure WordyTests.reject_postfix_notation(const aInput: string;
  aExpected: string);
var MyProc: TTestLocalMethod;
begin
  MyProc := procedure
            begin
              TWordy.Answer(aInput);
            end;

  Assert.WillRaiseWithMessage(MyProc, EInvalidProblem, aExpected);
end;

procedure WordyTests.reject_prefix_notation(const aInput: string;
  aExpected: string);
var MyProc: TTestLocalMethod;
begin
  MyProc := procedure
            begin
              TWordy.Answer(aInput);
            end;

  Assert.WillRaiseWithMessage(MyProc, EInvalidProblem, aExpected);
end;

procedure WordyTests.reject_two_numbers_in_a_row(const aInput: string;
  aExpected: string);
var MyProc: TTestLocalMethod;
begin
  MyProc := procedure
            begin
              TWordy.Answer(aInput);
            end;

  Assert.WillRaiseWithMessage(MyProc, EInvalidProblem, aExpected);
end;

procedure WordyTests.reject_two_operations_in_a_row(const aInput: string;
  aExpected: string);
var MyProc: TTestLocalMethod;
begin
  MyProc := procedure
            begin
              TWordy.Answer(aInput);
            end;

  Assert.WillRaiseWithMessage(MyProc, EInvalidProblem, aExpected);
end;

initialization
  TDUnitX.RegisterTestFixture(WordyTests);
end.
