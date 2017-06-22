unit uBankAccountTests;

interface
uses
  DUnitX.TestFramework;

type

  [TestFixture]
  BankAccountTests = class(TObject)
  public
    [Test]
//  [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure Returns_empty_balance_after_opening;

    [Test]
    [Ignore]
    procedure Check_basic_balance;

    [Test]
    [Ignore]
    procedure Balance_can_increment_and_decrement;

    [Test]
    [Ignore]
    procedure Closed_account_throws_exception_when_checking_balance;

    [Test]
    [Ignore]
    procedure Change_account_balance_from_multiple_threads;
  end;

implementation
uses System.Classes, System.SyncObjs, uBankAccount;

const HalfCentTolerance = 0.005;

procedure BankAccountTests.Returns_empty_balance_after_opening;
var account: IBankAccount;
    Expected: double;
begin
  Expected := 0.00;
  account := TBankAccount.Create;
  account.Open;
  assert.AreEqual(Expected,account.Balance,HalfCentTolerance);
end;

procedure BankAccountTests.Check_basic_balance;
var account: IBankAccount;
    openingBalance: Double;
    updatedBalance: Double;
    Expected: double;
begin
  account := TBankAccount.Create;
  account.Open;

  openingBalance := account.Balance;
  account.UpdateBalance(10);

  updatedBalance := account.Balance;

  Expected := 0.00;
  assert.AreEqual(Expected, openingBalance, HalfCentTolerance);
  Expected := 10.00;
  assert.AreEqual(Expected, updatedBalance, HalfCentTolerance);
end;

procedure BankAccountTests.Balance_can_increment_and_decrement;
var account: IBankAccount;
    openingBalance: Double;
    addedBalance: Double;
    subtractedBalance: Double;
    Expected: double;
begin
  account := TBankAccount.Create;
  account.Open;

  openingBalance := account.Balance;

  account.UpdateBalance(10);
  addedBalance := account.Balance;

  account.UpdateBalance(-15);
  subtractedBalance := account.Balance;

  Expected := 0.00;
  assert.AreEqual(Expected, openingBalance, HalfCentTolerance);

  Expected := 10.00;
  assert.AreEqual(Expected, addedBalance, HalfCentTolerance);

  Expected := -5.00;
  assert.AreEqual(Expected, subtractedBalance, HalfCentTolerance);
end;

procedure BankAccountTests.Closed_account_throws_exception_when_checking_balance;
var MyProc: TTestLocalMethod;
begin
  MyProc := procedure
            var account: IBankAccount;
            begin
              account := TBankAccount.Create;
              account.Open;
              account.Close;
              account.Balance;
            end;

  assert.WillRaise(MyProc, EAccountNotOpen);
end;

procedure BankAccountTests.Change_account_balance_from_multiple_threads;
const threads = 500;
      iterations = 100;

var account: IBankAccount;
    activeThreadCount: integer;
    allthreadsDone: TEvent;
    i: integer;
    Expected: double;
begin
  activeThreadCount := threads;
  account := TBankAccount.Create;
  account.Open;

  allThreadsDone := TEvent.Create(nil, True, False,'AllThreadsDone');
  allThreadsDone.ResetEvent;
  for i := 1 to threads do
  begin
    TThread.CreateAnonymousThread(
      procedure
      var j: integer;
      begin
        for j := 1 to iterations do
        begin
          account.UpdateBalance(1);
          account.UpdateBalance(-1);
        end;

        dec(activeThreadCount);
        if activeThreadCount <= 0 then
          allthreadsDone.SetEvent;
      end)
      .Start;
  end;

  assert.AreEqual(wrSignaled,allthreadsDone.WaitFor(60000));
  Expected := 0.00;
  assert.AreEqual(Expected, account.Balance, HalfCentTolerance);
end;

initialization
  TDUnitX.RegisterTestFixture(BankAccountTests);
end.
