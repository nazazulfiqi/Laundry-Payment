unit Unit11;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB, jpeg;

type
  TQuickReport11 = class(TQuickRep)
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    DetailBand1: TQRBand;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    Date: TQRExpr;
    QRImage1: TQRImage;
    QRShape1: TQRShape;
    procedure QuickRepEndPage(Sender: TCustomQuickRep);
  private

  public

  end;

var
  QuickReport11: TQuickReport11;

implementation

{$R *.DFM}

procedure TQuickReport11.QuickRepEndPage(Sender: TCustomQuickRep);
begin
adoquery1.close;
end;

end.
