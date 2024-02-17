{Псевдокомментарии и комментарии - не удалять при сдаче программы!}
{$mode TP}
{$R+,B+,X-,GOTO-,BREAK-}
{$codepage UTF-8}                    ///// ЗАДАЧА 1 (20 очков) /////
program task1_var_1(input, output);  ///// Вариант 1           /////
// -------------------------------------------------------------------
// Пусть натуральное число N задано константой.  
// Ввести с клавиатуры целые числа К и Р.  
// Сформировать целочисленную матрицу размера N x N вида:
{
    K    K+P    K+2P    K+3P     …
    K+1  K+P+1  K+2P+1  K+3P+1   …
    K+2  K+P+2  K+2P+2  K+3P+2   …
    K+3  K+P+3  K+2P+3  K+3P+3   …
     …     …       …      …      …
}
// Вывести полученную матрицу на экран 
//(столбцы чисел должны быть выровнены по правому краю).   
// Проверить, есть ли в матрице хотя бы одна СТРОКА, сумма элементов в 
// которой равна 0. Вывести результат проверки (true или false).  
// Замечание: приём программы будет производиться при N=4
// -------------------------------------------------------------------
// ТРЕБОВАНИЯ.  
// Предусмотреть в программе:
// 1) процедуру Form(M,K,P), которая по заданным числам K и P 
// формирует матрицу М заданного вида.
// 2) процедуру Print(M), которая выводит на экран матрицу М.
// 3) булевскую функцию Test(M), которая проверяет матрицу М на наличие
// заданного (выше) свойства.
// ВНИМАНИЕ: совмещать этапы НЕЛЬЗЯ (т.е. следует отдельно сформировать
// матрицу, после этого  вывести её на экран, и только затем приступить
// к проверке матрицы)
// ТЕСТЫ, НА КОТОРЫХ СДАВАТЬ ЗАДАЧУ, размещены в конце этой программы.
// --------------------------------------------------------------------

const 
    N = 4;
type
    matrix = array[1..N, 1..N] of integer;
var
    M: matrix;
    K, P: integer;

procedure Form(var M: matrix; K, P: integer);
    var i, j: integer;
    begin
        for i := 1 to N do
            for j := 1 to N do
                M[i, j] := K + P * (j - 1) + (i - 1);
    end;

procedure Print(var M: matrix);
    var i, j: integer;
    begin
        for i := 1 to N do begin
            for j := 1 to N do
                write(M[i, j]:6);
            writeln;
        end;    
    end;

function Test(var M: matrix): boolean;
    var i, j, sum: integer;
        fl: boolean;
    begin
        fl := False;
        i := 1;
        while (not fl) and (i <= N) do begin
            sum := 0;
            for j := 1 to N do
                sum := sum + M[i, j];
            if sum = 0 then begin
                fl := True;
            end;
            i := i + 1;
        end;
        Test := fl;
    end;
  
begin
    {Здесь ничего не менять, кроме снятия комментариев}
    writeln('============');
    writeln('Task_1_var_1');
    writeln('============');
    writeln;

    write('K  and  P: ');
    read(K, P);
     
    Form(M, K, P);
    writeln;
    writeln('Matrix:');
    writeln;
    Print(M);
    writeln;
    
    writeln('Answer: ', Test(M));
end.

{ ТЕСТЫ, на которых надо сдавать эту задачу:

Test 1:
-------
K and P:  -5   2
 
matrix:
   -5   -3   -1    1
   -4   -2    0    2
   -3   -1    1    3
   -2    0    2    4
   
answer: TRUE

полезно для отладки:
sum = -8 FALSE
sum = -4 FALSE
sum = 0 TRUE

Test 2:
-------
K and P:  -7   4

matrix:
   -7   -3    1    5
   -6   -2    2    6
   -5   -1    3    7
   -4    0    4    8

answer: TRUE

полезно для отладки:
sum = -4 FALSE
sum = 0 TRUE

Test 3:
-------
K and P:  -7   5

matrix:
   -7   -2    3    8
   -6   -1    4    9
   -5    0    5   10
   -4    1    6   11

answer: FALSE

полезно для отладки:
sum = 2 FALSE
sum = 6 FALSE
sum = 10 FALSE
sum = 14 FALSE

Test 4:
-------
K and P:  0   -2

matrix:
    0   -2   -4   -6
    1   -1   -3   -5
    2    0   -2   -4
    3    1   -1   -3

answer: TRUE

полезно для отладки:
sum = -12 FALSE
sum = -8 FALSE
sum = -4 FALSE
sum = 0 TRUE

Test 5:
-------
K and P:  3   -2

matrix:
    3    1   -1   -3
    4    2    0   -2
    5    3    1   -1
    6    4    2    0

answer: TRUE

полезно для отладки:
sum = 0 TRUE

Test 6:
-------
K and P:  -3   3

matrix:
   -3    0    3    6
   -2    1    4    7
   -1    2    5    8
    0    3    6    9

answer: FALSE

полезно для отладки:
sum = 6 FALSE
sum = 10 FALSE
sum = 14 FALSE
sum = 18 FALSE

}    
        





