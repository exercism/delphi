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
