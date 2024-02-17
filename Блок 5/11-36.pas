{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Cuarentaidos(input, output);
type
    slovo = packed array [1..6] of char;
var
    a, b, c, s: slovo;
    ch: char;
    fl: boolean;
    
procedure ReadWord(var s: slovo; v: char);
var
    i, j: integer;
begin
    i := 1;
    while (v <> ',') and (v <> '.') do begin
        s[i] := v;
        read(v);
        ch := v;
        i := i + 1;
    end;
    for j := i to 6 do
        s[j] := ' ';
end;

begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 11.36');
    writeln;
    
    write('Вводите слова: ');
    read(ch);
    fl := False;
    if ch <> '.' then
        ReadWord(a, ch);
    if ch <> '.' then begin
        read(ch);
        ReadWord(b, ch);
    end;
    if ch <> '.' then begin
        read(ch);
        ReadWord(c, ch);
        fl := True;
    end;
    if fl then
        if a = c then
            writeln(b);
    while ch <> '.' do begin
        read(ch);
        ReadWord(s, ch);
        a := b;
        b := c;
        c := s;
        if a = c then
            writeln(b);
    end;
        
end.
