unit uClockTest;

interface
uses
  DUnitX.TestFramework;

type

  [TestFixture]
  TClockTest = class(TObject) 
  public
    [Test]
    procedure Prints_the_hour_8;

    [Test]
    [Ignore('Comment these lines to run these tests')]
    procedure Prints_the_hour_9;

    [Test]
    [Ignore]
    procedure Can_add_minutes;

    [Test]
    [Ignore]
    procedure Can_add_over_an_hour;

    [Test]
    [Ignore]
    procedure Can_add_over_more_than_one_day;

    [Test]
    [Ignore]
    procedure Can_subtract_minutes;

    [Test]
    [Ignore]
    procedure Can_subtract_to_previous_hour;

    [Test]
    [Ignore]
    procedure Can_subtract_over_an_hour;

    [Test]
    [Ignore]
    procedure Wraps_around_midnight;

    [Test]
    [Ignore]
    procedure Wraps_around_midnight_backwards;

    [Test]
    [Ignore]
    procedure Midnight_is_zero_hundred_hours;

    [Test]
    [Ignore]
    procedure Sixty_minutes_is_next_hour;

    [Test]
    [Ignore]
    procedure Clocks_with_same_time_are_equal;

    [Test]
    [Ignore]
    procedure Clocks_with_different_time_are_not_equal;

    [Test]
    [Ignore]
    procedure Overflown_clocks_with_same_time_are_equal;
  end;

implementation
uses uClock;

procedure TClockTest.Prints_the_hour_8;
begin
  Assert.AreEqual('08:00', Clock.SetHands(8).ToString);
end;

procedure TClockTest.Prints_the_hour_9;
begin
  Assert.AreEqual('09:00', Clock.SetHands(9).ToString);
end;

procedure TClockTest.Can_add_minutes;
begin
  Assert.AreEqual('10:03', Clock.SetHands(10).Add(3).ToString);
end;

procedure TClockTest.Can_add_over_an_hour;
begin
  Assert.AreEqual('11:03', Clock.SetHands(10).Add(63).ToString);
end;

procedure TClockTest.Can_add_over_more_than_one_day;
begin
  Assert.AreEqual('10:24', Clock.SetHands(10).Add(7224).ToString);
end;

procedure TClockTest.Can_subtract_minutes;
begin
  Assert.AreEqual('10:00', Clock.SetHands(10, 3).Subtract(3).ToString);
end;

procedure TClockTest.Can_subtract_to_previous_hour;
begin
  Assert.AreEqual('09:33', Clock.SetHands(10, 3).Subtract(30).ToString);
end;

procedure TClockTest.Can_subtract_over_an_hour;
begin
  Assert.AreEqual('08:53', Clock.SetHands(10, 3).Subtract(70).ToString);
end;

procedure TClockTest.Wraps_around_midnight;
begin
  Assert.AreEqual('00:01', Clock.SetHands(23, 59).Add(2).ToString);
end;

procedure TClockTest.Wraps_around_midnight_backwards;
begin
  Assert.AreEqual('23:59', Clock.SetHands(0, 1).Subtract(2).ToString);
end;

procedure TClockTest.Midnight_is_zero_hundred_hours;
begin
  Assert.AreEqual('00:00', Clock.SetHands(24).ToString);
end;

procedure TClockTest.Sixty_minutes_is_next_hour;
begin
  Assert.AreEqual('02:00', Clock.SetHands(1, 60).ToString);
end;

procedure TClockTest.Clocks_with_same_time_are_equal;
var Clock1, Clock2: Clock;
begin
  Clock1 := Clock.SetHands(14, 30);
  Clock2 := Clock.SetHands(14, 30);

  Assert.AreEqual(Clock1, Clock2);
end;

procedure TClockTest.Clocks_with_different_time_are_not_equal;
var Clock1, Clock2: Clock;
begin
  Clock1 := Clock.SetHands(15, 30);
  Clock2 := Clock.SetHands(14, 30);

  Assert.AreNotEqual(Clock1, Clock2);
end;

procedure TClockTest.Overflown_clocks_with_same_time_are_equal;
var Clock1, Clock2: Clock;
begin
  Clock1 := Clock.SetHands(14, 30);
  Clock2 := Clock.SetHands(38, 30);

  Assert.AreEqual(Clock1, Clock2);
end;

initialization
  TDUnitX.RegisterTestFixture(TClockTest);
end.
