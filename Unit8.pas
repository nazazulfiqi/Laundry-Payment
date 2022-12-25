unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, StdCtrls, jpeg, ExtCtrls;

type
  TForm8 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Image1: TImage;
    Edit4: TEdit;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

uses Unit3, Unit1, Unit11, Unit16;

{$R *.dfm}

procedure TForm8.Button1Click(Sender: TObject);
begin
with adoquery1 do
begin
    sql.text:='select * from akun where username='+quotedstr(edit1.text);
    open;
  end;
if adoquery1.recordcount = 1 then
  begin
    messagedlg('Username sudah ada!',mtinformation,[mbok],0);
    edit1.SetFocus;
  end
else
if adoquery1.recordcount = 0 then
begin
if edit1.text='' then
begin
messagedlg('Semua Wajib Diisi!',mtwarning,[mbok],0);
edit1.text:='';
edit2.text:='';
edit4.text:='';
edit1.SetFocus;
end
else if edit2.text='' then
begin
messagedlg('Semua Wajib Diisi!',mtwarning,[mbok],0);
edit1.text:='';
edit2.text:='';
edit4.text:='';
edit1.SetFocus;
end
else
begin
messagedlg('Akun Berhasil Dibuat!',mtinformation,[mbok],0);
adoquery1.Append;
adoquery1.FieldByName('username').AsString:=edit1.Text;
adoquery1.FieldByName('password').AsString:=edit2.Text;
adoquery1.FieldByName('jabatan').AsString:=edit3.Text;
adoquery1.FieldByName('nama').AsString:=edit4.Text;
adoquery1.post;
edit1.text:='';
edit2.text:='';
edit4.text:='';
edit1.SetFocus;
end;
end;
end;

procedure TForm8.Button2Click(Sender: TObject);
begin
if edit1.Text='admin'then
  begin
    messagedlg('Tidak Bisa Di Hapus!',mtinformation,[mbok],0);
    end
  else
if edit2.Text='admin'then
  begin
    messagedlg('Tidak Bisa Di Hapus!',mtinformation,[mbok],0);
    end
  else
  begin
messagedlg('Sukses Di Hapus!',mtinformation,[mbok],0);
dbgrid1.DataSource.DataSet.Delete;
edit1.text:='';
edit2.text:='';
edit4.text:='';
end;
end;

procedure TForm8.DBGrid1CellClick(Column: TColumn);
begin
edit1.text:=adoquery1.fieldbyname('username').AsString;
edit2.text:=adoquery1.fieldbyname('password').AsString;
edit4.text:=adoquery1.fieldbyname('nama').AsString;
end;

procedure TForm8.Button3Click(Sender: TObject);
begin
if messagedlg('Apakah Anda Yakin Ingin Keluar?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
form8.hide;
form3.show;
end;
end;
procedure TForm8.Button4Click(Sender: TObject);
begin
quickreport11.adoquery1.open;
QuickReport11.Preview;
quickreport11.adoquery1.close;

end;

end.
 