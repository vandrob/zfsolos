unit uDatamodule;

interface

uses
  SysUtils, Classes, ZAbstractConnection, ZConnection, DB, Dialogs,Windows,
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
    qryCamadas: TZQuery;
    qryCamadasidcamada: TIntegerField;
    qryCamadasidfuro: TIntegerField;
    qryCamadasprofundidade: TFloatField;
    qryCamadascamada: TIntegerField;
    qryCamadasspt: TFloatField;
    qryCamadasvlr_k: TFloatField;
    qryCamadasvlr_alpha: TFloatField;
    qryCamadasvlr_rp: TFloatField;
    qryCamadasvlr_r1: TFloatField;
    qryCamadasvlr_beta: TFloatField;
    qryCamadasvlr_r2: TFloatField;
    qryCamadasqm_adm1: TFloatField;
    qryCamadasqm_adm2: TFloatField;
    qryCamadasqm_adm: TFloatField;
    qryCamadasidsolo: TIntegerField;
    qryCamadasSolo: TStringField;
    qryFuros_NSPT: TZQuery;
    dsFuros_NSPT: TDataSource;
    qryFuros_NSPTid: TIntegerField;
    qryFuros_NSPTidfuro: TIntegerField;
    qryFuros_NSPTidcamada: TIntegerField;
    qryFuros_NSPTnspt: TFloatField;
    dsCamadas: TDataSource;
    qryCalculosDecourt: TZQuery;
    dsCalculosDecourt: TDataSource;
    qryCalculosDecourtidcamada: TIntegerField;
    qryCalculosDecourtidfuro: TIntegerField;
    qryCalculosDecourtidsolo: TIntegerField;
    qryCalculosDecourtsolo: TStringField;
    qryCalculosDecourtprofundidade: TFloatField;
    qryCalculosDecourtcamada: TIntegerField;
    qryCalculosDecourtspt: TFloatField;
    qryCalculosDecourtvlr_k: TFloatField;
    qryCalculosDecourtvlr_alpha: TFloatField;
    qryCalculosDecourtvlr_rp: TFloatField;
    qryCalculosDecourtvlr_r1: TFloatField;
    qryCalculosDecourtvlr_beta: TFloatField;
    qryCalculosDecourtvlr_r2: TFloatField;
    qryCalculosDecourtqm_adm1: TFloatField;
    qryCalculosDecourtqm_adm2: TFloatField;
    qryCalculosDecourtqm_adm: TFloatField;
    procedure qryCamadasAfterInsert(DataSet: TDataSet);
    procedure qryCamadasidsoloChange(Sender: TField);
    procedure qryFuros_NSPTAfterInsert(DataSet: TDataSet);
    procedure qryFuros_NSPTAfterPost(DataSet: TDataSet);
    procedure qryCamadasAfterPost(DataSet: TDataSet);

  private
    { Private declarations }
    function vlrfield(strSQL:string):string;
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}
uses uFuncoes;

procedure TDataModule1.qryCamadasAfterInsert(DataSet: TDataSet);
var
  cid,csql:string;
begin
  cId:=TrimRight(TrimLeft(QryLocal_ObrasFurosid.AsString));
  if cId='' then cId:='0';

  if (StrToInt(cId)>=0) then begin
    qryCamadas.fieldbyname('idfuro').AsString:=cId;
    csql:='SELECT COALESCE( MAX(camada) ,0  )+1 from zf_furos_camadas WHERE idfuro='+ cId;
    cId:= vlrfield( csql);
    if cId='' then cId:='0';
    if (StrToInt(cId)>=0) then begin
     qryCamadas.FieldByName('camada').AsString:=cId;
    end;
  end;

  qryCamadasidfuro.AsString:=QryLocal_ObrasFurosid.AsString;
  

end;

procedure TDataModule1.qryCamadasidsoloChange(Sender: TField);
var
   sSQL,sIdSolo,sIdDiametro:string;
begin
   sIdSolo:= qryCamadasidsolo.AsString ;
   sIdDiametro:= QryLocal_ObrasFurosiddiametro.AsString;
 
end;

procedure TDataModule1.qryFuros_NSPTAfterInsert(DataSet: TDataSet);
var
  cid,csql:string;
begin
  cId:=TrimRight(TrimLeft(QryLocal_ObrasFurosid.AsString));
  if cId='' then cId:='0';

  if (StrToInt(cId)>=0) then begin
    qryFuros_NSPTidfuro.AsString:=cId;
    csql:='SELECT COALESCE( MAX(idcamada),0  )+1 from zf_furos_nspt WHERE idfuro='+ cId;
    cId:= vlrfield( csql);
    if cId='' then cId:='0';
    if (StrToInt(cId)>=0) then begin
     qryFuros_NSPTidcamada.AsString:=cId;
    end;
  end;
end;

procedure TDataModule1.qryFuros_NSPTAfterPost(DataSet: TDataSet);
begin
  qryFuros_NSPT.Refresh;
  qryFuros_NSPT.Last;
end;


function TDataModule1.vlrfield(strSQL:string):string;
    begin
     with datamodule1.qryLocal_Retorno do begin
       close;
       sql.clear;
       sql.add(strSQL);
       open;
       result:=trimright(trimleft( Fields[0].AsString ));
       close;
     end;
   end;
procedure TDataModule1.qryCamadasAfterPost(DataSet: TDataSet);
begin
  DataModule1.qryCalculosDecourt.Refresh;
end;

end.
