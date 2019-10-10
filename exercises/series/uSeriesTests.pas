unit uSeriesTests;

interface
uses
  DUnitX.TestFramework, uSeries;

const
  CanonicalVersion = '1.0.0.1';

type
  [TestFixture]
  TSeriesTest = class(TObject)
  private
    procedure CompareArrays(Array1, Array2: TArray<string>);
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure slices_of_one_from_one;

    [Test]
    [Ignore]
    procedure slices_of_one_from_two;

    [Test]
    [Ignore]
    procedure slices_of_two;

    [Test]
    [Ignore]
    procedure slices_of_two_overlap;

    [Test]
    [Ignore]
    procedure slices_can_include_duplicates;

    [Test]
    [Ignore]
    procedure slices_of_a_long_series;

    [Test]
    [Ignore]
    procedure slice_length_is_too_large;

    [Test]
    [Ignore]
    procedure slice_length_cannot_be_zero;

    [Test]
    [Ignore]
    procedure slice_length_cannot_be_negative;

    [Test]
    [Ignore]
    procedure empty_series_is_invalid;
  end;

implementation

uses System.SysUtils;

procedure TSeriesTest.CompareArrays(Array1, Array2: TArray<string>);
var
  i: integer;
begin
  Assert.AreEqual(Length(Array1), Length(Array2), ' - Array lengths must be equal');
  for i := Low(Array1) to High(Array1) do
    Assert.AreEqual(Array1[i], Array2[i], format('Expecting element %d to = %s, Actual = %s',
      [i, Array1[i], Array2[i]]));
end;

procedure TSeriesTest.empty_series_is_invalid;
var
  Actual : TSlice;
begin
  Actual := TSlice.Create('');
  Assert.WillRaiseWithMessage(procedure()
    begin
      try
        Actual.slices(1);
      finally
        Actual.DisposeOf;
      end;
    end, EArgumentException, 'series cannot be empty');

end;

procedure TSeriesTest.slices_can_include_duplicates;
var
  Actual : TSlice;
begin
  Actual := TSlice.Create('777777');
  CompareArrays(['777', '777', '777', '777'], Actual.slices(3));
  Actual.DisposeOf;
end;

procedure TSeriesTest.slices_of_a_long_series;
var
  Actual : TSlice;
begin
  Actual := TSlice.Create('918493904243');
  CompareArrays(['91849', '18493', '84939' ,'49390' ,'93904' ,'39042' ,'90424' ,'04243'], Actual.slices(5));
  Actual.DisposeOf;
end;

procedure TSeriesTest.slices_of_one_from_one;
var
  Actual : TSlice;
begin
  Actual := TSlice.Create('1');
  CompareArrays(['1'], Actual.slices(1));
  Actual.DisposeOf;
end;

procedure TSeriesTest.slices_of_one_from_two;
var
  Actual : TSlice;
begin
  Actual := TSlice.Create('12');
  CompareArrays(['1', '2'], Actual.slices(1));
  Actual.DisposeOf;
end;

procedure TSeriesTest.slices_of_two;
var
  Actual : TSlice;
begin
  Actual := TSlice.Create('35');
  CompareArrays(['35'], Actual.slices(2));
  Actual.DisposeOf;
end;

procedure TSeriesTest.slices_of_two_overlap;
var
  Actual : TSlice;
begin
  Actual := TSlice.Create('9142');
  CompareArrays(['91', '14', '42'], Actual.slices(2));
  Actual.DisposeOf;
end;

procedure TSeriesTest.slice_length_cannot_be_negative;
var
  Actual : TSlice;
begin
  Actual := TSlice.Create('123');
  Assert.WillRaiseWithMessage(
    procedure
    begin
      try
        Actual.slices(-1);
      finally
        Actual.DisposeOf;
      end;
    end, EArgumentOutOfRangeException, 'slice length cannot be negative');

end;

procedure TSeriesTest.slice_length_cannot_be_zero;
var
  Actual : TSlice;
begin
  Actual := TSlice.Create('12345');
  Assert.WillRaiseWithMessage(
    procedure
    begin
      try
        Actual.slices(0);
      finally
        Actual.DisposeOf;
      end;
    end, EArgumentOutOfRangeException, 'slice length cannot be zero');
end;

procedure TSeriesTest.slice_length_is_too_large;
var
  Actual : TSlice;
begin
  Actual := TSlice.Create('12345');
  Assert.WillRaiseWithMessage(
    procedure
    begin
      try
        Actual.slices(6);
      finally
        Actual.DisposeOf;
      end;
    end, EArgumentOutOfRangeException, 'slice length cannot be greater than series length');
end;

initialization
  TDUnitX.RegisterTestFixture(TSeriesTest);
end.
