object _dmConection: T_dmConection
  OldCreateOrder = False
  Height = 180
  Width = 227
  object ADOConnection: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=as47Pw3K;Persist Security Info=True' +
      ';User ID=sa;Initial Catalog=MAS;Data Source=NAS1\COMPAC'
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
        'ial, Usuarios.Login, Usuarios.Password, Usuarios.Permiso,'
      'UP.PermisoMenu, UP.PermisoOpcion, UP.PermisosFuncion'
      'FROM Usuarios'
      'INNER JOIN Personas ON Usuarios.IdPersona = Personas.IdPersona'
      
        'LEFT JOIN UsuariosPerfiles UP ON Usuarios.IdUsuarioPerfil=UP.IdU' +
        'suarioPerfil'
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
    object adoqUsuariosPermiso: TStringField
      FieldName = 'Permiso'
      Size = 255
    end
    object adoqUsuariosPermisoMenu: TStringField
      FieldName = 'PermisoMenu'
      Size = 300
    end
    object adoqUsuariosPermisoOpcion: TStringField
      FieldName = 'PermisoOpcion'
      Size = 500
    end
    object adoqUsuariosPermisosFuncion: TStringField
      FieldName = 'PermisosFuncion'
      Size = 300
    end
  end
end
