unit utwofer;

interface

  function twoFer(aName: string='you'): string;

implementation

function twoFer(aName: string='you'): string;
begin
  result := 'One for ' + aName + ', one for me.';
end;

end.
