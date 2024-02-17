{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program grpegr(input, output);
var 
    x, y, l, p, maxl, maxp: integer;
begin
    read(x);
    l := 1;
    y := 0;
    p := 1;
    maxl := 1;
    maxp := 1;
    while x <> 0 do begin
        p := p + 1;
        if x = y then begin
            l := l + 1;
        end
            else
                l := 1;
        if l > maxl then begin
            maxl := l;
            maxp := p - l;
        end;
        y := x;
        read(x);
        
    end;
    writeln(maxl, ' ', maxp);
end.
