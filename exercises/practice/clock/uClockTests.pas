unit uClockTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '2.4.0.1';

type

  [TestFixture('Create a new clock with an initial time')]
  TClockTest = class(TObject)
  public
    [Test]
//  [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure On_the_hour;

    [Test]
    [Ignore]
    procedure Past_the_hour;

    [Test]
    [Ignore]
    procedure Midnight_is_zero_hours;

    [Test]
    [Ignore]
    procedure Hour_rolls_over;

    [Test]
    [Ignore]
    procedure Hour_rolls_over_continuously;

    [Test]
    [Ignore]
    procedure Sixty_minutes_is_next_hour;

    [Test]
    [Ignore]
    procedure Minutes_roll_over;

    [Test]
    [Ignore]
    procedure Minutes_roll_over_continuously;

    [Test]
    [Ignore]
    procedure Hour_and_minutes_roll_over;

    [Test]
    [Ignore]
    procedure Hour_and_minutes_roll_over_continuously;

    [Test]
    [Ignore]
    procedure Hour_and_minutes_roll_over_to_exactly_midnight;

    [Test]
    [Ignore]
    procedure Negative_hour;

    [Test]
    [Ignore]
    procedure Negative_hour_rolls_over;

    [Test]
    [Ignore]
    procedure Negative_hour_rolls_over_continuously;

    [Test]
    [Ignore]
    procedure Negative_minutes;

    [Test]
    [Ignore]
    procedure Negative_minutes_roll_over;

    [Test]
    [Ignore]
    procedure Negative_minutes_roll_over_continuously;

    [Test]
    [Ignore]
    procedure Negative_sixty_minutes_is_previous_hour;

    [Test]
    [Ignore]
    procedure Negative_hour_and_minutes_both_roll_over;

    [Test]
    [Ignore]
    procedure Negative_hour_and_minutes_both_roll_over_continuously;
  end;

  [TestFixture('Add minutes')]
  TAddMinutes = class(TObject)
  public
    [Test]
    [Ignore]
    procedure Add_minutes;

    [Test]
    [Ignore]
    procedure Add_no_minutes;

    [Test]
    [Ignore]
    procedure Add_to_next_hour;

    [Test]
    [Ignore]
    procedure Add_more_than_one_hour;

    [Test]
    [Ignore]
    procedure Add_more_than_two_hours_with_carry;

    [Test]
    [Ignore]
    procedure Add_across_midnight;

    [Test]
    [Ignore]
    procedure Add_more_than_one_day; //1500 min = 25 hrs

    [Test]
    [Ignore]
    procedure Add_more_than_two_days;
  end;

  [TestFixture('Subtract minutes')]
  TSubtractMinutes = class(TObject)
  public
    [Test]
    [Ignore]
    procedure Subtract_minutes;

    [Test]
    [Ignore]
    procedure Subtract_to_previous_hour;

    [Test]
    [Ignore]
    procedure Subtract_more_than_one_hour;

    [Test]
    [Ignore]
    procedure Subtract_across_midnight;

    [Test]
    [Ignore]
    procedure Subtract_more_than_two_hours;

    [Test]
    [Ignore]
    procedure Subtract_more_than_two_hours_with_borrow;

    [Test]
    [Ignore]
    procedure Subtract_more_than_one_day; //(1500 min = 25 hrs)

    [Test]
    [Ignore]
    procedure Subtract_more_than_two_days;
  end;

  [TestFixture('Compare two clocks for equality')]
  TCompareClocks = class(TObject)
  public
    [Test]
    [Ignore]
    procedure Clocks_with_same_time;

    [Test]
    [Ignore]
    procedure Clocks_a_minute_apart;

    [Test]
    [Ignore]
    procedure Clocks_an_hour_apart;

    [Test]
    [Ignore]
    procedure Clocks_with_hour_overflow;

    [Test]
    [Ignore]
    procedure Clocks_with_hour_overflow_by_several_days;

    [Test]
    [Ignore]
    procedure Clocks_with_negative_hour;

    [Test]
    [Ignore]
    procedure Clocks_with_negative_hour_that_wraps;

    [Test]
    [Ignore]
    procedure Clocks_with_negative_hour_that_wraps_multiple_times;

    [Test]
    [Ignore]
    procedure Clocks_with_minute_overflow;

    [Test]
    [Ignore]
    procedure Clocks_with_minute_overflow_by_serveral_days;

    [Test]
    [Ignore]
    procedure Clocks_with_negative_minute;

    [Test]
    [Ignore]
    procedure Clocks_with_negative_minute_that_wraps;

    [Test]
    [Ignore]
    procedure Clocks_with_negative_minute_that_wraps_multiple_times;

    [Test]
    [Ignore]
    procedure Clocks_with_negative_hours_and_minutes;

    [Test]
    [Ignore]
    procedure Clocks_with_negative_hours_and_minutes_that_wrap;

    [Test]
    [Ignore]
    procedure full_clock_and_zeroed_clock;
  end;

implementation
uses uClock;

{$region 'TClockTest'}
procedure TClockTest.On_the_hour;
begin
  Assert.AreEqual('08:00', Clock.SetHands(8).ToString);
end;

procedure TClockTest.Past_the_hour;
begin
  Assert.AreEqual('11:09', Clock.SetHands(11, 9).ToString);
end;

procedure TClockTest.Midnight_is_zero_hours;
begin
  Assert.AreEqual('00:00', Clock.SetHands(24).ToString);
end;

procedure TClockTest.Hour_rolls_over;
begin
  Assert.AreEqual('01:00', Clock.SetHands(25).ToString);
end;

procedure TClockTest.Hour_rolls_over_continuously;
begin
  Assert.AreEqual('04:00', Clock.SetHands(100).ToString);
end;

procedure TClockTest.Sixty_minutes_is_next_hour;
begin
  Assert.AreEqual('02:00', Clock.SetHands(1, 60).ToString);
end;

procedure TClockTest.Minutes_roll_over;
begin
  Assert.AreEqual('02:40', Clock.SetHands(0, 160).ToString);
end;

procedure TClockTest.Minutes_roll_over_continuously;
begin
  Assert.AreEqual('04:43', Clock.SetHands(0, 1723).ToString);
end;

procedure TClockTest.Hour_and_minutes_roll_over;
begin
  Assert.AreEqual('03:40', Clock.SetHands(25, 160).ToString);
end;

procedure TClockTest.Hour_and_minutes_roll_over_continuously;
begin
  Assert.AreEqual('11:01', Clock.SetHands(201, 3001).ToString);
end;

procedure TClockTest.Hour_and_minutes_roll_over_to_exactly_midnight;
begin
  Assert.AreEqual('00:00', Clock.SetHands(72, 8640).ToString);
end;

procedure TClockTest.Negative_hour;
begin
  Assert.AreEqual('23:15', Clock.SetHands(-1, 15).ToString);
end;

procedure TClockTest.Negative_hour_rolls_over;
begin
  Assert.AreEqual('23:00', Clock.SetHands(-25).ToString);
end;

procedure TClockTest.Negative_hour_rolls_over_continuously;
begin
  Assert.AreEqual('05:00', Clock.SetHands(-91).ToString);
end;

procedure TClockTest.Negative_minutes;
begin
  Assert.AreEqual('00:20', Clock.SetHands(1, -40).ToString);
end;

procedure TClockTest.Negative_minutes_roll_over;
begin
  Assert.AreEqual('22:20', Clock.SetHands(1, -160).ToString);
end;

procedure TClockTest.Negative_minutes_roll_over_continuously;
begin
  Assert.AreEqual('16:40', Clock.SetHands(1, -4820).ToString);
end;

procedure TClockTest.Negative_sixty_minutes_is_previous_hour;
begin
  Assert.AreEqual('01:00', Clock.SetHands(2, -60).ToString);
end;

procedure TClockTest.Negative_hour_and_minutes_both_roll_over;
begin
  Assert.AreEqual('20:20', Clock.SetHands(-25, -160).ToString);
end;

procedure TClockTest.Negative_hour_and_minutes_both_roll_over_continuously;
begin
  Assert.AreEqual('22:10', Clock.SetHands(-121, -5810).ToString);
end;
{$endregion}

{$region 'TAddMinutes'}
procedure TAddMinutes.Add_minutes;
begin
  Assert.AreEqual('10:03', Clock.SetHands(10).Add(3).ToString);
end;

procedure TAddMinutes.Add_no_minutes;
begin
  Assert.AreEqual('06:41', Clock.SetHands(6, 41).Add(0).ToString);
end;

procedure TAddMinutes.Add_to_next_hour;
begin
  Assert.AreEqual('01:25', Clock.SetHands(0, 45).Add(40).ToString);
end;

procedure TAddMinutes.Add_more_than_one_hour;
begin
  Assert.AreEqual('11:01', Clock.SetHands(10).Add(61).ToString);
end;

procedure TAddMinutes.Add_more_than_two_hours_with_carry;
begin
  Assert.AreEqual('03:25', Clock.SetHands(0, 45).Add(160).ToString);
end;

procedure TAddMinutes.Add_across_midnight;
begin
  Assert.AreEqual('00:01', Clock.SetHands(23, 59).Add(2).ToString);
end;

procedure TAddMinutes.Add_more_than_one_day;
begin
  Assert.AreEqual('06:32', Clock.SetHands(5, 32).Add(1500).ToString);
end;

procedure TAddMinutes.Add_more_than_two_days;
begin
  Assert.AreEqual('11:21', Clock.SetHands(1, 1).Add(3500).ToString);
end;
{$endregion}

{$region 'TSubtractMinutes'}
procedure TSubtractMinutes.Subtract_minutes;
begin
  Assert.AreEqual('10:00', Clock.SetHands(10, 3).Subtract(3).ToString);
end;

procedure TSubtractMinutes.Subtract_to_previous_hour;
begin
  Assert.AreEqual('09:33', Clock.SetHands(10, 3).Subtract(30).ToString);
end;

procedure TSubtractMinutes.Subtract_more_than_one_hour;
begin
  Assert.AreEqual('08:53', Clock.SetHands(10, 3).Subtract(70).ToString);
end;

procedure TSubtractMinutes.Subtract_across_midnight;
begin
  Assert.AreEqual('23:59', Clock.SetHands(0, 3).Subtract(4).ToString);
end;

procedure TSubtractMinutes.Subtract_more_than_two_hours;
begin
  Assert.AreEqual('21:20', Clock.SetHands(0, 0).Subtract(160).ToString);
end;

procedure TSubtractMinutes.Subtract_more_than_two_hours_with_borrow;
begin
  Assert.AreEqual('03:35', Clock.SetHands(6, 15).Subtract(160).ToString);
end;

procedure TSubtractMinutes.Subtract_more_than_one_day;
begin
  Assert.AreEqual('04:32', Clock.SetHands(5, 32).Subtract(1500).ToString);
end;

procedure TSubtractMinutes.Subtract_more_than_two_days;
begin
  Assert.AreEqual('00:20', Clock.SetHands(2, 20).Subtract(3000).ToString);
end;
{$endregion}

{$region 'TCompareClocks'}
procedure TCompareClocks.Clocks_with_same_time;
var Clock1, Clock2: Clock;
begin
  Clock1 := Clock.SetHands(15, 37);
  Clock2 := Clock.SetHands(15, 37);

  Assert.IsTrue(Clock1.Equal(Clock2));
end;

procedure TCompareClocks.Clocks_a_minute_apart;
var Clock1, Clock2: Clock;
begin
  Clock1 := Clock.SetHands(15, 36);
  Clock2 := Clock.SetHands(15, 37);

  Assert.IsFalse(Clock1.Equal(Clock2));
end;

procedure TCompareClocks.Clocks_an_hour_apart;
var Clock1, Clock2: Clock;
begin
  Clock1 := Clock.SetHands(14, 37);
  Clock2 := Clock.SetHands(15, 37);

  Assert.IsFalse(Clock1.Equal(Clock2));
end;

procedure TCompareClocks.Clocks_with_hour_overflow;
var Clock1, Clock2: Clock;
begin
  Clock1 := Clock.SetHands(10, 37);
  Clock2 := Clock.SetHands(34, 37);

  Assert.IsTrue(Clock1.Equal(Clock2));
end;

procedure TCompareClocks.Clocks_with_hour_overflow_by_several_days;
var Clock1, Clock2: Clock;
begin
  Clock1 := Clock.SetHands(3, 11);
  Clock2 := Clock.SetHands(99, 11);

  Assert.IsTrue(Clock1.Equal(Clock2));
end;

procedure TCompareClocks.Clocks_with_negative_hour;
var Clock1, Clock2: Clock;
begin
  Clock1 := Clock.SetHands(22, 40);
  Clock2 := Clock.SetHands(-2, 40);

  Assert.IsTrue(Clock1.Equal(Clock2));
end;

procedure TCompareClocks.Clocks_with_negative_hour_that_wraps;
var Clock1, Clock2: Clock;
begin
  Clock1 := Clock.SetHands(17, 3);
  Clock2 := Clock.SetHands(-31, 3);

  Assert.IsTrue(Clock1.Equal(Clock2));
end;

procedure TCompareClocks.Clocks_with_negative_hour_that_wraps_multiple_times;
var Clock1, Clock2: Clock;
begin
  Clock1 := Clock.SetHands(13, 49);
  Clock2 := Clock.SetHands(-83, 49);

  Assert.IsTrue(Clock1.Equal(Clock2));
end;

procedure TCompareClocks.Clocks_with_minute_overflow;
var Clock1, Clock2: Clock;
begin
  Clock1 := Clock.SetHands(0, 1);
  Clock2 := Clock.SetHands(0, 1441);

  Assert.IsTrue(Clock1.Equal(Clock2));
end;

procedure TCompareClocks.Clocks_with_minute_overflow_by_serveral_days;
var Clock1, Clock2: Clock;
begin
  Clock1 := Clock.SetHands(2, 2);
  Clock2 := Clock.SetHands(2, 4322);

  Assert.IsTrue(Clock1.Equal(Clock2));
end;

procedure TCompareClocks.Clocks_with_negative_minute;
var Clock1, Clock2: Clock;
begin
  Clock1 := Clock.SetHands(2, 40);
  Clock2 := Clock.SetHands(3, -20);

  Assert.IsTrue(Clock1.Equal(Clock2));
end;

procedure TCompareClocks.Clocks_with_negative_minute_that_wraps;
var Clock1, Clock2: Clock;
begin
  Clock1 := Clock.SetHands(4, 10);
  Clock2 := Clock.SetHands(5, -1490);

  Assert.IsTrue(Clock1.Equal(Clock2));
end;

procedure TCompareClocks.Clocks_with_negative_minute_that_wraps_multiple_times;
var Clock1, Clock2: Clock;
begin
  Clock1 := Clock.SetHands(6, 15);
  Clock2 := Clock.SetHands(6, -4305);

  Assert.IsTrue(Clock1.Equal(Clock2));
end;

procedure TCompareClocks.Clocks_with_negative_hours_and_minutes;
var Clock1, Clock2: Clock;
begin
  Clock1 := Clock.SetHands(7, 32);
  Clock2 := Clock.SetHands(-12, -268);

  Assert.IsTrue(Clock1.Equal(Clock2));
end;

procedure TCompareClocks.Clocks_with_negative_hours_and_minutes_that_wrap;
var Clock1, Clock2: Clock;
begin
  Clock1 := Clock.SetHands(18, 7);
  Clock2 := Clock.SetHands(-54, -11513);

  Assert.IsTrue(Clock1.Equal(Clock2));
end;

procedure TCompareClocks.full_clock_and_zeroed_clock;
var Clock1, Clock2: Clock;
begin
  Clock1 := Clock.SetHands(24, 0);
  Clock2 := Clock.SetHands(0, 0);

  Assert.IsTrue(Clock1.Equal(Clock2));
end;

{$endregion}

initialization
  TDUnitX.RegisterTestFixture(TClockTest);
  TDUnitX.RegisterTestFixture(TAddMinutes);
  TDUnitX.RegisterTestFixture(TSubtractMinutes);
  TDUnitX.RegisterTestFixture(TCompareClocks);
end.
