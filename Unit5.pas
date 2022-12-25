unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls;

type
  TForm5 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm5.Button1Click(Sender: TObject);
begin
form5.hide;
form1.show;
end;

procedure TForm5.Button2Click(Sender: TObject);
begin
if messagedlg('Apakah Anda Yakin Ingin Keluar?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
application.Terminate;
end;
end;
end.
 