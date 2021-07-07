unit uHelloWorld;

interface

  function Hello: string;

implementation

function Hello: string;
begin
  result := 'Goodbye, Mars!';
end;

end.
