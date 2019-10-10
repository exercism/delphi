unit uAtbashCipherTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.2.0.1';

type
  [TestFixture('Test encoding from English to atbash')]
  TAtbashCipherEncodeTest = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure encode_yes;

    [Test]
    [Ignore]
    procedure encode_no;

    [Test]
    [Ignore]
    procedure encode_OMG;

    [Test]
    [Ignore]
    procedure encode_spaces;

    [Test]
    [Ignore]
    procedure encode_mindblowingly;

    [Test]
    [Ignore]
    procedure encode_numbers;

    [Test]
    [Ignore]
    procedure encode_deep_thought;

    [Test]
    [Ignore]
    procedure encode_all_the_letters;
  end;

  [TestFixture('Test decoding from atbash to English')]
  TAtbashCipherDecodeTest = class(TObject)
  public
    [Test]
    [Ignore]
    procedure decode_exercism;

    [Test]
    [Ignore]
    procedure decode_a_sentence;

    [Test]
    [Ignore]
    procedure decode_numbers;

    [Test]
    [Ignore]
    procedure decode_all_the_letters;

    [Test]
    [Ignore]
    procedure decode_with_too_many_spaces;

    [Test]
    [Ignore]
    procedure decode_with_no_spaces;
  end;

implementation
uses uAtbashCipher;

procedure TAtbashCipherEncodeTest.encode_all_the_letters;
begin
  Assert.AreEqual('gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt', TAtbashCipher.Encode('The quick brown fox jumps over the lazy dog.'));
end;

procedure TAtbashCipherEncodeTest.encode_deep_thought;
begin
  Assert.AreEqual('gifgs rhurx grlm', TAtbashCipher.Encode('Truth is fiction.'));
end;

procedure TAtbashCipherEncodeTest.encode_mindblowingly;
begin
  Assert.AreEqual('nrmwy oldrm tob', TAtbashCipher.Encode('mindblowingly'));
end;

procedure TAtbashCipherEncodeTest.encode_no;
begin
  Assert.AreEqual('ml', TAtbashCipher.Encode('no'));
end;

procedure TAtbashCipherEncodeTest.encode_numbers;
begin
  Assert.AreEqual('gvhgr mt123 gvhgr mt', TAtbashCipher.Encode('Testing,1 2 3, testing.'));
end;

procedure TAtbashCipherEncodeTest.encode_OMG;
begin
  Assert.AreEqual('lnt', TAtbashCipher.Encode('OMG'));
end;

procedure TAtbashCipherEncodeTest.encode_spaces;
begin
  Assert.AreEqual('lnt', TAtbashCipher.Encode('O M G'));
end;

procedure TAtbashCipherEncodeTest.encode_yes;
begin
  Assert.AreEqual('bvh', TAtbashCipher.Encode('yes'));
end;

procedure TAtbashCipherDecodeTest.decode_all_the_letters;
begin
  Assert.AreEqual('thequickbrownfoxjumpsoverthelazydog', TAtbashCipher.Decode('gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt'));
end;

procedure TAtbashCipherDecodeTest.decode_a_sentence;
begin
  Assert.AreEqual('exercism', TAtbashCipher.Decode('vcvix rhn'));
end;

procedure TAtbashCipherDecodeTest.decode_exercism;
begin
  Assert.AreEqual('anobstacleisoftenasteppingstone', TAtbashCipher.Decode('zmlyh gzxov rhlug vmzhg vkkrm thglm v'));
end;

procedure TAtbashCipherDecodeTest.decode_numbers;
begin
  Assert.AreEqual('testing123testing', TAtbashCipher.Decode('gvhgr mt123 gvhgr mt'));
end;

procedure TAtbashCipherDecodeTest.decode_with_no_spaces;
begin
  Assert.AreEqual('anobstacleisoftenasteppingstone', TAtbashCipher.Decode('zmlyhgzxovrhlugvmzhgvkkrmthglmv'));
end;

procedure TAtbashCipherDecodeTest.decode_with_too_many_spaces;
begin
  Assert.AreEqual('exercism', TAtbashCipher.Decode('vc vix    r hn'));
end;

initialization
  TDUnitX.RegisterTestFixture(TAtbashCipherEncodeTest);
  TDUnitX.RegisterTestFixture(TAtbashCipherDecodeTest);
end.
