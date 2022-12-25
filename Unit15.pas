unit Unit15;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ADODB, jpeg, ExtCtrls;

type
  TForm15 = class(TForm)
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Image1: TImage;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;

implementation

uses Unit4, Unit17;

{$R *.dfm}

procedure TForm15.Button3Click(Sender: TObject);
begin
messagedlg('Sukses Di Hapus!',mtinformation,[mbok],0);
dbgrid1.DataSource.DataSet.Delete;
end;

procedure TForm15.Button4Click(Sender: TObject);
begin
if messagedlg('Apakah Anda Yakin Ingin Keluar?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
form4.show;
form15.Hide;
end;
end;

procedure TForm15.Button5Click(Sender: TObject);
begin
quickreport17.adoquery1.open;
begin
with quickreport17 do
begin
qrexpr3.Expression:='SUM(harga)';
QuickReport17.Preview;
quickreport17.adoquery1.close;
end;
end;
end;
procedure TForm15.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if not  (key in['0'..'9', #8, #13, #32]) then
key :=#0;
end;

procedure TForm15.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
if not  (key in['0'..'9', #8, #13, #32]) then
key :=#0;
end;

procedure TForm15.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
if not  (key in['0'..'9', #8, #13, #32]) then
key :=#0;
end;

end.
