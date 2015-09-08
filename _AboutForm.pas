(******************************************************************************
 Proyecto Delphi Standard

 Copyright (C) 2008-2015 - Jesus Huante Caballero

 ******************************************************************************)
unit _AboutForm;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, jpeg, ShellAPI, _Utils;

type
  T_frmAbout = class(TForm)
    OKButton: TButton;
    Image1: TImage;
    GroupBox1: TGroupBox;
    lblCompanyName: TLabel;
    lblEmail: TLabel;
    lblWEB: TLabel;
    Bevel1: TBevel;
    Label4: TLabel;
    Panel1: TPanel;
    lblLegalCopyright: TLabel;
    lblComments: TLabel;
    lblFileDescription: TLabel;
    lblFileVersion: TLabel;
    Label1: TLabel;
    procedure lblEmailClick(Sender: TObject);
    procedure lblWEBClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    VersionINFO: TStringList;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure T_frmAbout.FormCreate(Sender: TObject);
begin
  VersionINFO:= TStringList.Create;
end;

procedure T_frmAbout.FormDestroy(Sender: TObject);
begin
  FreeAndNil(VersionINFO);
end;

procedure T_frmAbout.FormShow(Sender: TObject);
begin
  VersionInformation(Application.ExeName, VersionINFO);
  lblCompanyName.Caption:= VersionINFO[0];
  lblFileDescription.Caption:= VersionINFO[1];
  lblFileVersion.Caption:= VersionINFO[2];
  lblLegalCopyright.Caption:= VersionINFO[4];
  lblComments.Caption:= VersionINFO[9];
end;

procedure T_frmAbout.lblEmailClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'mailto:info@interva.mx?subject=Acerca de...', nil, nil, SW_SHOWNORMAL);
end;

procedure T_frmAbout.lblWEBClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar('interva.mx'), nil, nil, SW_SHOWNORMAL);
end;

end.

