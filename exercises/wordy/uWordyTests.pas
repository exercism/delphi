unit uWordyTests;

interface
uses
  DUnitX.TestFramework;
  
const
  CanonicalVersion = '1.1.0';

type

  [TestFixture]
  WordyTests = class(TObject)
  public
//   [Ignore('Comment the "[Ignore]" statement to run the test')]
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
   [TestCase('unknown operation', 'What is 52 cubed?,Invalid Problem')]
   procedure Unknown_operation(const aInput: string; aExpected: string);

   [Ignore]
   [TestCase('Non math question', 'Who is the President of the United States?,Invalid Problem')]
   procedure Non_math_question(const aInput: string; aExpected: string);
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

procedure WordyTests.Non_math_question(const aInput: string; aExpected: string);
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
