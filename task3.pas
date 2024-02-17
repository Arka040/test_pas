{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Cincuentainueve(output, t3);
var
    t3: text;
    k, i, maxi, max, j: integer;
    c: char;
begin
    assign(t3, 't3.txt');
    reset(t3);
    i := 0;
    max := 0;
    while not eof(t3) do begin
        k := 0;
        i := i + 1;
        while not eoln(t3) do begin
            read(t3, c);
            k := k + 1;
        end;
        readln(t3);
        if k > max then begin
            max := k;
            maxi := i;
        end;
    end;
    
    reset(t3);
    j := 1;
    while j <> maxi do begin 
        readln(t3);
        j := j + 1;
    end;
    while not eoln(t3) do begin
        read(t3, c);
        write(c);
    end;
    close(t3);
end.
