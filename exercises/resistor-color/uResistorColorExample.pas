unit uResistorColor;

interface

type
  TResistor = class
  private
    const AllColors: array[0..9] of string =('black', 'brown', 'red', 'orange',
      'yellow', 'green', 'blue', 'violet', 'grey', 'white');
  public
    class function colorCode(const aColor: string): integer;
    class function colors: TArray<string>;
  end;


implementation

{ TResistor }

class function TResistor.colorCode(const aColor: string): integer;
begin            //This logic is the same as "IndexOf" from TList<T>.IndexOf(const Value: T)
                 //without the overhead of instantiating a TList<T> or using Generics.Collections.
  for result := Low(AllColors) to High(AllColors) do
    if AllColors[result] = aColor then
      exit;
  result := -1;
end;

class function TResistor.colors: TArray<string>;
begin        // This could be simplified if an array type for the strings was declared
             //  I think doing that would make the exercise more complicated but
             //  would simplify this example solution.
  Result := [];
  for var aColor in AllColors do
    Result := Result + [aColor];
end;

end.
