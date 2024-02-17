{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Cincuenta(input, output);

function Number: integer;
var
    c, s: char;
    l, r: integer;
begin
    read(c);
    if (c >= '0') and (c <= '9') then
        Number := ord(c) - ord('0')
    else begin
        read(s);
        l := Number;
        read(s);
        r := Number;    
        read(s);
        case c of
            'M': if l > r then
                    Number := l
                else
                    Number := r;
            'm': if l > r then
                    Number := r
                else
                    Number := l;
        end
    end;
end;

begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 12.28');
    writeln;
    write('Вводите выражение: ');
    writeln(Number);
end.
