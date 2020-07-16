object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 475
  Top = 258
  Height = 436
  Width = 301
  object connSQLITE: TZConnection
    ControlsCodePage = cCP_UTF8
    UTF8StringsAsWideField = False
    AutoEncodeStrings = False
    Properties.Strings = (
      'controls_cp=CP_UTF8')
    HostName = 'localhost'
    Port = 0
    Database = 'C:\GitDeveloper\zfsolos\source\zfcalc.db'
    Protocol = 'sqlite-3'
    LibraryLocation = 'sqlite3.dll'
    Left = 232
    Top = 128
  end
  object qrylocal_usuarios: TZQuery
    Connection = connLocal
    ReadOnly = True
    SQL.Strings = (
      'SELECT * from zf_usuarios WHERE id>0 ORDER BY nome;')
    Params = <>
    Left = 48
    Top = 88
    object qrylocal_usuariosid: TIntegerField
      FieldName = 'id'
      Visible = False
    end
    object qrylocal_usuariosnome: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 30
      FieldName = 'nome'
      Required = True
      Size = 200
    end
    object qrylocal_usuariossenha: TStringField
      DisplayLabel = 'Senha'
      DisplayWidth = 12
      FieldName = 'senha'
      Required = True
      Visible = False
      Size = 200
    end
    object qrylocal_usuariosemail: TStringField
      DisplayLabel = 'E-mail'
      DisplayWidth = 30
      FieldName = 'email'
      Required = True
      Size = 400
    end
    object qrylocal_usuariosativo_sn: TStringField
      Alignment = taCenter
      DisplayLabel = 'Acesso Liberado ao Sistema?'
      DisplayWidth = 22
      FieldName = 'ativo_sn'
      Required = True
      Size = 4
    end
    object qrylocal_usuariosadministrador_sn: TStringField
      Alignment = taCenter
      DisplayLabel = #201' Administrador?'
      DisplayWidth = 22
      FieldName = 'administrador_sn'
      Required = True
      Size = 4
    end
  end
  object dslocal_usuarios: TDataSource
    DataSet = qrylocal_usuarios
    Left = 136
    Top = 88
  end
  object cmdLocal: TZSQLProcessor
    Params = <>
    Connection = connLocal
    Delimiter = ';'
    Left = 48
    Top = 328
  end
  object qrylocal_clientes: TZQuery
    Connection = connLocal
    SQL.Strings = (
      'SELECT * from zf_clientes WHERE id>0 ORDER BY nome;')
    Params = <>
    Left = 48
    Top = 152
    object qrylocal_clientesid: TIntegerField
      FieldName = 'id'
      Visible = False
    end
    object qrylocal_clientesnome: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 50
      FieldName = 'nome'
      Required = True
      Size = 400
    end
    object qrylocal_clientesendereco: TStringField
      DisplayLabel = 'Endere'#231'o'
      DisplayWidth = 50
      FieldName = 'endereco'
      Size = 400
    end
    object qrylocal_clientesbairro: TStringField
      DisplayLabel = 'Bairro'
      DisplayWidth = 20
      FieldName = 'bairro'
      Size = 400
    end
    object qrylocal_clientescidade: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 50
      FieldName = 'cidade'
      Size = 400
    end
    object qrylocal_clientesuf: TStringField
      DisplayLabel = 'UF'
      DisplayWidth = 5
      FieldName = 'uf'
      Size = 8
    end
    object qrylocal_clientestelefone: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefone'
      Size = 200
    end
    object qrylocal_clientesemail: TStringField
      DisplayLabel = 'E-mail'
      DisplayWidth = 60
      FieldName = 'email'
      Size = 400
    end
    object qrylocal_clientescontato: TStringField
      DisplayLabel = 'Contato'
      DisplayWidth = 30
      FieldName = 'contato'
      Size = 200
    end
    object qrylocal_clientesid_usuario: TIntegerField
      FieldName = 'id_usuario'
      Required = True
      Visible = False
    end
    object qrylocal_clientescodigo_referencia: TStringField
      DisplayLabel = 'C'#243'digo ZF'
      DisplayWidth = 20
      FieldName = 'codigo_referencia'
      Size = 80
    end
  end
  object dslocal_clientes: TDataSource
    DataSet = qrylocal_clientes
    Left = 160
    Top = 152
  end
  object qryLocal_Retorno: TZQuery
    Connection = connLocal
    Params = <>
    Left = 48
    Top = 216
  end
  object qryLocal_Obras: TZQuery
    Connection = connLocal
    ReadOnly = True
    SQL.Strings = (
      
        'SELECT * FROM zf_obras WHERE id_cliente=:id ORDER BY id_cliente,' +
        'nome;')
    Params = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    Left = 48
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        ParamType = ptUnknown
      end>
    object qryLocal_Obrasid: TIntegerField
      FieldName = 'id'
      Visible = False
    end
    object qryLocal_Obrasid_cliente: TIntegerField
      FieldName = 'id_cliente'
      Required = True
      Visible = False
    end
    object qryLocal_Obrasid_usuario: TIntegerField
      FieldName = 'id_usuario'
      Required = True
      Visible = False
    end
    object qryLocal_Obrasnome: TStringField
      DisplayLabel = 'Nome/Apelido da Obra'
      DisplayWidth = 60
      FieldName = 'nome'
      Required = True
      Size = 400
    end
    object qryLocal_Obrasdestinacao: TStringField
      DisplayLabel = 'Destina'#231#227'o da Obra'
      DisplayWidth = 40
      FieldName = 'destinacao'
      Size = 400
    end
    object qryLocal_Obrasendereco: TStringField
      DisplayLabel = 'Endere'#231'o'
      DisplayWidth = 70
      FieldName = 'endereco'
      Size = 400
    end
    object qryLocal_Obrasbairro: TStringField
      DisplayLabel = 'Bairro'
      DisplayWidth = 40
      FieldName = 'bairro'
      Size = 400
    end
    object qryLocal_Obrascidade: TStringField
      DisplayLabel = 'Cidade'
      DisplayWidth = 50
      FieldName = 'cidade'
      Size = 400
    end
    object qryLocal_Obrasuf: TStringField
      DisplayLabel = 'UF'
      DisplayWidth = 20
      FieldName = 'uf'
      Size = 8
    end
    object qryLocal_Obrasobservacoes: TStringField
      DisplayLabel = 'Observa'#231#245'es'
      DisplayWidth = 200
      FieldName = 'observacoes'
      Size = 2000
    end
    object qryLocal_Obrascodigo_referencia: TStringField
      DisplayLabel = 'C'#243'digo Referencia ZF'
      DisplayWidth = 50
      FieldName = 'codigo_referencia'
      Size = 80
    end
  end
  object dslocal_obras: TDataSource
    DataSet = qryLocal_Obras
    Left = 160
    Top = 264
  end
  object connLocal: TZConnection
    ControlsCodePage = cCP_UTF8
    UTF8StringsAsWideField = False
    AutoEncodeStrings = False
    Properties.Strings = (
      'controls_cp=CP_UTF8')
    HostName = '188.93.231.39'
    Port = 3306
    Database = 'estaqnet_erp1'
    User = 'estaqnet'
    Password = 'vander126422'
    Protocol = 'mysql-5'
    LibraryLocation = 'C:\zfcalc\libmysql.dll'
    Left = 40
    Top = 32
  end
  object connMYSQL: TZConnection
    ControlsCodePage = cCP_UTF8
    UTF8StringsAsWideField = False
    AutoEncodeStrings = False
    Properties.Strings = (
      'controls_cp=CP_UTF8')
    HostName = '188.93.231.39'
    Port = 3306
    Database = 'estaqnet_erp1'
    User = 'estaqnet'
    Password = 'vander126422'
    Protocol = 'mysql-5'
    LibraryLocation = 'C:\zfcalc\libmysql.dll'
    Left = 208
    Top = 72
  end
end
