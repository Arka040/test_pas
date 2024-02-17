{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}  
{ Путнев Аркадий}
program Cincuentaidos(input, output);
var
    N: integer;
function Delete3(N: integer): integer;
var
    o: integer;
begin
    if N = 0 then
        Delete3 := 0
    else begin
        o := N mod 10;
        N := N div 10;
        if o <> 3 then
            Delete3 := Delete3(N) * 10 + o
        else
            Delete3 := Delete3(N);
    end;
end;

begin
    writeln('Путнев Аркадий, Группа № 110, Задание (без троек)');
    writeln;
    write('Вводите число: ');
    read(N);
    writeln('Число без троек: ', Delete3(N));
end.
