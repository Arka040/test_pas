{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program dop1(input, output);
var
    X: real;
    n: integer;

function Count6(X: real; n: integer): integer;
var
    ost  : integer;
    
begin
    if n = 0 then
        Count6 := 0
    else begin
        X := X * 10;
        ost := trunc(X) mod 10;
        if ost = 6 then
            Count6 := Count6(X, n-1) + 1
        else
            Count6 := Count6(X, n-1);
    end;
        
end;

begin
    read(X, n);
    writeln(Count6(X, n));
end.
