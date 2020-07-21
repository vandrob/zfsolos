unit uFrmEstacas_TiposEdicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmPadraoEdicao, SUIButton, SUIImagePanel, ExtCtrls, SUIForm,
  StdCtrls, SUIEdit;

type
  TFrmEstacas_TiposEdicao = class(TFrmPadraoEdicao)
    txtOPERACAO: TLabel;
    txtID: TsuiEdit;
    txtNome: TsuiEdit;
    Label1: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
        procedure carregarCampos(strOperacao:string='I');

  end;

var
  FrmEstacas_TiposEdicao: TFrmEstacas_TiposEdicao;

implementation

uses uDatamodule,uFuncoes;

{$R *.dfm}

{ TFrmEstacas_TiposEdicao }

procedure TFrmEstacas_TiposEdicao.carregarCampos(strOperacao: string);
begin
 if (strOperacao='I') then txtOPERACAO.caption:='INCLUIR REGISTRO';
 if (strOperacao='A') then txtOPERACAO.caption:='ALTERAR REGISTRO';
 if (strOperacao='E') then txtOPERACAO.caption:='EXCLUIR REGISTRO';


 txtID.Text   :='0';
 txtNome.Text :='';

 if (strOperacao<>'I') then
  begin
   txtID.Text       :=trimright(trimleft( datamodule1.qryLocal_Estacas_Tiposid.AsString ));
   txtNome.Text     :=trimright(trimleft( datamodule1.qryLocal_Estacas_Tiposnome.AsString));
  end;

   txtNome.Enabled:=strOperacao<>'E';

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

procedure TFrmEstacas_TiposEdicao.FormActivate(Sender: TObject);
begin
  inherited;
  if btnSalvar.Visible then
   txtNome.SetFocus
  else
   btnExcluir.SetFocus
  ;
  if (txtNome.Text='NAO DEFINIDO') then begin
      myMSG('Não pode ser editado ou Excluído'#13+#10+'pois ele é utilizado pelo sistema'+#13+#10+'em lançamentos onde o usuário não'+#13+#10+' efetua preenchimentos corretamente','ATENÇÃO',2);
      btnsalvar.Visible:=false;
      btnexcluir.Visible:=false;
  end;
end;

procedure TFrmEstacas_TiposEdicao.btnExcluirClick(Sender: TObject);
var
 strSQL:string;
begin
  inherited;
  strSQL:='DELETE FROM zf_estacas_tipos WHERE id='+trimright(trimleft(txtID.Text));
  executarSQL( strSQL );
  uDatamodule.DataModule1.qryLocal_Estacas_Tipos.Refresh;
  close;


end;

procedure TFrmEstacas_TiposEdicao.btnSalvarClick(Sender: TObject);
var
 strSQL,strOperacao:string;
begin

  inherited;

  if not campoPreenchido(txtNome.Text   , 'O Campo [ NOME ] é de preenchimento obrigatório')   then begin txtNome.SetFocus; exit; end;


  strOperacao:= copy(txtOPERACAO.caption,0,1);

  if (strOperacao='I') then
   begin
    strSQL:='INSERT INTO zf_estacas_tipos ('+
            ' nome     '+
            ' ) VALUES ( '+
            aspas( txtNome.text )+')';

   end
  else if (strOperacao='A') then
   begin
     strSQL:='UPDATE zf_estacas_tipos SET '+
             '  nome      = '+ aspas( txtNome.text )+
             ' WHERE '+
             '  id='+aspas( txtID.Text );
   end
  ;



  executarSQL( strSQL );
  uDatamodule.DataModule1.qryLocal_Estacas_Tipos.Refresh;
  close;



end;

end.
