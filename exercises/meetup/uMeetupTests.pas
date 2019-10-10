unit uMeetupTests;

interface
uses
  DUnitX.TestFramework, uMeetup;

const
  CanonicalVersion = '1.1.0.1';

type

  [TestFixture]
  TMeetupTest = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure monteenth_of_May_2013;

    [Test]
    [Ignore]
    procedure monteenth_of_August_2013;

    [Test]
    [Ignore]
    procedure monteenth_of_September_2013;

    [Test]
    [Ignore]
    procedure tuesteenth_of_March_2013;

    [Test]
    [Ignore]
    procedure tuesteenth_of_April_2013;

    [Test]
    [Ignore]
    procedure tuesteenth_of_August_2013;

    [Test]
    [Ignore]
    procedure wednesteenth_of_January_2013;

    [Test]
    [Ignore]
    procedure wednesteenth_of_February_2013;

    [Test]
    [Ignore]
    procedure wednesteenth_of_June_2013;

    [Test]
    [Ignore]
    procedure thursteenth_of_May_2013;

    [Test]
    [Ignore]
    procedure thursteenth_of_June_2013;

    [Test]
    [Ignore]
    procedure thursteenth_of_September_2013;

    [Test]
    [Ignore]
    procedure friteenth_of_April_2013;

    [Test]
    [Ignore]
    procedure friteenth_of_August_2013;

    [Test]
    [Ignore]
    procedure friteenth_of_September_2013;

    [Test]
    [Ignore]
    procedure saturteenth_of_February_2013;

    [Test]
    [Ignore]
    procedure saturteenth_of_April_2013;

    [Test]
    [Ignore]
    procedure saturteenth_of_October_2013;

   [Test]
    [Ignore]
    procedure sunteenth_of_May_2013;

    [Test]
    [Ignore]
    procedure sunteenth_of_June_2013;

    [Test]
    [Ignore]
    procedure sunteenth_of_October_2013;

    [Test]
    [Ignore]
    procedure first_Monday_of_March_2013;

    [Test]
    [Ignore]
    procedure first_Monday_of_April_2013;

    [Test]
    [Ignore]
    procedure first_Tuesday_of_May_2013;

    [Test]
    [Ignore]
    procedure first_Tuesday_of_June_2013;

    [Test]
    [Ignore]
    procedure first_Wednesday_of_July_2013;

    [Test]
    [Ignore]
    procedure first_Wednesday_of_August_2013;

    [Test]
    [Ignore]
    procedure first_Thursday_of_September_2013;

    [Test]
    [Ignore]
    procedure first_Thursday_of_October_2013;

    [Test]
    [Ignore]
    procedure first_Friday_of_November_2013;

    [Test]
    [Ignore]
    procedure first_Friday_of_December_2013;

    [Test]
    [Ignore]
    procedure first_Saturday_of_January_2013;

    [Test]
    [Ignore]
    procedure first_Saturday_of_February_2013;

    [Test]
    [Ignore]
    procedure first_Sunday_of_March_2013;

    [Test]
    [Ignore]
    procedure first_Sunday_of_April_2013;

    [Test]
    [Ignore]
    procedure second_Monday_of_March_2013;

    [Test]
    [Ignore]
    procedure second_Monday_of_April_2013;

    [Test]
    [Ignore]
    procedure second_Tuesday_of_May_2013;

    [Test]
    [Ignore]
    procedure second_Tuesday_of_June_2013;

    [Test]
    [Ignore]
    procedure second_Wednesday_of_July_2013;

    [Test]
    [Ignore]
    procedure second_Wednesday_of_August_2013;

   [Test]
    [Ignore]
    procedure second_Thursday_of_September_2013;

    [Test]
    [Ignore]
    procedure second_Thursday_of_October_2013;

    [Test]
    [Ignore]
    procedure second_Friday_of_November_2013;

    [Test]
    [Ignore]
    procedure second_Friday_of_December_2013;

    [Test]
    [Ignore]
    procedure second_Saturday_of_January_2013;

    [Test]
    [Ignore]
    procedure second_Saturday_of_February_2013;

    [Test]
    [Ignore]
    procedure second_Sunday_of_March_2013;

    [Test]
    [Ignore]
    procedure second_Sunday_of_April_2013;

    [Test]
    [Ignore]
    procedure third_Monday_of_March_2013;

    [Test]
    [Ignore]
    procedure third_Monday_of_April_2013;

    [Test]
    [Ignore]
    procedure third_Tuesday_of_May_2013;

    [Test]
    [Ignore]
    procedure third_Tuesday_of_June_2013;

    [Test]
    [Ignore]
    procedure third_Wednesday_of_July_2013;

    [Test]
    [Ignore]
    procedure third_Wednesday_of_August_2013;

    [Test]
    [Ignore]
    procedure third_Thursday_of_September_2013;

    [Test]
    [Ignore]
    procedure third_Thursday_of_October_2013;

    [Test]
    [Ignore]
    procedure third_Friday_of_November_2013;

    [Test]
    [Ignore]
    procedure third_Friday_of_December_2013;

    [Test]
    [Ignore]
    procedure third_Saturday_of_January_2013;

    [Test]
    [Ignore]
    procedure third_Saturday_of_February_2013;

    [Test]
    [Ignore]
    procedure third_Sunday_of_March_2013;

    [Test]
    [Ignore]
    procedure third_Sunday_of_April_2013;

    [Test]
    [Ignore]
    procedure fourth_Monday_of_March_2013;

    [Test]
    [Ignore]
    procedure fourth_Monday_of_April_2013;

    [Test]
    [Ignore]
    procedure fourth_Tuesday_of_May_2013;

    [Test]
    [Ignore]
    procedure fourth_Tuesday_of_June_2013;

    [Test]
    [Ignore]
    procedure fourth_Wednesday_of_July_2013;

    [Test]
    [Ignore]
    procedure fourth_Wednesday_of_August_2013;

    [Test]
    [Ignore]
    procedure fourth_Thursday_of_September_2013;

    [Test]
    [Ignore]
    procedure fourth_Thursday_of_October_2013;

    [Test]
    [Ignore]
    procedure fourth_Friday_of_November_2013;

    [Test]
    [Ignore]
    procedure fourth_Friday_of_December_2013;

    [Test]
    [Ignore]
    procedure fourth_Saturday_of_January_2013;

    [Test]
    [Ignore]
    procedure fourth_Saturday_of_February_2013;

    [Test]
    [Ignore]
    procedure fourth_Sunday_of_March_2013;

    [Test]
    [Ignore]
    procedure fourth_Sunday_of_April_2013;

    [Test]
    [Ignore]
    procedure last_Monday_of_March_2013;

    [Test]
    [Ignore]
    procedure last_Monday_of_April_2013;

    [Test]
    [Ignore]
    procedure last_Tuesday_of_May_2013;

    [Test]
    [Ignore]
    procedure last_Tuesday_of_June_2013;

    [Test]
    [Ignore]
    procedure last_Wednesday_of_July_2013;

    [Test]
    [Ignore]
    procedure last_Wednesday_of_August_2013;

    [Test]
    [Ignore]
    procedure last_Thursday_of_September_2013;

    [Test]
    [Ignore]
    procedure last_Thursday_of_October_2013;

    [Test]
    [Ignore]
    procedure last_Friday_of_November_2013;

    [Test]
    [Ignore]
    procedure last_Friday_of_December_2013;

    [Test]
    [Ignore]
    procedure last_Saturday_of_January_2013;

    [Test]
    [Ignore]
    procedure last_Saturday_of_February_2013;

    [Test]
    [Ignore]
    procedure last_Sunday_of_March_2013;

    [Test]
    [Ignore]
    procedure last_Sunday_of_April_2013;

    [Test]
    [Ignore]
    procedure last_Wednesday_of_February_2012;

    [Test]
    [Ignore]
    procedure last_Wednesday_of_December_2014;

    [Test]
    [Ignore]
    procedure last_Sunday_of_February_2015;

    [Test]
    [Ignore]
    procedure first_Friday_of_December_2012;

  end;

implementation

{$REGION 'first'}

procedure TMeetupTest.first_Friday_of_December_2012;
begin
  Assert.AreEqual('2012-12-07', TMeetup.Meetup(2012, 12, TWeekDescriptor.First, TWeekDay.Friday));
end;

procedure TMeetupTest.first_Friday_of_December_2013;
begin
  Assert.AreEqual('2013-12-06', TMeetup.Meetup(2013, 12, TWeekDescriptor.First, TWeekDay.Friday));
end;

procedure TMeetupTest.first_Friday_of_November_2013;
begin
  Assert.AreEqual('2013-11-01', TMeetup.Meetup(2013, 11, TWeekDescriptor.First, TWeekDay.Friday));
end;

procedure TMeetupTest.first_Monday_of_April_2013;
begin
  Assert.AreEqual('2013-04-01', TMeetup.Meetup(2013, 4, TWeekDescriptor.First, TWeekDay.Monday));
end;

procedure TMeetupTest.first_Monday_of_March_2013;
begin
  Assert.AreEqual('2013-03-04', TMeetup.Meetup(2013, 3, TWeekDescriptor.First, TWeekDay.Monday));
end;

procedure TMeetupTest.first_Saturday_of_February_2013;
begin
  Assert.AreEqual('2013-02-02', TMeetup.Meetup(2013, 2, TWeekDescriptor.First, TWeekDay.Saturday));
end;

procedure TMeetupTest.first_Saturday_of_January_2013;
begin
  Assert.AreEqual('2013-01-05', TMeetup.Meetup(2013, 1, TWeekDescriptor.First, TWeekDay.Saturday));
end;

procedure TMeetupTest.first_Sunday_of_April_2013;
begin
  Assert.AreEqual('2013-04-07', TMeetup.Meetup(2013, 4, TWeekDescriptor.First, TWeekDay.Sunday));
end;

procedure TMeetupTest.first_Sunday_of_March_2013;
begin
  Assert.AreEqual('2013-03-03', TMeetup.Meetup(2013, 3, TWeekDescriptor.First, TWeekDay.Sunday));
end;

procedure TMeetupTest.first_Thursday_of_October_2013;
begin
  Assert.AreEqual('2013-10-03', TMeetup.Meetup(2013, 10, TWeekDescriptor.First, TWeekDay.Thursday));
end;

procedure TMeetupTest.first_Thursday_of_September_2013;
begin
  Assert.AreEqual('2013-09-05', TMeetup.Meetup(2013, 9, TWeekDescriptor.First, TWeekDay.Thursday))
end;

procedure TMeetupTest.first_Tuesday_of_June_2013;
begin
  Assert.AreEqual('2013-06-04', TMeetup.Meetup(2013, 6, TWeekDescriptor.First, TWeekDay.Tuesday));
end;

procedure TMeetupTest.first_Tuesday_of_May_2013;
begin
  Assert.AreEqual('2013-05-07', TMeetup.Meetup(2013, 5, TWeekDescriptor.First, TWeekDay.Tuesday));
end;

procedure TMeetupTest.first_Wednesday_of_August_2013;
begin
  Assert.AreEqual('2013-08-07', TMeetup.Meetup(2013, 8, TWeekDescriptor.First, TWeekDay.Wednesday));
end;

procedure TMeetupTest.first_Wednesday_of_July_2013;
begin
  Assert.AreEqual('2013-07-03', TMeetup.Meetup(2013, 7, TWeekDescriptor.First, TWeekDay.Wednesday));
end;

{$ENDREGION}

{$REGION 'second'}

procedure TMeetupTest.second_Friday_of_December_2013;
begin
  Assert.AreEqual('2013-12-13', TMeetup.Meetup(2013, 12, TWeekDescriptor.Second, TWeekDay.Friday));
end;

procedure TMeetupTest.second_Friday_of_November_2013;
begin
  Assert.AreEqual('2013-11-08', TMeetup.Meetup(2013, 11, TWeekDescriptor.Second, TWeekDay.Friday));
end;

procedure TMeetupTest.second_Monday_of_April_2013;
begin
  Assert.AreEqual('2013-04-08', TMeetup.Meetup(2013, 4, TWeekDescriptor.Second, TWeekDay.Monday));
end;

procedure TMeetupTest.second_Monday_of_March_2013;
begin
  Assert.AreEqual('2013-03-11', TMeetup.Meetup(2013, 3, TWeekDescriptor.Second, TWeekDay.Monday));
end;

procedure TMeetupTest.second_Saturday_of_February_2013;
begin
  Assert.AreEqual('2013-02-09', TMeetup.Meetup(2013, 2, TWeekDescriptor.Second, TWeekDay.Saturday));
end;

procedure TMeetupTest.second_Saturday_of_January_2013;
begin
  Assert.AreEqual('2013-01-12', TMeetup.Meetup(2013, 1, TWeekDescriptor.Second, TWeekDay.Saturday));
end;

procedure TMeetupTest.second_Sunday_of_April_2013;
begin
  Assert.AreEqual('2013-04-14', TMeetup.Meetup(2013, 4, TWeekDescriptor.Second, TWeekDay.Sunday));
end;

procedure TMeetupTest.second_Sunday_of_March_2013;
begin
  Assert.AreEqual('2013-03-10', TMeetup.Meetup(2013, 3, TWeekDescriptor.Second, TWeekDay.Sunday));
end;

procedure TMeetupTest.second_Thursday_of_October_2013;
begin
  Assert.AreEqual('2013-10-10', TMeetup.Meetup(2013, 10, TWeekDescriptor.Second, TWeekDay.Thursday));
end;

procedure TMeetupTest.second_Thursday_of_September_2013;
begin
  Assert.AreEqual('2013-09-12', TMeetup.Meetup(2013, 9, TWeekDescriptor.Second, TWeekDay.Thursday));
end;

procedure TMeetupTest.second_Tuesday_of_June_2013;
begin
  Assert.AreEqual('2013-06-11', TMeetup.Meetup(2013, 6, TWeekDescriptor.Second, TWeekDay.Tuesday));
end;

procedure TMeetupTest.second_Tuesday_of_May_2013;
begin
  Assert.AreEqual('2013-05-14', TMeetup.Meetup(2013, 5, TWeekDescriptor.Second, TWeekDay.Tuesday));
end;

procedure TMeetupTest.second_Wednesday_of_August_2013;
begin
  Assert.AreEqual('2013-08-14', TMeetup.Meetup(2013, 8, TWeekDescriptor.Second, TWeekDay.Wednesday));
end;

procedure TMeetupTest.second_Wednesday_of_July_2013;
begin
  Assert.AreEqual('2013-07-10', TMeetup.Meetup(2013, 7, TWeekDescriptor.Second, TWeekDay.Wednesday));
end;

{$ENDREGION}

{$REGION 'teenth'}

procedure TMeetupTest.friteenth_of_April_2013;
begin
  Assert.AreEqual('2013-04-19', TMeetup.Meetup(2013, 4, TWeekDescriptor.Teenth, TWeekDay.Friday));
end;

procedure TMeetupTest.friteenth_of_August_2013;
begin
  Assert.AreEqual('2013-08-16', TMeetup.Meetup(2013, 8, TWeekDescriptor.Teenth, TWeekDay.Friday));
end;

procedure TMeetupTest.friteenth_of_September_2013;
begin
  Assert.AreEqual('2013-09-13', TMeetup.Meetup(2013, 9, TWeekDescriptor.Teenth, TWeekDay.Friday));
end;

procedure TMeetupTest.monteenth_of_August_2013;
begin
  Assert.AreEqual('2013-08-19', TMeetup.Meetup(2013, 8, TWeekDescriptor.Teenth, TWeekDay.Monday));
end;

procedure TMeetupTest.monteenth_of_May_2013;
begin
  Assert.AreEqual('2013-05-13', TMeetup.Meetup(2013, 5, TWeekDescriptor.Teenth, TWeekDay.Monday));
end;

procedure TMeetupTest.monteenth_of_September_2013;
begin
  Assert.AreEqual('2013-09-16', TMeetup.Meetup(2013, 9, TWeekDescriptor.Teenth, TWeekDay.Monday));
end;

procedure TMeetupTest.saturteenth_of_April_2013;
begin
  Assert.AreEqual('2013-04-13', TMeetup.Meetup(2013, 4, TWeekDescriptor.Teenth, TWeekDay.Saturday));
end;

procedure TMeetupTest.saturteenth_of_February_2013;
begin
  Assert.AreEqual('2013-02-16', TMeetup.Meetup(2013, 2, TWeekDescriptor.Teenth, TWeekDay.Saturday));
end;

procedure TMeetupTest.saturteenth_of_October_2013;
begin
  Assert.AreEqual('2013-10-19', TMeetup.Meetup(2013, 10, TWeekDescriptor.Teenth, TWeekDay.Saturday));
end;

procedure TMeetupTest.sunteenth_of_June_2013;
begin
  Assert.AreEqual('2013-06-16', TMeetup.Meetup(2013, 6, TWeekDescriptor.Teenth, TWeekDay.Sunday));
end;

procedure TMeetupTest.sunteenth_of_May_2013;
begin
  Assert.AreEqual('2013-05-19', TMeetup.Meetup(2013, 5, TWeekDescriptor.Teenth, TWeekDay.Sunday));
end;

procedure TMeetupTest.sunteenth_of_October_2013;
begin
  Assert.AreEqual('2013-10-13', TMeetup.Meetup(2013, 10, TWeekDescriptor.Teenth, TWeekDay.Sunday));
end;

procedure TMeetupTest.thursteenth_of_June_2013;
begin
  Assert.AreEqual('2013-06-13', TMeetup.Meetup(2013, 6, TWeekDescriptor.Teenth, TWeekDay.Thursday));
end;

procedure TMeetupTest.thursteenth_of_May_2013;
begin
  Assert.AreEqual('2013-05-16', TMeetup.Meetup(2013, 5, TWeekDescriptor.Teenth, TWeekDay.Thursday));
end;

procedure TMeetupTest.thursteenth_of_September_2013;
begin
  Assert.AreEqual('2013-09-19', TMeetup.Meetup(2013, 9, TWeekDescriptor.Teenth, TWeekDay.Thursday));
end;

procedure TMeetupTest.tuesteenth_of_April_2013;
begin
  Assert.AreEqual('2013-04-16', TMeetup.Meetup(2013, 4, TWeekDescriptor.Teenth, TWeekDay.Tuesday));
end;

procedure TMeetupTest.tuesteenth_of_August_2013;
begin
  Assert.AreEqual('2013-08-13', TMeetup.Meetup(2013, 8, TWeekDescriptor.Teenth, TWeekDay.Tuesday));
end;

procedure TMeetupTest.tuesteenth_of_March_2013;
begin
  Assert.AreEqual('2013-03-19', TMeetup.Meetup(2013, 3, TWeekDescriptor.Teenth, TWeekDay.Tuesday));
end;

procedure TMeetupTest.wednesteenth_of_February_2013;
begin
  Assert.AreEqual('2013-02-13', TMeetup.Meetup(2013, 2, TWeekDescriptor.Teenth, TWeekDay.Wednesday));
end;

procedure TMeetupTest.wednesteenth_of_January_2013;
begin
  Assert.AreEqual('2013-01-16', TMeetup.Meetup(2013, 1, TWeekDescriptor.Teenth, TWeekDay.Wednesday));
end;

procedure TMeetupTest.wednesteenth_of_June_2013;
begin
  Assert.AreEqual('2013-06-19', TMeetup.Meetup(2013, 6, TWeekDescriptor.Teenth, TWeekDay.Wednesday));
end;

{$ENDREGION}

{$REGION 'third'}

procedure TMeetupTest.third_Friday_of_December_2013;
begin
  Assert.AreEqual('2013-12-20', TMeetup.Meetup(2013, 12, TWeekDescriptor.Third, TWeekDay.Friday));
end;

procedure TMeetupTest.third_Friday_of_November_2013;
begin
  Assert.AreEqual('2013-11-15', TMeetup.Meetup(2013, 11, TWeekDescriptor.Third, TWeekDay.Friday));
end;

procedure TMeetupTest.third_Monday_of_April_2013;
begin
  Assert.AreEqual('2013-04-15', TMeetup.Meetup(2013, 4, TWeekDescriptor.Third, TWeekDay.Monday));
end;

procedure TMeetupTest.third_Monday_of_March_2013;
begin
  Assert.AreEqual('2013-03-18', TMeetup.Meetup(2013, 3, TWeekDescriptor.Third, TWeekDay.Monday));
end;

procedure TMeetupTest.third_Saturday_of_February_2013;
begin
  Assert.AreEqual('2013-02-16', TMeetup.Meetup(2013, 2, TWeekDescriptor.Third, TWeekDay.Saturday));
end;

procedure TMeetupTest.third_Saturday_of_January_2013;
begin
  Assert.AreEqual('2013-01-19', TMeetup.Meetup(2013, 1, TWeekDescriptor.Third, TWeekDay.Saturday));
end;

procedure TMeetupTest.third_Sunday_of_April_2013;
begin
  Assert.AreEqual('2013-04-21', TMeetup.Meetup(2013, 4, TWeekDescriptor.Third, TWeekDay.Sunday));
end;

procedure TMeetupTest.third_Sunday_of_March_2013;
begin
  Assert.AreEqual('2013-03-17', TMeetup.Meetup(2013, 3, TWeekDescriptor.Third, TWeekDay.Sunday));
end;

procedure TMeetupTest.third_Thursday_of_October_2013;
begin
  Assert.AreEqual('2013-10-17', TMeetup.Meetup(2013, 10, TWeekDescriptor.Third, TWeekDay.Thursday));
end;

procedure TMeetupTest.third_Thursday_of_September_2013;
begin
  Assert.AreEqual('2013-09-19', TMeetup.Meetup(2013, 9, TWeekDescriptor.Third, TWeekDay.Thursday));
end;

procedure TMeetupTest.third_Tuesday_of_June_2013;
begin
  Assert.AreEqual('2013-06-18', TMeetup.Meetup(2013, 6, TWeekDescriptor.Third, TWeekDay.Tuesday));
end;

procedure TMeetupTest.third_Tuesday_of_May_2013;
begin
  Assert.AreEqual('2013-05-21', TMeetup.Meetup(2013, 5, TWeekDescriptor.Third, TWeekDay.Tuesday));
end;

procedure TMeetupTest.third_Wednesday_of_August_2013;
begin
  Assert.AreEqual('2013-08-21', TMeetup.Meetup(2013, 8, TWeekDescriptor.Third, TWeekDay.Wednesday));
end;

procedure TMeetupTest.third_Wednesday_of_July_2013;
begin
  Assert.AreEqual('2013-07-17', TMeetup.Meetup(2013, 7, TWeekDescriptor.Third, TWeekDay.Wednesday));
end;

{$ENDREGION}

{$REGION 'fourth'}

procedure TMeetupTest.fourth_Friday_of_December_2013;
begin
  Assert.AreEqual('2013-12-27', TMeetup.Meetup(2013, 12, TWeekDescriptor.Fourth, TWeekDay.Friday));
end;

procedure TMeetupTest.fourth_Friday_of_November_2013;
begin
  Assert.AreEqual('2013-11-22', TMeetup.Meetup(2013, 11, TWeekDescriptor.Fourth, TWeekDay.Friday));
end;

procedure TMeetupTest.fourth_Monday_of_April_2013;
begin
  Assert.AreEqual('2013-04-22', TMeetup.Meetup(2013, 4, TWeekDescriptor.Fourth, TWeekDay.Monday));
end;

procedure TMeetupTest.fourth_Monday_of_March_2013;
begin
  Assert.AreEqual('2013-03-25', TMeetup.Meetup(2013, 3, TWeekDescriptor.Fourth, TWeekDay.Monday));
end;

procedure TMeetupTest.fourth_Saturday_of_February_2013;
begin
  Assert.AreEqual('2013-02-23', TMeetup.Meetup(2013, 2, TWeekDescriptor.Fourth, TWeekDay.Saturday));
end;

procedure TMeetupTest.fourth_Saturday_of_January_2013;
begin
  Assert.AreEqual('2013-01-26', TMeetup.Meetup(2013, 1, TWeekDescriptor.Fourth, TWeekDay.Saturday));
end;

procedure TMeetupTest.fourth_Sunday_of_April_2013;
begin
  Assert.AreEqual('2013-04-28', TMeetup.Meetup(2013, 4, TWeekDescriptor.Fourth, TWeekDay.Sunday));
end;

procedure TMeetupTest.fourth_Sunday_of_March_2013;
begin
  Assert.AreEqual('2013-03-24', TMeetup.Meetup(2013, 3, TWeekDescriptor.Fourth, TWeekDay.Sunday));
end;

procedure TMeetupTest.fourth_Thursday_of_October_2013;
begin
  Assert.AreEqual('2013-10-24', TMeetup.Meetup(2013, 10, TWeekDescriptor.Fourth, TWeekDay.Thursday));
end;

procedure TMeetupTest.fourth_Thursday_of_September_2013;
begin
  Assert.AreEqual('2013-09-26', TMeetup.Meetup(2013, 9, TWeekDescriptor.Fourth, TWeekDay.Thursday));
end;

procedure TMeetupTest.fourth_Tuesday_of_June_2013;
begin
  Assert.AreEqual('2013-06-25', TMeetup.Meetup(2013, 6, TWeekDescriptor.Fourth, TWeekDay.Tuesday));
end;

procedure TMeetupTest.fourth_Tuesday_of_May_2013;
begin
  Assert.AreEqual('2013-05-28', TMeetup.Meetup(2013, 5, TWeekDescriptor.Fourth, TWeekDay.Tuesday));
end;

procedure TMeetupTest.fourth_Wednesday_of_August_2013;
begin
  Assert.AreEqual('2013-08-28', TMeetup.Meetup(2013, 8, TWeekDescriptor.Fourth, TWeekDay.Wednesday));
end;

procedure TMeetupTest.fourth_Wednesday_of_July_2013;
begin
  Assert.AreEqual('2013-07-24', TMeetup.Meetup(2013, 7, TWeekDescriptor.Fourth, TWeekDay.Wednesday));
end;

{$ENDREGION}

{$REGION 'last'}

procedure TMeetupTest.last_Friday_of_December_2013;
begin
  Assert.AreEqual('2013-12-27', TMeetup.Meetup(2013, 12, TWeekDescriptor.Last, TWeekDay.Friday));
end;

procedure TMeetupTest.last_Friday_of_November_2013;
begin
  Assert.AreEqual('2013-11-29', TMeetup.Meetup(2013, 11, TWeekDescriptor.Last, TWeekDay.Friday));
end;

procedure TMeetupTest.last_Monday_of_April_2013;
begin
  Assert.AreEqual('2013-04-29', TMeetup.Meetup(2013, 4, TWeekDescriptor.Last, TWeekDay.Monday));
end;

procedure TMeetupTest.last_Monday_of_March_2013;
begin
  Assert.AreEqual('2013-03-25', TMeetup.Meetup(2013, 3, TWeekDescriptor.Last, TWeekDay.Monday));
end;

procedure TMeetupTest.last_Saturday_of_February_2013;
begin
  Assert.AreEqual('2013-02-23', TMeetup.Meetup(2013, 2, TWeekDescriptor.Last, TWeekDay.Saturday));
end;

procedure TMeetupTest.last_Saturday_of_January_2013;
begin
  Assert.AreEqual('2013-01-26', TMeetup.Meetup(2013, 1, TWeekDescriptor.Last, TWeekDay.Saturday));
end;

procedure TMeetupTest.last_Sunday_of_April_2013;
begin
  Assert.AreEqual('2013-04-28', TMeetup.Meetup(2013, 4, TWeekDescriptor.Last, TWeekDay.Sunday));
end;

procedure TMeetupTest.last_Sunday_of_February_2015;
begin
  Assert.AreEqual('2015-02-22', TMeetup.Meetup(2015, 2, TWeekDescriptor.Last, TWeekDay.Sunday));
end;

procedure TMeetupTest.last_Sunday_of_March_2013;
begin
  Assert.AreEqual('2013-03-31', TMeetup.Meetup(2013, 3, TWeekDescriptor.Last, TWeekDay.Sunday));
end;

procedure TMeetupTest.last_Thursday_of_October_2013;
begin
  Assert.AreEqual('2013-10-31', TMeetup.Meetup(2013, 10, TWeekDescriptor.Last, TWeekDay.Thursday));
end;

procedure TMeetupTest.last_Thursday_of_September_2013;
begin
  Assert.AreEqual('2013-09-26', TMeetup.Meetup(2013, 9, TWeekDescriptor.Last, TWeekDay.Thursday));
end;

procedure TMeetupTest.last_Tuesday_of_June_2013;
begin
  Assert.AreEqual('2013-06-25', TMeetup.Meetup(2013, 6, TWeekDescriptor.Last, TWeekDay.Tuesday));
end;

procedure TMeetupTest.last_Tuesday_of_May_2013;
begin
  Assert.AreEqual('2013-05-28', TMeetup.Meetup(2013, 5, TWeekDescriptor.Last, TWeekDay.Tuesday));
end;

procedure TMeetupTest.last_Wednesday_of_August_2013;
begin
  Assert.AreEqual('2013-08-28', TMeetup.Meetup(2013, 8, TWeekDescriptor.Last, TWeekDay.Wednesday));
end;

procedure TMeetupTest.last_Wednesday_of_December_2014;
begin
  Assert.AreEqual('2014-12-31', TMeetup.Meetup(2014, 12, TWeekDescriptor.Last, TWeekDay.Wednesday));
end;

procedure TMeetupTest.last_Wednesday_of_February_2012;
begin
  Assert.AreEqual('2012-02-29', TMeetup.Meetup(2012, 2, TWeekDescriptor.Last, TWeekDay.Wednesday));
end;

procedure TMeetupTest.last_Wednesday_of_July_2013;
begin
  Assert.AreEqual('2013-07-31', TMeetup.Meetup(2013, 7, TWeekDescriptor.Last, TWeekDay.Wednesday));
end;

{$ENDREGION}

initialization
  TDUnitX.RegisterTestFixture(TMeetupTest);
end.
