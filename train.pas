{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Cuarentaicinco(input, output);

function max: integer;
var 
    x, t, otv: integer;
begin
    read(x);
    if x = 0 then begin
        max := 0;
        writeln;
    end
    else begin
        write(x, ' ');
        t := x;
        if t > max then begin
            otv := t;
            write(t, ' ');
        end;
    end;
    max := otv;
end;

begin
    writeln(max);
end.
