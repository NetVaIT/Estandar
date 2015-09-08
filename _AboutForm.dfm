object _frmAbout: T_frmAbout
  Left = 200
  Top = 108
  BorderStyle = bsDialog
  Caption = 'Acerca de ...'
  ClientHeight = 344
  ClientWidth = 451
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 300
    Height = 75
  end
  object Bevel1: TBevel
    Left = 8
    Top = 184
    Width = 433
    Height = 8
    Shape = bsTopLine
  end
  object Label4: TLabel
    Left = 8
    Top = 198
    Width = 179
    Height = 13
    Caption = 'Se autoriza el uso de este producto a:'
  end
  object lblLegalCopyright: TLabel
    Left = 8
    Top = 264
    Width = 80
    Height = 13
    Caption = 'lblLegalCopyright'
  end
  object lblComments: TLabel
    Left = 8
    Top = 283
    Width = 339
    Height = 52
    AutoSize = False
    Caption = 'lblComments'
    WordWrap = True
  end
  object lblFileDescription: TLabel
    Left = 171
    Top = 98
    Width = 123
    Height = 16
    Caption = 'lblFileDescription'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblFileVersion: TLabel
    Left = 171
    Top = 120
    Width = 61
    Height = 13
    Caption = 'lblFileVersion'
  end
  object OKButton: TButton
    Left = 366
    Top = 310
    Width = 75
    Height = 25
    Caption = 'Aceptar'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 89
    Width = 153
    Height = 88
    Caption = 'Contacto'
    TabOrder = 1
    object lblCompanyName: TLabel
      Left = 8
      Top = 24
      Width = 82
      Height = 13
      Caption = 'lblCompanyName'
    end
    object lblEmail: TLabel
      Left = 8
      Top = 43
      Width = 107
      Height = 13
      Cursor = crHandPoint
      Caption = 'eMail: info@interva.mx'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clActiveCaption
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      OnClick = lblEmailClick
    end
    object lblWEB: TLabel
      Left = 8
      Top = 62
      Width = 79
      Height = 13
      Cursor = crHandPoint
      Caption = 'WEB: interva.mx'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clActiveCaption
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      OnClick = lblWEBClick
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 217
    Width = 433
    Height = 41
    BevelOuter = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 68
      Height = 13
      Caption = 'X S.A. de C.V.'
    end
  end
end
