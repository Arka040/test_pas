{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Diecisiete(input, output);
const
    n = 10;
var
    c: array [1..n] of integer;
    i, j, x, left, right, k: integer;
begin
    write('Путнев Аркадий, Группа № 110, Задание № 8ю41(г)');
    writeln;
    
    write('Введите массив: ');
    for i := 1 to n do
        read(c[i]);
    for i := 2 to n do 
        if c[i] < c[i - 1] then begin
            x := c[i];
            left := 1;
            right := i - 1;
            repeat
                k := (left + right) div 2;
                if x > c[k] then
                    left := k + 1
                else
                    right := k - 1;
            until left > right;
            for j := i - 1 downto left do begin
                c[j + 1] := c[j];
            end;
            c[left] := x;
        end;
    write('Отсортированный массив: ');
    for i := 1 to n do 
        write(c[i], ' ');
            
end.
