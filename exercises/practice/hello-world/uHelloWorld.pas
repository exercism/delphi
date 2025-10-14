unit uHelloWorld;

interface

  function Hello: string;

implementation

function Hello: string;
begin
  result := 'Hello, World!';
end;

end.
