unit uGigasecondTest;

interface
uses
  DUnitX.TestFramework, uGigasecond;

const
  CanonicalVersion = '1.1.0';

type

  [TestFixture]
  TGigaSecondTest = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure date_only_specification_of_time;

    [Test]
//    [Ignore]
    procedure second_test_for_date_only_specification_of_time;

    [Test]
//    [Ignore]
    procedure third_test_for_date_only_specification_of_time;

    [Test]
//    [Ignore]
    procedure full_time_specified;

    [Test]
//    [Ignore]
    procedure full_time_with_day_roll_over;

  end;

implementation

procedure TGigaSecondTest.date_only_specification_of_time;
begin
  Assert.AreEqual('2043-01-01T01:46:40' ,TGigaSecond.Add('2011-04-25'));
end;

procedure TGigaSecondTest.full_time_specified;
begin
  Assert.AreEqual('2046-10-02T23:46:40' ,TGigaSecond.Add('2015-01-24T22:00:00'));
end;

procedure TGigaSecondTest.full_time_with_day_roll_over;
begin
  Assert.AreEqual('2046-10-03T01:46:39' ,TGigaSecond.Add('2015-01-24T23:59:59'));
end;

procedure TGigaSecondTest.second_test_for_date_only_specification_of_time;
begin
  Assert.AreEqual('2009-02-19T01:46:40' ,TGigaSecond.Add('1977-06-13'));
end;

procedure TGigaSecondTest.third_test_for_date_only_specification_of_time;
begin
  Assert.AreEqual('1991-03-27T01:46:40' ,TGigaSecond.Add('1959-07-19'));
end;

initialization
  TDUnitX.RegisterTestFixture(TGigaSecondTest);
end.
