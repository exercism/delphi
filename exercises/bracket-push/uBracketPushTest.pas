unit uBracketPushTest;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.3.0';

type
  [TestFixture]
  BracketPushTest = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure paired_square_brackets;

    [Test]
    [Ignore]
    procedure empty_string;

    [Test]
    [Ignore]
    procedure unpaired_brackets;

    [Test]
    [Ignore]
    procedure wrong_ordered_brackets;

    [Test]
    [Ignore]
    procedure wrong_closing_bracket;

    [Test]
    [Ignore]
    procedure paired_with_whitespace;

    [Test]
    [Ignore]
    procedure partially_paired_brackets;

    [Test]
    [Ignore]
    procedure simple_nested_brackets;

    [Test]
    [Ignore]
    procedure several_paired_brackets;

    [Test]
    [Ignore]
    procedure paired_and_nested_brackets;

    [Test]
    [Ignore]
    procedure unopened_closing_brackets;

    [Test]
    [Ignore]
    procedure unpaired_and_nested_brackets;

    [Test]
    [Ignore]
    procedure paired_and_wrong_nested_brackets;

    [Test]
    [Ignore]
    procedure math_expression;

    [Test]
    [Ignore]
    procedure complex_latex_expression;
  end;

implementation
uses uBracketPush;


{ BracketPushTest }

procedure BracketPushTest.complex_latex_expression;
begin
  Assert.IsTrue(TBracketPush.IsPaired('\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)'));
end;

procedure BracketPushTest.empty_string;
begin
  Assert.IsTrue(TBracketPush.IsPaired(''));
end;

procedure BracketPushTest.math_expression;
begin
  Assert.IsTrue(TBracketPush.IsPaired('(((185 + 223.85) * 15) - 543)/2'));
end;

procedure BracketPushTest.paired_and_nested_brackets;
begin
  Assert.IsTrue(TBracketPush.IsPaired('([{}({}[])])'));
end;

procedure BracketPushTest.paired_and_wrong_nested_brackets;
begin
  Assert.IsFalse(TBracketPush.IsPaired('[({]})'));
end;

procedure BracketPushTest.paired_square_brackets;
begin
  Assert.IsTrue(TBracketPush.IsPaired('[]'));
end;

procedure BracketPushTest.paired_with_whitespace;
begin
  Assert.IsTrue(TBracketPush.IsPaired('{ }'));
end;

procedure BracketPushTest.partially_paired_brackets;
begin
  Assert.IsFalse(TBracketPush.IsPaired('{[])'));
end;

procedure BracketPushTest.several_paired_brackets;
begin
  Assert.IsTrue(TBracketPush.IsPaired('{}[]'));
end;

procedure BracketPushTest.simple_nested_brackets;
begin
  Assert.IsTrue(TBracketPush.IsPaired('{[]}'));
end;

procedure BracketPushTest.unopened_closing_brackets;
begin
  Assert.IsFalse(TBracketPush.IsPaired('{[)][]}'));
end;

procedure BracketPushTest.unpaired_and_nested_brackets;
begin
  Assert.IsFalse(TBracketPush.IsPaired('([{])'));
end;

procedure BracketPushTest.unpaired_brackets;
begin
  Assert.IsFalse(TBracketPush.IsPaired('[['));
end;

procedure BracketPushTest.wrong_closing_bracket;
begin
  Assert.IsFalse(TBracketPush.IsPaired('{]'));
end;

procedure BracketPushTest.wrong_ordered_brackets;
begin
  Assert.IsFalse(TBracketPush.IsPaired('}{'));
end;

initialization
  TDUnitX.RegisterTestFixture(BracketPushTest);
end.
