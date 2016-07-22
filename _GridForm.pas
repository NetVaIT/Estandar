(******************************************************************************
 Proyecto Delphi Standard

 Copyright (C) 2008-2015 - Jesus Huante Caballero

 ******************************************************************************)
unit _GridForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.UITypes, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinsdxBarPainter, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, Data.DB, cxDBData, cxPC, dxDockControl, dxDockPanel, dxSkinsForm,
  cxGridCustomPopupMenu, cxGridPopupMenu, cxClasses, Vcl.StdActns, Vcl.DBActns,
  System.Actions, Vcl.ActnList, Vcl.ImgList, dxBar, Vcl.ExtCtrls, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.Menus,
  cxGridExportLink, _EditForm, Vcl.StdCtrls, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxSkinsdxRibbonPainter, dxPSCore, dxPScxCommon,
  dxPrnDlg,
  Winapi.ShellAPI;

type
  T_frmGrid = class(TForm)
    dxBarManager: TdxBarManager;
    pnlMaster: TPanel;
    splDetail3: TSplitter;
    pnlDetail3: TPanel;
    dxbNavigator: TdxBar;
    ActionList: TActionList;
    DataSource: TDataSource;
    cxStyleRepository: TcxStyleRepository;
    cxsEven: TcxStyle;
    cxsOdd: TcxStyle;
    cxsInactive: TcxStyle;
    cxsDelete: TcxStyle;
    cxsActive: TcxStyle;
    cxGridPopupMenu: TcxGridPopupMenu;
    cxImageList: TcxImageList;
    DatasetFirst: TDataSetFirst;
    DatasetPrior: TDataSetPrior;
    DatasetNext: TDataSetNext;
    DatasetLast: TDataSetLast;
    DatasetInsert: TDataSetInsert;
    DatasetDelete: TDataSetDelete;
    DatasetEdit: TDataSetEdit;
    DatasetPost: TDataSetPost;
    DatasetCancel: TDataSetCancel;
    DatasetRefresh: TDataSetRefresh;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    FileSaveAs1: TFileSaveAs;
    PopupMenu: TdxBarPopupMenu;
    Insert1: TdxBarButton;
    Edit1: TdxBarButton;
    Delete1: TdxBarButton;
    dxBarSeparator1: TdxBarSeparator;
    dxBarButton6: TdxBarButton;
    dxbEdit: TdxBar;
    dxbTools: TdxBar;
    cxGrid: TcxGrid;
    tvMaster: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    pnlDetail2: TPanel;
    splDetail1: TSplitter;
    pnlDetail1: TPanel;
    splDetail2: TSplitter;
    actShow: TAction;
    dxBarButton7: TdxBarButton;
    pnlClose: TPanel;
    btnClose: TButton;
    dxComponentPrinter: TdxComponentPrinter;
    dxcplGrid: TdxGridReportLink;
    dxbbPreview: TdxBarButton;
    actPreview: TAction;
    dxbFilter: TdxBar;
    dxbtnSearch: TdxBarButton;
    actFullExpandGroup: TAction;
    actFullColapseGroup: TAction;
    procedure FormShow(Sender: TObject);
    procedure FileSaveAs1Accept(Sender: TObject);
    procedure DatasetInsertExecute(Sender: TObject);
    procedure DatasetEditExecute(Sender: TObject);
    procedure DatasetDeleteExecute(Sender: TObject);
    procedure tvMasterCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure actShowExecute(Sender: TObject);
    procedure DatasetRefreshExecute(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure actPreviewExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actFullExpandGroupExecute(Sender: TObject);
    procedure actFullColapseGroupExecute(Sender: TObject);
  private
    { Private declarations }
    FMenuItem: TMenuItem;
    FReadOnlyGrid: Boolean;
    FDataSet: TDataSet;
    FgEditForm: T_frmEdit;
    FView: Boolean;
    FactSearch: TBasicAction;
    FPrintTitle: string;
    procedure SetReadOnlyGrid(const Value: Boolean);
    procedure SetDataSet(const Value: TDataSet);
    procedure SetView(const Value: Boolean);
    procedure SetactSearch(const Value: TBasicAction);
    procedure InsertMenuItem;
    procedure SetPrintTitle(const Value: string);
  protected
    tvStatus: TcxGridDBColumn;
    property gEditForm: T_frmEdit read FgEditForm write FgEditForm;
  public
    { Public declarations }
    property DataSet: TDataSet read FDataSet write SetDataSet;
    property ReadOnlyGrid: Boolean read FReadOnlyGrid write SetReadOnlyGrid default False;
    property View: Boolean read FView write SetView default False;
    property actSearch: TBasicAction read FactSearch write SetactSearch;
    property PrintTitle: string read FPrintTitle write SetPrintTitle;
  end;

implementation

{$R *.dfm}

uses _Utils;

procedure T_frmGrid.actFullColapseGroupExecute(Sender: TObject);
begin
  tvMaster.DataController.Groups.FullCollapse;
end;

procedure T_frmGrid.actFullExpandGroupExecute(Sender: TObject);
begin
  tvMaster.DataController.Groups.FullExpand;
end;

procedure T_frmGrid.actPreviewExecute(Sender: TObject);
begin
  dxComponentPrinter.Preview();
end;

procedure T_frmGrid.actShowExecute(Sender: TObject);
begin
  if Assigned(gEditForm) then
  begin
    gEditForm.View:= True;
    gEditForm.ShowModal;
  end;
end;

procedure T_frmGrid.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure T_frmGrid.DatasetDeleteExecute(Sender: TObject);
begin
  if MessageDlg(strAllowDelete, mtConfirmation, mbYesNo, 0) = mrYes then
  begin
    try
      DataSource.DataSet.Delete;
    except on E: EDatabaseError do
      if Pos('REFERENCE',E.Message)>0 then
        MessageDlg(strDeleteReferenceError, mtError, [mbOk], 0)
    end;
  end;
end;

procedure T_frmGrid.DatasetEditExecute(Sender: TObject);
begin
  DataSource.DataSet.Edit;
  if Assigned(gEditForm) then
    gEditForm.ShowModal;
end;

procedure T_frmGrid.DatasetInsertExecute(Sender: TObject);
begin
  DataSource.DataSet.Insert;
  if Assigned(gEditForm) then
    gEditForm.ShowModal;
end;

procedure T_frmGrid.DatasetRefreshExecute(Sender: TObject);
begin
  DataSource.DataSet.Refresh;
end;

procedure T_frmGrid.FileSaveAs1Accept(Sender: TObject);
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

procedure T_frmGrid.FormCreate(Sender: TObject);
begin
  InsertMenuItem;
end;

procedure T_frmGrid.FormShow(Sender: TObject);
begin
  if Assigned(gEditForm) then
    gEditForm.DataSet:= DataSet;
  cxGrid.SetFocus;
  tvMaster.DataController.Groups.FullExpand;
  tvMaster.ApplyBestFit();
//  tvMaster.ViewData.Expand(True);
  dxbNavigator.DockedLeft:= 82;
  dxbTools.DockedLeft:= 210;
end;

procedure T_frmGrid.SetactSearch(const Value: TBasicAction);
begin
  FactSearch := Value;
  dxbtnSearch.Action:= Value;
end;

procedure T_frmGrid.SetDataSet(const Value: TDataSet);
begin
  FDataSet := Value;
  DataSource.DataSet:= Value;
end;

procedure T_frmGrid.SetPrintTitle(const Value: string);
begin
  FPrintTitle := Value;
  dxComponentPrinter.PrintTitle:= Value;
  dxcplGrid.ReportTitleText:= Value;
  dxcplGrid.ReportDocument.Caption:= Value;
  dxcplGrid.PDFExportOptions.Title:= Value;
  dxcplGrid.PDFExportOptions.DefaultFileName:= Value;
end;

procedure T_frmGrid.SetReadOnlyGrid(const Value: Boolean);
begin
  FReadOnlyGrid := Value;
  DataSetInsert.Visible:= not Value;
  DataSetDelete.Visible:= not Value;
  DatasetEdit.Visible:= not Value;
  actShow.Visible:= Value;
  if FReadOnlyGrid then
  begin
    dxbNavigator.DockedLeft:= 36;
    dxbTools.DockedLeft:= 164;
  end
  else
  begin
    dxbNavigator.DockedLeft:= 82;
    dxbTools.DockedLeft:= 210;
  end;
end;

procedure T_frmGrid.SetView(const Value: Boolean);
begin
  FView := Value;
  if Value then
    BorderStyle:= bsToolWindow
  else
    BorderStyle:= bsNone;
  pnlClose.Visible:= Value;
end;

procedure T_frmGrid.tvMasterCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if ReadOnlyGrid then
    actShow.Execute
  else
    DatasetEdit.Execute;
end;

procedure T_frmGrid.InsertMenuItem;
var
  I: Integer;
  AMenu: TComponent;
  ABuiltInMenus: TcxGridDefaultPopupMenu;
begin
  AMenu := nil;
  ABuiltInMenus := cxGridPopupMenu.BuiltInPopupMenus;
  for I := 0 to ABuiltInMenus.Count - 1 do
    if ([gvhtColumnHeader] * ABuiltInMenus[I].HitTypes) <> [] then
    begin
      AMenu := ABuiltInMenus[I].PopupMenu;
    end;
  if Assigned(AMenu) and AMenu.InheritsFrom(TPopupMenu) then
  begin
    FMenuItem := TMenuItem.Create(Self);
    FMenuItem.Caption := '-';
    TPopupMenu(AMenu).Items.Add(FMenuItem);

    FMenuItem:= TMenuItem.Create(Self);
    FMenuItem.Action:= actFullExpandGroup;
    TPopupMenu(AMenu).Items.Add(FMenuItem);

    FMenuItem := TMenuItem.Create(Self);
    FMenuItem.Action:= actFullColapseGroup;
//    FMenuItem.Caption := 'Contraer';
//    FMenuItem.Hint := '';
//    FMenuItem.OnClick := GroupFullCollapse;
    TPopupMenu(AMenu).Items.Add(FMenuItem);
  end;
end;

end.
