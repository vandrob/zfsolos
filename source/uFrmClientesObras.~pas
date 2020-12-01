unit uFrmClientesObras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmPadrao, SUIButton, SUIDBCtrls, Grids, DBGrids,
  SUIImagePanel, ExtCtrls, SUIForm, StdCtrls, Mask, DBCtrls, SUIGroupBox;

type
  TFrmClientesObras = class(TFrmPadrao)
    suiGroupBox1: TsuiGroupBox;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label2: TLabel;
    suiDBEdit1: TsuiDBEdit;
    suiDBEdit2: TsuiDBEdit;
    suiDBEdit3: TsuiDBEdit;
    suiDBEdit4: TsuiDBEdit;
    btFuros: TsuiButton;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btFurosClick(Sender: TObject);
  private
    { Private declarations }
    procedure chamarTelaEdicao(strOpcao: string);
  public
    { Public declarations }
    procedure abrirObrasCliente(idCliente:integer);
  end;

var
  FrmClientesObras: TFrmClientesObras;

implementation

uses uDatamodule,ufuncoes, uFrmClientesObrasEdicao, uFrmObrasFuros;
{$R *.dfm}

procedure TFrmClientesObras.btnIncluirClick(Sender: TObject);
begin
  inherited;
    chamarTelaEdicao('I');
end;

procedure TFrmClientesObras.btnAlterarClick(Sender: TObject);
begin
  inherited;
    chamarTelaEdicao('A');
end;

procedure TFrmClientesObras.btnExcluirClick(Sender: TObject);
begin
  inherited;
     chamarTelaEdicao('E');
end;

procedure TFrmClientesObras.abrirObrasCliente(idCliente:integer);
begin
   with uDataModule.DataModule1.qryLocal_Obras do begin
    disablecontrols;
    close;
    ParamByName('id').Value:=idCliente;
    open;
    enablecontrols;
   end;
end;

procedure TFrmClientesObras.chamarTelaEdicao(strOpcao: string);
begin
//chamar a tela de edição como a opção (I)ncluir, (A)lterar ou (E)xcluir
if strOpcao<>'I' then begin
 if datamodule1.qryLocal_Obras.RecordCount = 0 then
  begin
       myMSG( 'Tabela Vazia! ','Opção não disponível',2);
       exit;
  end
end;

if not assigned(FrmClientesObrasEdicao) then
                 FrmClientesObrasEdicao:=TFrmClientesObrasEdicao.Create(Application);
                 uFrmClientesObrasEdicao.FrmClientesObrasEdicao.carregarCampos(strOpcao);
                 FrmClientesObrasEdicao.ShowModal;
                 FreeAndNil(FrmClientesObrasEdicao);
end;

procedure TFrmClientesObras.btFurosClick(Sender: TObject);
var
 idObra:string;
begin
  inherited;
  if not assigned(FrmObrasFuros) Then FrmObrasfuros.create(application);
  if udatamodule.DataModule1.qryLocal_Obras.eof then begin
     showmessage('insira a obra e depois clique para seleciona-la');
     exit;
  end;
  idObra:=uDatamodule.DataModule1.qryLocal_Obrasid.AsString;
  FrmObrasFuros.txtID.Caption:= idObra;
  FrmObrasFuros.txtObra.Caption:=uDatamodule.DataModule1.qryLocal_Obrasnome.AsString;
  FrmObrasFuros.txtCliente.Caption:=uDataModule.DataModule1.qrylocal_clientesnome.AsString;

  Datamodule1.QryLocal_ObrasFuros.Close;
  Datamodule1.QryLocal_ObrasFuros.ParamByName('parID').Value:=idObra;
  Datamodule1.QryLocal_ObrasFuros.Open;


  frmObrasFuros.showmodal;
end;

end.
