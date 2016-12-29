unit uCircularBuffer;

interface
uses System.SysUtils, System.Generics.Collections;

type
  ICircularBuffer<T> = interface(IInvokable)
  ['{E3531870-DA5D-451A-9E7A-86B1C46B4D29}']
    function Read: T;
    procedure Write(aValue: T);
    procedure ForceWrite(aValue: T);
    procedure Clear;
  end;

  TCircularBuffer<T> = class(TInterfacedObject, ICircularBuffer<T>)
  private
    FSize: integer;
    FBuffer: TQueue<T>;
  public
    constructor create(aSize: integer);
    destructor destroy;
    function Read: T;
    procedure Write(aValue: T);
    procedure ForceWrite(aValue: T);
    procedure Clear;
  end;

implementation

constructor TCircularBuffer<T>.Create(aSize: integer);
begin
  inherited create;
  FSize := aSize;
  FBuffer := TQueue<T>.Create;
end;

destructor TCircularBuffer<T>.Destroy;
begin
  FBuffer.Clear;
  FBuffer.Free;
  inherited;
end;

function TCircularBuffer<T>.Read: T;
begin
  if FBuffer.Count = 0 then
    raise EInvalidOpException.Create('Cannot read from empty buffer');

  result := FBuffer.Dequeue;
end;

procedure TCircularBuffer<T>.Write(aValue: T);
begin
  if FBuffer.Count = FSize then
    raise EInvalidOpException.Create('Cannot write to full buffer');

  FBuffer.Enqueue(aValue);
end;

procedure TCircularBuffer<T>.ForceWrite(aValue: T);
begin
  if FBuffer.Count = FSize then
    FBuffer.Dequeue;
  FBuffer.Enqueue(aValue);
end;

procedure TCircularBuffer<T>.Clear;
begin
  FBuffer.Clear;
end;

end.
