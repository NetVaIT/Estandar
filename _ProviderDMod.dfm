object _dmProvider: T_dmProvider
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
  object dspMaster: TDataSetProvider
    DataSet = adodsMaster
    Left = 96
    Top = 16
  end
  object cdsMaster: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMaster'
    AfterPost = cdsMasterAfterPost
    AfterCancel = cdsMasterAfterCancel
    AfterDelete = cdsMasterAfterDelete
    Left = 160
    Top = 16
  end
end
