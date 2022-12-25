unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TForm3 = class(TForm)
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
  Form3: TForm3;

implementation

uses Unit4, Unit8, Unit1;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
begin
form3.hide;
form4.show;
form4.edit1.Text:='';
form4.edit2.Text:='';
form4.edit3.Text:='';
form4.edit4.Text:='';
form4.edit5.Text:='';
form4.edit6.Text:='';
form4.edit7.Text:='';
form4.edit8.Text:='';

end;

procedure TForm3.Button2Click(Sender: TObject);
begin
form3.hide;
form8.show;
form8.Edit1.Text:='';
form8.Edit2.Text:='';
form8.Edit4.Text:='';
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
if messagedlg('Kembali Ke Menu Masuk?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
form3.hide;
form1.show;
end;
end;

end.
