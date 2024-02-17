{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Cincuentaiocho(output, t1, t2);
var
    t1, t2: text;
    fl: boolean;
    a, b: char;


begin
    assign(t1, 't1.txt');
    assign(t2, 't2.txt');
    reset(t1);
    reset(t2);
    fl := True;
    while not eof(t1) and not eof(t2) and fl do begin
        while not eoln(t1) and not eoln(t2) and fl do begin
            read(t1, a);
            read(t2, b);
            if a <> b then 
                fl := False;
        end;
        if eoln(t1) <> eoln(t2) then 
            fl := False
        else begin
            readln(t1);
            readln(t2);
        end;
    end;
    if (eof(t1) <> eof(t2)) or not fl then
        writeln('Файлы НЕ равны!!!')
    else   
        writeln('Файлы равны');
    close(t1);
    close(t2);
end.
