object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 192
  Top = 124
  Height = 436
  Width = 301
  object connLocal: TZConnection
    ControlsCodePage = cCP_UTF8
    UTF8StringsAsWideField = False
    AutoEncodeStrings = False
    Properties.Strings = (
      'controls_cp=CP_UTF8')
    Connected = True
    HostName = 'localhost'
    Port = 0
    Database = 'C:\GitDeveloper\zfsolos\source\zfcalc.db'
    Protocol = 'sqlite-3'
    LibraryLocation = 'C:\GitDeveloper\zfsolos\source\sqlite3.dll'
    Left = 40
    Top = 24
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
      DisplayWidth = 15
      FieldName = 'senha'
      Required = True
      Visible = False
      Size = 200
    end
    object qrylocal_usuariosemail: TStringField
      DisplayLabel = 'E-mail'
      DisplayWidth = 50
      FieldName = 'email'
      Required = True
      Size = 400
    end
    object qrylocal_usuariosativo_sn: TStringField
      Alignment = taCenter
      DisplayLabel = 'Ativo?'
      DisplayWidth = 12
      FieldName = 'ativo_sn'
      Required = True
      Size = 4
    end
    object qrylocal_usuariosadministrador_sn: TStringField
      Alignment = taCenter
      DisplayLabel = 'Administrador'
      DisplayWidth = 12
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
    Left = 120
    Top = 24
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
    object qrylocal_clientestelefones: TStringField
      DisplayLabel = 'Telefones'
      DisplayWidth = 20
      FieldName = 'telefones'
      Size = 200
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
end
