unit uTriangle; 
 
interface 
 
type 
  TriangleKind = (Equilateral, Isosceles, Scalene); 
 
  Triangle = class 
  private 
    class function AllSidesAreZero(aSide1, aSide2, aSide3: double): boolean; static; 
    class function HasImpossibleSides(aSide1, aSide2, aSide3: double): boolean; static; 
    class function ViolatesTriangleInequality(aSide1, aSide2, aSide3: double): boolean; static; 
    class function UniqueSides(aSide1, aSide2, aSide3: double): integer; static; 
  public 
    class function Sides(aIsKind: TriangleKind; aSide1, aSide2, aSide3: double): boolean; static; 
  end; 
 
implementation 
uses System.SysUtils; 
 
class function Triangle.AllSidesAreZero(aSide1, aSide2, aSide3: double): boolean; 
begin 
  result := (aSide1 = 0) and (aSide2 = 0) and (aSide3 = 0); 
end; 
 
class function Triangle.HasImpossibleSides(aSide1, aSide2, aSide3: double): boolean; 
begin 
  result := (aSide1 < 0) or (aSide2 < 0) or (aSide3 < 0); 
end; 
 
class function Triangle.ViolatesTriangleInequality(aSide1, aSide2, aSide3: double): boolean; 
begin 
  result := (aSide1 + aSide2 <= aSide3) or (aSide1 + aSide3 <= aSide2) or (aSide2 + aSide3 <= aSide1); 
end; 
 
class function Triangle.UniqueSides(aSide1, aSide2, aSide3: double): integer; 
begin 
  result := 1; 
  if (aSide1 <> aSide2) and (aSide1 <> aSide3) then 
    inc(result); 
  if (aSide2 <> aSide1) and (aSide2 <> aSide3) then 
    inc(result); 
  if (aSide3 <> aSide2) and (aSide3 <> aSide1) then 
    inc(result); 
  if result > 3 then 
    result := 3; 
end; 
 
class function Triangle.Sides(aIsKind: TriangleKind; aSide1, aSide2, aSide3: double): boolean; 
var luniqueSides: integer; 
begin 
  result := false; 
  if not (AllSidesAreZero(aSide1, aSide2, aSide3) or 
          ViolatesTriangleInequality(aSide1, aSide2, aSide3) or 
          HasImpossibleSides(aSide1, aSide2, aSide3)) then 
  begin 
    luniqueSides := UniqueSides(aSide1, aSide2, aSide3); 
    result := ((luniqueSides = 1) and (aIsKind in [Equilateral, Isosceles])) or 
              ((luniqueSides = 2) and (aIsKind = Isosceles)) or 
              ((aIsKind = Scalene) and (luniqueSides = 3)); 
  end; 
end; 
 
end. 