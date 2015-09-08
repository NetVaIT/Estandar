object _frmDualList: T_frmDualList
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = '_frmDualList'
  ClientHeight = 338
  ClientWidth = 867
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMaster: TPanel
    Left = 0
    Top = 0
    Width = 867
    Height = 338
    Align = alClient
    TabOrder = 0
    object Splitter: TSplitter
      Left = 414
      Top = 1
      Height = 295
      ExplicitLeft = 440
      ExplicitTop = 72
      ExplicitHeight = 100
    end
    object pnlAviable: TPanel
      Left = 1
      Top = 1
      Width = 413
      Height = 295
      Align = alLeft
      Caption = 'pnlAviable'
      TabOrder = 0
      object cxGridAvailable: TcxGrid
        Left = 1
        Top = 1
        Width = 380
        Height = 293
        Align = alClient
        PopupMenu = bpmAvailable
        TabOrder = 0
        LookAndFeel.Kind = lfStandard
        object tvAvailable: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          OnCellDblClick = tvAvailableCellDblClick
          DataController.DataSource = dsAvailable
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.NoDataToDisplayInfoText = '<Ninguna disponible>'
          OptionsView.GroupByBox = False
        end
        object cxGridAvailableLevel1: TcxGridLevel
          GridView = tvAvailable
        end
      end
      object bcdTool: TdxBarDockControl
        Left = 381
        Top = 1
        Width = 31
        Height = 293
        Align = dalRight
        BarManager = dxBarManager
      end
    end
    object pnlAssigned: TPanel
      Left = 417
      Top = 1
      Width = 449
      Height = 295
      Align = alClient
      Caption = 'pnlAssigned'
      TabOrder = 1
      object cxGridAssigned: TcxGrid
        Left = 1
        Top = 1
        Width = 447
        Height = 293
        Align = alClient
        PopupMenu = bpmAssigned
        TabOrder = 0
        LookAndFeel.Kind = lfStandard
        object tvAssigned: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          OnCellDblClick = tvAssignedCellDblClick
          DataController.DataSource = dsAssigned
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnsQuickCustomization = True
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.CellSelect = False
          OptionsView.NoDataToDisplayInfoText = '<Ninguna seleccionada>'
          OptionsView.GroupByBox = False
        end
        object cxGridAssignedLevel1: TcxGridLevel
          GridView = tvAssigned
        end
      end
    end
    object pnlClose: TPanel
      Left = 1
      Top = 296
      Width = 865
      Height = 41
      Align = alBottom
      TabOrder = 2
      Visible = False
      DesignSize = (
        865
        41)
      object btnClose: TButton
        Left = 780
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Cancel = True
        Caption = 'Cerrar'
        TabOrder = 0
        OnClick = btnCloseClick
      end
    end
  end
  object cxStyleRepository: TcxStyleRepository
    Left = 544
    Top = 80
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
  object cxImageList: TcxImageList
    FormatVersion = 1
    DesignInfo = 1573496
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00C5630D00BA561300FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00D0761D00F4BA6F00FABC6700B24C0E00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00EFB47E00ECAE6600EFAE6100EFAA5100F6AD4800AE450900FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00F5BD8C00E79F4A00EAA04600EC9C3600F49F2B00A83F0500FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00F3C19B00E18D2F00E7932C00EA8F1C00F1900F00A33B
          0300FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00F2C6A700DC801A00E4861300E7820300EE88
          00009F380100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D5730800E17B0000E680
          0000EE880000A53C0100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00AC4C1500DE780000E17B
          0000E6800000F48E0000C3886A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00B5520E00D7781200D7710000DB75
          0000E57F0000D3907200FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00BA530800D37D2A00D1731500D26E0500D872
          0000DA9F8300FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00C0570400D0854500CD7A2F00CE751F00CF6E1000E3AF
          9400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00C55B0100CF905F00CC844900CC7D3900C9722400EABDA400FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00DBA96900CC957200CE906500CC885400C6733300FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00F5B98600CC916900C3743B00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00EFCAAC00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        MaskColor = clFuchsia
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00B959
          1000C25B0600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00B44F0B00FF9A
          0000FF9C0000CB640100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00AD440000F08A0000F18B
          0000F7910000FF990000EFBB8900FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00A93F0100E27C0000E47E0000E983
          0000ED870000F6C49700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00A53C0000D56F0000D6700000DB750000DD76
          0000F4CAA700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00A0370100C8620000C9630000CD670000CD670000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00A23C0400C1620F00BC560000C05A0000BF590000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00C3876800CF8A5300C06D2F00B95B1400B8520000A9440100FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00D4907200C5815400BC6A3500B85C1800BA540000B34B0000FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00DC9F8300C27D5300BE6F3800BE641D00C15B0100BB52
          0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00C7682800C7835300C7793D00C76F2200CB67
          0700C25A0300FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00C9692400CF895100D1854300D27C
          2700D6750C00C8610200FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D48D4E00DB91
          4900DD892B00E7891300D78D4500FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00DA93
          4900E7A04D00EBAD7400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        MaskColor = clFuchsia
      end>
  end
  object dxBarManager: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    ImageOptions.Images = cxImageList
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 632
    Top = 80
    DockControlHeights = (
      0
      0
      0
      0)
    object dxBarManagerBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockControl = bcdTool
      DockedDockControl = bcdTool
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 661
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnAdd'
        end
        item
          Visible = True
          ItemName = 'btnDelete'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object btnAdd: TdxBarButton
      Caption = 'Agregar'
      Category = 0
      Visible = ivAlways
      ImageIndex = 0
    end
    object btnDelete: TdxBarButton
      Caption = 'Quitar'
      Category = 0
      Visible = ivAlways
      ImageIndex = 1
    end
    object btnViewAvailable: TdxBarButton
      Caption = 'actAvailable'
      Category = 0
      Visible = ivAlways
    end
    object btnViewAssigned: TdxBarButton
      Caption = 'actAssigned'
      Category = 0
      Visible = ivAlways
    end
  end
  object dsAvailable: TDataSource
    Left = 17
    Top = 24
  end
  object dsAssigned: TDataSource
    Left = 436
    Top = 24
  end
  object bpmAvailable: TdxBarPopupMenu
    BarManager = dxBarManager
    ItemLinks = <
      item
        Visible = True
        ItemName = 'btnAdd'
      end
      item
        Visible = True
        ItemName = 'btnViewAvailable'
      end>
    UseOwnFont = False
    Left = 25
    Top = 81
  end
  object bpmAssigned: TdxBarPopupMenu
    BarManager = dxBarManager
    ItemLinks = <
      item
        Visible = True
        ItemName = 'btnDelete'
      end
      item
        Visible = True
        ItemName = 'btnViewAssigned'
      end>
    UseOwnFont = False
    Left = 441
    Top = 81
  end
end
