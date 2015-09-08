object _dmDualList: T_dmDualList
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 150
  Width = 318
  object adoqAvailable: TADOQuery
    Connection = _dmConection.ADOConnection
    Parameters = <>
    Left = 32
    Top = 24
  end
  object adoqAssigned: TADOQuery
    Connection = _dmConection.ADOConnection
    Parameters = <>
    Left = 120
    Top = 24
  end
  object adocAdd: TADOCommand
    Connection = _dmConection.ADOConnection
    Parameters = <>
    Left = 32
    Top = 88
  end
  object adocDelete: TADOCommand
    Connection = _dmConection.ADOConnection
    Parameters = <>
    Left = 128
    Top = 88
  end
  object ActionList: TActionList
    Left = 240
    Top = 24
    object actAdd: TAction
      Caption = 'Agregar'
      ImageIndex = 0
      OnExecute = actAddExecute
      OnUpdate = actAddUpdate
    end
    object actDelete: TAction
      Caption = 'Quitar'
      ImageIndex = 1
      OnExecute = actDeleteExecute
      OnUpdate = actDeleteUpdate
    end
    object actViewAviable: TAction
      Caption = 'Consultar'
      Visible = False
    end
    object actViewAssigned: TAction
      Caption = 'Consultar'
      Visible = False
    end
  end
end
