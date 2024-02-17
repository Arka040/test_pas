{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Cincuentaiciete(output, t1, t2);
var
    t1, t2: text;
    a, b, tp: set of char;
    c, i: char;



begin
    assign(t1, 'words.txt');
    assign(t2, 'result.txt');
    reset(t1);
    rewrite(t2);
    b := [];
    a := ['a', 'o', 'e', 'u', 'y', 'i'];
    while not eof(t1) do begin
        tp := [];
        while not eoln(t1) do begin
            
            read(t1, c);
            if not(c in ['a', 'o', 'e', 'u', 'y', 'i']) then
                b := b + [c];
            if c in ['a', 'o', 'e', 'u', 'y', 'i'] then begin
                tp := tp + [c];
                writeln(c);
            end;
        end;
        a := a * tp;
        readln(t1);
    end;
    for i := 'a' to 'z' do
        if i in b then
            write(t2, i);
    writeln(t2);
    for i := 'a' to 'z' do
        if not(i in b) and not(i in ['a', 'o', 'e', 'u', 'y', 'i']) then
            write(t2, i);
    writeln(t2);
    for i := 'a' to 'z' do
        if (i in a) and (i in ['a', 'o', 'e', 'u', 'y', 'i']) then
            write(t2, i);
    writeln(t2);
    for i := 'a' to 'z' do
        if not(i in a) and (i in ['a', 'o', 'e', 'u', 'y', 'i']) then
            write(t2, i);
    writeln(t2);
    close(t1);
    close(t2);
end.



