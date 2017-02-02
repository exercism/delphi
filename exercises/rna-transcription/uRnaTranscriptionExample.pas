unit uRnaTranscription;

interface

  function Hello(name: string='World'): string;

implementation

function Hello(name: string='World'): string;
begin
  result := 'Hello, ' + name + '!';
end;

end.
