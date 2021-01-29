unit uMarkdownTests;

interface
uses
  DUnitX.TestFramework;

const
  CanonicalVersion = '1.4.0.1';

type
  [TestFixture]
  TMyTestObject = class(TObject)
  public
    [Test]
//    [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure parses_normal_text_as_a_paragraph;

    [Test]
    [Ignore]
    procedure parsing_italics;

    [Test]
    [Ignore]
    procedure parsing_bold_text;

    [Test]
    [Ignore]
    procedure mixed_normal_italics_and_bold_text;

    [Test]
    [Ignore]
    procedure with_h1_header_level;

    [Test]
    [Ignore]
    procedure with_h2_header_level;

    [Test]
    [Ignore]
    procedure with_h6_header_level;

    [Test]
    [Ignore]
    procedure unordered_lists;

    [Test]
    [Ignore]
    procedure  with_a_little_bit_of_everything;

    [Test]
    [Ignore]
    procedure with_markdown_symbols_in_the_header_text_that_should_not_be_interpreted;

    [Test]
    [Ignore]
    procedure with_markdown_symbols_in_the_list_item_text_that_should_not_be_interpreted;

    [Test]
    [Ignore]
    procedure with_markdown_symbols_in_the_paragraph_text_that_should_not_be_interpreted;

    [Test]
    [Ignore]
    procedure unordered_lists_close_properly_with_preceding_and_following_lines;
  end;

implementation
uses
  uMarkDown;

procedure TMyTestObject.parsing_bold_text;
begin
  Assert.AreEqual('<p><strong>This will be bold</strong></p>',
    TMarkdown.Parse('__This will be bold__'));
end;

procedure TMyTestObject.parsing_italics;
begin
  Assert.AreEqual('<p><em>This will be italic</em></p>',
    TMarkdown.Parse('_This will be italic_'));
end;

procedure TMyTestObject.unordered_lists;
begin
  Assert.AreEqual('<ul><li>Item 1</li><li>Item 2</li></ul>',
    TMarkdown.Parse('* Item 1\n* Item 2'));
end;

procedure TMyTestObject.unordered_lists_close_properly_with_preceding_and_following_lines;
begin
  Assert.AreEqual('<h1>Start a list</h1><ul><li>Item 1</li><li>Item 2</li></ul><p>End a list</p>',
    TMarkdown.Parse('# Start a list\n* Item 1\n* Item 2\nEnd a list'));
end;

procedure TMyTestObject.with_a_little_bit_of_everything;
begin
  Assert.AreEqual('<h1>Header!</h1><ul><li><strong>Bold Item</strong></li><li><em>Italic Item</em></li></ul>',
    TMarkdown.Parse('# Header!\n* __Bold Item__\n* _Italic Item_'));
end;

procedure TMyTestObject.with_h1_header_level;
begin
  Assert.AreEqual('<h1>This will be an h1</h1>', TMarkdown.Parse('# This will be an h1'));
end;

procedure TMyTestObject.with_h2_header_level;
begin
  Assert.AreEqual('<h2>This will be an h2</h2>',
    TMarkdown.Parse('## This will be an h2'));
end;

procedure TMyTestObject.with_h6_header_level;
begin
  Assert.AreEqual('<h6>This will be an h6</h6>',
    TMarkdown.Parse('###### This will be an h6'));
end;

procedure TMyTestObject.with_markdown_symbols_in_the_header_text_that_should_not_be_interpreted;
begin
  Assert.AreEqual('<h1>This is a header with # and * in the text</h1>',
    TMarkdown.Parse('# This is a header with # and * in the text'));
end;

procedure TMyTestObject.with_markdown_symbols_in_the_list_item_text_that_should_not_be_interpreted;
begin
  Assert.AreEqual('<ul><li>Item 1 with a # in the text</li><li>Item 2 with * in the text</li></ul>',
    TMarkdown.Parse('* Item 1 with a # in the text\n* Item 2 with * in the text'));
end;

procedure TMyTestObject.with_markdown_symbols_in_the_paragraph_text_that_should_not_be_interpreted;
begin
  Assert.AreEqual('<p>This is a paragraph with # and * in the text</p>',
    TMarkdown.Parse('This is a paragraph with # and * in the text'));
end;

procedure TMyTestObject.mixed_normal_italics_and_bold_text;
begin
  Assert.AreEqual('<p>This will <em>be</em> <strong>mixed</strong></p>',
    TMarkdown.Parse('This will _be_ __mixed__'));
end;

procedure TMyTestObject.parses_normal_text_as_a_paragraph;
begin
  Assert.AreEqual('<p>This will be a paragraph</p>',
    TMarkdown.Parse('This will be a paragraph'));
end;

initialization
  TDUnitX.RegisterTestFixture(TMyTestObject);
end.
