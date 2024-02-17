{$mode TP}
{$R+,B+,X-,I+,GOTO-}
{$codepage UTF-8}
{ Путнев Аркадий}
program Dop91(t1, output);
uses heaptrc;
type
    // очередь
    list = ^node;
    node = record
        count: integer;
        next: list;
    end;
    stack = list;
var
    S: stack;
    
procedure Numeration(var S: stack);
var
    c: char;
    i: integer;
    y: list;

procedure ClearStack(var S: stack);
begin
    S := nil;
end;
    
procedure AddToStack(var S: stack);  // открывающие скобки
var
    p: list;
begin
    new(p);
    p^.count := i;
    p^.next := S;
    S := p;
end;

begin
    read(c);
    i := 0;
    ClearStack(S);
    while c <> '.' do begin
        i := i + 1;
        if c = '(' then 
            AddToStack(S);
        if c = ')' then begin
            write(S^.count, ' ');
            write(i, '  ');
            y := S;
            S := S^.next;
            dispose(y);
        end;
        read(c);
    end;
end;

begin
    writeln('Путнев Аркадий, Группа № 110, Задание 17.5(б)');
    writeln;
    write('Введите текст: ');
    Numeration(S);
end.

// A+(45-f(x)*(b-c)).
// 8 10  12 16  3 17

// (a(b+c)*(d-t)).
// 3 7  9 13  1 14

// (aaaaa(a(aaa)a)a).
// 9 13  7 15  1 17

// (a(a()()())a()a).
// 5 6  7 8  9 10  3 11  13 14  1 16
