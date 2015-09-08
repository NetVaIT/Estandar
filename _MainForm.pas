(******************************************************************************
 Proyecto Delphi Standard

 Copyright (C) 2008-2015 - Jesus Huante Caballero

 ******************************************************************************)
unit _MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ImgList, StdActns, ActnList, ComCtrls, ExtCtrls, System.Actions;

type
  T_frmMain = class(TForm)
    ActionList1: TActionList;
    actAbout: TAction;
    pnlMain: TPanel;
    actExit: TFileExit;
    StatusBar: TStatusBar;
    ilSmall: TImageList;
    actConect: TAction;
    actDesconect: TAction;
    procedure actAboutExecute(Sender: TObject);
    procedure actConectExecute(Sender: TObject);
    procedure actDesconectExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FConected: Boolean;
    procedure SetConected(const Value: Boolean);
  protected
    procedure CreateModule(pModulo: Integer; pCaption: String); virtual; abstract;
    procedure ConfigControls; virtual; abstract;
    procedure DestroyModule; virtual; abstract;
    property Conected: Boolean read FConected write SetConected;
  public
    { Public declarations }
  end;

var
  _frmMain: T_frmMain;

implementation

uses _AboutForm, _ConectionDmod;

{$R *.dfm}

procedure T_frmMain.actAboutExecute(Sender: TObject);
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

procedure T_frmMain.actConectExecute(Sender: TObject);
begin
  Conected:= _dmConection.Login;
end;

procedure T_frmMain.actDesconectExecute(Sender: TObject);
begin
  _dmConection.Logout;
  Conected:= False;
  DestroyModule;
end;

procedure T_frmMain.FormShow(Sender: TObject);
begin
{ DONE -ojhuante :
FAVOR DE NO BORRAR
Se deja para que se ejecuta FormShow en la herencia }
end;

procedure T_frmMain.SetConected(const Value: Boolean);
begin
  FConected := Value;
  actConect.Enabled:= not FConected;
  actDesconect.Enabled:= FConected;
  ConfigControls;
end;

end.
