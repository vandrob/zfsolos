unit uFrmMetodosEdicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmPadraoEdicao, SUIButton, SUIImagePanel, ExtCtrls, SUIForm,
  StdCtrls, SUIEdit;

type
  TFrmMetodosEdicao = class(TFrmPadraoEdicao)
    txtID: TsuiEdit;
    txtOPERACAO: TLabel;
    txtNome: TsuiEdit;
    txtDescricao: TsuiEdit;
    Label2: TLabel;
    Label1: TLabel;
    procedure txtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure txtDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure carregarCampos(strOperacao: string);
  end;

var
  FrmMetodosEdicao: TFrmMetodosEdicao;

implementation

{$R *.dfm}
uses uDatamodule,uFuncoes;
{ TFrmMetodosEdicao }

procedure TFrmMetodosEdicao.carregarCampos(strOperacao: string);
begin
                                  
 if (strOperacao='I') then txtOPERACAO.caption:='INCLUIR REGISTRO';
 if (strOperacao='A') then txtOPERACAO.caption:='ALTERAR REGISTRO';
 if (strOperacao='E') then txtOPERACAO.caption:='EXCLUIR REGISTRO';


 txtID.Text   :='0';
 txtNome.Text :='';
 txtDescricao.Text:='';

 if (strOperacao<>'I') then
  begin
   txtID.Text        :=trimright(trimleft( datamodule1.qryLocal_Metodosid.AsString ));
   txtNome.Text      :=trimright(trimleft( datamodule1.qryLocal_Metodosnome.AsString));
   txtDescricao.Text :=trimright(trimleft( datamodule1.qryLocal_Metodosdescricao.AsString));
  end;

   txtNome.Enabled:=strOperacao<>'E';
   txtDescricao.Enabled:=strOperacao<>'E';

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

procedure TFrmMetodosEdicao.txtNomeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if key=#13 then selectnext(Sender as Twincontrol,true,true);
end;

procedure TFrmMetodosEdicao.txtDescricaoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if key=#13 then selectnext(Sender as Twincontrol,true,true);
end;

procedure TFrmMetodosEdicao.FormActivate(Sender: TObject);
begin
  inherited;
   if btnSalvar.Visible then
   txtNome.SetFocus
  else
   btnExcluir.SetFocus
  ;
end;

procedure TFrmMetodosEdicao.btnSalvarClick(Sender: TObject);
var
 strSQL,strOperacao:string;
begin

  inherited;

  if not campoPreenchido(txtNome.Text   , 'O Campo [ NOME DO MÉTODO ] é de preenchimento obrigatório')   then begin txtNome.SetFocus; exit; end;


  strOperacao:= copy(txtOPERACAO.caption,0,1);

  if (strOperacao='I') then
   begin
    strSQL:='INSERT INTO zf_metodos ('+
            ' nome ,    '+
            ' descricao '+
            ' ) VALUES ( '+
            aspas( txtNome.Text )+','+
            aspas( txtDescricao.text )+')';

   end
  else if (strOperacao='A') then
   begin
     strSQL:='UPDATE zf_metodos SET '+
             '  nome      = '+ aspas( txtNome.text )+','+
             '  descricao  = '+ aspas( txtDescricao.Text)+
             ' WHERE '+
             '  id='+aspas( txtID.Text );
   end
  ;



  executarSQL( strSQL );
  uDatamodule.DataModule1.qryLocal_Metodos.Refresh;
  close;


end;

procedure TFrmMetodosEdicao.btnExcluirClick(Sender: TObject);
var
 strSQL:string;
begin
  inherited;
  strSQL:='DELETE FROM zf_metodos WHERE id='+trimright(trimleft(txtID.Text));
  executarSQL( strSQL );
  uDatamodule.DataModule1.qryLocal_Metodos.Refresh;
  close;

end;

end.
