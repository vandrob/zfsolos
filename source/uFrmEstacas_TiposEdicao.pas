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
    Label2: TLabel;
    txtF1: TsuiNumberEdit;
    Label3: TLabel;
    txtF2: TsuiNumberEdit;
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
 txtF1.Value  :=0;
 txtF2.Value  :=0;

 if (strOperacao<>'I') then
  begin
   txtID.Text       :=trimright(trimleft( datamodule1.qryLocal_Estacas_Tiposid.AsString ));
   txtNome.Text     :=trimright(trimleft( datamodule1.qryLocal_Estacas_Tiposnome.AsString));
   txtF1.Value      :=StrToFloat( datamodule1.qryLocal_Estacas_Tiposf1.AsString);
   txtF2.Value      :=StrToFloat( datamodule1.qryLocal_Estacas_Tiposf2.AsString);

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
      myMSG('N�o pode ser editado ou Exclu�do'#13+#10+'pois ele � utilizado pelo sistema'+#13+#10+'em lan�amentos onde o usu�rio n�o'+#13+#10+' efetua preenchimentos corretamente','ATEN��O',2);
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
 _id,_Nome,_F1,_F2:string;

begin

  inherited;

  if not campoPreenchido(txtNome.Text   , 'O Campo [ NOME ] � de preenchimento obrigat�rio')   then begin txtNome.SetFocus; exit; end;


  strOperacao:= copy(txtOPERACAO.caption,0,1);

  _id  :=  aspas( txtID.Text );
  _Nome:=  aspas( txtNome.text );
  _F1  :=  aspas( VirgulaParaPonto( txtF1.Text ) )   ;
  _F2  :=  aspas( VirgulaParaPonto( txtF2.Text ) )   ;



  if (strOperacao='I') then
   begin
    strSQL:='INSERT INTO zf_estacas_tipos ('+
            ' nome,f1,f2     '+
            ' ) VALUES ( '+
            _id   +',' +
            _Nome +','+
            _F1   +','+
            _F2   +')';

   end
  else if (strOperacao='A') then
   begin
     strSQL:='UPDATE zf_estacas_tipos SET '+
             '  nome       = '+ _Nome+','+
             '  f1         = '+ _F1  +','+
             '  f2         = '+ _F2  +   
             ' WHERE '+
             '  id = '+ _id;
   end
  ;



  executarSQL( strSQL );
  uDatamodule.DataModule1.qryLocal_Estacas_Tipos.Refresh;
  close;



end;

end.
