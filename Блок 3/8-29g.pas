{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Diecicuatro(input, output);
const 
    n = 10;
var
    c: array [1..n] of integer;
    i, j: integer;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 8.29(ж)');
    writeln;
    
    write('Вводите массив: ');
    i := 1;
    j := 1;
    for i := 1 to n do
        read(c[i]);
    for i := 1 to n do 
        if c[i] <> 0 then begin
            c[j] := c[i];
            j := j + 1;
        end;
    for j := j to n do
        c[j] := 0;
    for i := 1 to n do 
        write(c[i], ' ');
        
        
    
end.

