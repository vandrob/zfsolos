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
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
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

uses uDatamodule,ufuncoes, uFrmClientesObrasEdicao;
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

end.
