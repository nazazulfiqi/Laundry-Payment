unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, jpeg, ExtCtrls, DB, ADODB, Mask,
  DBCtrls, ComCtrls;

type
  TForm7 = class(TForm)
    Image1: TImage;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    DBGrid1: TDBGrid;
    Edit4: TEdit;
    Edit5: TEdit;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    Edit6: TEdit;
    DataSource1: TDataSource;
    Button1: TButton;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Edit7: TEdit;
    Edit8: TEdit;
    Button2: TButton;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    Button3: TButton;
    Edit9: TEdit;
    Label11: TLabel;
    ADOQuery3: TADOQuery;
    DataSource3: TDataSource;
    DBGrid2: TDBGrid;
    Edit10: TEdit;
    Memo1: TMemo;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Edit3: TEdit;
    Label13: TLabel;
    ComboBox1: TComboBox;
    ADOQuery3kategori: TWideStringField;
    ADOQuery3harga: TWideStringField;
    DBEdit1: TDBEdit;
    Label12: TLabel;
    DT1: TDateTimePicker;
    DT2: TDateTimePicker;
    Label8: TLabel;
    Label14: TLabel;
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Button4Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
  PROCEDURE TAMPIL;
  
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

uses Unit2, Unit9, Unit14, Unit13, Unit15;

{$R *.dfm}

procedure TForm7.Edit5KeyPress(Sender: TObject; var Key: Char);
var
harga,jumlah,h:integer;
begin
if not  (key in['0'..'9', #8, #13, #32]) then
key :=#0;

if key=#13 then
begin
harga:=strtoint(edit4.text);
jumlah:=strtoint(edit5.text);
h:=harga*jumlah;
edit6.text:=inttostr(h);
end;
end;
procedure TForm7.Button1Click(Sender: TObject);
begin
if edit1.text='' then
begin
messagedlg('Semua Wajib Diisi!',mtinformation,[mbok],0);
end
else if edit2.text='' then
begin
messagedlg('Semua Wajib Diisi!',mtinformation,[mbok],0);
end
else
begin
messagedlg('Sukses diMasukkan Keranjang!',mtinformation,[mbok],0);
edit7.Enabled:=true;
button2.Enabled:=true;
button3.Enabled:=true;
adoquery1.append;
adoquery1.FieldByName('kategori').AsString:=edit10.Text;
adoquery1.FieldByName('harga').AsString:=edit4.Text;
adoquery1.FieldByName('jumlah').AsString:=edit5.Text;
adoquery1.FieldByName('total_harga').AsString:=edit6.Text;
adoquery1.FieldByName('kode_pembayaran').AsString:=edit9.Text;
adoquery1.post;
form15.adoquery1.Append;
form15.adoquery1.FieldByName('nama').AsString:=edit1.text;
form15.adoquery1.FieldByName('no_telp').AsString:=edit2.text;
form15.adoquery1.FieldByName('alamat').AsString:=memo1.text;
form15.adoquery1.FieldByName('kategori').AsString:=edit10.text;
form15.adoquery1.FieldByName('harga').AsString:=edit4.text;
form15.adoquery1.FieldByName('jumlah').AsString:=edit5.text;
form15.adoquery1.FieldByName('jenis').AsString:=edit3.text;
form15.adoquery1.FieldByName('kode_pembayaran').AsString:=edit9.text;
form15.adoquery1.FieldByName('tanggal_pesan').AsDateTime:=DT1.Date;
form15.adoquery1.FieldByName('tanggal_ambil').AsDateTime:=DT2.Date;
form15.adoquery1.Post;
edit5.text:='';
edit6.text:='0';

adoquery2.Close;
adoquery2.SQL.Clear;
adoquery2.SQL.Add('select sum(total_harga) from keranjang_satuan');
adoquery2.Open;
//form2.ADOQuery1.Close;
end;
end;

procedure TForm7.Button2Click(Sender: TObject);
var
na,za:integer;
qi : real;
begin
na:=strtoint(edit7.Text);
za:=strtoint(dbedit1.Text);
if na < za then
begin
messagedlg('Uang Kurang!',mtinformation,[mbok],0);
end
else
begin
messagedlg('Sukses,Silahkan Cetak Struk!',mtinformation,[mbok],0);
button4.Enabled:=true;
qi:=na-za;
edit8.Text:=floattostr(qi);
end;
end;


procedure TForm7.Button3Click(Sender: TObject);
begin
adoquery1.First;
while not adoquery1.Eof do
begin
messagedlg('Sukses Di Hapus!',mtinformation,[mbok],0);
if adoquery1['kategori']<>''then
adoquery1.delete;
end;
end;

procedure TForm7.DBGrid2CellClick(Column: TColumn);
begin
edit10.text:=adoquery3.fieldbyname('kategori').AsString;
edit4.text:=adoquery3.fieldbyname('harga').AsString;
end;

procedure TForm7.FormCreate(Sender: TObject);
begin
memo1.Text:='';
ADOQuery3.Close;
ADOQuery3.Open;
ADOQuery3.Active:=False;
ADOQuery3.SQL.Clear;
ADOQuery3.SQL.Add('SELECT*FROM satuan');
ADOQuery3.Active:=True;
while not ADOQuery3.Eof do
begin
combobox1.Items.Add(ADOQuery3.FieldByName('kategori').AsString);
ADOQuery3.Next;
end;
end;

procedure TForm7.Memo1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
edit9.text:='KG'+'-'+ formatdatetime('ddmmyyyy',now)+'-'+inttostr(form15.adoquery1.RecordCount+1);
end;
end;

procedure TForm7.Button5Click(Sender: TObject);
begin
edit1.text:='';
edit2.Text:='';
memo1.text:='';
edit9.text:='';
edit10.text:='';
edit4.text:='0';
edit5.text:='';
edit6.text:='0';
DBedit1.text:='0';
edit7.text:='';
edit8.text:='0';
quickreport14.ADOQuery1.close;

end;

procedure TForm7.Button6Click(Sender: TObject);
begin
if messagedlg('Apakah Anda Yakin Ingin Keluar?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
begin
form7.hide;
form2.show;
end;
end;

procedure TForm7.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
if not  (key in['0'..'9', #8, #13, #32]) then
key :=#0;
end;

procedure TForm7.Button4Click(Sender: TObject);
begin
quickreport14.ADOQuery1.Open;
QuickReport14.QRLabel15.Caption:=Edit1.text;
QuickReport14.QRLabel16.Caption:=Edit2.text;
QuickReport14.QRLabel17.Caption:=memo1.text;
QuickReport14.QRLabel18.Caption:=Edit9.text;
QuickReport14.QRLabel20.Caption:=Edit3.text;
QuickReport14.QRLabel6.Caption:=Edit7.text;
QuickReport14.QRLabel21.Caption:=Edit8.text;
QuickReport14.QRLabel12.Caption:=DBEdit1.text;
QuickReport14.Preview;
quickreport14.ADOQuery1.close;
ADOQuery1.First;
while not ADOQuery1.Eof do
begin
if ADOQuery1['kategori'] <> '' then
ADOQuery1.Delete
else
ADOQuery1.Next;
edit1.text:='';
edit2.Text:='';
memo1.text:='';
edit9.text:='';
edit10.text:='';
edit4.text:='0';
edit5.text:='';
edit6.text:='0';
DBedit1.text:='0';
edit7.text:='';
edit8.text:='0';
edit7.Enabled:=false;
button2.Enabled:=false;
button3.Enabled:=false;
button4.enabled:=false;
edit1.SetFocus;
end;
end;

procedure TForm7.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if not  (key in['0'..'9', #8, #13, #32]) then
key :=#0;
end;

procedure TForm7.ComboBox1Click(Sender: TObject);
begin
edit4.Text:= Adoquery3.fieldbyname('harga').AsString;
end;

procedure TForm7.TAMPIL;
begin
edit10.Text:=ADOQuery3kategori.AsString;
edit4.Text:=ADOQuery3harga.AsString;
end;

procedure TForm7.ComboBox1Change(Sender: TObject);
begin
if not ADOQuery3.Locate('kategori',ComboBox1.Text,[]) =true then
messagedlg('Kategori Belum Tersedia!',mtwarning,[mbok],0);
combobox1.Text :='';
TAMPIL;

end;

end.
