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
  uFrmClientesEdicao in 'uFrmClientesEdicao.pas' {FrmClientesEdicao},
  uFrmClientesObrasEdicao in 'uFrmClientesObrasEdicao.pas' {FrmClientesObrasEdicao},
  uFrmClientesObras in 'uFrmClientesObras.pas' {FrmClientesObras},
  uFrmConexao in 'uFrmConexao.pas' {FrmConexao},
  uFrmEstacas_Tipos in 'uFrmEstacas_Tipos.pas' {FrmEstacas_Tipos},
  uFrmEstacas_TiposEdicao in 'uFrmEstacas_TiposEdicao.pas' {FrmEstacas_TiposEdicao},
  uFrmSolos in 'uFrmSolos.pas' {FrmSolos},
  uFrmSolosEdicao in 'uFrmSolosEdicao.pas' {FrmSolosEdicao},
  uFrmDiametros in 'uFrmDiametros.pas' {FrmDiametros},
  uFrmDiametrosEdicao in 'uFrmDiametrosEdicao.pas' {FrmDiametrosEdicao},
  uFrmMetodos in 'uFrmMetodos.pas' {FrmMetodos},
  uFrmMetodosEdicao in 'uFrmMetodosEdicao.pas' {FrmMetodosEdicao},
  uFrmEstacasSolos in 'uFrmEstacasSolos.pas' {FrmEstacasSolos},
  uFrmEstacasSolosEdicao in 'uFrmEstacasSolosEdicao.pas' {FrmEstacasSolosEdicao},
  uFrmObrasFuros in 'uFrmObrasFuros.pas' {FrmObrasFuros},
  uFrmObrasFurosEdicao in 'uFrmObrasFurosEdicao.pas' {FrmObrasFurosEdicao};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFrmConexao, FrmConexao);
  Application.CreateForm(TFrmObrasFuros, FrmObrasFuros);
  Application.CreateForm(TFrmObrasFurosEdicao, FrmObrasFurosEdicao);
  Application.Run;
end.
