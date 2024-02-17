{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program letsgo(input, output);
var 
    i, x: integer;
begin
    i := 2;
    read(x);
    while x <> 1 do begin
        if x mod i = 0 then begin
            write(i);
            x := x div i;
            if x <> 1 then
                write('*');
        end
        else
            i := i + 1;
    end;
end.
