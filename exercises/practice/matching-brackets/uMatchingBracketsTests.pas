unit uMatchingBracketsTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '2.0.0.1';

type
  [TestFixture]
  TMatchingBracketTest = class(TObject)
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
    procedure paired_and_incomplete_brackets;

    [Test]
    [Ignore]
    procedure too_many_closing_brackets;

    [Test]
    [Ignore]
    procedure math_expression;

    [Test]
    [Ignore]
    procedure complex_latex_expression;
  end;

implementation
uses uMatchingBrackets;


{ TMatchingBracketTest }

procedure TMatchingBracketTest.complex_latex_expression;
begin
  Assert.IsTrue(TMatchingBrackets.IsPaired(
    '\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)'));
end;

procedure TMatchingBracketTest.empty_string;
begin
  Assert.IsTrue(TMatchingBrackets.IsPaired(''));
end;

procedure TMatchingBracketTest.math_expression;
begin
  Assert.IsTrue(TMatchingBrackets.IsPaired('(((185 + 223.85) * 15) - 543)/2'));
end;

procedure TMatchingBracketTest.paired_and_incomplete_brackets;
begin
  Assert.IsFalse(TMatchingBrackets.IsPaired('{}['));
end;

procedure TMatchingBracketTest.paired_and_nested_brackets;
begin
  Assert.IsTrue(TMatchingBrackets.IsPaired('([{}({}[])])'));
end;

procedure TMatchingBracketTest.paired_and_wrong_nested_brackets;
begin
  Assert.IsFalse(TMatchingBrackets.IsPaired('[({]})'));
end;

procedure TMatchingBracketTest.paired_square_brackets;
begin
  Assert.IsTrue(TMatchingBrackets.IsPaired('[]'));
end;

procedure TMatchingBracketTest.paired_with_whitespace;
begin
  Assert.IsTrue(TMatchingBrackets.IsPaired('{ }'));
end;

procedure TMatchingBracketTest.partially_paired_brackets;
begin
  Assert.IsFalse(TMatchingBrackets.IsPaired('{[])'));
end;

procedure TMatchingBracketTest.several_paired_brackets;
begin
  Assert.IsTrue(TMatchingBrackets.IsPaired('{}[]'));
end;

procedure TMatchingBracketTest.simple_nested_brackets;
begin
  Assert.IsTrue(TMatchingBrackets.IsPaired('{[]}'));
end;

procedure TMatchingBracketTest.too_many_closing_brackets;
begin
  Assert.IsFalse(TMatchingBrackets.IsPaired('[]]'));
end;

procedure TMatchingBracketTest.unopened_closing_brackets;
begin
  Assert.IsFalse(TMatchingBrackets.IsPaired('{[)][]}'));
end;

procedure TMatchingBracketTest.unpaired_and_nested_brackets;
begin
  Assert.IsFalse(TMatchingBrackets.IsPaired('([{])'));
end;

procedure TMatchingBracketTest.unpaired_brackets;
begin
  Assert.IsFalse(TMatchingBrackets.IsPaired('[['));
end;

procedure TMatchingBracketTest.wrong_closing_bracket;
begin
  Assert.IsFalse(TMatchingBrackets.IsPaired('{]'));
end;

procedure TMatchingBracketTest.wrong_ordered_brackets;
begin
  Assert.IsFalse(TMatchingBrackets.IsPaired('}{'));
end;

initialization
  TDUnitX.RegisterTestFixture(TMatchingBracketTest);
end.
