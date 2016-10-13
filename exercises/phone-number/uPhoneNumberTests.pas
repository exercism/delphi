unit uPhoneNumberTests;

interface
uses
  DUnitX.TestFramework;

type

  [TestFixture]
  PhoneNumberTests = class(TObject) 
  public
    [Test]
    [Ignore]
    procedure Cleans_parens_spaces_and_dashes;

    [Test]
    [Ignore]
    procedure Cleans_numbers_with_dots;

    [Test]
    [Ignore]
    procedure Allows_us_country_code;

    [Test]
    [Ignore]
    procedure Invalid_when_11_digits;

    [Test]
    [Ignore]
    procedure Invalid_when_9_digits;

    [Test]
    [Ignore]
    procedure Has_an_area_code;

    [Test]
    [Ignore]
    procedure Formats_a_number;
  end;

implementation
uses uPhoneNumber;

procedure PhoneNumberTests.Cleans_parens_spaces_and_dashes;
var phone: IPhoneNumber;
begin
  phone := TPhoneNumber.Create('(123) 456-7890');
  assert.AreEqual('1234567890',phone.Number);
end;

procedure PhoneNumberTests.Cleans_numbers_with_dots;
var phone: IPhoneNumber;
begin
  phone := TPhoneNumber.Create('123.456.7890');
  assert.AreEqual('1234567890',phone.Number);
end;

procedure PhoneNumberTests.Allows_us_country_code;
var phone: IPhoneNumber;
begin
  phone := TPhoneNumber.Create('11234567890');
  assert.AreEqual('1234567890', phone.Number);
end;

procedure PhoneNumberTests.Invalid_when_11_digits;
var phone: IPhoneNumber;
begin
  phone := TPhoneNumber.Create('21234567890');
  assert.AreEqual('0000000000', phone.Number);
end;

procedure PhoneNumberTests.Invalid_when_9_digits;
var phone: IPhoneNumber;
begin
  phone := TPhoneNumber.Create('123456789');
  assert.AreEqual('0000000000', phone.Number);
end;

procedure PhoneNumberTests.Has_an_area_code;
var phone: IPhoneNumber;
begin
  phone := TPhoneNumber.Create('1234567890');
  assert.AreEqual('123', phone.AreaCode);
end;

procedure PhoneNumberTests.Formats_a_number;
var phone: IPhoneNumber;
begin
  phone := TPhoneNumber.Create('1234567890');
  assert.AreEqual('(123) 456-7890', phone.ToString);
end;

initialization
  TDUnitX.RegisterTestFixture(PhoneNumberTests);
end.
