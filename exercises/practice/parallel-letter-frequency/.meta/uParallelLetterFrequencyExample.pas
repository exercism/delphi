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
  System.SysUtils,
  System.Character,
  System.Threading;

{ ParallelLetterFrequency }

class function TParallelLetterFrequency.Calculate(
  const aInputLetters: string): TDictionary<char, integer>;
begin
  var LowerCased := aInputLetters.ToLowerInvariant;
  var LetterTallies := TDictionary<char, integer>.Create;
  TParallel.For(low(LowerCased), High(LowerCased), procedure(i: Int64)
  begin
    var c := LowerCased[i];
    if c.IsLetter then
    begin
      TMonitor.Enter(LetterTallies);
      try
        if not LetterTallies.ContainsKey(c) then
          LetterTallies.AddOrSetValue(c, 0);
        var x := LetterTallies[c];
        inc(x);
        LetterTallies[c] := x;
      finally
        TMonitor.Exit(LetterTallies);
      end;
    end;
  end);
  result := LetterTallies;
end;

end.
