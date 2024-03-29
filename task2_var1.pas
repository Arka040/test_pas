{Псевдокомментарии и комментарии - не удалять при сдаче программы!}
{$mode TP}
{$R+,B+,X-,GOTO-,BREAK-}
{$codepage UTF-8}                        /////   ЗАДАЧА 2      ///// 
program task_2_var_1(input, output);     /////   Вариант 1     /////
//////////////////////////////////////////////   40 очков      /////
// -------------------------------------------------------------------
// Const  N = 15; Type vector = array [0..N] of integer;
// Описать процедуру SortNonZero(A), которая в массиве А типа vector 
// выстраивает все НЕНУЛЕВЫЕ элементы в порядке неубывания, 
// а НУЛЕВЫЕ элементы оставляет на своих местах.  
(*    (внимание, индексы элементов начинаются ОТ НУЛЯ !!!)     *)
{
ПРИМЕР 

ИСХОДНЫЙ массив A (индексы элементов указаны сверху – для наглядности):   
 0 | 1 | 2  | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 |
=======================================================================
14 | 0 | 23 | 7 | 19| 0 | 30| 5 | 3 | 0 | 0  | -8 |-10 | 0  |  5 | 15 |
=======================================================================

ПРЕОБРАЗОВАННЫЙ массив A (индексы при выводе массива печатать не надо):
 0 | 1 | 2  | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 |
=======================================================================
-10| 0 | -8 | 3 | 5 | 0 | 5 | 7 | 14| 0 | 0  | 15 | 19 | 0  | 23 | 30 |
=======================================================================
}
// ИДЕЯ РЕШЕНИЯ
// Этап 1 (10 очков). Переписать НЕНУЛЕВЫЕ элементы из массива А 
// в начало вспомогательного массива В.
// Этап 2 (20 очков). Отсортировать  заполненную часть массива В (любым 
// известным вам методом).
// Этап 3 (10 очков). Переписать отсортированные элементы из рабочей  
// части массива В на место прежних ненулевых элементов массива А.  

// ТРЕБОВАНИЯ
// 1) Применить процедуру SortNonZero(A) для обработки конкретного
// массива по указанному выше правилу. ВНУТРИ процедуры SortNonZero(A)
// описать вспомогательную процедуру Sort(B,K) для сортировки начальной
// части массива В (с индексами от 0 до К) выбранным (по вашему 
// усмотрению) методом.
// 2) Дополнительно описать следующие процедуры:
// InArray(A) - для ввода элементов исходного массива;  
// OutArray(A,K) - для вывода элементов массива А с индексами от 0 до K.
// Параметр K в процедуре OutArray(A,K) полезен, если этой процедурой 
// пользоваться для промежуточной печати в процессе отладки основной
// процедуры SortNonZero(A). Например, рекомендуется вывести результат 
// заполнения рабочей части массива B ненулевыми элементами (для 
// контроля правильности работы этапа 1). Полезно также вывести
// результат сортировки рабочей части массива B с помощью Sort(B,K) (для 
// контроля правильности работы этапа 2). Наконец, эту же процедуру 
// вывода можно задействовать для печати окончательного ответа,  
// полученного (после этапа 3) в массиве A (в этом случае параметру K 
// будет соответствовать значение константы N, описанной в разделе const 
// основной программы). 

// ТЕСТЫ, НА КОТОРЫХ СДАВАТЬ ЗАДАЧУ, размещены в конце этой программы.

// ЕСЛИ НЕ ПОЛУЧАЕТСЯ СДАТЬ СРАЗУ ТРИ ЭТАПА, то можно сдавать этапами:
// 1) отдельно 1-ый этап (с выводом содержимого рабочей части массива B)
// 2) после сдачи 1-ого этапа можно сдать отдельно 2-ой этап (с выводом 
// отсортированной рабочей части массива B).
// 3) после этого останется отдельно сдать 3-ий этап (окончательный 
// вывод ответа (преобразованный массив A).
// ЗАМЕЧАНИЕ. При сдаче любого этапа ввод и вывод необходимо выполнять
// с использованием процедур InArray(A) и OutArray(A,K). Каждый этап
// должен быть оформлен как составная часть процедуры SortNonZero(A).

// ПРОСЬБА. Не злоупотреблять возможностью сдавать отдельными этапами, 
// СТАРАТЬСЯ всё-таки СДАВАТЬ СРАЗУ ВСЕ ТРИ ЭТАПА (в целях экономии 
// своего времени и времени проверяющих)
// --------------------------------------------------------------------

const 
    N = 15;
type
    vector = array[0..N] of integer; (* внимание, индексы от НУЛЯ !!! *)
var
    A: vector;

(* процедура InArray(A) для ввода элементов вектора A типа vector *)
{использует имя N (глобальной константы) НАПРЯМУЮ, а не как параметр}
procedure InArray(var A: vector);
                {здесь расположить её описание}
    var
        i: integer;
    begin
        for i := 0 to N do
            read(A[i]);
    end;

(* процедура OutArray(A,K) для вывода начальных элементов с индексами 
   от 0 до K вектора A типа vector *)
procedure OutArray(var A: vector);
                {здесь расположить её описание}
    var i: integer;
    begin
        for i := 0 to N do 
            if A[i] <> 0 then
                write(A[i], '  ')
            else
                write(0, '  ');
            
    end;

(* процедура SortNonZero(A) для преобразования вектора A типа vector *)
{использует имя N (глобальной константы) НАПРЯМУЮ, а не как параметр}
procedure SortNonZero(var A: vector);
                {здесь расположить её описание}
{ а также описание вспомогательной (вложенной) процедуры Sort(B,K) 
  для сортировки начальной части массива B с индексами от 0 до N }
    type
        svector = array [0..N] of integer;
    var 
        B: svector;
        i, j, K, t: integer;
    
    procedure Sort(var B: svector; K: integer);
        var
            i, j, m: integer;
        begin
            i := 0;
            m := K;
            repeat
                for j := 0 to m - 1 do 
                    if B[j] > B[j + 1] then begin
                        t := B[j];
                        B[j] := B[j + 1];
                        B[j + 1] := t;
                        i := i + 1;
                    end;
                m := m - 1;
            until (i = 0) or (m = 0);
        end;
        
    begin
        j := 0;
        K := 0;
        for i := 0 to N do 
            if A[i] <> 0 then begin 
                K := K + 1;
                B[j] := A[i];
                j := j + 1;
            end;
        
        Sort(B, K);
        j := 0;
        for i := 0 to N do
            if A[i] <> 0 then begin
                A[i] := B[j];
                j := j + 1;
            end;
        
    end;



begin 
    {Здесь ничего не менять, кроме снятия комментариев}
    writeln('================');
    writeln('task_2_var_1');
    writeln('================');
    writeln;
    writeln('Enter ', N+1, ' (N+1) numbers:');
    InArray(A);
    SortNonZero(A);
    writeln('Answer:');
    OutArray(A);
end.
{ ТЕСТЫ, на которых надо сдавать эту задачу:

Test 1 (из условия задачи):
-------
ввод:
14  0  23  7  19  0  30  5  3  0  0  -8  -10  0  5  15
вывод:
-10  0 -8  3  5   0  5   7  14 0  0  15   19  0  23 30

Test 2:
-------
ввод:
0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0
вывод:
0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0

Test 3:
-------
ввод:
0  0  -1  -2  0  6  4  0  0  0  -9  0  0  5  0  0
вывод:
0  0  -9  -2  0 -1  4  0  0  0   5  0  0  6  0  0

Test 4:
-------
ввод:
15  14  13  12  11  10  9  8  7  6  5  4  3  2  1  0
вывод:
1  2  3  4  5  6  7  8  9  10  11  12  13  14  15  0

Test 5:
-------
ввод:
0  1  2  3  4  5  6  7  8  9  10  11  12  13  14  15
вывод:
0  1  2  3  4  5  6  7  8  9  10  11  12  13  14  15

}    
        





