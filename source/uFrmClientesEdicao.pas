unit uFrmClientesEdicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmPadraoEdicao, SUIButton, SUIImagePanel, ExtCtrls, SUIForm,
  StdCtrls, SUIEdit;

type
  TFrmClientesEdicao = class(TFrmPadraoEdicao)
    txtID: TsuiEdit;
    txtOPERACAO: TLabel;
    Label1: TLabel;
    txtNome: TsuiEdit;
    txtEndereco: TsuiEdit;
    Label2: TLabel;
    txtBairro: TsuiEdit;
    Label3: TLabel;
    txtCidade: TsuiEdit;
    Label4: TLabel;
    txtUF: TsuiEdit;
    Label5: TLabel;
    txtEmail: TsuiEdit;
    Label6: TLabel;
    txtContato: TsuiEdit;
    Label7: TLabel;
    txtTelefones: TsuiEdit;
    Label8: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure txtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure carregarCampos(strOperacao:string='I');
  end;

var
  FrmClientesEdicao: TFrmClientesEdicao;

implementation

uses uDataModule,uFuncoes;
{$R *.dfm}

procedure TFrmClientesEdicao.btnSalvarClick(Sender: TObject);
var
 strSQL,strOperacao:string;
begin

  inherited;

  if not campoPreenchido(txtNome.Text   , 'O Campo [ NOME ] é de preenchimento obrigatório')   then begin txtNome.SetFocus; exit; end;


  strOperacao:= copy(txtOPERACAO.caption,0,1);

  if (strOperacao='I') then
   begin
    strSQL:='INSERT INTO zf_clientes ('+
            ' nome ,    '+
            ' endereco,    '+
            ' bairro,    '+
            ' cidade, '+
            ' uf, '+
            ' contato, '+
            ' email, '+
            ' telefone '+
            ' ) VALUES ( '+
            aspas( txtNome.Text )+','+
            aspas( txtEndereco.Text ) +','+
            aspas( txtBairro.Text ) +','+
            aspas( txtCidade.text )+','+
            aspas( txtUF.text )+','+
            aspas( txtcontato.text )+','+
            aspas( txtEmail.text )+','+
            aspas( txtTelefones.text )+')';

   end
  else if (strOperacao='A') then
   begin
     strSQL:='UPDATE zf_clientes SET '+
             '  nome      = '+ aspas( txtNome.text )+','+
             '  endereco  = '+ aspas( txtEndereco.Text)+','+
             '  bairro    = '+ aspas( txtBairro.Text)+','+
             '  cidade    = '+ aspas( txtCidade.Text)+','+
             '  uf        = '+ aspas( txtUF.Text)+','+
             '  contato   = '+ aspas( txtcontato.Text)+','+
             '  email     = '+ aspas( txtEmail.Text)+','+
             '  telefones = '+ aspas( txtTelefones.Text)+
             ' WHERE '+
             '  id='+aspas( txtID.Text );
   end
  ;



  executarSQL( strSQL );
  uDatamodule.DataModule1.qrylocal_clientes.Refresh;
  close;


end;

procedure TFrmClientesEdicao.btnExcluirClick(Sender: TObject);
var
 strSQL:string;
begin
  inherited;
  strSQL:='DELETE FROM zf_clientes WHERE id='+trimright(trimleft(txtID.Text));
  executarSQL( strSQL );
  uDatamodule.DataModule1.qrylocal_clientes.Refresh;
  close;


end;

procedure TFrmClientesEdicao.carregarCampos(strOperacao: string);
begin
                                    
 if (strOperacao='I') then txtOPERACAO.caption:='INCLUIR REGISTRO';
 if (strOperacao='A') then txtOPERACAO.caption:='ALTERAR REGISTRO';
 if (strOperacao='E') then txtOPERACAO.caption:='EXCLUIR REGISTRO';


 txtID.Text   :='0';
 txtNome.Text :='';
 txtEndereco.Text:='';
 txtBairro.Text:='';
 txtCidade.Text:='';
 txtUF.Text:='';
 txtContato.Text:='';
 txtEmail.Text:='';
 txtTelefones.Text:='';

 if (strOperacao<>'I') then
  begin
   txtID.Text       :=trimright(trimleft( datamodule1.qrylocal_clientesid.AsString ));
   txtNome.Text     :=trimright(trimleft( datamodule1.qrylocal_clientesnome.AsString));
   txtEndereco.Text :=trimright(trimleft( datamodule1.qrylocal_clientesbairro.AsString));
   txtBairro.Text   :=trimright(trimleft( datamodule1.qrylocal_clientesbairro.AsString));
   txtCidade.Text   :=trimright(trimleft( datamodule1.qrylocal_clientescidade.AsString));
   txtUF.Text       :=trimright(trimleft( datamodule1.qrylocal_clientesuf.AsString));
   txtContato.Text  :=trimright(trimleft( datamodule1.qrylocal_clientesuf.AsString ));
   txtEmail.Text    :=trimright(trimleft( datamodule1.qrylocal_clientesemail.AsString));
   txtTelefones.Text:=trimright(trimleft( datamodule1.qrylocal_clientestelefones.AsString));
  end;

   txtNome.Enabled:=strOperacao<>'E';
   txtEndereco.Enabled:=strOperacao<>'E';
   txtBairro.Enabled:=strOperacao<>'E';
   txtCidade.Enabled:=strOperacao<>'E';
   txtUF.Enabled:=strOperacao<>'E';
   txtContato.Enabled:=strOperacao<>'E';
   txtEmail.Enabled:=strOperacao<>'E';
   txtTelefones.Enabled:=strOperacao<>'E';

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

procedure TFrmClientesEdicao.txtNomeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
if key=#13 then selectnext(Sender as Twincontrol,true,true);
end;

procedure TFrmClientesEdicao.FormActivate(Sender: TObject);
begin
  inherited;
  if btnSalvar.Visible then
   txtNome.SetFocus
  else
   btnExcluir.SetFocus
  ;

end;

end.
