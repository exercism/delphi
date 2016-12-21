unit uETL;

interface
uses System.Generics.Collections;

type
  ETL = class
    class function Transform(old: TDictionary<integer, TList<string>>): TDictionary<string, integer>;
  end;

implementation
uses SysUtils;

class function ETL.Transform(old: TDictionary<Integer,TList<System.string>>): TDictionary<string, integer>;
var intlistPair: TPair<integer, TList<string>>;
    iteminList: string;
begin
  result := TDictionary<string, integer>.Create;

  for intlistPair in old do
    for iteminList in intlistPair.Value do
      result.Add(iteminList.ToLower, intlistPair.key);
end;

end.
