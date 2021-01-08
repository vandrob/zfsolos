object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 312
  Height = 739
  Width = 541
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
    Left = 80
    Top = 400
    object qryLocal_Estacas_Tiposid: TIntegerField
      FieldName = 'id'
      Required = True
      Visible = False
    end
    object qryLocal_Estacas_Tiposnome: TStringField
      DisplayWidth = 50
      FieldName = 'nome'
      Required = True
      Size = 500
    end
    object qryLocal_Estacas_Tiposf1: TFloatField
      DisplayLabel = '(Par'#226'metro) f1'
      FieldName = 'f1'
      Required = True
      DisplayFormat = '####0.00'
    end
    object qryLocal_Estacas_Tiposf2: TFloatField
      DisplayLabel = '(Par'#226'metro) f2'
      FieldName = 'f2'
      Required = True
      DisplayFormat = '####0;00'
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
    object qryLocal_Solosknm2: TFloatField
      DisplayLabel = 'KN/m2'
      FieldName = 'knm2'
      Required = True
      DisplayFormat = '#####0.00'
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
    Left = 192
    Top = 376
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
    Left = 176
    Top = 200
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
  object qryLocal_EstacasSolos: TZQuery
    Connection = connMYSQL
    ReadOnly = True
    SQL.Strings = (
      'SELECT '#10
      ' es.id,'#10
      ' es.idestacas,'#10
      ' e.nome as estaca,'#10
      ' es.idsolos,'#10
      ' s.nome as solo,'#10
      ' es.vlr_alpha,'#10
      ' es.vlr_beta '#10
      'FROM '#10
      '  zf_estacas_solos es'#10
      '  INNER JOIN zf_estacas_tipos e ON (e.id=es.idestacas)'#10
      '  INNER JOIN zf_solos s  ON (s.id=es.idsolos)'#10
      'ORDER BY'#10
      '  e.nome,s.nome,es.id')
    Params = <>
    Left = 168
    Top = 264
    object qryLocal_EstacasSolosid: TIntegerField
      FieldName = 'id'
      Required = True
      Visible = False
    end
    object qryLocal_EstacasSolosidestacas: TIntegerField
      FieldName = 'idestacas'
      Required = True
      Visible = False
    end
    object qryLocal_EstacasSolosestaca: TStringField
      DisplayLabel = 'Tipo de Estaca'
      DisplayWidth = 40
      FieldName = 'estaca'
      Required = True
      Size = 500
    end
    object qryLocal_EstacasSolosidsolos: TIntegerField
      FieldName = 'idsolos'
      Required = True
      Visible = False
    end
    object qryLocal_EstacasSolossolo: TStringField
      DisplayLabel = 'Tipo de Solo'
      DisplayWidth = 40
      FieldName = 'solo'
      Size = 45
    end
    object qryLocal_EstacasSolosvlr_alpha: TFloatField
      DisplayLabel = 'Alpha'
      FieldName = 'vlr_alpha'
      Required = True
      DisplayFormat = '####,##0.00'
    end
    object qryLocal_EstacasSolosvlr_beta: TFloatField
      DisplayLabel = 'Beta'
      FieldName = 'vlr_beta'
      Required = True
      DisplayFormat = '####,##0.00'
    end
  end
  object dsLocal_EstacasSolos: TDataSource
    DataSet = qryLocal_EstacasSolos
    Left = 272
    Top = 504
  end
  object QryLocal_ObrasFuros: TZQuery
    Connection = connMYSQL
    ReadOnly = True
    SQL.Strings = (
      'SELECT '
      ' f.id,'
      ' f.iddiametro,'
      ' d.diametro,'
      ' t.nome as descricao_estaca,'
      ' f.descricaofuro,'
      ' f.cota_sondagem,'
      ' f.cota_arrasamento'
      'FROM '
      ' zf_furos f'
      ' inner join zf_diametros d on d.id=f.iddiametro'
      ' inner join zf_estacas_tipos t on t.id=d.id_estacas_tipos'
      'WHERE '
      ' f.idobra=:parID'
      'ORDER BY'
      ' f.idobra, f.descricaofuro')
    Params = <
      item
        DataType = ftUnknown
        Name = 'parID'
        ParamType = ptUnknown
      end>
    Left = 48
    Top = 552
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'parID'
        ParamType = ptUnknown
      end>
    object QryLocal_ObrasFurosid: TIntegerField
      FieldName = 'id'
      Required = True
      Visible = False
    end
    object QryLocal_ObrasFurosiddiametro: TIntegerField
      FieldName = 'iddiametro'
      Required = True
      Visible = False
    end
    object QryLocal_ObrasFurosdiametro: TFloatField
      DisplayLabel = 'Di'#226'metro'
      FieldName = 'diametro'
      Required = True
      DisplayFormat = '####0.00'
    end
    object QryLocal_ObrasFurosdescricao_estaca: TStringField
      DisplayLabel = 'Tipo da Estaca'
      DisplayWidth = 50
      FieldName = 'descricao_estaca'
      Required = True
      Size = 500
    end
    object QryLocal_ObrasFurosdescricaofuro: TStringField
      DisplayLabel = 'Identifica'#231#227'o do Furo'
      FieldName = 'descricaofuro'
      Size = 45
    end
    object QryLocal_ObrasFuroscota_sondagem: TFloatField
      DisplayLabel = 'Cota de Sondagem'
      FieldName = 'cota_sondagem'
      Required = True
      DisplayFormat = '#####0.00'
    end
    object QryLocal_ObrasFuroscota_arrasamento: TFloatField
      DisplayLabel = 'Cota de Arrasamento'
      FieldName = 'cota_arrasamento'
      Required = True
      DisplayFormat = '#####0.00'
    end
  end
  object dsLocal_ObrasFuros: TDataSource
    DataSet = QryLocal_ObrasFuros
    Left = 168
    Top = 552
  end
  object qryCamadas: TZQuery
    Connection = connMYSQL
    AfterInsert = qryCamadasAfterInsert
    AfterPost = qryCamadasAfterPost
    SQL.Strings = (
      'SELECT '
      '    '#10'idcamada,'#10
      '    idfuro,'
      '    idsolo,'
      '    '#10'profundidade,'
      '   '#10'camada,'
      '   '#10'spt,'
      '   '#10'vlr_k,'
      '   '#10'vlr_alpha,'
      '    '#10'vlr_rp,'#10
      '    vlr_r1,'
      '    '#10'vlr_beta,'
      '    '#10'vlr_r2,'
      '    '#10'qm_adm1,'
      '    '#10'qm_adm2,'#10
      '    qm_adm'#10
      'FROM '#10
      '   zf_furos_camadas'
      'WHERE '
      '  idfuro=:parIDFURO'
      'ORDER BY'
      '  idfuro,profundidade,camada')
    Params = <
      item
        DataType = ftUnknown
        Name = 'parIDFURO'
        ParamType = ptUnknown
      end>
    Left = 72
    Top = 640
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'parIDFURO'
        ParamType = ptUnknown
      end>
    object qryCamadasidcamada: TIntegerField
      FieldName = 'idcamada'
      Required = True
      Visible = False
    end
    object qryCamadasidfuro: TIntegerField
      FieldName = 'idfuro'
      Required = True
      Visible = False
    end
    object qryCamadasidsolo: TIntegerField
      FieldName = 'idsolo'
      Required = True
      Visible = False
      OnChange = qryCamadasidsoloChange
    end
    object qryCamadasprofundidade: TFloatField
      FieldName = 'Profundidade'
      Required = True
      DisplayFormat = '###0.00'
      EditFormat = '###0.00'
    end
    object qryCamadascamada: TIntegerField
      DisplayLabel = 'Camada'
      FieldName = 'camada'
      Required = True
      DisplayFormat = '###0'
      EditFormat = '###0'
    end
    object qryCamadasSolo: TStringField
      FieldKind = fkLookup
      FieldName = 'Solo'
      LookupDataSet = qryLocal_Solos
      LookupKeyFields = 'id'
      LookupResultField = 'nome'
      KeyFields = 'idsolo'
      Size = 50
      Lookup = True
    end
    object qryCamadasspt: TFloatField
      DisplayLabel = 'SPT'
      FieldName = 'spt'
      Required = True
      DisplayFormat = '###0'
      EditFormat = '###0'
    end
    object qryCamadasvlr_k: TFloatField
      DisplayLabel = 'K'
      FieldName = 'vlr_k'
      Required = True
      DisplayFormat = '#####0.00'
      EditFormat = '#####0.00'
    end
    object qryCamadasvlr_alpha: TFloatField
      DisplayLabel = 'Alpha'
      FieldName = 'vlr_alpha'
      Required = True
      DisplayFormat = '#####0.00'
      EditFormat = '#####0.00'
    end
    object qryCamadasvlr_rp: TFloatField
      DisplayLabel = 'RP'
      FieldName = 'vlr_rp'
      Required = True
      DisplayFormat = '#####0.00'
      EditFormat = '#####0.00'
    end
    object qryCamadasvlr_r1: TFloatField
      DisplayLabel = 'R1'
      FieldName = 'vlr_r1'
      Required = True
      DisplayFormat = '#####0.00'
      EditFormat = '#####0.00'
    end
    object qryCamadasvlr_beta: TFloatField
      DisplayLabel = 'Beta'
      FieldName = 'vlr_beta'
      Required = True
      DisplayFormat = '#####0.00'
      EditFormat = '#####0.00'
    end
    object qryCamadasvlr_r2: TFloatField
      DisplayLabel = 'R2'
      FieldName = 'vlr_r2'
      Required = True
      DisplayFormat = '#####0.00'
      EditFormat = '#####0.00'
    end
    object qryCamadasqm_adm1: TFloatField
      DisplayLabel = 'QM Adm1'
      FieldName = 'qm_adm1'
      Required = True
      DisplayFormat = '#####0.00'
      EditFormat = '#####0.00'
    end
    object qryCamadasqm_adm2: TFloatField
      DisplayLabel = 'QM Adm2'
      FieldName = 'qm_adm2'
      Required = True
      DisplayFormat = '#####0.00'
      EditFormat = '#####0.00'
    end
    object qryCamadasqm_adm: TFloatField
      DisplayLabel = 'QM Adm'
      FieldName = 'qm_adm'
      Required = True
      DisplayFormat = '#####0.00'
      EditFormat = '#####0.00'
    end
  end
  object qryFuros_NSPT: TZQuery
    Connection = connMYSQL
    AfterInsert = qryFuros_NSPTAfterInsert
    AfterPost = qryFuros_NSPTAfterPost
    SQL.Strings = (
      
        'SELECT * FROM estaqnet_erp1.zf_furos_nspt where idfuro=:parIDFUR' +
        'O ORDER BY idfuro,idcamada ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'parIDFuro'
        ParamType = ptUnknown
      end>
    Left = 176
    Top = 640
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'parIDFuro'
        ParamType = ptUnknown
      end>
    object qryFuros_NSPTid: TIntegerField
      FieldName = 'id'
      Required = True
      Visible = False
    end
    object qryFuros_NSPTidfuro: TIntegerField
      FieldName = 'idfuro'
      Required = True
      Visible = False
    end
    object qryFuros_NSPTidcamada: TIntegerField
      DisplayLabel = 'Camada'
      FieldName = 'idcamada'
      Required = True
    end
    object qryFuros_NSPTnspt: TFloatField
      DisplayLabel = 'N Spt'
      FieldName = 'nspt'
      Required = True
      DisplayFormat = '#####0'
      EditFormat = '#####0'
    end
  end
  object dsFuros_NSPT: TDataSource
    DataSet = qryFuros_NSPT
    Left = 400
    Top = 632
  end
  object dsCamadas: TDataSource
    DataSet = qryCamadas
    Left = 368
    Top = 520
  end
  object qryCalculosDecourt: TZQuery
    Connection = connMYSQL
    SQL.Strings = (
      'SELECT'
      #9'c.idcamada,'
      #9'c.idfuro,'
      #9'c.idsolo,'
      '  s.nome as solo,'
      #9'c.profundidade,'
      #9'c.camada,'
      #9'c.spt,'
      #9'c.vlr_k,'
      #9'c.vlr_alpha,'
      #9'c.vlr_rp,'
      #9'c.vlr_r1,'
      #9'c.vlr_beta,'
      #9'c.vlr_r2,'
      #9'c.qm_adm1,'
      #9'c.qm_adm2,'
      #9'c.qm_adm'
      'FROM'
      #9'  zf_furos_camadas c'
      '    inner join zf_solos s on s.id=c.idsolo'
      'WHERE'
      '    c.idfuro=:parIDFURO'
      'ORDER by'
      '    c.idfuro,c.profundidade ')
    Params = <
      item
        DataType = ftUnknown
        Name = 'parIDFURO'
        ParamType = ptUnknown
      end>
    Left = 288
    Top = 632
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'parIDFURO'
        ParamType = ptUnknown
      end>
    object qryCalculosDecourtidcamada: TIntegerField
      FieldName = 'idcamada'
      Required = True
      Visible = False
    end
    object qryCalculosDecourtidfuro: TIntegerField
      FieldName = 'idfuro'
      Required = True
      Visible = False
    end
    object qryCalculosDecourtidsolo: TIntegerField
      FieldName = 'idsolo'
      Required = True
      Visible = False
    end
    object qryCalculosDecourtsolo: TStringField
      DisplayLabel = 'Solo'
      FieldName = 'solo'
      Size = 45
    end
    object qryCalculosDecourtprofundidade: TFloatField
      DisplayLabel = 'Profundidade'
      FieldName = 'profundidade'
      Required = True
      DisplayFormat = '####0.00'
      EditFormat = '####0.00'
    end
    object qryCalculosDecourtcamada: TIntegerField
      DisplayLabel = 'Camada'
      FieldName = 'camada'
      Required = True
    end
    object qryCalculosDecourtspt: TFloatField
      DisplayLabel = 'NSpt'
      FieldName = 'spt'
      Required = True
      DisplayFormat = '####0'
      EditFormat = '####0'
    end
    object qryCalculosDecourtvlr_k: TFloatField
      DisplayLabel = 'K'
      FieldName = 'vlr_k'
      Required = True
      DisplayFormat = '####0.00'
    end
    object qryCalculosDecourtvlr_alpha: TFloatField
      DisplayLabel = 'Alpha'
      FieldName = 'vlr_alpha'
      Required = True
      DisplayFormat = '####0.00'
    end
    object qryCalculosDecourtvlr_r1: TFloatField
      DisplayLabel = 'Rl'
      FieldName = 'vlr_r1'
      Required = True
      DisplayFormat = '####0.00'
    end
    object qryCalculosDecourtvlr_rp: TFloatField
      DisplayLabel = 'Rp'
      FieldName = 'vlr_rp'
      Required = True
      DisplayFormat = '####0.00'
    end
    object qryCalculosDecourtvlr_beta: TFloatField
      DisplayLabel = 'Beta'
      FieldName = 'vlr_beta'
      Required = True
      DisplayFormat = '####0.00'
    end
    object qryCalculosDecourtvlr_r2: TFloatField
      DisplayLabel = 'Rt'
      FieldName = 'vlr_r2'
      Required = True
      DisplayFormat = '####0.00'
    end
    object qryCalculosDecourtqm_adm1: TFloatField
      DisplayLabel = 'QM Adm1'
      FieldName = 'qm_adm1'
      Required = True
      DisplayFormat = '####0.00'
    end
    object qryCalculosDecourtqm_adm2: TFloatField
      DisplayLabel = 'QM Adm2'
      FieldName = 'qm_adm2'
      Required = True
      DisplayFormat = '####0.00'
    end
    object qryCalculosDecourtqm_adm: TFloatField
      DisplayLabel = 'QM Adm'
      FieldName = 'qm_adm'
      Required = True
      DisplayFormat = '####0.00'
    end
  end
  object dsCalculosDecourt: TDataSource
    DataSet = qryCalculosDecourt
    Left = 400
    Top = 632
  end
end
