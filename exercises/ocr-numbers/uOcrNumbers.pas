unit uOcrNumbers;

interface

uses System.Generics.Collections;

type

  TSegment = TList<string>;

  TOcrNumbers = class
  private
    class procedure CheckFormat(AInp : TArray<string>);
    class function RecogniseNumber(AInp : TArray<string>) : string;
    class function RecogniseDigit(ADigit : TArray<string>): char;
    class function SliceToSegments(AInp : TArray<string>) : TObjectList<TSegment>;
  public
    class function convert(AInp : TArray<string>) : string;
  end;

implementation

uses System.SysUtils;

{ TOcrNumbers }

class procedure TOcrNumbers.CheckFormat(AInp: TArray<string>);
var s: string;
begin
  if Length(AInp) mod 4 <> 0 then
    raise EArgumentException.Create('Number of input lines is not a multiple of four');

  for s in Ainp do
    if s.Length mod 3 <> 0 then
      raise EArgumentException.Create('Number of input columns is not a multiple of three');
end;

class function TOcrNumbers.convert(AInp: TArray<string>) : string;
var
  i, j: Integer;
  LResultList, LInpList : TList<string>;

begin
  CheckFormat(AInp);

  LResultList :=  TList<string>.Create;
  LInpList := TList<string>.Create;
  for i := 0 to Length(AInp) div 4 - 1 do
  begin
    LInpList := TList<string>.Create;
    for j := 0 to 3 do
      LInpList.Add(AInp[i * 4 + j]);

    LResultList.Add(RecogniseNumber(LInpList.ToArray));
    LInpList.Clear;
  end;
  Result := string.Join(',', LResultList.ToArray);

  LInpList.DisposeOf;
  LResultList.DisposeOf;
end;

class function TOcrNumbers.RecogniseDigit(ADigit: Tarray<string>): char;

type DState = (S1_4, S2_3, S5_6, S7, S8_9, S0, SOther, One, Four);

var DS : DState;
begin
  if ADigit[0] = '   ' then
    DS := S1_4
  else if ADigit[0] = ' _ ' then
    DS := SOther
  else
    exit('?');

  case ds of
    S1_4:
      if ADigit[1] = '  |' then
        DS := One
      else if ADigit[1] = '|_|' then
        ds := Four
      else
        exit('?');
    SOther:
      if ADigit[1] = ' _|' then
        DS := S2_3
      else if ADigit[1] = '|_ ' then
        ds := S5_6
      else if ADigit[1] = '  |' then
        ds := S7
      else if ADigit[1] = '|_|' then
        ds := S8_9
      else if ADigit[1] = '| |' then
        ds := S0
      else
        exit('?');
  end;
  result := '?';
  case ds of
    S2_3:
      if ADigit[2] = '|_ ' then
        result := '2'
      else if ADigit[2] = ' _|' then
        result := '3';
    S5_6: if ADigit[2] = ' _|' then
        result := '5'
      else if ADigit[2] = '|_|' then
        result := '6';
    S7:
      if ADigit[2] = '  |' then
        result := '7';
    S8_9:
      if ADigit[2] = '|_|' then
        result := '8'
      else if ADigit[2] = ' _|' then
        result := '9';
    S0: if ADigit[2] = '|_|' then
        result := '0';
    One:
      if ADigit[2] = '  |' then
        result := '1';
    Four:
      if ADigit[2] = '  |' then
        result := '4';
  end;
end;

class function TOcrNumbers.RecogniseNumber(AInp: TArray<string>): string;
var Segment : TSegment;
  Segments : TObjectList<TSegment>;
begin
  Result := '';
  Segments := SliceToSegments(AInp);
  for Segment in Segments do
    Result := Result + RecogniseDigit(Segment.ToArray);
  Segments.DisposeOf;
end;

class function TOcrNumbers.SliceToSegments(AInp: TArray<string>) : TObjectList<TSegment>;
var
  i, j: Integer;
  Seg : TSegment;
begin
  Result := TObjectList<TSegment>.Create(True);
  i := 0;
  while i < Length(AInp[0]) do
  begin
    Seg := TSegment.Create;
    for j := 0 to 3 do
    begin
      Seg.Add(copy(AInp[j], i + 1, 3));
    end;
    i := i + 3;
    Result.Add(Seg);
  end;
end;

end.
