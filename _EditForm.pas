unit _EditForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxPCdxBarPopupMenu,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, Vcl.ImgList,
  System.Actions, Vcl.ActnList, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls, cxPC,
  Vcl.DBActns;

type
  T_frmEdit = class(TForm)
    pcMain: TcxPageControl;
    tsGeneral: TcxTabSheet;
    pmlMain: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    DataSource: TDataSource;
    ActionList: TActionList;
    cxImageList: TcxImageList;
    actPost: TAction;
    actCancel: TAction;
    procedure FormShow(Sender: TObject);
    procedure actPostExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure pcMainChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FDataSet: TDataSet;
    FView: Boolean;
    FieldDescripcion: TField;
    FDescripcion: string;
    procedure SetDataSet(const Value: TDataSet);
    procedure SetView(const Value: Boolean);
    procedure SetDescripcion(const Value: string);
  public
    { Public declarations }
    property View: Boolean read FView write SetView default False;
    property DataSet: TDataSet read FDataSet write SetDataSet;
    property Descripcion: string read FDescripcion write SetDescripcion;
  end;

implementation

{$R *.dfm}

uses _Utils;

procedure T_frmEdit.actCancelExecute(Sender: TObject);
begin
  if DataSource.DataSet.State in [dsInsert, dsEdit] then
    DataSource.DataSet.Cancel;
  ModalResult:= mrCancel;
end;

procedure T_frmEdit.actPostExecute(Sender: TObject);
begin
  if DataSource.DataSet.State in [dsInsert, dsEdit] then
//    try
      DataSource.DataSet.Post;
//    except on E: EDatabaseError do
//      if Pos('UNIQUE KEY',E.Message)>0 then
//        MessageDlg(strUniqueKeyError, mtError, [mbOk], 0)
//    end;
  ModalResult:= mrOk;
end;

procedure T_frmEdit.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DataSource.DataSet.State in [dsInsert, dsEdit] then
    DataSource.DataSet.Cancel;
end;

procedure T_frmEdit.FormCreate(Sender: TObject);
begin
  Descripcion:= 'Descripcion';
end;

procedure T_frmEdit.FormShow(Sender: TObject);
begin
  pcMain.ActivePage := tsGeneral;
  if Assigned(FieldDescripcion) and (FieldDescripcion is TStringField) then
    Caption:= FieldDescripcion.AsString;
end;

procedure T_frmEdit.pcMainChange(Sender: TObject);
begin
  if (pcMain.ActivePage <> tsGeneral) and (DataSource.DataSet.State in [dsInsert]) then
    try
      DataSource.DataSet.Post;
    except
      pcMain.ActivePage := tsGeneral;
      raise;
    end;
end;

procedure T_frmEdit.SetDataSet(const Value: TDataSet);
begin
  FDataSet := Value;
  if Assigned(Value) then
  begin
    DataSource.DataSet:= Value;
    FieldDescripcion:= Value.FindField(Descripcion);
  end;
end;

procedure T_frmEdit.SetDescripcion(const Value: string);
begin
  FDescripcion := Value;
end;

procedure T_frmEdit.SetView(const Value: Boolean);
begin
  FView := Value;
  btnOk.Visible:= not Value;
  if Value then
    btnCancel.Caption:= 'Cerrar'
  else
    btnCancel.Caption:= '&Cancelar'
end;

end.
