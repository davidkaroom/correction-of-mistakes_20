unit my_module;
{это модуль логики программы}
// здесь описываются все процедуры, которые работают с данными пользователя:
// получение (вычисление) новых данных, сохранение и загрузка в файл
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

function sum(a,d,n:real): real;                //вычисляет сумму алгебраической прогрессии
procedure saveparam(a,d,n:real; filename: string); //сохраняет параметры ввода в текстовый файл построчно
procedure loadparams(var a, d, n: real; filename: string); //загружает параметры ввода из текстового файла построчно


implementation
 function sum(a,d,n:real): real;
  begin
  result := ((2*a+(n-1)*d)*n) / 2;
  end;
procedure saveparam(a,d,n:real; filename: string);
 var f:text;
 begin
   assign(f, filename);
       rewrite(f);
       writeln(f, a);
       writeln(f, d);
       writeln(f, n);
       close(f);
 end;
 procedure loadparams(var a, d, n: real; filename: string);
   var
    f: text;
  begin
      assign(f, filename);
      reset(f);
      readln(f, a);
      readln(f, d);
      readln(f, n);
      close(f);
  end;

end.

