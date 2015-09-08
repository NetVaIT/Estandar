(******************************************************************************
 Proyecto Delphi Standard

 Copyright (C) 2008-2015 - Jesus Huante Caballero

 ******************************************************************************)
unit _StandarGridForm;

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
  System.Actions;

type
  T_frmStandarGrid = class(TForm)
    DataSource: TDataSource;
    pcMain: TPageControl;
    tsGrid: TTabSheet;
    tsData: TTabSheet;
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
    tbarData: TToolBar;
    ScrollBox1: TScrollBox;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    pnlDetail: TPanel;
    Splitter: TSplitter;
    cxStyleRepository1: TcxStyleRepository;
    cxsEven: TcxStyle;
    cxsOdd: TcxStyle;
    FileSaveAs1: TFileSaveAs;
    cxGridPopupMenu: TcxGridPopupMenu;
    cxsInactive: TcxStyle;
    cxsDelete: TcxStyle;
    cxsActive: TcxStyle;
    pnlMaster: TPanel;
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
    cxGrid: TcxGrid;
    tvMaster: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    procedure DataSetInsertExecute(Sender: TObject);
    procedure pcMainChanging(Sender: TObject; var AllowChange: Boolean);
    procedure FormShow(Sender: TObject);
//    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
//      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DataSetDeleteExecute(Sender: TObject);
    procedure FileSaveAs1Accept(Sender: TObject);
    procedure tvMasterStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      out AStyle: TcxStyle);
  private
    { Private declarations }
    FReadOnlyGrid: Boolean;
    procedure SetReadOnlyGrid(const Value: Boolean);
  protected
    tvStatus: TcxGridDBColumn;
    property ReadOnlyGrid: Boolean read FReadOnlyGrid write SetReadOnlyGrid default False;
  public
    { Public declarations }
    procedure GetContentStyle(pStatus: TcxGridDBColumn;
      pRecord: TcxCustomGridRecord; pItem: TcxCustomGridTableItem;
      out pStyle: TcxStyle);
  end;

implementation

{$R *.dfm}

uses _MainRibbonForm;

procedure T_frmStandarGrid.DataSetDeleteExecute(Sender: TObject);
begin
  if MessageDlg(strAllowDelete, mtConfirmation, mbYesNo, 0) = mrYes
  then DataSource.DataSet.Delete;
end;

procedure T_frmStandarGrid.DataSetInsertExecute(Sender: TObject);
begin
  if tsData.TabVisible then
  begin
    if pcMain.ActivePage = tsGrid then
      pcMain.ActivePage := tsData;
    DataSource.DataSet.Insert;
  end;
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

procedure T_frmStandarGrid.FileSaveAs1Accept(Sender: TObject);
begin
  case FileSaveAs1.Dialog.FilterIndex of
    1: ExportGridToExcel(FileSaveAs1.Dialog.FileName, cxGrid);
    2: ExportGridToHTML(FileSaveAs1.Dialog.FileName, cxGrid);
    3: ExportGridToText(FileSaveAs1.Dialog.FileName, cxGrid);
    4: ExportGridToXML(FileSaveAs1.Dialog.FileName, cxGrid);
  end;
end;

procedure T_frmStandarGrid.FormShow(Sender: TObject);
begin
 { TODO -ojhuante : pcMain.ActivePage := tsGrid; }
  if cxGrid.Visible then
  begin
    cxGrid.SetFocus;
    tvMaster.ViewData.Expand(True);
  end;
end;

procedure T_frmStandarGrid.GetContentStyle(pStatus: TcxGridDBColumn;
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

procedure T_frmStandarGrid.pcMainChanging(Sender: TObject;
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

procedure T_frmStandarGrid.SetReadOnlyGrid(const Value: Boolean);
begin
  FReadOnlyGrid := Value;
  DataSetInsert.Visible:= not Value;
  ToolButton2.Visible:= not Value;
  DataSetDelete.Visible:= not Value;
  ToolButton4.Visible:= not Value;
  tsData.TabVisible:= not Value;
end;

procedure T_frmStandarGrid.tvMasterStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  GetContentStyle(tvStatus, ARecord, AItem, AStyle);
end;

end.
