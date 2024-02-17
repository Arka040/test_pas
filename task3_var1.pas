{Псевдокомментарии и комментарии - не удалять при сдаче программы!}
{$mode TP}
{$R+,B+,X-,GOTO-,BREAK-}
{$codepage UTF-8}
//////////////////////////////////////////////////////////////////////
/////////////    ЗАДАЧА 3 (20 очков). Вариант 1   ////////////////////
//////////////////////////////////////////////////////////////////////
// Реализовать БЕЗ ИСПОЛЬЗОВАНИЯ функции chr  функцию chr1, которая для
// целого аргумента даёт тот же результат, что и функция chr. 
// Написать программу, которая ВВОДИТ ЦЕЛОЕ ЧИСЛО  n  от  32  до  254
// (этим кодам соответствуют графически представимые символы)   
// и ВЫВОДИТ на экран (c помощью функции chr1)  СИМВОЛ С ДАННЫМ КОДОМ.
// Вывести на экран также символ, который получится в результате 
// применения стандартной функции chr к  этому же числу n.
// Ответы (при правильном решении) должны совпасть. 
// ПОДСКАЗКА. Согласно Стандарту символы-ЦИФРЫ обязательно должны 
// входить в тип char (один из этих символов можно выбрать в качестве 
// ОПОРНОГО для решения задачи – осталось догадаться как использовать 
// этот ОПОРНЫЙ символ). Решать строго в рамках Стандарта Паскаля !!!
//////////////////////////////////////////////////////////////////////

program Task_3_var_1(input, output);  
var
    n : integer;

(* функция chr1(n), возвращающая символ с кодом n}= *)
function chr1(var n: integer): char;
{здесь расположить описание функции chr1 - НЕ ИСПОЛЬЗУЯ в решении chr}
    var
        c: char;
    begin
        c := '0';
        if n < ord(c) then
            while n < ord(c) do
                c := pred(c)
        else
            while n > ord(c) do
                c := succ(c);
        chr1 := c
    end;


begin
    {здесь (в разделе операторов программы) НИЧЕГО НЕ МЕНЯТЬ !!!}
    writeln('============');
    writeln('Task_3_var_1');
    writeln('============');
    writeln;
    write('n = ');
    read(n);  
    if (n < 255) and (n > 31) then
        writeln('chr1(',n,')=''', chr1(n),     {применение вашей chr1}
             '''  chr(',n,')=''', chr(n),'''') {применение станд. chr}
    else
        writeln('Значение n = ', n,' недопустимо.')
end.
   
