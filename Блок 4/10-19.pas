{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Treinteiocho(input, output);
const
    n = 20;
    alf = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
var
    A, B: packed array [1..n] of char;
    i, j: integer;
    c: char;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 10.19');
    writeln;
    
    write('Вводите текст: ');
    for i := 1 to n do begin
        read(c);
        A[i] := c;
        j := 1;
        repeat
            if c = alf[j] then
                B[i] := '-';
            j := j + 1;
        until (B[i] = '-') or (j = 53);
    end;
    writeln(A);
    writeln(B);
end.
