{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Cincuentaicuatro(input, output);

function log: boolean;
var
    c: char;
    b: boolean;
begin
    read(c);
    case c of 
    't': begin
        read(c,c,c); 
        log := true;
    end;
    'f': begin
        read(c,c,c,c);
        log := false;
    end;
    'n': begin
        read(c,c,c);
        log := not log;
        read(c);
    end;
    'o': begin
        read(c);
        b := false;
        read(c);
        repeat
            b := b or log;
            read(c);
        until c = ')';
        log := b;
    end;
    'a': begin
        read(c,c);
        b := true;
        read(c);
        repeat
            b := b and log;
            read(c);
        until c = ')';
        log := b;
    end;
    end
end;

begin
    writeln('Путнев Аркадий, Группа № 110, Задание № 12.28');
    writeln;
    write('Вводите выражение: ');
    writeln(log);
end.
