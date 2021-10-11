unit gen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Clipbrd, Buttons, XPman, Spin;

type
  TForm1 = class(TForm)
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Label1: TLabel;
    result: TEdit;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    SpinEdit1: TSpinEdit;
    CheckBox5: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox4Enter(Sender: TObject);
    procedure resultClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  str,spec,bigstr,cif,rus:string;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
i:integer;
pass,resx:string;
len:integer;
begin
resx:=edit2.Text;
len:=SpinEdit1.Value;

if resx <> '' then
begin
  for i:=1 to len do
  begin
    randomize();
    pass:=pass+resx[random(length(resx))+1];
  end;
end
else
  MessageDlg('Выберите составляющие пароля.',mtWarning, [mbOK], 0);

result.Text:=pass;

end;

procedure TForm1.CheckBox4Enter(Sender: TObject);
var res:string;
begin
  res:='';
  if CheckBox1.Checked = true then
   res:=res+spec;
  if CheckBox5.Checked = true then
   res:=res+rus;
  if CheckBox2.Checked = true then
   res:=res+str;
  if CheckBox3.Checked = true then
   res:=res+bigstr;
  if CheckBox4.Checked = true then
   res:=res+cif;
   Edit2.text:=res;
end;

procedure TForm1.resultClick(Sender: TObject);
begin
  result.SelectAll;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Clipboard.AsText := result.Text;
  MessageDlg('Пароль скопирован в буфер обмена.',mtInformation, [mbOK], 0);
end;

begin
  Application.Title:='Генератор паролей';
  str:='abcdefghijklmnopqrstuvwxyz';
  bigstr:='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  cif:='1234567890';
  spec:='!@#$%^&*()"''\\/|~`?<>,.;:{}[]';
  rus:='абвгдеёжзийклмнопрстуфхцчшщъыьэюя';
end.
