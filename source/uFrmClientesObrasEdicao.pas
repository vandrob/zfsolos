unit uFrmClientesObrasEdicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmPadraoEdicao, SUIButton, SUIImagePanel, ExtCtrls, SUIForm,
  StdCtrls, SUIEdit, SUIComboBox;

type
  TFrmClientesObrasEdicao = class(TFrmPadraoEdicao)
    txtOPERACAO: TLabel;
    txtID: TsuiEdit;
    Label1: TLabel;
    txtNome: TsuiEdit;
    Label2: TLabel;
    txtEndereco: TsuiEdit;
    Label3: TLabel;
    txtBairro: TsuiEdit;
    txtCidade: TsuiEdit;
    Label4: TLabel;
    Label5: TLabel;
    txtDestinacao: TsuiEdit;
    Label6: TLabel;
    Label7: TLabel;
    txtObservacoes: TsuiEdit;
    txtId_cliente: TsuiEdit;
    txtId_usuario: TsuiEdit;
    Label9: TLabel;
    txtCodigo_referencia: TsuiEdit;
    txtUF: TsuiComboBox;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure txtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure txtObservacoesKeyPress(Sender: TObject; var Key: Char);
    procedure txtUFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtUFKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure carregarCampos(strOperacao: string);
  end;

var
  FrmClientesObrasEdicao: TFrmClientesObrasEdicao;

implementation

uses uDatamodule,uFuncoes;

{$R *.dfm}

{ TFrmClientesObrasEdicao }

procedure TFrmClientesObrasEdicao.carregarCampos(strOperacao: string);
begin

 if (strOperacao='I') then txtOPERACAO.caption:='INCLUIR REGISTRO';
 if (strOperacao='A') then txtOPERACAO.caption:='ALTERAR REGISTRO';
 if (strOperacao='E') then txtOPERACAO.caption:='EXCLUIR REGISTRO';


 txtID.Text         :='0';
 txtId_cliente.Text := Datamodule1.qrylocal_clientesid.AsString;
 txtId_usuario.Text := usuario_id;

 txtNome.Text :='';
 txtEndereco.Text:='';
 txtBairro.Text:='';
 txtCidade.Text:='';
 txtUF.Text:='';

 txtCodigo_referencia.Text:='';
 txtDestinacao.Text:='';
 txtObservacoes.Text:='';

 if (strOperacao<>'I') then
  begin
   txtID.Text               :=trimright(trimleft( datamodule1.qryLocal_Obrasid.AsString ));

   txtNome.Text     :=trimright(trimleft( datamodule1.qryLocal_Obrasnome.AsString));
   txtCodigo_referencia.Text:=trimright(trimleft( datamodule1.qryLocal_Obrascodigo_referencia.AsString) );

   txtEndereco.Text :=trimright(trimleft( datamodule1.qryLocal_Obrasendereco.AsString));
   txtBairro.Text   :=trimright(trimleft( datamodule1.qryLocal_Obrasbairro.AsString));
   txtCidade.Text   :=trimright(trimleft( datamodule1.qryLocal_Obrascidade.AsString));
   txtUF.Text       :=trimright(trimleft( datamodule1.qryLocal_Obrasuf.AsString));

   txtDestinacao.Text       :=trimright(trimleft( datamodule1.qryLocal_Obrasdestinacao.AsString));
   txtObservacoes.Text      :=trimright(trimleft( datamodule1.qryLocal_Obrasobservacoes.AsString));


  end;

   txtNome.Enabled      :=strOperacao<>'E';
   txtEndereco.Enabled  :=strOperacao<>'E';
   txtBairro.Enabled    :=strOperacao<>'E';
   txtCidade.Enabled    :=strOperacao<>'E';
   txtUF.Enabled        :=strOperacao<>'E';


   txtNome.Enabled             :=strOperacao<>'E';
   txtCodigo_referencia.Enabled:=strOperacao<>'E';

   txtEndereco.Enabled        :=strOperacao<>'E';
   txtBairro.Enabled          :=strOperacao<>'E';
   txtCidade.Enabled          :=strOperacao<>'E';
   txtUF.Enabled              :=strOperacao<>'E';

   txtDestinacao.Enabled      :=strOperacao<>'E';
   txtObservacoes.Enabled     :=strOperacao<>'E';


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

procedure TFrmClientesObrasEdicao.btnSalvarClick(Sender: TObject);

var
 strSQL,strOperacao:string;
begin

  inherited;

  if not campoPreenchido(txtNome.Text   , 'O Campo [ NOME ] é de preenchimento obrigatório')   then begin txtNome.SetFocus; exit; end;


  strOperacao:= copy(txtOPERACAO.caption,0,1);

  if (strOperacao='I') then
   begin
    strSQL:='INSERT INTO zf_obras ('+
            ' id_cliente,'+
            ' id_usuario,'+
            ' nome ,    '+
            ' endereco,    '+
            ' bairro,    '+
            ' cidade, '+
            ' uf, '+
            ' destinacao, '+
            ' observacoes, '+
            ' codigo_referencia '+
            ' ) VALUES ( '+
            aspas( txtid_cliente.Text )+','+
            aspas( txtid_usuario.Text )+','+
            aspas( txtNome.Text )+','+
            aspas( txtEndereco.Text )+','+
            aspas( txtBairro.Text )+','+
            aspas( txtCidade.Text )+','+
            aspas( txtUF.Text )+','+
            aspas( txtDestinacao.Text ) +','+
            aspas( txtObservacoes.Text ) +','+
            aspas( txtCodigo_referencia.text )+
            ')';

   end
  else if (strOperacao='A') then
   begin
     strSQL:='UPDATE zf_obras SET '+
             ' nome        = '+ aspas( txtNome.text )+','+
             ' endereco    = '+ aspas( txtEndereco.text )+','+
             ' bairro      = '+ aspas( txtBairro.text )+','+
             ' cidade      = '+ aspas( txtCidade.text )+','+
             ' uf          = '+ aspas( txtUF.text )+','+
             ' destinacao  = '+ aspas( txtDestinacao.text )+','+
             ' observacoes = '+ aspas( txtObservacoes.text )+','+
             ' codigo_referencia   = '+ aspas( txtCodigo_referencia.text )+
             ' WHERE '+
             '  id='+aspas( txtID.Text );
   end
  ;
  executarSQL( strSQL );
  uDatamodule.DataModule1.qryLocal_Obras.Refresh;
  close;
end;

procedure TFrmClientesObrasEdicao.btnExcluirClick(Sender: TObject);
var
 strSQL:string;
begin
  inherited;
  strSQL:='DELETE FROM zf_obras WHERE id='+trimright(trimleft(txtID.Text));
  executarSQL( strSQL );
  uDatamodule.DataModule1.qryLocal_Obras.Refresh;
  close;
end;

procedure TFrmClientesObrasEdicao.FormActivate(Sender: TObject);
begin
  inherited;
  if btnSalvar.Visible then
   txtNome.SetFocus
  else
   btnExcluir.SetFocus
  ;

end;

procedure TFrmClientesObrasEdicao.txtNomeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if key=#13 then selectnext(Sender as Twincontrol,true,true);
end;

procedure TFrmClientesObrasEdicao.txtObservacoesKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key=#13 then btnsalvar.setfocus;
end;

procedure TFrmClientesObrasEdicao.txtUFKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
   if Key = VK_DELETE then begin
    Beep;
    Key:= 0;
  end;
end;

procedure TFrmClientesObrasEdicao.txtUFKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key=#13 then
   selectnext(Sender as Twincontrol,true,true)
  else
   key:=#0
  ;

end;

end.
