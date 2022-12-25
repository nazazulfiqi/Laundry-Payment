unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1, Unit6, Unit7, Unit14;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
form2.Hide;
form6.show;
form6.edit1.text:='';
form6.edit2.text:='';
form6.memo1.text:='';
form6.Combobox1.text:='';
form6.edit9.text:='0';
form6.edit4.text:='';
form6.edit6.text:='0';
form6.edit7.text:='';
form6.edit8.text:='';
form6.edit11.text:='';
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
form7.adoquery3.open;
form2.Hide;
form7.show;
form7.adoquery3.open;
form7.Edit1.SetFocus;
form7.edit1.text:='';
form7.edit2.Text:='';
form7.memo1.text:='';
form7.edit9.text:='';
form7.edit10.text:='';
form7.edit4.text:='0';
form7.edit5.text:='';
form7.edit6.text:='0';
form7.DBedit1.text:='0';
form7.edit7.text:='';
form7.edit8.text:='0';
quickreport14.ADOQuery1.close;
form7.ADOQuery1.First;
while not form7.ADOQuery1.Eof do
begin
if form7.ADOQuery1['kategori'] <> '' then
form7.ADOQuery1.Delete
else
form7.ADOQuery1.Next;
end;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
if messagedlg('Kembali Ke Menu Masuk?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
form2.hide;
form1.show;
end;
end;

end.
