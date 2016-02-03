(******************************************************************************
 Proyecto Delphi Standard

 Copyright (C) 2008-2015 - Jesus Huante Caballero

 ******************************************************************************)
unit _StandarGFormGrid;

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
  System.Actions, Winapi.ShellAPI;

type
  T_frmStandarGFormGrid = class(TForm)
    DataSource: TDataSource;
    ilPageControl: TImageList;
    ActionList: TActionList;
    ilAction: TImageList;
    DataSetFirst: TDataSetFirst;
    DataSetPrior: TDataSetPrior;
    DataSetNext: TDataSetNext;
    DataSetLast: TDataSetLast;
    DataSetInsert: TDataSetInsert;
    DataSetDelete: TDataSetDelete;
    DataSetEdit: TDataSetEdit;
    DataSetPost: TDataSetPost;
    DataSetCancel: TDataSetCancel;
    DataSetRefresh: TDataSetRefresh;
    cxStyleRepository1: TcxStyleRepository;
    cxsEven: TcxStyle;
    cxsOdd: TcxStyle;
    FileSaveAs1: TFileSaveAs;
    cxGridPopupMenu: TcxGridPopupMenu;
    cxsInactive: TcxStyle;
    cxsDelete: TcxStyle;
    cxsActive: TcxStyle;
    pnlClose: TPanel;
    pnlDetail3: TPanel;
    splDetail3: TSplitter;
    pnlDetail2: TPanel;
    splDetail2: TSplitter;
    pnlDetail1: TPanel;
    splDetail1: TSplitter;
    pnltoolbar: TPanel;
    pnlMaster: TPanel;
    cxGrid: TcxGrid;
    tvMaster: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    actCloseGrid: TAction;
    tbarGrid: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    ToolButton10: TToolButton;
    tbtnCerrar: TToolButton;
    PopupMenu: TPopupMenu;
    Insertar1: TMenuItem;
    Editar1: TMenuItem;
    Eliminar1: TMenuItem;
    procedure pcMainChanging(Sender: TObject; var AllowChange: Boolean);
    procedure FormShow(Sender: TObject);
//    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
//      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DataSetDeleteExecute(Sender: TObject);
    procedure FileSaveAs1Accept(Sender: TObject);
    procedure tvMasterStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      out AStyle: TcxStyle);
    procedure actCloseGridExecute(Sender: TObject);
    procedure tvMasterCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
    FReadOnlyGrid: Boolean;
    FDataSet: TDataSet;
    FView: Boolean;
    FCerrarGrid: TBasicAction;
    FApplyBestFit: Boolean;
    procedure SetReadOnlyGrid(const Value: Boolean);
    procedure SetView(const Value: Boolean);
    procedure SetDataSet(const Value: TDataSet);
    procedure SetCerrarGrid(const Value: TBasicAction);
  protected
    tvStatus: TcxGridDBColumn;
  public
    { Public declarations }
    procedure GetContentStyle(pStatus: TcxGridDBColumn;
      pRecord: TcxCustomGridRecord; pItem: TcxCustomGridTableItem;
      out pStyle: TcxStyle);
    property DataSet: TDataSet read FDataSet write SetDataSet;
    property ReadOnlyGrid: Boolean read FReadOnlyGrid write SetReadOnlyGrid default False;
    property View: Boolean read FView write SetView default False;
    property ApplyBestFit: Boolean read FApplyBestFit write FApplyBestFit default True;
    property CerrarGrid : TBasicAction read FCerrarGrid write SetCerrarGrid;
  end;

implementation

{$R *.dfm}

uses _MainRibbonForm;

procedure T_frmStandarGFormGrid.actCloseGridExecute(Sender: TObject);
begin
  Close;
end;

procedure T_frmStandarGFormGrid.DataSetDeleteExecute(Sender: TObject);
begin
  if MessageDlg(strAllowDelete, mtConfirmation, mbYesNo, 0) = mrYes
  then DataSource.DataSet.Delete;
end;

//procedure T_StandarFrm.DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
//  DataCol: Integer; Column: TColumn; State: TGridDrawState);
//const
//  clPaleGreen = TColor($CCFFCC);
//  clPaleRed =   TColor($CCCCFF);
//begin
//  with (Sender as TDBGrid) do
//  begin
// { TODO -ojhuante : Definicion de colores en grid }
//    if (DataSource.DataSet.RecNo mod 2) = 0
//      then Canvas.Brush.Color := clMoneyGreen;
////      else Canvas.Brush.Color := clMoneyGreen;
//    if (gdSelected in State) then Canvas.Brush.Color := clHighlight;
//    DefaultDrawColumnCell(Rect, DataCol, Column, State);
//  end;
//  DBGrid.SelectedRows.CurrentRowSelected
//end;

procedure T_frmStandarGFormGrid.FileSaveAs1Accept(Sender: TObject);
var
  FileName: TFileName;
begin
  FileName := FileSaveAs1.Dialog.FileName;
  case FileSaveAs1.Dialog.FilterIndex of
    1: ExportGridToExcel(FileName, cxGrid);
    2: ExportGridToXLSX(FileName, cxGrid);
    3: ExportGridToHTML(FileName, cxGrid);
    4: ExportGridToText(FileName, cxGrid);
    5: ExportGridToXML(FileName, cxGrid);
  end;
  if MessageDlg(strOpenFile, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    ShellExecute(Handle, 'open', PChar(FileName), nil, nil, 0);
end;

procedure T_frmStandarGFormGrid.FormShow(Sender: TObject);
begin
 { TODO -ojhuante : pcMain.ActivePage := tsGrid; }
{  if cxGrid.Visible then
  begin
    cxGrid.SetFocus;
    tvMaster.ViewData.Expand(True);
  end;}
  if ApplyBestFit then
    tvMaster.ApplyBestFit();
end;

procedure T_frmStandarGFormGrid.GetContentStyle(pStatus: TcxGridDBColumn;
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

procedure T_frmStandarGFormGrid.pcMainChanging(Sender: TObject;
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

procedure T_frmStandarGFormGrid.SetCerrarGrid(const Value: TBasicAction);
begin
  FCerrarGrid := Value;
  tbtnCerrar.Action := Value;
end;

procedure T_frmStandarGFormGrid.SetDataSet(const Value: TDataSet);
begin
  FDataSet := Value;
  DataSource.DataSet:= Value;
end;

procedure T_frmStandarGFormGrid.SetReadOnlyGrid(const Value: Boolean);
begin
  FReadOnlyGrid := Value;
  DataSetInsert.Visible:= not Value;
  ToolButton2.Visible:= not Value;
  DataSetDelete.Visible:= not Value;
  ToolButton4.Visible:= not Value;
end;

procedure T_frmStandarGFormGrid.SetView(const Value: Boolean);
begin
  FView := Value;
//  btnOk.Visible:= not Value;
//  if Value then
//    btnCancel.Caption:= 'Cerrar'
//  else
//    btnCancel.Caption:= '&Cancelar'
end;

procedure T_frmStandarGFormGrid.tvMasterCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  if actCloseGrid.Visible then
    actCloseGrid.Execute;
end;

procedure T_frmStandarGFormGrid.tvMasterStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  GetContentStyle(tvStatus, ARecord, AItem, AStyle);
end;

end.
