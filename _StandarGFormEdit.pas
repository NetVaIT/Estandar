(******************************************************************************
 Proyecto Delphi Standard

 Copyright (C) 2008-2015 - Jesus Huante Caballero

 ******************************************************************************)
unit _StandarGFormEdit;

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
  System.Actions, cxPCdxBarPopupMenu, cxPC, _StandarGFormGrid, cxScrollBox,
  Vcl.StdCtrls;

type
  T_frmStandarGFormEdit = class(TForm)
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
    actShowGrid: TAction;
    pcMain: TcxPageControl;
    tsGeneral: TcxTabSheet;
    cxScrollBox1: TcxScrollBox;
    tbarData: TToolBar;
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
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    pnlMaster: TPanel;
    actCloseGrid: TAction;
    procedure DataSetInsertExecute(Sender: TObject);
    procedure pcMainChanging(Sender: TObject; var AllowChange: Boolean);
//    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
//      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DataSetDeleteExecute(Sender: TObject);
    procedure tvMasterStylesGetContentStyle(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      out AStyle: TcxStyle);
    procedure actShowGridExecute(Sender: TObject);
    procedure actCloseGridExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FReadOnlyGrid: Boolean;
    FDataSet: TDataSet;
    FgGridForm : T_frmStandarGFormGrid;
    FContainerDetail2: TCustomControl;
    FContainerDetail3: TCustomControl;
    FContainerDetail1: TCustomControl;
    FContainerDetail4: TCustomControl;
    procedure SetReadOnlyGrid(const Value: Boolean);
    procedure SetDataSet(const Value: TDataSet);
    procedure SetContainerDetail1(const Value: TCustomControl);
    procedure SetContainerDetail2(const Value: TCustomControl);
    procedure SetContainerDetail3(const Value: TCustomControl);
    procedure SetContainerDetail4(const Value: TCustomControl);
  protected
    tvStatus: TcxGridDBColumn;
    property ReadOnlyGrid: Boolean read FReadOnlyGrid write SetReadOnlyGrid default False;
    property gFormGrid : T_frmStandarGFormGrid read FgGridForm write FgGridForm;
  public
    { Public declarations }
    property DataSet: TDataSet read FDataSet write SetDataSet;
    property ContainerDetail1: TCustomControl read FContainerDetail1 write SetContainerDetail1;
    property ContainerDetail2: TCustomControl read FContainerDetail2 write SetContainerDetail2;
    property ContainerDetail3: TCustomControl read FContainerDetail3 write SetContainerDetail3;
    property ContainerDetail4: TCustomControl read FContainerDetail4 write SetContainerDetail4;
    procedure GetContentStyle(pStatus: TcxGridDBColumn;
      pRecord: TcxCustomGridRecord; pItem: TcxCustomGridTableItem;
      out pStyle: TcxStyle);
  end;

implementation

{$R *.dfm}

uses _MainRibbonForm;

procedure T_frmStandarGFormEdit.actCloseGridExecute(Sender: TObject);
begin
//  FgGridForm.Close;
//  cxScrollBox1.Visible := True;
end;

procedure T_frmStandarGFormEdit.actShowGridExecute(Sender: TObject);
begin
  if Assigned(gFormGrid) then
  begin
//    cxScrollBox1.Visible := False;
    gFormGrid.Parent := tsGeneral;
    gFormGrid.Align := alClient;
    gFormGrid.Show;
//    FgGridForm.View := True;
//    FgGridForm.ShowModal;
  end;
end;

procedure T_frmStandarGFormEdit.DataSetDeleteExecute(Sender: TObject);
begin
  if MessageDlg(strAllowDelete, mtConfirmation, mbYesNo, 0) = mrYes
  then DataSource.DataSet.Delete;
end;

procedure T_frmStandarGFormEdit.DataSetInsertExecute(Sender: TObject);
begin
  DataSource.DataSet.Insert;
end;

procedure T_frmStandarGFormEdit.FormCreate(Sender: TObject);
begin
  ContainerDetail1:= pnlDetail1;
  ContainerDetail2:= pnlDetail2;
  ContainerDetail3:= pnlDetail3;
  ContainerDetail4:= nil;
end;

procedure T_frmStandarGFormEdit.FormShow(Sender: TObject);
begin
  if Assigned(gFormGrid) then
    gFormGrid.DataSet:= DataSet;
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

procedure T_frmStandarGFormEdit.GetContentStyle(pStatus: TcxGridDBColumn;
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

procedure T_frmStandarGFormEdit.pcMainChanging(Sender: TObject;
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

procedure T_frmStandarGFormEdit.SetContainerDetail1(
  const Value: TCustomControl);
begin
  FContainerDetail1 := Value;
end;

procedure T_frmStandarGFormEdit.SetContainerDetail2(
  const Value: TCustomControl);
begin
  FContainerDetail2 := Value;
end;

procedure T_frmStandarGFormEdit.SetContainerDetail3(
  const Value: TCustomControl);
begin
  FContainerDetail3 := Value;
end;

procedure T_frmStandarGFormEdit.SetContainerDetail4(
  const Value: TCustomControl);
begin
  FContainerDetail4 := Value;
end;

procedure T_frmStandarGFormEdit.SetDataSet(const Value: TDataSet);
begin
  FDataSet := Value;
  DataSource.DataSet:= Value;
end;

procedure T_frmStandarGFormEdit.SetReadOnlyGrid(const Value: Boolean);
begin
  FReadOnlyGrid := Value;
  DataSetInsert.Visible:= not Value;
  DataSetDelete.Visible:= not Value;
end;

procedure T_frmStandarGFormEdit.tvMasterStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  GetContentStyle(tvStatus, ARecord, AItem, AStyle);
end;

end.
