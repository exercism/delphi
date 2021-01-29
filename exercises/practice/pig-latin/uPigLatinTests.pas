unit uPigLatinTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.2.0.1';

type
  [TestFixture]
  PigLatinTest = class(TObject)
  published
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure Word_beginning_with_a;

    [Ignore]
    procedure Word_beginning_with_e;

    [Ignore]
    procedure Word_beginning_with_i;

    [Ignore]
    procedure Word_beginning_with_o;

    [Ignore]
    procedure Word_beginning_with_u;

    [Ignore]
    procedure Word_beginning_with_a_vowel_and_followed_by_a_qu;

    [Ignore]
    procedure Word_beginning_with_p;

    [Ignore]
    procedure Word_beginning_with_k;

    [Ignore]
    procedure Word_beginning_with_x;

    [Ignore]
    procedure Word_beginning_with_q_without_a_following_u;

    [Ignore]
    procedure Word_beginning_with_ch;

    [Ignore]
    procedure Word_beginning_with_qu;

    [Ignore]
    procedure Word_beginning_with_qu_and_a_preceding_consonant;

    [Ignore]
    procedure Word_beginning_with_th;

    [Ignore]
    procedure Word_beginning_with_thr;

    [Ignore]
    procedure Word_beginning_with_sch;

    [Ignore]
    procedure Word_beginning_with_yt;

    [Ignore]
    procedure Word_beginning_with_xr;

    [Ignore]
    procedure y_is_treated_like_a_consonant_at_the_beginning_of_a_word;

    [Ignore]
    procedure y_is_treated_like_a_vowel_at_the_end_of_a_consonant_cluster;

    [Ignore]
    procedure y_as_second_letter_in_two_letter_word;

    [Ignore]
    procedure A_whole_phrase;
  end;

implementation
uses uPigLatin;


{ PigLatinTest }

procedure PigLatinTest.A_whole_phrase;
begin
  Assert.AreEqual('ickquay astfay unray', TPigLatin.Translate('quick fast run'));
end;

procedure PigLatinTest.Word_beginning_with_a;
begin
  Assert.AreEqual('appleay', TPigLatin.Translate('apple'));
end;

procedure PigLatinTest.Word_beginning_with_a_vowel_and_followed_by_a_qu;
begin
  Assert.AreEqual('equalay', TPigLatin.Translate('equal'));
end;

procedure PigLatinTest.Word_beginning_with_ch;
begin
  Assert.AreEqual('airchay', TPigLatin.Translate('chair'));
end;

procedure PigLatinTest.Word_beginning_with_e;
begin
  Assert.AreEqual('earay', TPigLatin.Translate('ear'));
end;

procedure PigLatinTest.Word_beginning_with_i;
begin
  Assert.AreEqual('iglooay', TPigLatin.Translate('igloo'));
end;

procedure PigLatinTest.Word_beginning_with_k;
begin
  Assert.AreEqual('oalakay', TPigLatin.Translate('koala'));
end;

procedure PigLatinTest.Word_beginning_with_o;
begin
  Assert.AreEqual('objectay', TPigLatin.Translate('object'));
end;

procedure PigLatinTest.Word_beginning_with_p;
begin
  Assert.AreEqual('igpay', TPigLatin.Translate('pig'));
end;

procedure PigLatinTest.Word_beginning_with_qu;
begin
  Assert.AreEqual('eenquay', TPigLatin.Translate('queen'));
end;

procedure PigLatinTest.Word_beginning_with_qu_and_a_preceding_consonant;
begin
  Assert.AreEqual('aresquay', TPigLatin.Translate('square'));
end;

procedure PigLatinTest.Word_beginning_with_q_without_a_following_u;
begin
  Assert.AreEqual('atqay', TPigLatin.Translate('qat'));
end;

procedure PigLatinTest.Word_beginning_with_sch;
begin
  Assert.AreEqual('oolschay', TPigLatin.Translate('school'));
end;

procedure PigLatinTest.Word_beginning_with_th;
begin
  Assert.AreEqual('erapythay', TPigLatin.Translate('therapy'));
end;

procedure PigLatinTest.Word_beginning_with_thr;
begin
  Assert.AreEqual('ushthray', TPigLatin.Translate('thrush'));
end;

procedure PigLatinTest.Word_beginning_with_u;
begin
  Assert.AreEqual('underay', TPigLatin.Translate('under'));
end;

procedure PigLatinTest.Word_beginning_with_x;
begin
  Assert.AreEqual('enonxay', TPigLatin.Translate('xenon'));
end;

procedure PigLatinTest.Word_beginning_with_xr;
begin
  Assert.AreEqual('xrayay', TPigLatin.Translate('xray'));
end;

procedure PigLatinTest.y_as_second_letter_in_two_letter_word;
begin
  Assert.AreEqual('ymay', TPigLatin.Translate('my'));
end;

procedure PigLatinTest.y_is_treated_like_a_consonant_at_the_beginning_of_a_word;
begin
  Assert.AreEqual('ellowyay', TPigLatin.Translate('yellow'));
end;

procedure PigLatinTest.y_is_treated_like_a_vowel_at_the_end_of_a_consonant_cluster;
begin
  Assert.AreEqual('ythmrhay', TPigLatin.Translate('rhythm'));
end;

procedure PigLatinTest.Word_beginning_with_yt;
begin
  Assert.AreEqual('yttriaay', TPigLatin.Translate('yttria'));
end;

initialization
  TDUnitX.RegisterTestFixture(PigLatinTest);
end.
