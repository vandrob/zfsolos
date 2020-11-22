unit uFrmObrasFurosEdicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmPadraoEdicao, SUIButton, SUIImagePanel, ExtCtrls, SUIForm,
  StdCtrls, SUIEdit, DBCtrls, SUIDBCtrls;

type
  TFrmObrasFurosEdicao = class(TFrmPadraoEdicao)
    GroupBox1: TGroupBox;
    lbl1: TLabel;
    Label1: TLabel;
    cmbDiametro: TsuiDBLookupComboBox;
    txtCotaSondagem: TsuiNumberEdit;
    txtCotaArrasamento: TsuiNumberEdit;
    txtNomeFuro: TsuiEdit;
    Label2: TLabel;
    Label3: TLabel;
    txtObraNome: TDBText;
    txtClienteNome: TDBText;
    txtObraEndereco: TDBText;
    txtOPERACAO: TLabel;
    txtID: TsuiEdit;
    txtTIPOESTACA: TDBText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure txtNomeFuroKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure txtCotaSondagemEnter(Sender: TObject);
    procedure txtNomeFuroEnter(Sender: TObject);
    procedure txtCotaArrasamentoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure carregarCampos(strOperacao:string='I');
  end;

var
  FrmObrasFurosEdicao: TFrmObrasFurosEdicao;

implementation

{$R *.dfm}
uses uDatamodule,uFuncoes;

procedure TFrmObrasFurosEdicao.FormCreate(Sender: TObject);
begin
  inherited;
  uDatamodule.DataModule1.qryDiametros.Open;
end;

procedure TFrmObrasFurosEdicao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  uDatamodule.DataModule1.qryDiametros.close;
end;

procedure TFrmObrasFurosEdicao.carregarCampos(strOperacao: string);
var
   idDiametro:string;
begin

 if (strOperacao='I') then txtOPERACAO.caption:='INCLUIR REGISTRO';
 if (strOperacao='A') then txtOPERACAO.caption:='ALTERAR REGISTRO';
 if (strOperacao='E') then txtOPERACAO.caption:='EXCLUIR REGISTRO';


 txtID.Text   :='0';
 txtNomeFuro.Text :='';
 txtCotaSondagem.Text:='0';
 txtCotaArrasamento.Text:='0';

 if (strOperacao<>'I') then
  begin
   txtID.Text             :=trimright(trimleft( datamodule1.QryLocal_ObrasFurosid.AsString ));
   txtNomeFuro.Text       :=DataModule1.QryLocal_ObrasFurosdescricaofuro.AsString;
   txtCotaSondagem.Text   :=DataModule1.QryLocal_ObrasFuroscota_sondagem.AsString;
   txtCotaArrasamento.Text:=DataModule1.QryLocal_ObrasFuroscota_arrasamento.AsString;
   idDiametro             :=DataModule1.QryLocal_ObrasFurosiddiametro.AsString;
   cmbDiametro.KeyValue   :=idDiametro;
  end;

   txtNomeFuro.Enabled:=strOperacao<>'E';
   txtCotaSondagem.Enabled:=strOperacao<>'E';
   txtCotaArrasamento.Enabled:=strOperacao<>'E';
   cmbDiametro.Enabled:=strOperacao<>'E';

   if (strOperacao<>'E') then
    begin
     btnSalvar.Visible:=true;
     btnCancelar.Visible:=true;
     btnExcluir.Visible:=false;
    end
   else
    begin
     btnSalvar.Visible:=false;
     btnCancelar.Visible:=true;
     btnExcluir.Visible:=true;
    end
   ;

end;

procedure TFrmObrasFurosEdicao.txtNomeFuroKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key=#13 then selectnext(Sender as Twincontrol,true,true)
end;

procedure TFrmObrasFurosEdicao.FormActivate(Sender: TObject);
begin
  inherited;
  if btnSalvar.Visible then
   cmbDiametro.SetFocus
 else
   btnExcluir.SetFocus
 ;

end;

procedure TFrmObrasFurosEdicao.btnExcluirClick(Sender: TObject);
var
 strSQL:string;
begin
  inherited;
  strSQL:='DELETE FROM zf_furos WHERE id='+trimright(trimleft(txtID.Text));
  executarSQL( strSQL );
  uDatamodule.DataModule1.QryLocal_ObrasFuros.Refresh;
  close;


end;

procedure TFrmObrasFurosEdicao.btnSalvarClick(Sender: TObject);
var
 strSQL,strOperacao:string;
begin

  inherited;

  if not campoPreenchido(txtNomeFuro.Text   , 'O Campo [ NOME ] é de preenchimento obrigatório')   then begin txtNomeFuro.SetFocus; exit; end;


  strOperacao:= copy(txtOPERACAO.caption,0,1);

  if (strOperacao='I') then
   begin
    strSQL:='INSERT INTO zf_furos ('+
            ' idobra ,    '+
            ' iddiametro,    '+
            ' descricaofuro,    '+
            ' cota_sondagem, '+
            ' cota_arrasamento '+
            ' ) VALUES ( '+
            aspas(  VirgulaParaPonto(uDatamodule.DataModule1.qryLocal_Obrasid.AsString ))+','+
            aspas( VirgulaParaPonto(cmbDiametro.KeyValue )) +','+
            aspas( txtNomeFuro.Text )+','+
            aspas( VirgulaParaPonto(txtCotaSondagem.Text) ) +','+
            aspas( VirgulaParaPonto(txtCotaArrasamento.Text) )+')';

   end
  else if (strOperacao='A') then
   begin
     strSQL:='UPDATE zf_furos SET '+
             '  iddiametro  = '+ aspas( VirgulaParaPonto(cmbDiametro.KeyValue) )+','+
             '  descricaofuro    = '+ aspas( txtNomeFuro.Text)+','+
             '  cota_sondagem    = '+ aspas( VirgulaParaPonto(txtCotaSondagem.Text))+','+
             '  cota_arrasamento        = '+ aspas( VirgulaParaPonto(txtCotaArrasamento.Text))+
             ' WHERE '+
             '  id='+aspas( VirgulaParaPonto(txtID.Text) );
   end
  ;



  executarSQL( strSQL );
  uDatamodule.DataModule1.QryLocal_ObrasFuros.Refresh;
  close;

end;

procedure TFrmObrasFurosEdicao.txtCotaSondagemEnter(Sender: TObject);
begin
  inherited;
  txtCotaSondagem.SelectAll;
end;

procedure TFrmObrasFurosEdicao.txtNomeFuroEnter(Sender: TObject);
begin
  inherited;
 txtNomeFuro.SelectAll;
end;

procedure TFrmObrasFurosEdicao.txtCotaArrasamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key=#13 then begin
    if btnSalvar.Visible then btnSalvar.SetFocus else btnExcluir.SetFocus;
  end;
end;

end.
