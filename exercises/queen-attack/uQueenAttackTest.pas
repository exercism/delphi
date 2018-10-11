unit uQueenAttackTest;

interface
uses
  DUnitX.TestFramework, uQueenAttack;

const
  CanonicalVersion = '2.2.0';

type
  [TestFixture('Creation of queens with valid and invalid positions')]
  TQueenCreationTests = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure queen_with_a_valid_position;

    [Test]
    [Ignore]
    procedure queen_must_have_positive_row;

    [Test]
    [Ignore]
    procedure queen_must_have_row_on_board;

    [Test]
    [Ignore]
    procedure queen_must_have_positive_column;

    [Test]
    [Ignore]
    procedure queen_must_have_column_on_board;
  end;

  [TestFixture('Ability of one queen to attack another')]
  TQueenAttackTests = class(TObject)
  private
    WhiteQueen, BlackQueen : TQueen;
    ReturnCode : integer;
  public
    [Test]
    [Ignore]
    procedure can_not_attack;

    [Test]
    [Ignore]
    procedure can_attack_on_same_row;

    [Test]
    [Ignore]
    procedure can_attack_on_same_column;

    [Test]
    [Ignore]
    procedure can_attack_on_first_diagonal;

    [Test]
    [Ignore]
    procedure can_attack_on_second_diagonal;

    [Test]
    [Ignore]
    procedure can_attack_on_third_diagonal;

    [Test]
    [Ignore]
    procedure can_attack_on_fourth_diagonal;
  end;

implementation

uses
  System.SysUtils;

{$REGION 'TQueenCreationTests'}

procedure TQueenCreationTests.queen_must_have_column_on_board;
var
  ReturnCode : integer;
begin
  Assert.WillRaise(procedure
    begin
      TQueen.Create(4, 8, ReturnCode)
    end, EArgumentException, 'column not on board');

end;

procedure TQueenCreationTests.queen_must_have_positive_column;
var
  ReturnCode : integer;
begin
  Assert.WillRaise(procedure
    begin
      TQueen.Create(2, -2, ReturnCode)
    end, EArgumentException, 'column not positive');
end;

procedure TQueenCreationTests.queen_must_have_positive_row;
var
  ReturnCode : integer;
begin
  Assert.WillRaise(procedure
    begin
      TQueen.Create(-2, 2, ReturnCode)
    end, EArgumentException, 'row not positive');
end;

procedure TQueenCreationTests.queen_must_have_row_on_board;
var
  ReturnCode : integer;
begin
  Assert.WillRaise(procedure
    begin
      TQueen.Create(8, 4, ReturnCode)
    end, EArgumentException, 'row not on board');
end;

procedure TQueenCreationTests.queen_with_a_valid_position;
var
  Queen : TQueen;
  ReturnCode : integer;
begin
  Queen := TQueen.Create(2, 2, ReturnCode);
  Assert.AreEqual(0, ReturnCode);
end;

{$ENDREGION}

{$REGION 'TQueenAttackTests'}

procedure TQueenAttackTests.can_attack_on_first_diagonal;
begin
  WhiteQueen := TQueen.Create(2, 2, ReturnCode);
  Assert.IsTrue(WhiteQueen.CanAttack(BlackQueen.Create(0, 4, ReturnCode)));
end;

procedure TQueenAttackTests.can_attack_on_fourth_diagonal;
begin
  WhiteQueen := TQueen.Create(2, 2, ReturnCode);
  Assert.IsTrue(WhiteQueen.CanAttack(BlackQueen.Create(5, 5, ReturnCode)));
end;

procedure TQueenAttackTests.can_attack_on_same_column;
begin
  WhiteQueen := TQueen.Create(4, 5, ReturnCode);
  Assert.IsTrue(WhiteQueen.CanAttack(BlackQueen.Create(2, 5, ReturnCode)));
end;

procedure TQueenAttackTests.can_attack_on_same_row;
begin
  WhiteQueen := TQueen.Create(2, 4, ReturnCode);
  Assert.IsTrue(WhiteQueen.CanAttack(BlackQueen.Create(2, 6, ReturnCode)));
end;

procedure TQueenAttackTests.can_attack_on_second_diagonal;
begin
  WhiteQueen := TQueen.Create(2, 2, ReturnCode);
  Assert.IsTrue(WhiteQueen.CanAttack(BlackQueen.Create(3, 1, ReturnCode)));
end;

procedure TQueenAttackTests.can_attack_on_third_diagonal;
begin
  WhiteQueen := TQueen.Create(2, 2, ReturnCode);
  Assert.IsTrue(WhiteQueen.CanAttack(BlackQueen.Create(1, 1, ReturnCode)));
end;

procedure TQueenAttackTests.can_not_attack;
begin
  WhiteQueen := TQueen.Create(2, 4, ReturnCode);
  Assert.IsFalse(WhiteQueen.CanAttack(BlackQueen.Create(6, 6, ReturnCode)));
end;

{$ENDREGION}

initialization
  TDUnitX.RegisterTestFixture(TQueenCreationTests);
  TDUnitX.RegisterTestFixture(TQueenAttackTests);
end.
