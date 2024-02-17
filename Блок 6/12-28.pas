{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}  
{ Путнев Аркадий}
program Cincuentaiuno(input, output);
procedure Print;
var
    c: char;
begin
    read(c);
    if c = '(' then begin
        Print;
        read(c);
        Print;
        write(c);
        read(c);
    end
    else
        write(c);
end;

begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 12.28');
    writeln;
    write('Вводите выражение: ');
    Print;
end.

// ((a+(b-c))*d) → abc-+d*
// a → a
// (a+b) → ab+
// ((a+b)-(c*(d+e))) → ab+cde+*-
// ((((a+b)+b)+c)+d) →> ab+b+c+d+
