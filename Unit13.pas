unit Unit13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, jpeg, ExtCtrls;

type
  TForm13 = class(TForm)
    DBGrid1: TDBGrid;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Button2: TButton;
    Button5: TButton;
    Button6: TButton;
    Image1: TImage;
    procedure Button2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit8KeyPress(Sender: TObject; var Key: Char);
    procedure Edit10KeyPress(Sender: TObject; var Key: Char);
    procedure Edit11KeyPress(Sender: TObject; var Key: Char);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

uses Unit4, Unit16;

{$R *.dfm}

procedure TForm13.Button2Click(Sender: TObject);
begin
if messagedlg('Apakah Anda Yakin Ingin Keluar?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
form13.Hide;
form4.show;
end;
end;

procedure TForm13.Button6Click(Sender: TObject);
begin
quickreport16.adoquery1.open;
begin
with quickreport16 do
begin
qrexpr3.Expression:='SUM(total_harga)';
QuickReport16.Preview;
quickreport16.adoquery1.close;

end;
end;
end;

procedure TForm13.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if not  (key in['0'..'9', #8, #13, #32]) then
key :=#0;
end;

procedure TForm13.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
if not  (key in['0'..'9', #8, #13, #32]) then
key :=#0;
end;

procedure TForm13.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
if not  (key in['0'..'9', #8, #13, #32]) then
key :=#0;
end;

procedure TForm13.Edit8KeyPress(Sender: TObject; var Key: Char);
begin
if not  (key in['0'..'9', #8, #13, #32]) then
key :=#0;
end;

procedure TForm13.Edit10KeyPress(Sender: TObject; var Key: Char);
begin
if not  (key in['0'..'9', #8, #13, #32]) then
key :=#0;
end;

procedure TForm13.Edit11KeyPress(Sender: TObject; var Key: Char);
begin
if not  (key in['0'..'9', #8, #13, #32]) then
key :=#0;
end;

procedure TForm13.Button5Click(Sender: TObject);
begin
messagedlg('Sukses Di Hapus!',mtinformation,[mbok],0);
dbgrid1.DataSource.DataSet.Delete;
end;

end.
