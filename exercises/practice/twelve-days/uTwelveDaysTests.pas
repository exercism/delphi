unit uTwelveDaysTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.2.0';

type

  [TestFixture('Verse')]
  TwelveDaysVerseTests = class(TObject)
  private
    expected: string;
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure first_day_a_partridge_in_a_pear_tree;

    [Test]
    [Ignore]
    procedure second_day_two_turtle_doves;

    [Test]
    [Ignore]
    procedure third_day_three_french_hens;

    [Test]
    [Ignore]
    procedure fourth_day_four_calling_birds;

    [Test]
    [Ignore]
    procedure fifth_day_five_gold_rings;

    [Test]
    [Ignore]
    procedure sixth_day_six_geese_a_laying;

    [Test]
    [Ignore]
    procedure seventh_day_seven_swans_a_swimming;

    [Test]
    [Ignore]
    procedure eighth_day_eight_maids_a_milking;

    [Test]
    [Ignore]
    procedure ninth_day_nine_ladies_dancing;

    [Test]
    [Ignore]
    procedure tenth_day_ten_lords_a_leaping;

    [Test]
    [Ignore]
    procedure eleventh_day_eleven_pipers_piping;

    [Test]
    [Ignore]
    procedure twelfth_day_twelve_drummers_drumming;
  end;

  [TestFixture('Lyrics')]
  TwelveDaysLyricsTests = class(TObject)
  private
    expected: string;
  public
    [Test]
    [Ignore]
    procedure recites_first_three_verses_of_the_song;

    [Test]
    [Ignore]
    procedure recites_three_verses_from_the_middle_of_the_song;

    [Test]
    [Ignore]
    procedure recites_the_whole_song;
  end;

implementation
uses System.SysUtils, uTwelveDays;

{ TwelveDaysVerseTests }

procedure TwelveDaysVerseTests.eighth_day_eight_maids_a_milking;
begin
  expected := 'On the eighth day of Christmas my true love gave to me: ' +
    'eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five ' +
    'Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, ' +
    'and a Partridge in a Pear Tree.';
  Assert.AreEqual(expected, TwelveDays.Recite(8), false);
end;

procedure TwelveDaysVerseTests.eleventh_day_eleven_pipers_piping;
begin
  expected := 'On the eleventh day of Christmas my true love gave to me: ' +
    'eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight ' +
    'Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold ' +
    'Rings, four Calling Birds, three French Hens, two Turtle Doves, and a ' +
    'Partridge in a Pear Tree.';
  Assert.AreEqual(expected, TwelveDays.Recite(11), false);
end;

procedure TwelveDaysVerseTests.fifth_day_five_gold_rings;
begin
  expected := 'On the fifth day of Christmas my true love gave to me: five ' +
    'Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, ' +
    'and a Partridge in a Pear Tree.';
  Assert.AreEqual(expected, TwelveDays.Recite(5),false);
end;

procedure TwelveDaysVerseTests.first_day_a_partridge_in_a_pear_tree;
begin
  expected := 'On the first day of Christmas my true love gave to me: a ' +
    'Partridge in a Pear Tree.';
  Assert.AreEqual(expected, TwelveDays.Recite(1), false);
end;

procedure TwelveDaysVerseTests.fourth_day_four_calling_birds;
begin
  expected := 'On the fourth day of Christmas my true love gave to me: four ' +
    'Calling Birds, three French Hens, two Turtle Doves, and a Partridge in ' +
    'a Pear Tree.';
  Assert.AreEqual(expected, TwelveDays.Recite(4), false);
end;

procedure TwelveDaysVerseTests.ninth_day_nine_ladies_dancing;
begin
  expected := 'On the ninth day of Christmas my true love gave to me: nine ' +
    'Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six ' +
    'Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, ' +
    'two Turtle Doves, and a Partridge in a Pear Tree.';
  Assert.AreEqual(expected, TwelveDays.Recite(9), false);
end;

procedure TwelveDaysVerseTests.second_day_two_turtle_doves;
begin
  expected := 'On the second day of Christmas my true love gave to me: two ' +
    'Turtle Doves, and a Partridge in a Pear Tree.';
  Assert.AreEqual(expected, TwelveDays.Recite(2), false);
end;

procedure TwelveDaysVerseTests.seventh_day_seven_swans_a_swimming;
begin
  expected := 'On the seventh day of Christmas my true love gave to me: ' +
    'seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four ' +
    'Calling Birds, three French Hens, two Turtle Doves, and a Partridge in ' +
    'a Pear Tree.';
  Assert.AreEqual(expected, TwelveDays.Recite(7), false);
end;

procedure TwelveDaysVerseTests.sixth_day_six_geese_a_laying;
begin
  expected := 'On the sixth day of Christmas my true love gave to me: six ' +
    'Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, ' +
    'two Turtle Doves, and a Partridge in a Pear Tree.';
  Assert.AreEqual(expected, TwelveDays.Recite(6), false);
end;

procedure TwelveDaysVerseTests.tenth_day_ten_lords_a_leaping;
begin
  expected := 'On the tenth day of Christmas my true love gave to me: ten ' +
    'Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven ' +
    'Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling ' +
    'Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear ' +
    'Tree.';
  Assert.AreEqual(expected, TwelveDays.Recite(10), false);
end;

procedure TwelveDaysVerseTests.third_day_three_french_hens;
begin
  expected := 'On the third day of Christmas my true love gave to me: three ' +
    'French Hens, two Turtle Doves, and a Partridge in a Pear Tree.';
  Assert.AreEqual(expected, TwelveDays.Recite(3), false);
end;

procedure TwelveDaysVerseTests.twelfth_day_twelve_drummers_drumming;
begin
  expected := 'On the twelfth day of Christmas my true love gave to me: ' +
    'twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, ' +
    'nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six ' +
    'Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, ' +
    'two Turtle Doves, and a Partridge in a Pear Tree.';
  Assert.AreEqual(expected, TwelveDays.Recite(12), false);
end;

{ TwelveDaysLyricsTests }

procedure TwelveDaysLyricsTests.recites_first_three_verses_of_the_song;
begin
  expected := 'On the first day of Christmas my true love gave to me: a ' +
    'Partridge in a Pear Tree.\n' +
    'On the second day of Christmas my true love gave to me: two ' +
    'Turtle Doves, and a Partridge in a Pear Tree.\n' +
    'On the third day of Christmas my true love gave to me: three French ' +
    'Hens, two Turtle Doves, and a Partridge in a Pear Tree.';
  Assert.AreEqual(expected, TwelveDays.Recite(1, 3), false);
end;

procedure TwelveDaysLyricsTests.recites_the_whole_song;
begin
  expected := 'On the first day of Christmas my true love gave to me: a ' +
    'Partridge in a Pear Tree.\n' +
    'On the second day of Christmas my true love gave to me: two ' +
    'Turtle Doves, and a Partridge in a Pear Tree.\n' +
    'On the third day of Christmas my true love gave to me: three French ' +
    'Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n' +
    'On the fourth day of Christmas my true love gave to me: four ' +
    'Calling Birds, three French Hens, two Turtle Doves, and a Partridge ' +
    'in a Pear Tree.\n' +
    'On the fifth day of Christmas my true love gave to me: five Gold Rings, ' +
    'four Calling Birds, three French Hens, two Turtle Doves, and a ' +
    'Partridge in a Pear Tree.\n' +
    'On the sixth day of Christmas my true love gave to me: six ' +
    'Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, ' +
    'two Turtle Doves, and a Partridge in a Pear Tree.\n' +
    'On the seventh day of Christmas my true love gave to me: seven ' +
    'Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling ' +
    'Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear ' +
    'Tree.\n' +
    'On the eighth day of Christmas my true love gave to me: eight ' +
    'Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold ' +
    'Rings, four Calling Birds, three French Hens, two Turtle Doves, and a ' +
    'Partridge in a Pear Tree.\n' +
    'On the ninth day of Christmas my true love gave to me: nine Ladies ' +
    'Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six ' +
    'Geese-a-Laying, five Gold Rings, four Calling Birds, three French ' +
    'Hens, two Turtle Doves, and a Partridge in a Pear Tree.\n' +
    'On the tenth day of Christmas my true love gave to me: ten ' +
    'Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven ' +
    'Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling ' +
    'Birds, three French Hens, two Turtle Doves, and a Partridge in a ' +
    'Pear Tree.\n' +
    'On the eleventh day of Christmas my true love gave to me: eleven ' +
    'Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight ' +
    'Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five ' +
    'Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, ' +
    'and a Partridge in a Pear Tree.\n' +
    'On the twelfth day of Christmas my true love gave to me: twelve ' +
    'Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine ' +
    'Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six ' +
    'Geese-a-Laying, five Gold Rings, four Calling Birds, three French ' +
    'Hens, two Turtle Doves, and a Partridge in a Pear Tree.';
  Assert.AreEqual(expected, TwelveDays.Recite(1, 12), false);
end;

procedure TwelveDaysLyricsTests.recites_three_verses_from_the_middle_of_the_song;
begin
  expected := 'On the fourth day of Christmas my true love gave to me: four ' +
    'Calling Birds, three French Hens, two Turtle Doves, and a Partridge ' +
    'in a Pear Tree.\n' +
    'On the fifth day of Christmas my true love gave to me: five Gold Rings, ' +
    'four Calling Birds, three French Hens, two Turtle Doves, and a ' +
    'Partridge in a Pear Tree.\n' +
    'On the sixth day of Christmas my true love gave to me: six ' +
    'Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, ' +
    'two Turtle Doves, and a Partridge in a Pear Tree.';
  Assert.AreEqual(expected, TwelveDays.Recite(4, 6), false);
end;

initialization
  TDUnitX.RegisterTestFixture(TwelveDaysVerseTests);
  TDUnitX.RegisterTestFixture(TwelveDaysLyricsTests);
end.
