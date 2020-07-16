unit uDatamodule;

interface

uses
  SysUtils, Classes, ZAbstractConnection, ZConnection, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZSqlProcessor;

type
  TDataModule1 = class(TDataModule)
    connLocal: TZConnection;
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
    qrylocal_clientestelefones: TStringField;
    qryLocal_Retorno: TZQuery;
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
