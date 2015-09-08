(******************************************************************************
 Proyecto Delphi Standard

 Copyright (C) 2008-2015 - Jesus Huante Caballero

 ******************************************************************************)
unit _MainRibbonForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs,
  dxBar, dxRibbon, dxRibbonForm, dxRibbonSkins, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxClasses, dxRibbonBackstageView, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinsdxRibbonPainter, dxSkinsdxBarPainter, cxContainer, cxEdit, dxSkinsForm,
  dxStatusBar, dxRibbonStatusBar, cxLabel, dxGallery, dxGalleryControl,
  dxRibbonBackstageViewGalleryControl, Vcl.ImgList, Vcl.StdActns,
  System.Actions, Vcl.ActnList, Vcl.ExtCtrls, _Utils, dxScreenTip,
  dxBarStrs;

type
  T_frmMainRibbon = class(TdxRibbonForm)
    dxBarManager: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxRibbon1: TdxRibbon;
    dxRibbon1Tab1: TdxRibbonTab;
    dxRibbonBackstageView1: TdxRibbonBackstageView;
    dxRibbonBackstageViewTabSheet1: TdxRibbonBackstageViewTabSheet;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    dxRibbonBackstageViewGalleryControl1: TdxRibbonBackstageViewGalleryControl;
    cxLabel1: TcxLabel;
    dxRibbonBackstageViewGalleryControl1Group1: TdxRibbonBackstageViewGalleryGroup;
    dxSkinController: TdxSkinController;
    dxRibbonBackstageViewGalleryControl1Group1Item1: TdxRibbonBackstageViewGalleryItem;
    cxSmallImages: TcxImageList;
    cxLargeImages: TcxImageList;
    ActionList: TActionList;
    actAbout: TAction;
    actExit: TFileExit;
    actConect: TAction;
    actDesconect: TAction;
    pnlMain: TPanel;
    bbConnect: TdxBarButton;
    bbDesconnect: TdxBarButton;
    dxbArchivo: TdxBar;
    bbExit: TdxBarLargeButton;
    bbAbout: TdxBarLargeButton;
    dxBarScreenTipRepository: TdxBarScreenTipRepository;
    stExit: TdxScreenTip;
    procedure FormCreate(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure actConectExecute(Sender: TObject);
    procedure actDesconectExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FConected: Boolean;
    procedure SetConected(const Value: Boolean);
    procedure cxTranslate;
  protected
    procedure CreateModule(pModulo: Integer; pCaption: String); virtual; abstract;
    procedure ConfigControls; virtual;
    procedure DestroyModule; virtual; abstract;
    property Conected: Boolean read FConected write SetConected;
  public
    { Public declarations }
  end;

var
  _frmMainRibbon: T_frmMainRibbon;

implementation

uses _AboutForm, _ConectionDmod;

{$R *.dfm}

{ T_frmMainRibbon }

procedure T_frmMainRibbon.actAboutExecute(Sender: TObject);
var
  frmAbout: T_frmAbout;
begin
  try
    frmAbout:= T_frmAbout.Create(Self);
    frmAbout.ShowModal;
  finally
    FreeAndNil(frmAbout);
  end;
end;

procedure T_frmMainRibbon.actConectExecute(Sender: TObject);
begin
  Conected:= _dmConection.Login;
end;

procedure T_frmMainRibbon.actDesconectExecute(Sender: TObject);
begin
  _dmConection.Logout;
  Conected:= False;
  DestroyModule;
end;

procedure T_frmMainRibbon.ConfigControls;
begin
  Caption := strProductName + strSeparador + strFileDescription;
  dxRibbonStatusBar1.Panels[0].Text:= _dmConection.ConectionCaption;
  dxRibbonStatusBar1.Panels[1].Text:= strUser + _dmConection.Usuario;
end;

procedure T_frmMainRibbon.cxTranslate;
begin
  cxSetResourceString(@dxSBAR_SHOWBELOWRIBBON, '&Mostrar bajo la cinta');
  cxSetResourceString(@dxSBAR_SHOWABOVERIBBON, '&Mostrar sobre la cinta');
  cxSetResourceString(@dxSBAR_MINIMIZERIBBON, 'Mi&nimizar la cinta');
  cxSetResourceString(@dxSBAR_MORECOMMANDS, 'Más comandos');
end;

procedure T_frmMainRibbon.FormCreate(Sender: TObject);
begin
  DisableAero := True;
end;

procedure T_frmMainRibbon.FormShow(Sender: TObject);
begin
  cxTranslate;
  _dmConection.ExePath:= ExtractFilePath(Application.ExeName);
  if _dmConection.TryToConnect then
  begin
    actConect.Execute;
    WindowState:= wsMaximized;
  end
  else Application.Terminate;
  dxRibbon1.Tabs[0].Active:= True;
end;

procedure T_frmMainRibbon.SetConected(const Value: Boolean);
begin
  FConected := Value;
  actConect.Enabled:= not FConected;
  actDesconect.Enabled:= FConected;
  ConfigControls;
end;

end.
