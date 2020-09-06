object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 923
  Top = 229
  Height = 587
  Width = 401
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
    Connection = connMYSQL
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
    Connection = connMYSQL
    Delimiter = ';'
    Left = 48
    Top = 328
  end
  object qrylocal_clientes: TZQuery
    Connection = connMYSQL
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
    Connection = connMYSQL
    Params = <>
    Left = 48
    Top = 216
  end
  object qryLocal_Obras: TZQuery
    Connection = connMYSQL
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
    Left = 152
    Top = 8
  end
  object connMYSQL: TZConnection
    ControlsCodePage = cGET_ACP
    UTF8StringsAsWideField = False
    AutoEncodeStrings = False
    Properties.Strings = (
      'controls_cp=GET_ACP')
    Connected = True
    HostName = '188.93.231.39'
    Port = 3306
    Database = 'estaqnet_erp1'
    User = 'estaqnet'
    Password = 'vander126422'
    Protocol = 'mysql-5'
    Left = 48
    Top = 24
  end
  object qryLocal_Estacas_Tipos: TZQuery
    Connection = connMYSQL
    SQL.Strings = (
      'SELECT * FROM zf_estacas_tipos')
    Params = <>
    Left = 56
    Top = 392
    object qryLocal_Estacas_Tiposid: TIntegerField
      FieldName = 'id'
      Required = True
      Visible = False
    end
    object qryLocal_Estacas_Tiposnome: TStringField
      FieldName = 'nome'
      Required = True
      Size = 500
    end
  end
  object dsLocal_Estacas_Tipos: TDataSource
    DataSet = qryLocal_Estacas_Tipos
    Left = 232
    Top = 40
  end
  object qryLocal_Solos: TZQuery
    Connection = connMYSQL
    ReadOnly = True
    SQL.Strings = (
      'SELECT * FROM zf_solos ORDER BY nome;')
    Params = <>
    Left = 56
    Top = 472
    object qryLocal_Solosid: TIntegerField
      FieldName = 'id'
      Required = True
      Visible = False
    end
    object qryLocal_Solosnome: TStringField
      DisplayLabel = 'Nome do Tipo de Solo'
      DisplayWidth = 100
      FieldName = 'nome'
      Size = 45
    end
  end
  object dsLocal_Solos: TDataSource
    DataSet = qryLocal_Solos
    Left = 296
    Top = 64
  end
  object qryLocal_Diametros: TZQuery
    Connection = connMYSQL
    ReadOnly = True
    SQL.Strings = (
      
        'SELECT * FROM zf_diametros  WHERE id_estacas_tipos=:id ORDER BY ' +
        'id_estacas_tipos,diametro;')
    Params = <
      item
        DataType = ftString
        Name = 'id'
        ParamType = ptUnknown
        Value = '7'
      end>
    Left = 288
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'id'
        ParamType = ptUnknown
        Value = '7'
      end>
    object qryLocal_Diametrosid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object qryLocal_Diametrosid_estacas_tipos: TIntegerField
      FieldName = 'id_estacas_tipos'
      Required = True
    end
    object qryLocal_Diametrosdiametro: TFloatField
      FieldName = 'diametro'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object qryLocal_Diametrossecao_1: TFloatField
      DisplayLabel = 'Secao 1 (Largura)'
      FieldName = 'secao_1'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object qryLocal_Diametrossecao_2: TFloatField
      DisplayLabel = 'Secao 2 (Profundidade)'
      FieldName = 'secao_2'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object qryLocal_Diametrosarea: TFloatField
      DisplayLabel = #193'rea'
      FieldName = 'area'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object qryLocal_Diametrosperimetro: TFloatField
      DisplayLabel = 'Per'#237'metro'
      FieldName = 'perimetro'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object qryLocal_Diametrosmetalica_bitola_letra: TStringField
      DisplayLabel = 'Met'#225'lica Bitola Letra'
      FieldName = 'metalica_bitola_letra'
      Size = 5
    end
    object qryLocal_Diametrosmetalica_bitola_secao_1: TFloatField
      DisplayLabel = 'Met'#225'lica Bitola Se'#231#227'o 1'
      FieldName = 'metalica_bitola_secao_1'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object qryLocal_Diametrosmetalica_bitola_secao_2: TFloatField
      DisplayLabel = 'M'#233't'#225'lica Bitola Se'#231#227'o 2'
      FieldName = 'metalica_bitola_secao_2'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object qryLocal_Diametrosmetalica_area_bruta: TFloatField
      DisplayLabel = 'Met'#225'lica '#193'rea Bruta'
      FieldName = 'metalica_area_bruta'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object qryLocal_Diametrosmetalica_perimetro: TFloatField
      DisplayLabel = 'Met'#225'lica Per'#237'metro'
      FieldName = 'metalica_perimetro'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object qryLocal_Diametrosmetalica_area_plena: TFloatField
      DisplayLabel = 'Met'#225'lica '#193'rea Plena'
      FieldName = 'metalica_area_plena'
      Required = True
      DisplayFormat = '#,##0.00'
    end
  end
  object dsLocal_Diametros: TDataSource
    DataSet = qryLocal_Diametros
    Left = 288
    Top = 320
  end
  object qryLocal_Metodos: TZQuery
    Connection = connMYSQL
    SQL.Strings = (
      'SELECT * FROM zf_metodos ORDER BY nome;')
    Params = <>
    Properties.Strings = (
      'SELECT * FROM zf_metodos ORDER BY nome;')
    Left = 168
    Top = 440
    object qryLocal_Metodosid: TIntegerField
      FieldName = 'id'
      Required = True
      Visible = False
    end
    object qryLocal_Metodosnome: TStringField
      DisplayLabel = 'Nome do M'#233'todo'
      DisplayWidth = 60
      FieldName = 'nome'
      Required = True
      Size = 45
    end
    object qryLocal_Metodosdescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 100
      FieldName = 'descricao'
      Required = True
      Size = 45
    end
  end
  object dsLocal_Metodos: TDataSource
    DataSet = qryLocal_Metodos
    Left = 272
    Top = 432
  end
end
