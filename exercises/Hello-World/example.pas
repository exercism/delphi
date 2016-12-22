//========================================================
// Example solution to exercise.
//
// A simple hello function would suffice, however this
// solution is mimicking the Ruby hello-world exercise
//========================================================
unit uHelloWorld;

interface

type
  THelloWorld = class
  public
    class function hello(name: string='World'): string; static;
  end;

implementation

class function THelloWorld.hello(name: string='World'): string;
begin
  result := 'Hello, ' + name + '!';
end;

end.
