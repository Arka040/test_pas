{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Treinteicinco(input, output);
var
    A: array ['a'..'z', 'a'..'z'] of 0..MaxInt;
    max: integer;
    c, i, j, maxi, maxj: char;
begin
    writeln('Путнев Аркадий, Группа №110, Задание № 9.32');
    writeln;
    
    write('Вводите текст: ');
    for i := 'a' to 'z' do
        for j := 'a' to 'z' do
            A[i, j] := 0;
    repeat
        read(c);
        i := c;
        repeat
            j := c;
            read(c);
        until (c = ',') or (c = '.');
        A[i, j] := A[i, j] + 1;
    until (c = '.');
    max := A['a', 'a'];
    for i := 'a' to 'z' do
        for j := 'a' to 'z' do
            if A[i, j] > max then begin
                max := A[i, j];
                maxi := i;
                maxj := j;
            end;
    writeln('Самая встречающаяся пара: ',maxi, maxj);
end.
