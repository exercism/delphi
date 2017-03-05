unit uCircularBufferTests;

interface
uses
  DUnitX.TestFramework;

type

  [TestFixture]
  TestCircularBuffer = class(TObject)
  public
    [Test]
    procedure Write_and_read_back_one_item;

    [Test]
    [Ignore('Comment these lines to run these tests')]
    procedure Write_and_read_back_multiple_items;

    [Test]
    [Ignore]
    procedure Clearing_buffer;

    [Test]
    [Ignore]
    procedure Alternate_write_and_read;

    [Test]
    [Ignore]
    procedure Reads_back_oldest_item;

    [Test]
    [Ignore]
    procedure Writing_to_a_full_buffer_throws_an_exception;

    [Test]
    [Ignore]
    procedure Overwriting_oldest_item_in_a_full_buffer;

    [Test]
    [Ignore]
    procedure Forced_writes_to_non_full_buffer_should_behave_like_writes;

    [Test]
    [Ignore]
    procedure Alternate_read_and_write_into_buffer_overflow;
  end;

implementation
uses System.SysUtils, uCircularBuffer;

procedure TestCircularBuffer.Write_and_read_back_one_item;
var MyBuffer: ICircularBuffer<char>;
    Actual: char;
begin
  MyBuffer := TCircularBuffer<char>.Create(1);
  MyBuffer.Write('1');
  Actual := MyBuffer.Read;
  assert.AreEqual('1', Actual);
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

procedure TestCircularBuffer.Clearing_buffer;
var MyBuffer: ICircularBuffer<char>;
    Act1, Act2: char;
    MyProc: TTestLocalMethod;
begin
  MyBuffer := TCircularBuffer<char>.Create(3);

  MyBuffer.Write('1');
  MyBuffer.Write('2');
  MyBuffer.Write('3');

  MyBuffer.Clear;

  MyProc := procedure
            begin
              MyBuffer.Read;
            end;
  Assert.WillRaise(MyProc, EInvalidOpException);

  MyBuffer.Write('1');
  MyBuffer.Write('2');

  Act1 := MyBuffer.Read;
  MyBuffer.Write('3');
  Act2 := MyBuffer.Read;

  Assert.AreEqual('1', Act1);
  Assert.AreEqual('2', Act2);
end;

procedure TestCircularBuffer.Alternate_write_and_read;
var MyBuffer: ICircularBuffer<char>;
    Act1, Act2: char;
begin
  MyBuffer := TCircularBuffer<char>.create(2);
  MyBuffer.Write('1');
  Act1 := MyBuffer.Read;
  MyBuffer.Write('2');
  Act2 := MyBuffer.Read;

  Assert.AreEqual('1', Act1);
  Assert.AreEqual('2', Act2);
end;

procedure TestCircularBuffer.Reads_back_oldest_item;
var MyBuffer: ICircularBuffer<char>;
    Act1, Act2, Act3: char;
begin
  MyBuffer := TCircularBuffer<char>.create(3);
  MyBuffer.Write('1');
  MyBuffer.Write('2');
  Act1 := MyBuffer.Read;

  MyBuffer.Write('3');
  Act2 := MyBuffer.Read;
  Act3 := MyBuffer.Read;

  Assert.AreEqual('2', Act2);
  Assert.AreEqual('3', Act3);
end;

procedure TestCircularBuffer.Writing_to_a_full_buffer_throws_an_exception;
var MyBuffer: ICircularBuffer<char>;
    MyProc: TTestLocalMethod;
begin
  MyBuffer := TCircularBuffer<char>.create(2);
  MyBuffer.Write('1');
  MyBuffer.Write('2');

  MyProc := procedure
            begin
              MyBuffer.Write('A');
            end;
  Assert.WillRaise(MyProc, EInvalidOpException);
end;

procedure TestCircularBuffer.Overwriting_oldest_item_in_a_full_buffer;
var MyBuffer: ICircularBuffer<char>;
    Act1, Act2: char;
    MyProc: TTestLocalMethod;
begin
  MyBuffer := TCircularBuffer<char>.create(2);
  MyBuffer.Write('1');
  MyBuffer.Write('2');
  MyBuffer.ForceWrite('A');

  Act1 := MyBuffer.Read;
  Act2 := MyBuffer.Read;

  Assert.AreEqual('2', Act1);
  Assert.AreEqual('A', Act2);
  MyProc := procedure
            begin
              MyBuffer.Read;
            end;
  Assert.WillRaise(MyProc, EInvalidOpException);
end;

procedure TestCircularBuffer.Forced_writes_to_non_full_buffer_should_behave_like_writes;
var MyBuffer: ICircularBuffer<char>;
    Act1, Act2: char;
    MyProc: TTestLocalMethod;
begin
  MyBuffer := TCircularBuffer<char>.create(2);
  MyBuffer.Write('1');
  MyBuffer.ForceWrite('2');

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

procedure TestCircularBuffer.Alternate_read_and_write_into_buffer_overflow;
var MyBuffer: ICircularBuffer<char>;
    Act: TArray<char>;
    MyProc: TTestLocalMethod;
begin
  SetLength(Act, 8);
  MyBuffer := TCircularBuffer<char>.create(5);
  MyBuffer.Write('1');
  MyBuffer.Write('2');
  MyBuffer.Write('3');

  Act[0] := MyBuffer.Read;
  Act[1] := MyBuffer.Read;
  MyBuffer.Write('4');
  Act[2] := MyBuffer.Read;

  MyBuffer.Write('5');
  MyBuffer.Write('6');
  MyBuffer.Write('7');
  MyBuffer.Write('8');

  MyBuffer.ForceWrite('A');
  MyBuffer.ForceWrite('B');

  Act[3] := MyBuffer.Read;
  Act[4] := MyBuffer.Read;
  Act[5] := MyBuffer.Read;
  Act[6] := MyBuffer.Read;
  Act[7] := MyBuffer.Read;

  Assert.AreEqual('6', Act[3]);
  Assert.AreEqual('7', Act[4]);
  Assert.AreEqual('8', Act[5]);
  Assert.AreEqual('A', Act[6]);
  Assert.AreEqual('B', Act[7]);

  MyProc := procedure
            begin
              MyBuffer.Read;
            end;
  Assert.WillRaise(MyProc, EInvalidOpException);
end;

initialization
  TDUnitX.RegisterTestFixture(TestCircularBuffer);
end.
