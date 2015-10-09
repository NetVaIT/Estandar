object _frmStandarMDFormEdit: T_frmStandarMDFormEdit
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = '_FrmStandar'
  ClientHeight = 600
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMaster: TPanel
    Left = 0
    Top = 29
    Width = 800
    Height = 571
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
  end
  object tbarCategorias: TToolBar
    Left = 0
    Top = 0
    Width = 800
    Height = 29
    Caption = 'tbarCategorias'
    TabOrder = 1
    object ToolButton3: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      Style = tbsSeparator
    end
  end
  object DataSource: TDataSource
    Left = 610
    Top = 18
  end
  object ilPageControl: TImageList
    Left = 642
    Top = 18
  end
  object ActionList: TActionList
    Images = ilAction
    Left = 674
    Top = 18
  end
  object ilAction: TImageList
    Left = 708
    Top = 18
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 578
    Top = 18
    PixelsPerInch = 96
    object cxsEven: TcxStyle
    end
    object cxsOdd: TcxStyle
      AssignedValues = [svColor]
      Color = clMoneyGreen
    end
    object cxsInactive: TcxStyle
      AssignedValues = [svColor]
      Color = clSilver
    end
    object cxsDelete: TcxStyle
      AssignedValues = [svColor]
      Color = 8421631
    end
    object cxsActive: TcxStyle
    end
  end
end
