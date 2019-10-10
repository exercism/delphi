unit uDiamondTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.1.0.1';

type
  [TestFixture]
  TDiamondTest = class(TObject)
  private
    Expected : TArray<string>;
    procedure CompareArrays(Array1, Array2: TArray<string>);
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure Degenerate_case_with_a_single_A_row;

    [Test]
    [Ignore]
    procedure Degenerate_case_with_no_row_containing_3_distinct_groups_of_spaces;

    [Test]
    [Ignore]
    procedure Smallest_non_degenerate_case_with_odd_diamond_side_length;

    [Test]
    [Ignore]
    procedure Smallest_non_degenerate_case_with_even_diamond_side_length;

    [Test]
    [Ignore]
    procedure Largest_possible_diamond;
  end;

implementation

uses
  System.SysUtils, uDiamond;

{ TDiamondTest }

procedure TDiamondTest.CompareArrays(Array1, Array2: TArray<string>);
var
  i: integer;
begin
  Assert.AreEqual(Length(Array1), Length(Array2), ' - Array lengths must be equal');
  for i := Low(Array1) to High(Array1) do
    Assert.AreEqual(Array1[i], Array2[i], format('Expecting element %d to = %s, Actual = %s',
      [i, Array1[i], Array2[i]]));
end;

procedure TDiamondTest.Degenerate_case_with_a_single_A_row;
begin
  Expected := ['A'];
  CompareArrays(Expected, TDiamond.Rows('A'));
end;

procedure TDiamondTest.Degenerate_case_with_no_row_containing_3_distinct_groups_of_spaces;
begin
  Expected := [' A ',
               'B B',
               ' A '];
  CompareArrays(Expected, TDiamond.Rows('B'));
end;

procedure TDiamondTest.Largest_possible_diamond;
begin
  Expected := ['                         A                         ',
               '                        B B                        ',
               '                       C   C                       ',
               '                      D     D                      ',
               '                     E       E                     ',
               '                    F         F                    ',
               '                   G           G                   ',
               '                  H             H                  ',
               '                 I               I                 ',
               '                J                 J                ',
               '               K                   K               ',
               '              L                     L              ',
               '             M                       M             ',
               '            N                         N            ',
               '           O                           O           ',
               '          P                             P          ',
               '         Q                               Q         ',
               '        R                                 R        ',
               '       S                                   S       ',
               '      T                                     T      ',
               '     U                                       U     ',
               '    V                                         V    ',
               '   W                                           W   ',
               '  X                                             X  ',
               ' Y                                               Y ',
               'Z                                                 Z',
               ' Y                                               Y ',
               '  X                                             X  ',
               '   W                                           W   ',
               '    V                                         V    ',
               '     U                                       U     ',
               '      T                                     T      ',
               '       S                                   S       ',
               '        R                                 R        ',
               '         Q                               Q         ',
               '          P                             P          ',
               '           O                           O           ',
               '            N                         N            ',
               '             M                       M             ',
               '              L                     L              ',
               '               K                   K               ',
               '                J                 J                ',
               '                 I               I                 ',
               '                  H             H                  ',
               '                   G           G                   ',
               '                    F         F                    ',
               '                     E       E                     ',
               '                      D     D                      ',
               '                       C   C                       ',
               '                        B B                        ',
               '                         A                         '];
  CompareArrays(Expected, TDiamond.Rows('Z'));
end;

procedure TDiamondTest.Smallest_non_degenerate_case_with_even_diamond_side_length;
begin
  Expected := ['   A   ',
               '  B B  ',
               ' C   C ',
               'D     D',
               ' C   C ',
               '  B B  ',
               '   A   '];
  CompareArrays(Expected, TDiamond.Rows('D'));
end;

procedure TDiamondTest.Smallest_non_degenerate_case_with_odd_diamond_side_length;
begin
  Expected := ['  A  ',
               ' B B ',
               'C   C',
               ' B B ',
               '  A  '];
  CompareArrays(Expected, TDiamond.Rows('C'));
end;

initialization
  TDUnitX.RegisterTestFixture(TDiamondTest);
end.
