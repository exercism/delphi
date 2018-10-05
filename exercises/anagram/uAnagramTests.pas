unit uAnagramTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.4.0';

type

  [TestFixture]
  AnagramTests = class(TObject)
  private
    procedure CompareDynamicArrays(Expected, Actual: TArray<string>);
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure no_matches;

    [Test]
    [Ignore]
    procedure detects_two_anagrams;

    [Test]
    [Ignore]
    procedure does_not_detect_anagram_subsets;

    [Test]
    [Ignore]
    procedure detects_anagram;

    [Test]
    [Ignore]
    procedure detects_three_anagrams;

    [Test]
    [Ignore]
    procedure does_not_detect_non_anagrams_with_identical_checksum;

    [Test]
    [Ignore]
    procedure detects_anagrams_case_insensitively;

    [Test]
    [Ignore]
    procedure detects_anagrams_using_case_insensitive_subject;

    [Test]
    [Ignore]
    procedure detects_anagrams_using_case_insensitive_possible_matches;

    [Test]
    [Ignore]
    procedure does_not_detect_a_anagram_if_the_original_word_is_repeated;

    [Test]
    [Ignore]
    procedure anagrams_must_use_all_letters_exactly_once;

    [Test]
    [Ignore]
    procedure words_are_not_anagrams_of_themselves_case_insensitive;
  end;

implementation
uses SysUtils, uAnagram;

{ AnagramTests }

procedure AnagramTests.anagrams_must_use_all_letters_exactly_once;
var
  Anagram: TAnagram;
  Expected: TArray<string>;
  candidates: TArray<string>;
begin
  SetLength(Expected, 0);
  SetLength(candidates, 1);
  candidates[0] := 'patter';
  Anagram := TAnagram.Create('tapper');
  CompareDynamicArrays(Expected, Anagram.findAnagram(candidates));
end;

procedure AnagramTests.words_are_not_anagrams_of_themselves_case_insensitive;
var
  Anagram: TAnagram;
  Expected: TArray<string>;
  candidates: TArray<string>;
begin
  SetLength(Expected, 0);
  SetLength(candidates, 3);
  candidates[0] := 'BANANA';
  candidates[1] := 'Banana';
  candidates[2] := 'banana';
  Anagram := TAnagram.Create('BANANA');
  CompareDynamicArrays(Expected, Anagram.findAnagram(candidates));
end;

procedure AnagramTests.detects_anagram;
var
  Anagram: TAnagram;
  Expected: TArray<string>;
  candidates: TArray<string>;
begin
  SetLength(Expected, 1);
  Expected[0] := 'inlets';

  SetLength(candidates, 4);
  candidates[0] := 'enlists';
  candidates[1] := 'google';
  candidates[2] := 'inlets';
  candidates[3] := 'banana';
  Anagram := TAnagram.Create('listen');
  CompareDynamicArrays(Expected, Anagram.findAnagram(candidates));
end;

procedure AnagramTests.detects_anagrams_case_insensitively;
var
  Anagram: TAnagram;
  Expected: TArray<string>;
  candidates: TArray<string>;
begin
  SetLength(Expected, 1);
  Expected[0] := 'Carthorse';

  SetLength(candidates, 3);
  candidates[0] := 'cashregister';
  candidates[1] := 'Carthorse';
  candidates[2] := 'radishes';
  Anagram := TAnagram.Create('Orchestra');
  CompareDynamicArrays(Expected, Anagram.findAnagram(candidates));
end;

procedure AnagramTests.detects_anagrams_using_case_insensitive_possible_matches;
var
  Anagram: TAnagram;
  Expected: TArray<string>;
  candidates: TArray<string>;
begin
  SetLength(Expected, 1);
  Expected[0] := 'Carthorse';

  SetLength(candidates, 3);
  candidates[0] := 'cashregister';
  candidates[1] := 'Carthorse';
  candidates[2] := 'radishes';
  Anagram := TAnagram.Create('orchestra');
  CompareDynamicArrays(Expected, Anagram.findAnagram(candidates));
end;

procedure AnagramTests.detects_anagrams_using_case_insensitive_subject;
var
  Anagram: TAnagram;
  Expected: TArray<string>;
  candidates: TArray<string>;
begin
  SetLength(Expected, 1);
  Expected[0] := 'carthorse';

  SetLength(candidates, 3);
  candidates[0] := 'cashregister';
  candidates[1] := 'carthorse';
  candidates[2] := 'radishes';
  Anagram := TAnagram.Create('Orchestra');
  CompareDynamicArrays(Expected, Anagram.findAnagram(candidates));
end;

procedure AnagramTests.detects_three_anagrams;
var
  Anagram: TAnagram;
  Expected: TArray<string>;
  candidates: TArray<string>;
begin
  SetLength(Expected, 3);
  Expected[0] := 'gallery';
  Expected[1] := 'regally';
  Expected[2] := 'largely';

  SetLength(candidates, 6);
  candidates[0] := 'gallery';
  candidates[1] := 'ballerina';
  candidates[2] := 'regally';
  candidates[3] := 'clergy';
  candidates[4] := 'largely';
  candidates[5] := 'leading';
  Anagram := TAnagram.Create('allergy');
  CompareDynamicArrays(Expected, Anagram.findAnagram(candidates));
end;

procedure AnagramTests.detects_two_anagrams;
var
  Anagram: TAnagram;
  Expected: TArray<string>;
  candidates: TArray<string>;
begin
  SetLength(Expected, 2);
  Expected[0] := 'stream';
  Expected[1] := 'maters';

  SetLength(candidates, 3);
  candidates[0] := 'stream';
  candidates[1] := 'pigeon';
  candidates[2] := 'maters';
  Anagram := TAnagram.Create('master');
  CompareDynamicArrays(Expected, Anagram.findAnagram(candidates));
end;

procedure AnagramTests.does_not_detect_anagram_subsets;
var
  Anagram: TAnagram;
  Expected: TArray<string>;
  candidates: TArray<string>;
begin
  SetLength(Expected, 0);
  SetLength(candidates, 2);
  candidates[0] := 'dog';
  candidates[1] := 'goody';
  Anagram := TAnagram.Create('good');
  CompareDynamicArrays(Expected, Anagram.findAnagram(candidates));
end;

procedure AnagramTests.does_not_detect_a_anagram_if_the_original_word_is_repeated;
var
  Anagram: TAnagram;
  Expected: TArray<string>;
  candidates: TArray<string>;
begin
  SetLength(Expected, 0);
  SetLength(candidates, 3);
  candidates[0] := 'go';
  candidates[1] := 'Go';
  candidates[2] := 'GO';
  Anagram := TAnagram.Create('go');
  CompareDynamicArrays(Expected, Anagram.findAnagram(candidates));
end;

procedure AnagramTests.does_not_detect_non_anagrams_with_identical_checksum;
var
  Anagram: TAnagram;
  Expected: TArray<string>;
  candidates: TArray<string>;
begin
  SetLength(Expected, 0);
  SetLength(candidates, 1);
  candidates[0] := 'last';
  Anagram := TAnagram.Create('mass');
  CompareDynamicArrays(Expected, Anagram.findAnagram(candidates));
end;

procedure AnagramTests.no_matches;
var
  Anagram: TAnagram;
  Expected: TArray<string>;
  candidates: TArray<string>;
begin
  SetLength(Expected, 0);
  SetLength(candidates, 4);
  candidates[0] := 'hello';
  candidates[1] := 'world';
  candidates[2] := 'zombies';
  candidates[3] := 'pants';
  Anagram := TAnagram.Create('diaper');
  CompareDynamicArrays(Expected, Anagram.findAnagram(candidates));
end;

procedure AnagramTests.CompareDynamicArrays(Expected, Actual: TArray<string>);
var
  i: integer;
begin
  Assert.AreEqual(Length(Expected), Length(Actual));
  for i := low(Expected) to High(Expected) do
    Assert.AreEqual(Expected[i], Actual[i]);
end;

initialization
  TDUnitX.RegisterTestFixture(AnagramTests);
end.
