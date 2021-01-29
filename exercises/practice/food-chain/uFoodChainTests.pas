unit uFoodChainTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '2.1.0.1';

type

  [TestFixture]
  TFoodChainTest = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure fly;

    [Test]
    [Ignore]
    procedure spider;

    [Test]
    [Ignore]
    procedure bird;

    [Test]
    [Ignore]
    procedure cat;

    [Test]
    [Ignore]
    procedure dog;

    [Test]
    [Ignore]
    procedure goat;

    [Test]
    [Ignore]
    procedure cow;

    [Test]
    [Ignore]
    procedure horse;

    [Test]
    [Ignore]
    procedure multiple_verses;

    [Test]
    [Ignore]
    procedure full_song;
  end;

implementation

uses
  uFoodChain;

procedure TFoodChainTest.spider;
begin
  Assert.AreEqual('I know an old lady who swallowed a spider.' + '\n' +
            'It wriggled and jiggled and tickled inside her.' + '\n' +
            'She swallowed the spider to catch the fly.' + '\n' +
            'I don''t know why she swallowed the fly. Perhaps she''ll die.',
    TFoodChain.Recite(2, 2));
end;

procedure TFoodChainTest.bird;
begin
  Assert.AreEqual('I know an old lady who swallowed a bird.' + '\n' +
            'How absurd to swallow a bird!' + '\n' +
            'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.' + '\n' +
            'She swallowed the spider to catch the fly.' + '\n' +
            'I don''t know why she swallowed the fly. Perhaps she''ll die.',
    TFoodChain.Recite(3, 3));
end;

procedure TFoodChainTest.cat;
begin
   Assert.AreEqual('I know an old lady who swallowed a cat.' + '\n' +
            'Imagine that, to swallow a cat!' + '\n' +
            'She swallowed the cat to catch the bird.' + '\n' +
            'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.' + '\n' +
            'She swallowed the spider to catch the fly.' + '\n' +
            'I don''t know why she swallowed the fly. Perhaps she''ll die.',
    TFoodChain.Recite(4, 4));
end;

procedure TFoodChainTest.cow;
begin
Assert.AreEqual('I know an old lady who swallowed a cow.' + '\n' +
            'I don''t know how she swallowed a cow!' + '\n' +
            'She swallowed the cow to catch the goat.' + '\n' +
            'She swallowed the goat to catch the dog.' + '\n' +
            'She swallowed the dog to catch the cat.'  + '\n' +
            'She swallowed the cat to catch the bird.' + '\n' +
            'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.' + '\n' +
            'She swallowed the spider to catch the fly.' + '\n' +
            'I don''t know why she swallowed the fly. Perhaps she''ll die.',
    TFoodChain.Recite(7, 7));
end;

procedure TFoodChainTest.dog;
begin
   Assert.AreEqual('I know an old lady who swallowed a dog.' + '\n' +
            'What a hog, to swallow a dog!' + '\n' +
            'She swallowed the dog to catch the cat.'  + '\n' +
            'She swallowed the cat to catch the bird.' + '\n' +
            'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.' + '\n' +
            'She swallowed the spider to catch the fly.' + '\n' +
            'I don''t know why she swallowed the fly. Perhaps she''ll die.',
    TFoodChain.Recite(5, 5));
end;

procedure TFoodChainTest.fly;
begin
  Assert.AreEqual('I know an old lady who swallowed a fly.\nI don''t know why she swallowed the fly. Perhaps she''ll die.',
    TFoodChain.Recite(1, 1));
end;

procedure TFoodChainTest.full_song;
begin
  Assert.AreEqual('I know an old lady who swallowed a fly.\nI don''t know why she swallowed the fly. Perhaps she''ll die.' + '\n' +
            '\n' +
            'I know an old lady who swallowed a spider.' + '\n' +
            'It wriggled and jiggled and tickled inside her.' + '\n' +
            'She swallowed the spider to catch the fly.' + '\n' +
            'I don''t know why she swallowed the fly. Perhaps she''ll die.' + '\n' +
            '\n' +
            'I know an old lady who swallowed a bird.' + '\n' +
            'How absurd to swallow a bird!' + '\n' +
            'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.' + '\n' +
            'She swallowed the spider to catch the fly.' + '\n' +
            'I don''t know why she swallowed the fly. Perhaps she''ll die.' + '\n' +
            '\n' +
            'I know an old lady who swallowed a cat.' + '\n' +
            'Imagine that, to swallow a cat!' + '\n' +
            'She swallowed the cat to catch the bird.' + '\n' +
            'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.' + '\n' +
            'She swallowed the spider to catch the fly.' + '\n' +
            'I don''t know why she swallowed the fly. Perhaps she''ll die.' + '\n' +
            '\n' +
            'I know an old lady who swallowed a dog.' + '\n' +
            'What a hog, to swallow a dog!' + '\n' +
            'She swallowed the dog to catch the cat.'  + '\n' +
            'She swallowed the cat to catch the bird.' + '\n' +
            'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.' + '\n' +
            'She swallowed the spider to catch the fly.' + '\n' +
            'I don''t know why she swallowed the fly. Perhaps she''ll die.' + '\n' +
            '\n' +
            'I know an old lady who swallowed a goat.' + '\n' +
            'Just opened her throat and swallowed a goat!' + '\n' +
            'She swallowed the goat to catch the dog.' + '\n' +
            'She swallowed the dog to catch the cat.'  + '\n' +
            'She swallowed the cat to catch the bird.' + '\n' +
            'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.' + '\n' +
            'She swallowed the spider to catch the fly.' + '\n' +
            'I don''t know why she swallowed the fly. Perhaps she''ll die.' + '\n' +
            '\n' +
            'I know an old lady who swallowed a cow.' + '\n' +
            'I don''t know how she swallowed a cow!' + '\n' +
            'She swallowed the cow to catch the goat.' + '\n' +
            'She swallowed the goat to catch the dog.' + '\n' +
            'She swallowed the dog to catch the cat.'  + '\n' +
            'She swallowed the cat to catch the bird.' + '\n' +
            'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.' + '\n' +
            'She swallowed the spider to catch the fly.' + '\n' +
            'I don''t know why she swallowed the fly. Perhaps she''ll die.' + '\n' +
            '\n' +
            'I know an old lady who swallowed a horse.' + '\n' +
            'She''s dead, of course!',
    TFoodChain.Recite(1, 8));
end;

procedure TFoodChainTest.goat;
begin
Assert.AreEqual('I know an old lady who swallowed a goat.' + '\n' +
            'Just opened her throat and swallowed a goat!' + '\n' +
            'She swallowed the goat to catch the dog.' + '\n' +
            'She swallowed the dog to catch the cat.'  + '\n' +
            'She swallowed the cat to catch the bird.' + '\n' +
            'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.' + '\n' +
            'She swallowed the spider to catch the fly.' + '\n' +
            'I don''t know why she swallowed the fly. Perhaps she''ll die.',
    TFoodChain.Recite(6, 6));
end;

procedure TFoodChainTest.horse;
begin
  Assert.AreEqual('I know an old lady who swallowed a horse.' + '\n' +
            'She''s dead, of course!',
    TFoodChain.Recite(8, 8));
end;

procedure TFoodChainTest.multiple_verses;
begin
 Assert.AreEqual('I know an old lady who swallowed a fly.\nI don''t know why she swallowed the fly. Perhaps she''ll die.' + '\n' +
            '\n' +
            'I know an old lady who swallowed a spider.' + '\n' +
            'It wriggled and jiggled and tickled inside her.' + '\n' +
            'She swallowed the spider to catch the fly.' + '\n' +
            'I don''t know why she swallowed the fly. Perhaps she''ll die.' + '\n' +
            '\n' +
            'I know an old lady who swallowed a bird.' + '\n' +
            'How absurd to swallow a bird!' + '\n' +
            'She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.' + '\n' +
            'She swallowed the spider to catch the fly.' + '\n' +
            'I don''t know why she swallowed the fly. Perhaps she''ll die.',
    TFoodChain.Recite(1, 3));
end;

initialization
  TDUnitX.RegisterTestFixture(TFoodChainTest);
end.
