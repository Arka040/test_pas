{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
Program Treinta(input, output);
const
    n = 10;
var
    c1: array [1..n] of integer;
    c2: array [1..n] of integer;
    i, j, min: integer;
    fl: boolean;
begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 8.54');
    writeln;
    
    write('Вводите первую последовательность: ');
    for i := 1 to n do 
        read(c1[i]);
    write('Вводите вторую последовательность: ');
    for i := 1 to n do
        read(c2[i]);
    min := MaxInt;
    for i := 1 to n do begin
        if c1[i] <= min then begin
            j := 1;
            fl := True;
            while fl and (j <> 10) do begin
                if c1[i] = c2[j] then
                    fl := False;
                j := j + 1;
            end;
            if fl then
                min := c1[i];
        end;
    end;
    
    writeln('Минимальный элемент: ', min);
            
        
end.
