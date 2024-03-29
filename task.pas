{$mode TP}
{$codepage UTF-8}
{$R+,B+,X-}

// ---------------------------------------------------------------------
// ЗАДАЧА (три этапа) (выход-8 от 08.12.2022)    Суммарно 100 очков
// РЕШАТЬ САМОСТОЯТЕЛЬНО, А НЕ КОЛЛЕКТИВНО (КАЖДЫЙ РАБОТАЕТ НА СЕБЯ !)
// ---------------------------------------------------------------------
(****************    ПОЭТАПНАЯ РАБОТА СО СПИСКОМ   *********************
Внимание! Можете описывать свои процедуры и функции как угодно 
(итеративно или рекурсивно), это дело вашего вкуса.
НЕ ДОПУСКАТЬ УТЕЧКИ ПАМЯТИ, СДАВАЯ все ЭТАПЫ (использовать для этого
процедуру Destroy(L), написанную на предыдущем выходе-7).
Сдавать можно отдельными этапами или сразу всю программу целиком.
------------------------------------------------------------------------
ЭТАП_1  (40 очков)
Построение по текстовому файлу matrix.txt списка L требуемого вида
------------------------------------------------------------------------
Дан внешний текстовый файл с именем matrix.txt, который содержит 
таблицу целых чисел размером n x n  (n задано в программе константой 
со значением 5). Программа  запрашивает у пользователя  целое число k
и по нему строит линейный список следующего вида:  сначала в списке 
(в отдельных звеньях)  должны располагаться элементы k-ой строки 
таблицы (в том же порядке, что и в таблице, т.е. СЛЕВА НАПРАВО), 
затем – элементы k-ого столбца таблицы (в противоположном порядке, 
т.е. СНИЗУ ВВЕРХ).  

ОГРАНИЧЕНИЯ в решении ЭТАПА_1: 
1) в решении ЗАПРЕЩЕНО ИСПОЛЬЗОВАТЬ МАССИВЫ;  2) для считывания 
элементов таблицы следует  использовать ТОЛЬКО ЧИСЛОВОЙ ВВОД  вида 
read(t, x), где t – текстовый файл, х – целочисленная переменная;
3) таблицу (т.е. файл) можно просматривать ТОЛЬКО ОДИН РАЗ;  

ТРЕБОВАНИЯ к решению ЭТАПА_1: 
1) Описать функцию CreateList(t,k), которая по текстовому файлу t
(хранящему указанную выше таблицу) и целому числу k строит список 
требуемого вида и возвращает ссылку на построенный список. Если 
значение параметра k окажется вне диапазона от 1 до n, то функция 
возвращает значение nil . 2) Ссылку на построенный список присвоить 
переменной  L , описанной в основной программе. 3) Распечатать 
получившийся список  (описав предварительно процедуру  вывода 
элементов списка Print(L)). В случае пустого списка – вывести слово
“empty”.

ПОДСКАЗКА по реализации функции CreateList(t,k): построить два списка
(первый список строить от начала в конец, второй – от конца в начало)
и их объединить (соединив последнее звено первого списка с первым 
звеном второго списка). 

Содержимое файла matrix.txt должно соответствовать образцу, 
приведённому в конце этой программы (после точки).
Тесты, на которых будет проверяться работа программы, см. в самом
конце (после матрицы).

------------------------------------------------------------------------
ЭТАП_2  (30 очков)
Работа со списком, полученным после ЭТАПА_1
------------------------------------------------------------------------
За ОДИН просмотр полученного списка L УДАЛИТЬ в нём все элементы, 
нарушающие УПОРЯДОЧЕННОСТЬ  этого списка "СТРОГО ПО ВОЗРАСТАНИЮ (<)", 
НАЧИНАЯ С ЕГО НАЧАЛА. Поясняющие ПРИМЕРЫ (1-5) приведены ниже: 
1) если список имел вид (10,13,16,19,8,5,14,20,19,3), то в
результате преобразований он станет таким: (10,13,16,19,20).
2) если список имел вид (1,1,1,1,1,1,1,1,1,1), то в результате 
преобразований он станет таким: (1).
3) если список имел вид (10,9,4,6,2,4,1,7,8,9), то в
результате преобразований он станет таким: (10).
4) если список имел вид (2,3,5,9,10,14,16,20,21,30), то в
результате преобразований он не изменится.
5) если список был пустым, то он не изменится.

ТРЕБОВАНИЯ к решению ЭТАПА_2: 
1) Описать процедуру  Remove(L) для удаления из списка L всех лишних 
элементов. 2) Вывести на экран полученный список, воспользовавшись
ранее написанной процедурой Print(L).  

------------------------------------------------------------------------
ЭТАП_3  (30 очков)
Работа со списком, полученным после ЭТАПА_2
------------------------------------------------------------------------
Проверить, образует ли полученный список L ВОЗРАСТАЮЩУЮ арифметическую 
прогрессию, состоящую из НЕ МЕНЕЕ ДВУХ элементов. Ответ на экране в 
виде: TRUE/FALSE. Если да, то ДОБАВИТЬ В КОНЕЦ СПИСКА НОВЫЙ ЭЛЕМЕНТ, 
являющийся очередным членом этой арифметической прогрессии. 

ТРЕБОВАНИЯ к решению ЭТАПА_3: 
1) Описать булевскую функцию IsArithm(L), выполняющую требуемую 
проверку. Функция, помимо проверки, в качестве “побочного эффекта”, 
ДОБАВЛЯЕТ, в случае необходимости, НОВЫЙ ЭЛЕМЕНТ в КОНЕЦ списка. 
(внимание: в процессе работы данной функции ПО СПИСКУ разрешается 
пройтись ТОЛЬКО ОДИН РАЗ!). Если новый элемент был добавлен в конец 
списка, то по окончании работы функции IsArithm(L) вывести (из основной 
программы) на экран преобразованный список, воспользовавшись ранее 
написанной процедурой Print(L). Если нет - то на этом завершить работу 
программы. 

------------------------------------------------------------------------
Примечание: размер шрифта (в окне редактора и окне вывода следует 
УВЕЛИЧИТЬ, чтобы проверяющему всё было ВИДНО ХОРОШО.
------------------------------------------------------------------------
***********************************************************************)
program task(input, output);
uses heaptrc;        {подключение модуля контроля утечки памяти}
const
    n = 5;           {в текстовом файле matrix.txt задана 
                      целочисленная квадратная матрица n x n}
type
    TE = integer;
    list = ^node;
    node = record
        elem: TE;
        next: list
    end;
var 
    L: list;     {список, который следует построить}
    t: text;     {текстовый файл с матрицей чисел размером n x n}
    k: integer;  {значение k ввести с клавиатуры - для ЭТАПА_1}
    
//////////////////////////////////////////////////////////////////////
////   далее располагаются описания ваших процедур и функций      ////
//////////////////////////////////////////////////////////////////////

function CreateList(var t: text; k: integer): list;
var
    p1, p2, p, pt: list;
    i, j, x: integer;
begin
    reset(t);
    p1 := nil;
    p2 := nil;
    pt := nil;
    if (k > 0) and (k <= n) then begin
        for i := 1 to n do begin
            for j := 1 to n do begin
                read(t, x);
                write(x, ' ');
                if j = k then begin
                    new(p);
                    p^.elem := x;
                    p^.next := p2;
                    p2 := p;
                end;
                if i = k then begin
                    new(p);
                    p^.elem := x;
                    p^.next := nil;
                
                    if p1 = nil then begin
                        p1 := p;
                        pt := p1;
                    end
                    else begin
                        pt^.next := p;
                        pt := p;
                    end;
                end;
            end;
            writeln;
        end;
        pt^.next := p2;
    end;
    
    if p1 = nil then
        writeln('empty');
    CreateList := p1;
end;

procedure Remove(var L: list);
var
    q: list;
begin
    if L <> nil then
        if L^.next <> nil then begin
            if L^.elem >= L^.next^.elem then begin
                q := L^.next;
                L^.next := L^.next^.next;
                dispose(q);
                Remove(L);
            end
            else
                Remove(L^.next);
            
        end;
end;

function IsArithm(L: list): boolean;
var
    d, dt: integer;
    fl : boolean;
    p: list;
begin
    fl := False;
    if L <> nil then
        if L^.next <> nil then begin
            d := L^.next^.elem - L^.elem;
            if d > 0 then
                fl := True;
            L := L^.next;
            while (L^.next <> nil) and fl do begin
                dt := L^.next^.elem - L^.elem;
                if dt <> d then
                    fl := False;
                L := L^.next;
            end;
            if fl then begin
                new(p);
                p^.elem := L^.elem + d;
                p^.next := nil;
                L^.next := p;
            end;
        end;
    IsArithm := fl;
end;




procedure Print(var L: list);
begin
    if L <> nil then
        if L^.next <> nil then begin
            write(L^.elem, ' ');
            Print(L^.next);
        end
        else
            write(L^.elem, ' ');
end;

procedure destroy(var L: list);
var
    p: List;
begin
    if L <> nil then begin  
        p := L;
        L := L^.next;
        dispose(p);
        destroy(L);
    end;
        
end;

begin
    {содержимое раздела операторов - менять с учётом сдаваемых этапов}
    {обязательно выводить номер этапа, который сейчас выполняется}
    {содержимое раздела операторов - менять с учётом сдаваемых этапов}
    {обязательно выводить название этапа, который сейчас выполняется}
    writeln('===================');
    writeln('Task (list actions)');
    writeln('===================');
    writeln;
    assign(t,'matrix.txt');    // матрица целых чисел размером n x n
    writeln('part_1');
    {далее ваши операторы:}  
    read(k);
    L := nil;
    L := CreateList(t, k);
    Remove(L);
    writeln(IsArithm(L));
    Print(L);
    
    destroy(L);
    close(t);                           {нужно для Фри-Паскаля}   
    writeln
end.

(* Содержимое файла matrix.txt (всего пять строк, в каждой - по 5 чисел):
10   10   10   10   10 
10   12   14   16   18   
10   9    8    7    6
10   20   30   20   30
10   5    10   40   50
*)

{
------------------------------------------------------------------------
                                ТЕСТЫ
------------------------------------------------------------------------
Тест_1: k=1
------------------------------------------------------------------------
после этапа_1:
10   10   10   10   10   10   10   10   10   10
после этапа_2:
10
после этапа_3:
FALSE
------------------------------------------------------------------------
Тест_2: k=2
------------------------------------------------------------------------
после этапа_1:
10   12   14   16   18   5   20   9   12   10
после этапа_2:
10   12   14   16   18   20 
после этапа_3:
TRUE
10   12   14   16   18   20   22
------------------------------------------------------------------------
Тест_3: k=3
------------------------------------------------------------------------
после этапа_1:
10   9    8    7    6   10   30   8   14   10
после этапа_2:
10   30 
после этапа_3:
TRUE
10   30   50
------------------------------------------------------------------------
Тест_4: k=4
------------------------------------------------------------------------
после этапа_1:
10   20   30   20   30   40   20   7    16    10
после этапа_2:
10   20   30   40 
после этапа_3:
TRUE
10   20   30   40    50
------------------------------------------------------------------------
Тест_5: k=5
------------------------------------------------------------------------
после этапа_1:
10   5    10   40   50   50   30   6   18  10
после этапа_2:
10   40    50
после этапа_3:
FALSE
------------------------------------------------------------------------
Тест_6: k=6 (>n)
------------------------------------------------------------------------
после этапа_1:
empty
после этапа_2:
ничего не напечатается
после этапа_3:
FALSE
------------------------------------------------------------------------
}




