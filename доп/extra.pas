{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}
// ---------------------------------------------------------------------
// ДОП_ЗАДАЧА  (выход-5 от 17.11.2022)  (30 очков)
// ---------------------------------------------------------------------
(***********************************************************************
             Реализовать КОЛЬЦЕВОЙ БУФЕР, запоминающий 
      ПОСЛЕДНИЕ n (n=10) ЧИСЕЛ (ЭЛЕМЕНТОВ), поданных с клавиатуры
                     (n задано константой).
************************************************************************ 
По запросу "p" (от слова put) и поданному с клавиатуры ЧИСЛУ (ЭЛЕМЕНТУ), 
буфер должен ЗАПОМИНАТЬ это ЧИСЛО (поданное с клавиатуры).

По запросу "g" (от слова get) и поданному с клавиатуры НОМЕРУ, 
буфер должен ВОЗВРАЩАТЬ ЭЛЕМЕНТ, номер которого равен поданному ранее,
начиная отсчет от последнего поданного числа в обратную сторону. 
Если поданный номер является некорректным, буфер должн возвращать -1.
 
По запросу "q" программа должна завершать работу.

Пример работы (см. в конце более развёрнутый пример работы программы):
p 17
g 1 -> 17
p 18
g 1 -> 18
g 2 -> 17
g 3 -> -1
p 19
g 1 -> 19
g 2 -> 18
g 3 -> 17
g 4 -> -1

q
 
***********************************************************************)
{ТРЕБОВАНИЕ. Использовать описания и заготовки, приведённые в программе. 
Фактически остаётся реализовать процедуру put(a, val) и 
функцию get(a, idx). Все остальные действия уже заготовлены в программе}
(**********************************************************************)
{Прислать не только программу, но и СКРИНШОТЫ её работы для случая n=5}
(**********************************************************************)
program cycle_buf(input, output);
const
    n = 5;
type
    arr = array [1..n] of integer;
    CycleArray = record
        buf: arr;        {хранилище элементов}
        cur: integer;    {очередная свободная позиция для записи в буфер}
        size: integer;   {текущее количество элементов в буфере}
    end;
var
    i: integer;
    c: char;
    a: CycleArray;      {циклический буфер}
    
procedure put(var a: CycleArray; val: integer);
begin
    with a do begin
        if cur > 5 then
            buf[cur mod 6 + 1] := val
        else
            buf[cur] := val;
        cur := cur + 1;
        if size < n then
            size := size + 1;
    end;
{здесь расположить ваше описание этой процедуры (ТОЧЕК не использовать)}

end;

function get(var a: CycleArray; idx: integer): integer;

{здесь расположить ваше описание этой функции (ТОЧЕК не использовать)}
begin
    if idx > a.size then 
        get := -1
    else
        if a.cur > 5 then
            get := a.buf[idx]
        else
            get := a.buf[a.cur-idx];

end;

procedure OutputBuf(var buf: arr);
var
    i: integer;
begin
    writeln('Current buffer:');
    for i := 1 to n do
        write(buf[i], ' ');
    writeln;
end;

begin
    {инициализация буфера:}
    with a do begin
        for i := 1 to n do
            buf[i] := 0;
        cur := 1;
        size := 0;
    end;
    {по желанию, можно уменьшить количество выводимого текста на экране}
    write('Input the action ');
    write('(p: put, g: get, q: quit): ');
    readln(c);
    while c <> 'q' do begin
        if c = 'p' then begin
            write('Input a pushing number: ');
            readln(i);
            put(a, i);
            OutputBuf(a.buf); {контрольная печать содержимого буфера}
        end else if c = 'g' then begin
            write('Input an index: ');
            readln(i);
            writeln(get(a, i));
        end else
            writeln('Wrong input!');
        write('Input the action ');
        write('(p: put, g: get, q: quit): ');
        readln(c);
    end;
end.
{=======================================================================
ПРИМЕР РАБОТЫ ПРОГРАММЫ (при выводе можно УМЕНЬШИТЬ длину сообщений):
========================================================================
Пусть сейчас буфер заполнен наполовину (cur=6, size=5) и имеет вид:
17 18 19 20 21 0 0 0 0 0
========================================================================
Input the action (p: put, g: get, q: quit): p
Input a pushing number: 22
Current buffer:
17 18 19 20 21 22 0 0 0 0
Input the action (p: put, g: get, q: quit): p
Input a pushing number: 23
Current buffer:
17 18 19 20 21 22 23 0 0 0
Input the action (p: put, g: get, q: quit): p
Input a pushing number: 24
Current buffer:
17 18 19 20 21 22 23 24 0 0
Input the action (p: put, g: get, q: quit): p
Input a pushing number: 25
Current buffer:
17 18 19 20 21 22 23 24 25 0
Input the action (p: put, g: get, q: quit): p
Input a pushing number: 26
Current buffer:
17 18 19 20 21 22 23 24 25 26
Input the action (p: put, g: get, q: quit): g
Input an index: 1
26
Input the action (p: put, g: get, q: quit): p
Input a pushing number: 27
Current buffer:
27 18 19 20 21 22 23 24 25 26
Input the action (p: put, g: get, q: quit): g
Input an index: 1
27
Input the action (p: put, g: get, q: quit): g
Input an index: 2
26
Input the action (p: put, g: get, q: quit): g
Input an index: 10
18
Input the action (p: put, g: get, q: quit): g
Input an index: 11
-1
Input the action (p: put, g: get, q: quit): g
Input an index: 9
19
Input the action (p: put, g: get, q: quit): q

}
