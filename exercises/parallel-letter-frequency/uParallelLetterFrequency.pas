unit uParallelLetterFrequency;

interface
uses
  System.Generics.Collections;

type
  TParallelLetterFrequency = class
    class function Calculate(const aInputLetters: string): TDictionary<char, integer>;
  end;

implementation
uses
  System.Threading;

{ ParallelLetterFrequency }

class function TParallelLetterFrequency.Calculate(
  const aInputLetters: string): TDictionary<char, integer>;
begin

end;

end.
