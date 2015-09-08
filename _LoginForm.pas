(******************************************************************************
 Proyecto Delphi Standard

 Copyright (C) 2008-2015 - Jesus Huante Caballero

 ******************************************************************************)
unit _LoginForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, Buttons, ExtCtrls, ShellAPI, cxPropertiesStore, ActnList, ImgList,
  System.Actions;

type
  T_frmLogin = class(TForm)
    Label1: TLabel;
    edtUser: TEdit;
    edtPassword: TEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Image1: TImage;
    Label3: TLabel;
    cxPropertiesStore: TcxPropertiesStore;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ActionList1: TActionList;
    actKeyboard: TAction;
    ImageList1: TImageList;
    procedure FormShow(Sender: TObject);
    procedure actKeyboardExecute(Sender: TObject);
    procedure edtUserEnter(Sender: TObject);
    procedure edtPasswordEnter(Sender: TObject);
  private
    { Private declarations }
    function GetPassword: String;
    function GetUser: String;
  public
    { Public declarations }
    property User: String read GetUser;
    property Password: String read GetPassword;
  end;

implementation

{$R *.dfm}

{ T_frmLogin }

procedure T_frmLogin.actKeyboardExecute(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'open', 'osk.exe', nil, nil, 0);
end;

procedure T_frmLogin.edtPasswordEnter(Sender: TObject);
begin
{$IFDEF TOUCHSCREEN}
  actKeyboard.Execute;
{$ENDIF}
end;

procedure T_frmLogin.edtUserEnter(Sender: TObject);
begin
{$IFDEF TOUCHSCREEN}
  actKeyboard.Execute;
{$ENDIF}
end;

procedure T_frmLogin.FormShow(Sender: TObject);
begin
  if edtUser.Text = EmptyStr
  then edtUser.SetFocus
  else edtPassword.SetFocus;
end;

function T_frmLogin.GetPassword: String;
begin
  Result:= edtPassword.Text;
end;

function T_frmLogin.GetUser: String;
begin
  Result:= edtUser.Text;
end;

end.
