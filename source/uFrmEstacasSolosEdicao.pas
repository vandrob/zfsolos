unit uFrmEstacasSolosEdicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmPadraoEdicao, SUIButton, SUIImagePanel, ExtCtrls, SUIForm,
  SUIEdit, StdCtrls, DBCtrls, SUIDBCtrls;

type
  TFrmEstacasSolosEdicao = class(TFrmPadraoEdicao)
    txtID: TsuiEdit;
    txtOPERACAO: TLabel;
    Label1: TLabel;
    txtAlpha: TsuiNumberEdit;
    Label2: TLabel;
    Label3: TLabel;
    txtBeta: TsuiNumberEdit;
    Label4: TLabel;
    cmbEstacas: TsuiDBLookupComboBox;
    cmbSolo: TsuiDBLookupComboBox;
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure carregarCampos(strOperacao: string);
  end;

var
  FrmEstacasSolosEdicao: TFrmEstacasSolosEdicao;

implementation

uses uDatamodule,uFuncoes ;
{$R *.dfm}

procedure TFrmEstacasSolosEdicao.btnExcluirClick(Sender: TObject);
var
 strSQL:string;
begin
  inherited;
  strSQL:='DELETE FROM zf_estacas_solos WHERE id='+trimright(trimleft(txtID.Text));
  executarSQL( strSQL );
  uDatamodule.DataModule1.qryLocal_EstacasSolos.Refresh;
  close;

end;

procedure TFrmEstacasSolosEdicao.btnSalvarClick(Sender: TObject);
var
 strSQL,strOperacao,_id,_idE,_idS,_vlA,_vlB:string;
begin

  inherited;


  strOperacao:= copy(txtOPERACAO.caption,0,1);
  _id :=  aspas( txtID.Text );
  _idE:=  aspas( cmbEstacas.KeyValue );
  _idS:=  aspas( cmbSolo.KeyValue );
  _vlA:=  aspas( VirgulaParaPonto( txtAlpha.Text ) )   ;
  _vlB:=  aspas( VirgulaParaPonto( txtBeta.Text ) )   ;



  if (strOperacao='I') then
   begin
    strSQL:='INSERT INTO zf_estacas_solos ('+
            ' idestacas,idsolos,vlr_alpha,vlr_beta     '+
            ' ) VALUES ( '+
            _idE+','+
            _idS+','+
            _VlA+','+
            _VlB+')';

   end
  else if (strOperacao='A') then
   begin
     strSQL:='UPDATE zf_estacas_solos SET '+
             '  idestacas  = '+ _idE +',' +
             '  idsolos    = '+ _idS +',' +
             '  vlr_alpha  = '+ _vlA +',' +
             '  vlr_beta   = '+ _vlB      +
             ' WHERE '+
             '  id='+_id;
   end
  ;



  executarSQL( strSQL );
  uDatamodule.DataModule1.qryLocal_EstacasSolos.Refresh;
  close;


end;

procedure TFrmEstacasSolosEdicao.carregarCampos(strOperacao: string);
begin
 if (strOperacao='I') then txtOPERACAO.caption:='INCLUIR REGISTRO';
 if (strOperacao='A') then txtOPERACAO.caption:='ALTERAR REGISTRO';
 if (strOperacao='E') then txtOPERACAO.caption:='EXCLUIR REGISTRO';


 txtID.Text   :='0';
 txtAlpha.Value:=0;
 txtBeta.Value:=0;

 if (strOperacao<>'I') then
  begin
   txtID.Text       :=trimright(trimleft( datamodule1.qryLocal_EstacasSolosid.AsString ));
   txtAlpha.Value    :=StrToFloat( datamodule1.qryLocal_EstacasSolosvlr_alpha.AsString);
   txtBeta.Value    :=StrToFloat( datamodule1.qryLocal_EstacasSolosvlr_beta.AsString);

   cmbEstacas.KeyValue:=datamodule1.qryLocal_EstacasSolosidestacas.AsString;
   cmbSolo.KeyValue   :=datamodule1.qryLocal_Solosid.AsString;


  end;

  // txtNome.Enabled:=strOperacao<>'E';

   if (strOperacao<>'E') then
    begin
     btnSalvar.Visible:=true;
     btnCancelar.Visible:=true;
     btnExcluir.Visible:=false;

     cmbEstacas.Enabled:=true;
     cmbSolo.Enabled:=true;
     txtAlpha.Enabled:=true;
     txtBeta.Enabled:=true;

    end
   else
    begin
     btnSalvar.Visible:=false;
     btnCancelar.Visible:=true;
     btnExcluir.Visible:=true;

     cmbEstacas.Enabled:=false;
     cmbSolo.Enabled:=false;
     txtAlpha.Enabled:=false;
     txtBeta.Enabled:=false;
    end
   ;
end;

end.
