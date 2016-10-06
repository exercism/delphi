unit uBankAccount;

interface
uses System.SysUtils;

type
  EAccountNotOpen = class(Exception);

  IBankAccount = interface(IInvokable)
  ['{5DA23C52-A1D1-4FBE-8601-1CF194B2C372}']
    function GetBalance: Double;
    procedure UpdateBalance(aValue: Double);
    procedure Open;
    procedure Close;
    property Balance: Double read GetBalance;
  end;

  TBankAccount = class(TInterfacedObject, IBankAccount)
  private
    fLock: TMREWSync;
    fBalance: Double;
    fIsOpen: Boolean;
    function GetBalance: Double;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Open;
    procedure Close;
    procedure UpdateBalance(aValue: Double);
    property Balance: Double read GetBalance;
  end;

implementation


constructor TBankAccount.Create;
begin
  inherited create;
  fLock := TMREWSync.Create;
  fBalance := 0;
  fIsOpen := false;
end;

destructor TBankAccount.Destroy;
begin
  fLock.Free;
  inherited Destroy;
end;

procedure TBankAccount.Open;
begin
  fLock.BeginWrite;
  try
    fIsOpen := true;
  finally
    fLock.EndWrite;
  end;
end;

procedure TBankAccount.Close;
begin
  fLock.BeginWrite;
  try
    fIsOpen := false;
  finally
    fLock.EndWrite;
  end;
end;

function TBankAccount.GetBalance;
begin
  fLock.BeginRead;
  try
    if not fIsOpen then
      raise EAccountNotOpen.Create('Cannot get balance on an account that isn''t open');

    result := fBalance;
  finally
    fLock.EndRead;
  end;
end;

procedure TBankAccount.UpdateBalance(aValue: Double);
begin
  fLock.BeginWrite;
  try
    if not fIsOpen then
      raise EAccountNotOpen.Create('Cannot update balance on an account that isn''t open');

    fBalance := fBalance + aValue;
  finally
    fLock.EndWrite;
  end;
end;

end.
