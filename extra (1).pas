{Псевдокомментарии и комментарии - не удалять при сдаче программы!}
{$mode TP}
{$R+,B+,X-}
{$codepage UTF-8}      
//----------------------------------------------------------------------
//     Дополнительная задача на 30 очков (выход-6 от 24.11.2022)
//----------------------------------------------------------------------
(***********************************************************************
 Условие. Дана матрица А размером n x m, состоящая из символов "." и "#".
 Матрица А представляет собой карту, где "." является обозначением моря,
 а "#" является обозначнием суши.  Две клетки с сушей являются смежными, 
 если они соседствуют в матрице по горизонтали или по вертикали.
 Посчитать количество островов на карте и вывести карту,  в которой 
 части суши, принадлежащие одному острову, имеют одинаковое обозначение
 (см. ниже примеры возможных обозначений).
 Требования к решению.
 1) Ввод исходной матрицы и вывод изменённой матрицы следует оформить 
 в виде отдельных процедур (при символьном вводе проявлять осторожность, 
 т.к. нажатие на Enter приводит к занесению в буфер ввода управляющих 
 символов => после ввода символов очередной строки нужно выполнить
 readln для очистки от этих "мешающих" управляющих символов).
 2) Для подсчёта количества островов описать целочисленную функцию 
 painting(А), значением которой является искомое количество островов на
 карте А. Функция, в качестве побочного эффекта, в процессе своей работы 
 выявляет острова и обозначает их на карте (см. ниже примеры - станет 
 ясно).
 **********************************************************************)
{      Примеры работы программы для матрицы размером 3 x 10:          
 -----------------------------------------------------------------------
 Пример_1.
 Вход:
##..##...#
..####..#.
##....###.
 Выход:
 5
aa..bb...c
..bbbb..d.
ee....ddd.
 -----------------------------------------------------------------------
 Пример_2.
 Вход:
##..##...#
..####..#.
##...####.
 Выход:
 4
aa..bb...c
..bbbb..b.
dd...bbbb.
 -----------------------------------------------------------------------
 Пример_3
 Вход:
######..##
..####..#.
###..####.
 Выход:
 1
aaaaaa..aa
..aaaa..a.
aaa..aaaa.
-----------------------------------------------------------------------
 Пример_4
 Вход:
#.#.#.#.#.
.#.#.#.#.#
#.#.#.#.#.
 Выход:
 15
a.b.c.d.e.
.f.g.h.i.j
k.l.m.n.o.
}
(***********************************************************************
СДАВАТЬ ПРОГРАММУ так:
1) Оттранслировать её для значений n=3 и m=10 (n и m - константы)
2) Показать работу программы на каждом из четырёх приведённых тестов,
прикрепив соответствующие скриншоты с результатми прохождения этих тестов
3) Не забыть поместить в архив саму программу, в которой должны 
присутствовать комментарии с необходимыми пояснениями (как решали задачу)
************************************************************************
Без комментариев с пояснениями решение проверяться не будет !!!
***********************************************************************)

program islands(input, output);
const
    n = 3;
    m = 10;
type
    matrix = array [1..n, 1..m] of char;
var
    A: matrix;
   
{возможно, вам понадобится сделать дополнительные описания}
function painting(var A: matrix): integer;
var
    i, j, k: integer;

// процедура filling просматривает все соприкосащиеся клетки и, если 
// следующая клетка - суша, то ставит на ее место букву, которая была
// на предыдущей соседней клетке.
// таким образом мы заполняем целый остров одной буквой.

procedure filling(str, stb: integer); 
begin
    if A[str, stb] = '#' then begin
        A[str, stb] := chr(ord('a') + k); 
        if stb < m then             // проверка суши справа
            filling(str, stb + 1);
        if str < n then             // проверка суши снизу
            filling(str + 1, stb);
        if stb > 1 then             // проверка суши слева
            filling(str, stb - 1);
        if str > 1 then             // проверка суши сверху
            filling(str - 1, stb);
    end;
end;
{здесь ваше описание функции painting:}

begin
    k := 0;
    for i := 1 to n do
        for j := 1 to m do
            if A[i, j] = '#' then begin
                filling(i, j);
                k := k + 1;
            end;
    painting := k;
end;

procedure input(var A: matrix);
var
    i, j: integer;
begin
    writeln('Input map with islnads') ;
    for i := 1 to n do begin
        for j := 1 to m do
            read(A[i,j]);
        readln;
    end;
end;
    
procedure output(var A: matrix);
var
    i, j: integer;
begin
    writeln('Colored map:');
    for i := 1 to n do begin
        for j := 1 to m do
            write(A[i,j]);
        writeln;
    end;
end;
    
begin {в разделе операторов программы ничего не менять!}
    input(A);
    writeln('Number of islands: ', painting(A));
    output(A);
end.