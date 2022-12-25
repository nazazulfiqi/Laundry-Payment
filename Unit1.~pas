unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, jpeg, ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    ADOCon: TADOConnection;
    QLogin: TADOQuery;
    Image1: TImage;
    Button2: TButton;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit3, Unit4, Unit5;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
if edit1.Text=''then
  begin
    messagedlg('Nama atau Kata Sandi Salah!',mtinformation,[mbok],0);
    end
  else
if edit2.Text=''then
  begin
    messagedlg('Nama atau Kata Sandi Salah!',mtinformation,[mbok],0);
    end
  else
  begin
    with QLogin do
  begin
    close;
    sql.clear;
    sql.text:='select *from akun where username='+quotedstr(edit1.Text);
    open;
  end;
if QLogin.recordcount=0 then
  begin
    messagedlg('Nama atau Kata Sandi Salah!',mtinformation,[mbok],0);
    edit1.Text:='';
    edit2.Text:='';
    edit1.SetFocus;
    end
  else
if QLogin.fieldbyname('password').asstring <> edit2.Text then
  begin
    messagedlg('Nama atau Kata Sandi Salah!',mtwarning,[mbok],0);
    edit1.Text:='';
    edit2.text:='';
    edit1.setfocus;
    end
  else
  begin
    messagedlg('Berhasil Login',mtinformation,[mbok],0);
if QLogin.fieldbyname('jabatan').asstring='kasir' then
  begin
  form1.hide;
  form2.show;
  edit1.Text:='';
  edit2.Text:='';
end
  else if QLogin.fieldbyname('jabatan').asstring='admin' then
  begin
  form1.hide;
  form3.show;
  edit1.Text:='';
  edit2.Text:='';
end
end;
end;
end;
procedure TForm1.Button2Click(Sender: TObject);
begin
form1.Hide;
form5.show;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
if checkbox1.Checked then
  begin
  edit2.passwordchar:=#0;
  end
else
  begin
  edit2.passwordchar:='*';
end;
end;

end.
