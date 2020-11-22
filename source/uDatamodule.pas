unit uDatamodule;

interface

uses
  SysUtils, Classes, ZAbstractConnection, ZConnection, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZSqlProcessor;

type
  TDataModule1 = class(TDataModule)
    connSQLITE: TZConnection;
    qrylocal_usuarios: TZQuery;
    dslocal_usuarios: TDataSource;
    cmdLocal: TZSQLProcessor;
    qrylocal_usuariosid: TIntegerField;
    qrylocal_usuariosnome: TStringField;
    qrylocal_usuariossenha: TStringField;
    qrylocal_usuariosemail: TStringField;
    qrylocal_usuariosativo_sn: TStringField;
    qrylocal_usuariosadministrador_sn: TStringField;
    qrylocal_clientes: TZQuery;
    dslocal_clientes: TDataSource;
    qrylocal_clientesid: TIntegerField;
    qrylocal_clientesnome: TStringField;
    qrylocal_clientesendereco: TStringField;
    qrylocal_clientesbairro: TStringField;
    qrylocal_clientescidade: TStringField;
    qrylocal_clientesuf: TStringField;
    qrylocal_clientesemail: TStringField;
    qrylocal_clientescontato: TStringField;
    qryLocal_Retorno: TZQuery;
    qrylocal_clientesid_usuario: TIntegerField;
    qrylocal_clientescodigo_referencia: TStringField;
    qryLocal_Obras: TZQuery;
    dslocal_obras: TDataSource;
    qrylocal_clientestelefone: TStringField;
    qryLocal_Obrasid: TIntegerField;
    qryLocal_Obrasid_cliente: TIntegerField;
    qryLocal_Obrasid_usuario: TIntegerField;
    qryLocal_Obrasnome: TStringField;
    qryLocal_Obrasendereco: TStringField;
    qryLocal_Obrasbairro: TStringField;
    qryLocal_Obrascidade: TStringField;
    qryLocal_Obrasuf: TStringField;
    qryLocal_Obrasdestinacao: TStringField;
    qryLocal_Obrasobservacoes: TStringField;
    qryLocal_Obrascodigo_referencia: TStringField;
    connMYSQL: TZConnection;
    qryLocal_Estacas_Tipos: TZQuery;
    qryLocal_Estacas_Tiposid: TIntegerField;
    dsLocal_Estacas_Tipos: TDataSource;
    qryLocal_Solos: TZQuery;
    qryLocal_Solosid: TIntegerField;
    qryLocal_Solosnome: TStringField;
    dsLocal_Solos: TDataSource;
    qryLocal_Diametros: TZQuery;
    dsLocal_Diametros: TDataSource;
    qryLocal_Diametrosid: TIntegerField;
    qryLocal_Diametrosdiametro: TFloatField;
    qryLocal_Diametrosid_estacas_tipos: TIntegerField;
    qryLocal_Metodos: TZQuery;
    dsLocal_Metodos: TDataSource;
    qryLocal_Metodosid: TIntegerField;
    qryLocal_Metodosnome: TStringField;
    qryLocal_Metodosdescricao: TStringField;
    qryLocal_Estacas_Tiposnome: TStringField;
    qryLocal_Diametrossecao_1: TFloatField;
    qryLocal_Diametrossecao_2: TFloatField;
    qryLocal_Diametrosarea: TFloatField;
    qryLocal_Diametrosperimetro: TFloatField;
    qryLocal_Diametrosmetalica_bitola_letra: TStringField;
    qryLocal_Diametrosmetalica_bitola_secao_1: TFloatField;
    qryLocal_Diametrosmetalica_bitola_secao_2: TFloatField;
    qryLocal_Diametrosmetalica_area_bruta: TFloatField;
    qryLocal_Diametrosmetalica_perimetro: TFloatField;
    qryLocal_Diametrosmetalica_area_plena: TFloatField;
    qryLocal_Solosknm2: TFloatField;
    qryLocal_EstacasSolos: TZQuery;
    dsLocal_EstacasSolos: TDataSource;
    qryLocal_EstacasSolosid: TIntegerField;
    qryLocal_EstacasSolosidestacas: TIntegerField;
    qryLocal_EstacasSolosestaca: TStringField;
    qryLocal_EstacasSolosidsolos: TIntegerField;
    qryLocal_EstacasSolossolo: TStringField;
    qryLocal_EstacasSolosvlr_alpha: TFloatField;
    qryLocal_EstacasSolosvlr_beta: TFloatField;
    qryLocal_Estacas_Tiposf1: TFloatField;
    qryLocal_Estacas_Tiposf2: TFloatField;
    QryLocal_ObrasFuros: TZQuery;
    dsLocal_ObrasFuros: TDataSource;
    QryLocal_ObrasFurosid: TIntegerField;
    QryLocal_ObrasFurosiddiametro: TIntegerField;
    QryLocal_ObrasFurosdiametro: TFloatField;
    QryLocal_ObrasFurosdescricao_estaca: TStringField;
    QryLocal_ObrasFurosdescricaofuro: TStringField;
    QryLocal_ObrasFuroscota_sondagem: TFloatField;
    QryLocal_ObrasFuroscota_arrasamento: TFloatField;
    qryDiametros: TZQuery;
    dsDiametros: TDataSource;
    qryDiametrosid: TIntegerField;
    qryDiametrosnome: TStringField;
    qryDiametrosdiametro: TFloatField;
    qryDiametrosid_estacas_tipos: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

end.
