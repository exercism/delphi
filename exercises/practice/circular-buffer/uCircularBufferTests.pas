unit uCircularBufferTests;

interface
uses
  DUnitX.TestFramework;

const
   CanonicalVersion = '1.0.1';

type

  [TestFixture]
  TestCircularBuffer = class(TObject)
  public
    [Test]
//  [Ignore('Comment the "[Ignore]" statement to run the test')]
    procedure reading_empty_buffer_should_fail;

    [Test]
    [Ignore]
    procedure can_read_an_item_just_written;

    [Test]
    [Ignore]
    procedure Write_and_read_back_multiple_items;

    [Test]
    [Ignore]
    procedure each_item_may_only_be_read_once;

    [Test]
    [Ignore]
    procedure items_are_read_in_the_order_they_are_written;

    [Test]
    [Ignore]
    procedure full_buffer_cannot_be_written_to;

    [Test]
    [Ignore]
    procedure a_read_frees_up_capacity_for_another_write;

    [Test]
    [Ignore]
    procedure read_position_is_maintained_even_across_multiple_writes;

    [Test]
    [Ignore]
    procedure items_cleared_out_of_buffer_cannot_be_read;

    [Test]
    [Ignore]
    procedure clear_frees_up_capacity_for_another_write;

    [Test]
    [Ignore]
    procedure clear_does_nothing_on_empty_buffer;

    [Test]
    [Ignore]
    procedure overwrite_acts_like_write_on_non_full_buffer;

    [Test]
    [Ignore]
    procedure overwrite_replaces_the_oldest_item_on_full_buffer;

    [Test]
    [Ignore]
    procedure overwrite_replaces_the_oldest_item_remaining_in_buffer_following_a_read;
  end;

implementation
uses System.SysUtils, uCircularBuffer;

procedure TestCircularBuffer.can_read_an_item_just_written;
var MyBuffer: ICircularBuffer<char>;
    Actual: char;
begin
  MyBuffer := TCircularBuffer<char>.Create(1);
  MyBuffer.Write('1');
  Actual := MyBuffer.Read;
  assert.AreEqual('1', Actual);
end;

procedure TestCircularBuffer.clear_does_nothing_on_empty_buffer;
var MyBuffer: ICircularBuffer<integer>;
    Actual: integer;
    MyProc: TTestLocalMethod;
begin
  MyBuffer := TCircularBuffer<integer>.Create(1);
  MyBuffer.Clear;

  MyProc := procedure
            begin
              MyBuffer.Write(1);
            end;

  Assert.WillNotRaise(MyProc, EInvalidOpException);

  Actual := MyBuffer.Read;
  Assert.AreEqual(1, Actual);
end;

procedure TestCircularBuffer.clear_frees_up_capacity_for_another_write;
var MyBuffer: ICircularBuffer<integer>;
    Actual: integer;
    MyProc: TTestLocalMethod;
begin
  MyBuffer := TCircularBuffer<integer>.Create(1);
  MyBuffer.Write(1);
  MyBuffer.Clear;

  MyProc := procedure
            begin
              MyBuffer.Write(2);
            end;

  Assert.WillNotRaise(MyProc, EInvalidOpException);

  Actual := MyBuffer.Read;
  Assert.AreEqual(2, Actual);
end;

procedure TestCircularBuffer.Write_and_read_back_multiple_items;
var MyBuffer: ICircularBuffer<char>;
    Act1, Act2: char;
    MyProc: TTestLocalMethod;
begin
  MyBuffer := TCircularBuffer<char>.Create(2);
  MyBuffer.Write('1');
  MyBuffer.Write('2');

  Act1 := MyBuffer.Read;
  Act2 := MyBuffer.Read;

  Assert.AreEqual('1', Act1);
  Assert.AreEqual('2', Act2);

  MyProc := procedure
            begin
              MyBuffer.Read;
            end;

  Assert.WillRaise(MyProc, EInvalidOpException);
end;

procedure TestCircularBuffer.items_cleared_out_of_buffer_cannot_be_read;
var MyBuffer: ICircularBuffer<char>;
    Act1, Act2: char;
    MyProc: TTestLocalMethod;
begin
  MyBuffer := TCircularBuffer<char>.Create(1);

  MyBuffer.Write('1');

  MyBuffer.Clear;

  MyProc := procedure
            begin
              MyBuffer.Read;
            end;
  Assert.WillRaise(MyProc, EInvalidOpException);
end;

procedure TestCircularBuffer.each_item_may_only_be_read_once;
var MyBuffer: ICircularBuffer<integer>;
    Actual: integer;
    MyProc: TTestLocalMethod;
begin
  MyBuffer := TCircularBuffer<integer>.Create(1);
  MyBuffer.Write(1);
  Actual := MyBuffer.Read;
  assert.AreEqual(1, Actual);
  MyProc := procedure
            begin
              MyBuffer.Read;
            end;
  Assert.WillRaise(MyProc, EInvalidOpException);
end;

procedure TestCircularBuffer.a_read_frees_up_capacity_for_another_write;
var MyBuffer: ICircularBuffer<integer>;
    Actual: integer;
    MyProc: TTestLocalMethod;
begin
  MyBuffer := TCircularBuffer<integer>.create(1);
  MyBuffer.Write(1);
  Actual := MyBuffer.Read;

  MyProc := procedure
            begin
              MyBuffer.Write(2);
            end;
  Assert.WillNotRaise(MyProc, EInvalidOpException);
  Actual := MyBuffer.Read;
  Assert.AreEqual(2, Actual);
end;

procedure TestCircularBuffer.read_position_is_maintained_even_across_multiple_writes;
var MyBuffer: ICircularBuffer<char>;
    Actual: char;
begin
  MyBuffer := TCircularBuffer<char>.create(3);
  MyBuffer.Write('1');
  MyBuffer.Write('2');
  Actual := MyBuffer.Read;
  Assert.AreEqual('1', Actual);

  MyBuffer.Write('3');

  Actual := MyBuffer.Read;
  Assert.AreEqual('2',Actual);
  Actual := MyBuffer.Read;
  Assert.AreEqual('3',Actual);
end;

procedure TestCircularBuffer.full_buffer_cannot_be_written_to;
var MyBuffer: ICircularBuffer<char>;
    MyProc: TTestLocalMethod;
begin
  MyBuffer := TCircularBuffer<char>.create(1);
  MyBuffer.Write('1');

  MyProc := procedure
            begin
              MyBuffer.Write('2');
            end;
  Assert.WillRaise(MyProc, EInvalidOpException);
end;

procedure TestCircularBuffer.overwrite_replaces_the_oldest_item_on_full_buffer;
var MyBuffer: ICircularBuffer<integer>;
    Act1, Act2: integer;
    MyProc: TTestLocalMethod;
begin
  MyBuffer := TCircularBuffer<integer>.create(2);
  MyBuffer.Write(1);
  MyBuffer.Write(2);
  MyBuffer.OverWrite(3);

  Act1 := MyBuffer.Read;
  Act2 := MyBuffer.Read;

  Assert.AreEqual(2, Act1);
  Assert.AreEqual(3, Act2);
end;

procedure TestCircularBuffer.overwrite_replaces_the_oldest_item_remaining_in_buffer_following_a_read;
var MyBuffer: ICircularBuffer<integer>;
    MyProc: TTestLocalMethod;
    Actual: integer;
begin
  MyBuffer := TCircularBuffer<integer>.create(3);
  MyBuffer.Write(1);
  MyBuffer.Write(2);
  MyBuffer.Write(3);

  Actual := MyBuffer.Read;
  Assert.AreEqual(1,Actual);

  MyBuffer.Write(4);
  MyBuffer.OverWrite(5);

  Actual := MyBuffer.Read;
  Assert.AreEqual(3,Actual);
  Actual := MyBuffer.Read;
  Assert.AreEqual(4,Actual);
  Actual := MyBuffer.Read;
  Assert.AreEqual(5,Actual);
end;

procedure TestCircularBuffer.reading_empty_buffer_should_fail;
var MyBuffer: ICircularBuffer<integer>;
    MyProc: TTestLocalMethod;
begin
  MyBuffer := TCircularBuffer<integer>.create(2);
  MyProc := procedure
            begin
              MyBuffer.Read;
            end;
  Assert.WillRaise(MyProc, EInvalidOpException);
end;

procedure TestCircularBuffer.overwrite_acts_like_write_on_non_full_buffer;
var MyBuffer: ICircularBuffer<char>;
    Act1, Act2: char;
    MyProc: TTestLocalMethod;
begin
  MyBuffer := TCircularBuffer<char>.create(2);
  MyBuffer.Write('1');
  MyBuffer.OverWrite('2');

  Act1 := MyBuffer.Read;
  Act2 := MyBuffer.Read;

  Assert.AreEqual('1', Act1);
  Assert.AreEqual('2', Act2);
  MyProc := procedure
            begin
              MyBuffer.Read;
            end;
  Assert.WillRaise(MyProc, EInvalidOpException);
end;

procedure TestCircularBuffer.items_are_read_in_the_order_they_are_written;
var MyBuffer: ICircularBuffer<char>;
    Act: TArray<char>;
begin
  SetLength(Act, 2);
  MyBuffer := TCircularBuffer<char>.create(2);
  MyBuffer.Write('1');
  MyBuffer.Write('2');

  Act[0] := MyBuffer.Read;
  Act[1] := MyBuffer.Read;

  Assert.AreEqual('1', Act[0]);
  Assert.AreEqual('2', Act[1]);
end;

initialization
  TDUnitX.RegisterTestFixture(TestCircularBuffer);
end.
