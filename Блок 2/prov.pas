{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program pjgeoggm(input, output);
var 
    a, y, x, k, i: integer;
begin
    read(x);
    k := 1;
    i := 1;
    y := x;
    a := x mod 10;
    if x < 10 then
        writeln(x)
    else begin
        while y > 9 do begin
            y := y div 10;
            i := i * 10;
            k := k + 1;
        end;
        writeln(a * i + (x - y * i) div 10 * 10 + y );
    end;
        
end.
