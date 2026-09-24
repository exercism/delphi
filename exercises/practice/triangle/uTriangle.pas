unit uTriangle;

interface

type
  TriangleKind = (Equilateral, Isosceles, Scalene);

  Triangle = class
  public
    class function Sides(aIsKind: TriangleKind; aSide1, aSide2, aSide3: double): boolean; static;
  end;

implementation
     // Provide your implementation here
end.