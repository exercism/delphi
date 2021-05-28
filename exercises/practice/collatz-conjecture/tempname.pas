unit uCollatzconjectureTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.2.0.1';

type
  [TestFixture]
  CollatzconjectureTest = class(TObject)
  public
    [Testcase('Zero steps for one', '1, 0')]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure Zero_steps_for_one(const aNumber: integer; const aExpected: integer);

    [Testcase('Divide if even','16, 4')]
    [Ignore]
    procedure Divide_if_even(const aNumber: integer; const aExpected: integer);

    [Testcase('Even and odd steps','12, 9')]
    [Ignore]
    procedure Even_and_odd_steps(const aNumber: integer; const aExpected: integer);

    [Testcase('Large number of even and odd steps', '1000000, 152')]
    [Ignore]
    procedure Large_number_of_even_and_odd_steps(const aNumber: integer; const aExpected: integer);

    [Testcase('Zero is an error', '0,error: Only positive numbers are allowed')]
    [Ignore]
    procedure Zero_is_an_error(const aNumber: integer; const aExpected: string);

    [Testcase('Negative value is an error', '-15,error: Only positive numbers are allowed')]
    [Ignore]
    procedure Negative_value_is_an_error(const aNumber: integer; const aExpected: string);
  end;

implementation
uses uCollatzconjecture;

procedure CollatzconjectureTest.Zero_steps_for_one(const aNumber: integer; const aExpected: integer);
begin
  Assert.AreEqual(aExpected, collatzSteps(aNumber));
end;

procedure CollatzconjectureTest.Divide_if_even(const aNumber: integer; const aExpected: integer);
begin
  Assert.AreEqual(aExpected, collatzSteps(aNumber));
end;

procedure CollatzconjectureTest.Even_and_odd_steps(const aNumber: integer; const aExpected: integer);
begin
  Assert.AreEqual(aExpected, collatzSteps(aNumber));
end;

procedure CollatzconjectureTest.Large_number_of_even_and_odd_steps(const aNumber: integer; const aExpected: integer);
begin
  Assert.AreEqual(aExpected, collatzSteps(aNumber));
end;

procedure CollatzconjectureTest.Zero_is_an_error(const aNumber: integer; const aExpected: string);
var MyProc: TTestLocalMethod;
begin
  MyProc := procedure
            begin
              collatzSteps(aNumber);
            end;

  Assert.WillRaiseWithMessage(MyProc, EIllegalNumber, aExpected);
end;

procedure CollatzconjectureTest.Negative_value_is_an_error(const aNumber: integer; const aExpected: string);
var MyProc: TTestLocalMethod;
begin
  MyProc := procedure
            begin
              collatzSteps(aNumber);
            end;

  Assert.WillRaiseWithMessage(MyProc, EIllegalNumber, aExpected);
end;

initialization
  TDUnitX.RegisterTestFixture(CollatzconjectureTest);
end.
