unit uOcrNumbers;

interface

uses System.Generics.Collections;

type

  TOcrNumbers = class
  public
    class function convert(AInp : TArray<string>) : string;
  end;

implementation

uses System.SysUtils;

{ TOcrNumbers }



class function TOcrNumbers.convert(AInp: TArray<string>) : string;
type
  TSegment = TList<string>;
var
  i, j: Integer;
  LResultList, LInpList : TList<string>;

  procedure CheckFormat(AInp: TArray<string>);
  var
    s: string;
  begin
    if Length(AInp) mod 4 <> 0 then
      raise EArgumentException.Create('Number of input lines is not a multiple of four');

    for s in Ainp do
      if s.Length mod 3 <> 0 then
        raise EArgumentException.Create('Number of input columns is not a multiple of three');
  end;

  function RecogniseDigit(ADigit: Tarray<string>): char;
  type
    TDState = (Err, S1, S1_4, S2_3, S4, S5_6, S7, S8_9, S0, SOther);
  var
    DS : TDState;

    function CheckFirstRow(ARow : string) : TDState;
    begin
      Result := Err;
      if ARow = '   ' then
        Result := S1_4
      else
        if ARow = ' _ ' then
          Result := SOther
    end;

    function CheckSecondRow(ARow : string; ASt : TDState) : TDState;
    begin
      Result := Err;
      case ASt of
        S1_4:
          if ARow = '  |' then
            Result := S1
          else if ARow = '|_|' then
            Result := S4;
      SOther:
          if ARow = ' _|' then
            Result := S2_3
          else
            if ARow = '|_ ' then
              Result := S5_6
          else
            if ARow = '  |' then
              Result := S7
          else
            if ARow = '|_|' then
              Result := S8_9
          else
            if ARow = '| |' then
              result := S0;
      end;
    end;

    function CheckThirdRow(ARow : string; ASt : TDState) : char;
    begin
      Result := '?';
      case ASt of
        S1:
          if ARow = '  |' then
            result := '1';
        S2_3:
          if ARow = '|_ ' then
            result := '2'
          else
            if ARow = ' _|' then
              result := '3';
        S4:
          if ARow = '  |' then
            result := '4';
        S5_6:
          if ARow = ' _|' then
            result := '5'
          else
            if ARow = '|_|' then
              result := '6';
        S7:
          if ARow = '  |' then
            result := '7';
        S8_9:
          if ARow = '|_|' then
            result := '8'
          else
            if ARow = ' _|' then
              result := '9';
        S0:
          if ARow = '|_|' then
            result := '0';
      end;
    end;

  begin
    DS := CheckFirstRow(ADigit[0]);
    if DS = Err then
      exit('?');
    DS := CheckSecondRow(ADigit[1], DS);
    if DS = Err then
      exit('?');
    result := CheckThirdRow(ADigit[2], DS);
    if Trim(ADigit[3]) <> '' then
      Result := '?'
  end;

  function SliceToSegments(AInp: TArray<string>) : TObjectList<TSegment>;
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
        Seg.Add(copy(AInp[j], i + 1, 3));
      i := i + 3;
      Result.Add(Seg);
    end;
  end;

  function RecogniseNumber(AInp: TArray<string>): string;
  var
    Segment : TSegment;
    Segments : TObjectList<TSegment>;
  begin
    Result := '';
    Segments := SliceToSegments(AInp);
    for Segment in Segments do
      Result := Result + RecogniseDigit(Segment.ToArray);
    Segments.DisposeOf;
  end;

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

end.
