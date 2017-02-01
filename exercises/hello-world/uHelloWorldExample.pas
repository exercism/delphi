unit uHelloWorld;

interface

  function Hello(name: string='World'): string;

implementation

function Hello(name: string='World'): string;
begin
  result := 'Hello, ' + name + '!';
end;

end.
