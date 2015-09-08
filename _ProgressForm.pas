(******************************************************************************
 Proyecto Delphi Standard

 Copyright (C) 2008-2015 - Jesus Huante Caballero

 ******************************************************************************)
unit _ProgressForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dxGDIPlusClasses, ExtCtrls, cxControls, cxContainer,
  cxEdit, cxProgressBar, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  T_frmProgress = class(TForm)
    cxProgressBar: TcxProgressBar;
    Image1: TImage;
    Label1: TLabel;
  private
    { Private declarations }
    FTotal: Double;
    FPosition: Double;
    FText: string;
    procedure SetPosition(const Value: Double);
    procedure SetTotal(const Value: Double);
    procedure SetText(const Value: string);
  public
    { Public declarations }
    property Total: Double read FTotal write SetTotal;
    property Position: Double read FPosition write SetPosition;
    property Text: string read FText write SetText;
  end;

var
  _frmProgress: T_frmProgress;

implementation

{$R *.dfm}

{ T_frmProgress }

procedure T_frmProgress.SetPosition(const Value: Double);
begin
  FPosition := Value;
  cxProgressBar.Position := Value
end;

procedure T_frmProgress.SetText(const Value: string);
begin
  FText := Value;
  if Value <> EmptyStr then
  begin
    cxProgressBar.Properties.ShowTextStyle:= cxtsText;
    cxProgressBar.Properties.Text := Value;
  end
  else
    cxProgressBar.Properties.ShowTextStyle:= cxtsPercent;
end;

procedure T_frmProgress.SetTotal(const Value: Double);
begin
  FTotal := Value;
  cxProgressBar.Properties.Max := Value;
end;

end.
