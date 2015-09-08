object _dmStandar: T_dmStandar
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 347
  Width = 404
  object adodsMaster: TADODataSet
    Connection = _dmConection.ADOConnection
    Parameters = <>
    Left = 24
    Top = 16
  end
  object adodsUpdate: TADODataSet
    Connection = _dmConection.ADOConnection
    Parameters = <>
    Left = 320
    Top = 16
  end
  object ActionList: TActionList
    Left = 320
    Top = 88
    object actSearch: TAction
      Caption = 'Buscar'
      HelpKeyword = 'Buscar'
      ImageIndex = 16
      ShortCut = 16450
      OnExecute = actSearchExecute
    end
  end
end
