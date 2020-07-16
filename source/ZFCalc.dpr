program ZFCalc;

uses
  Forms,
  uFrmAbertura in 'uFrmAbertura.pas' {FrmAbertura},
  uFuncoes in 'uFuncoes.pas',
  uDatamodule in 'uDatamodule.pas' {DataModule1: TDataModule},
  uFrmPadrao in 'uFrmPadrao.pas' {FrmPadrao},
  uFrmUsuarios in 'uFrmUsuarios.pas' {FrmUsuarios},
  uFrmPadraoEdicao in 'uFrmPadraoEdicao.pas' {FrmPadraoEdicao},
  uFrmUsuariosEdicao in 'uFrmUsuariosEdicao.pas' {FrmUsuariosEdicao},
  uFrmClientes in 'uFrmClientes.pas' {FrmClientes},
  uFrmClientesEdicao in 'uFrmClientesEdicao.pas' {FrmClientesEdicao};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmAbertura, FrmAbertura);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
