unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, my_module;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    MainMenu1: TMainMenu;
    FileU: TMenuItem;
    HELPF: TMenuItem;
    CLOSEF: TMenuItem;
    OPENF: TMenuItem;
    SAVEF: TMenuItem;
    SAVEAS: TMenuItem;
    OpenDialog1: TOpenDialog;
    Podskazka3: TLabel;
    Result: TMemo;
    SaveDialog1: TSaveDialog;
    VA: TEdit;
    VD: TEdit;
    VN: TEdit;
    Podskazka: TLabel;
    Podskazka1: TLabel;
    Podskazka2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure HELPFClick(Sender: TObject);
    procedure CLOSEFClick(Sender: TObject);
    procedure OPENFClick(Sender: TObject);
    procedure SAVEASClick(Sender: TObject);
    procedure SAVEFClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  //глобальные переменные
  a,d,n,s:real;
  //s- сумма алгебраической прогрессии, a,d,n - параметры.
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  Result.Lines.Clear; //очищаем от лишней информации
  a:=random(100);
  d:=random(100);
  n:=random(100);
  VA.Text:=FloatToStr(a);
  VD.Text:=FloatToStr(d);
  VN.Text:=FloatToStr(n);
  //далее при запуске программы сразу заполняем поля ввода и присваиваем переменным рандомные значения
  //и присваиваем переменным рандомные значения  так как это удобно для пользователя
end;


procedure TForm1.HELPFClick(Sender: TObject);
begin
   ShowMessage('Программа вычисляет сумму арифметической прогрессии по формуле [s:=((2*a+(n-1)*d)*n) / 2 ]  Автор: Бурдуковский Давид');
end;

procedure TForm1.CLOSEFClick(Sender: TObject);
begin
  Close;
end;

//открыть файл с параметрами
procedure TForm1.OPENFClick(Sender: TObject);
 begin
    if OpenDialog1.Execute then
      begin
        if OpenDialog1.FileName <> '' then
          begin
          loadparams(a,d, n, OpenDialog1.FileName);
          VA.Text   := floattostr( a );
          VD.Text := floattostr( d );
          VN.Text   := floattostr( n );
          end;
      end;

end;

procedure TForm1.SAVEASClick(Sender: TObject);
begin
   if SaveDialog1.Execute then
    if SaveDialog1.FileName <> '' then
  Result.Lines.SaveToFile( SaveDialog1.FileName);
end;

procedure TForm1.SAVEFClick(Sender: TObject);
begin
   if SaveDialog1.Execute then
     begin
       if SaveDialog1.FileName <> '' then
         begin
         saveparam(a,d, n, SaveDialog1.FileName);
         end;
     end;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
if TryStrToFloat(VA.Text, a) = false then
   begin
   ShowMessage('Неправильно введён параметр a');
   exit;
   end;
if TryStrToFloat(VD.Text, d) = false then
   begin
   ShowMessage('Неправильно введён параметр d');
   exit;
   end;
if TryStrToFloat(VN.Text, n) = false then
   begin
   ShowMessage('Неправильно введён параметр n');
   exit;
   end;
 a:=StrToFloat(VA.Text);
 d:=StrToFloat(VD.Text);
 N:=StrToFloat(VN.Text);
 s:=sum(a,d,n);
 Result.Lines.Add('При a = '+FloatToStr(a)+' d = '+FloatToStr(d)+' n = '+FloatToStr(n));
 Result.Lines.Add('Сумма членов арифметической прогрессии равна '+ FloatToStr(s));
end;

end.

