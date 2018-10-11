unit uQueenAttack;

interface

uses
  System.Types;

type
  TQueen = record
  private
    FPos : TPoint;
  public
    constructor Create(ARow, ACol : integer; var ASuccess : integer);
    function CanAttack(ABlackQueen : TQueen) : boolean;
  end;

implementation

uses
  System.SysUtils;

{ TQueen }

function TQueen.CanAttack(ABlackQueen: TQueen): boolean;
begin
  Result := (FPos.X = ABlackQueen.FPos.X) or
    (FPos.Y = ABlackQueen.FPos.Y) or
    (abs(FPos.X - FPos.Y) = abs(ABlackQueen.FPos.X - ABlackQueen.FPos.Y)) or
    (FPos.X + FPos.Y = ABlackQueen.FPos.X + ABlackQueen.FPos.Y);
end;

constructor TQueen.Create(ARow, ACol: integer; var ASuccess : integer);
begin
  ASuccess := -1;
  if ARow < 0 then
    raise EArgumentException.Create('queen must have positive row');
  if ARow > 7 then
    raise EArgumentException.Create('queen must have row on board');
  if ACol < 0 then
    raise EArgumentException.Create('queen must have positive column');
  if ACol > 7 then
    raise EArgumentException.Create('queen must have column on board');
  ASuccess := 0;
  FPos := TPoint.Create(ARow, ACol);
end;

end.
