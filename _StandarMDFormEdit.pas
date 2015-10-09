(******************************************************************************
 Proyecto Delphi Standard

 Copyright (C) 2008-2015 - Jesus Huante Caballero

 ******************************************************************************)
unit _StandarMDFormEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Vcl.Dialogs, System.UITypes, DB, ExtCtrls, Grids, DBGrids, DBCtrls, ImgList, ComCtrls, ToolWin,
  ActnMan, ActnCtrls, XPStyleActnCtrls, DBActns, ActnList, DBClientActns,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, StdActns,
  cxGridExportLink, _Utils, cxGridCustomPopupMenu, cxGridPopupMenu, cxHint,
  Menus, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxNavigator,
  System.Actions, cxPCdxBarPopupMenu, cxPC, _StandarGFormEdit, _StandarGFormGrid;

type
  T_frmStandarMDFormEdit = class(TForm)
    DataSource: TDataSource;
    ilPageControl: TImageList;
    ActionList: TActionList;
    ilAction: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    cxsEven: TcxStyle;
    cxsOdd: TcxStyle;
    cxsInactive: TcxStyle;
    cxsDelete: TcxStyle;
    cxsActive: TcxStyle;
    pnlMaster: TPanel;
    tbarCategorias: TToolBar;
    ToolButton3: TToolButton;
    procedure DataSetInsertExecute(Sender: TObject);
    procedure pcMainChanging(Sender: TObject; var AllowChange: Boolean);
//    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
//      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DataSetDeleteExecute(Sender: TObject);
    procedure tvMasterStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      out AStyle: TcxStyle);
    procedure actShowGridExecute(Sender: TObject);
  private
    { Private declarations }
    FReadOnlyGrid: Boolean;
    FDataSet: TDataSet;
    FgEditForm : T_frmStandarGFormEdit;
    FgGridForm : T_frmStandarGFormGrid;
    procedure SetDataSet(const Value: TDataSet);
  protected
    tvStatus: TcxGridDBColumn;
    gGridEditForm : T_frmStandarGFormEdit;
    property gFormGrid : T_frmStandarGFormGrid read FgGridForm write FgGridForm;
  public
    { Public declarations }
    property DataSet: TDataSet read FDataSet write SetDataSet;
    procedure GetContentStyle(pStatus: TcxGridDBColumn;
      pRecord: TcxCustomGridRecord; pItem: TcxCustomGridTableItem;
      out pStyle: TcxStyle);
    procedure ShowModule(pConteiner: TWinControl; pCation: TCaption);
  end;

implementation

{$R *.dfm}

uses _MainRibbonForm;

procedure T_frmStandarMDFormEdit.actShowGridExecute(Sender: TObject);
begin
  if Assigned(FgGridForm) then
  begin
    FgGridForm.View := True;
    FgGridForm.ShowModal;
  end;
end;

procedure T_frmStandarMDFormEdit.DataSetDeleteExecute(Sender: TObject);
begin
  if MessageDlg(strAllowDelete, mtConfirmation, mbYesNo, 0) = mrYes
  then DataSource.DataSet.Delete;
end;

procedure T_frmStandarMDFormEdit.DataSetInsertExecute(Sender: TObject);
begin
  DataSource.DataSet.Insert;
end;

procedure T_frmStandarMDFormEdit.GetContentStyle(pStatus: TcxGridDBColumn;
  pRecord: TcxCustomGridRecord; pItem: TcxCustomGridTableItem;
  out pStyle: TcxStyle);
var
  vStatus: string;
begin
  vStatus := EmptyStr;
  if (pStatus <> nil) and (pRecord <> nil) and (pItem <> nil ) then
    if not VarIsNull(TcxCustomGridRecord(pRecord).Values[pStatus.Index]) then
      vStatus := VarAsType(TcxCustomGridRecord(pRecord).Values[pStatus.Index], varString);
  if vStatus = 'A' then pStyle := cxsActive;
  if vStatus = 'I' then pStyle := cxsInactive;
  if vStatus = 'B' then pStyle := cxsDelete;
end;

procedure T_frmStandarMDFormEdit.pcMainChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  case (Sender as TPageControl).ActivePageIndex of
    0:
    begin

    end;
    1:
    begin
      if DataSource.DataSet.State in [dsInsert, dsEdit] then
        if MessageDlg(strExistChanges, mtConfirmation, mbYesNo, 0) = mrYes then
        begin
          try
            DataSource.DataSet.Post;
          except
            AllowChange := False;
 { TODO -ojhuante : Verificar el raise ya que de todas formas hace el cambio de pestaña en el insert }
            raise;
          end;

        end
        else
        begin
          DataSource.DataSet.Cancel;
        end;

    end;
  end;
end;

procedure T_frmStandarMDFormEdit.SetDataSet(const Value: TDataSet);
begin
  FDataSet := Value;
  DataSource.DataSet:= Value;
end;

procedure T_frmStandarMDFormEdit.ShowModule(pConteiner: TWinControl;
  pCation: TCaption);
begin
  if Assigned(gGridEditForm) then
  begin
    if Assigned(pConteiner) then
    begin
      gGridEditForm.Parent:= pConteiner;
      gGridEditForm.Align:= alClient;
      gGridEditForm.Show;
    end
    else
    begin
      //gGridEditForm.View:= True;
      gGridEditForm.ShowModal;
    end;
  end;
end;

procedure T_frmStandarMDFormEdit.tvMasterStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  GetContentStyle(tvStatus, ARecord, AItem, AStyle);
end;

end.
