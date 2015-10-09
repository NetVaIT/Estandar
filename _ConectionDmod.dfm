object _dmConection: T_dmConection
  OldCreateOrder = False
  Height = 180
  Width = 227
  object ADOConnection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;User ID=sa;Initial Catalog=MAS;Data Source=DESARROLLO04' +
      '\SQLEXPRESS;Use Procedure for Prepare=1;Auto Translate=True;Pack' +
      'et Size=4096;Workstation ID=DESARROLLO3;Use Encryption for Data=' +
      'False;Tag with column collation when possible=False'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    OnDisconnect = ADOConnectionDisconnect
    OnConnectComplete = ADOConnectionConnectComplete
    Left = 32
    Top = 8
  end
  object adoqUsuarios: TADOQuery
    Connection = ADOConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT Usuarios.IdUsuario, Usuarios.IdPersona, Personas.RazonSoc' +
        'ial, Usuarios.Login, Usuarios.Password'
      'FROM Usuarios'
      'INNER JOIN Personas ON Usuarios.IdPersona = Personas.IdPersona'
      'WHERE Usuarios.IdUsuarioEstatus = 1')
    Left = 32
    Top = 72
    object adoqUsuariosIdUsuario: TAutoIncField
      FieldName = 'IdUsuario'
      ReadOnly = True
    end
    object adoqUsuariosIdPersona: TIntegerField
      FieldName = 'IdPersona'
    end
    object adoqUsuariosRazonSocial: TStringField
      FieldName = 'RazonSocial'
      Size = 300
    end
    object adoqUsuariosLogin: TStringField
      FieldName = 'Login'
      Size = 15
    end
    object adoqUsuariosPassword: TStringField
      FieldName = 'Password'
      Size = 15
    end
  end
end
