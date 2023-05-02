program Agenda;

uses
  Vcl.Forms,
  Agenda.View.Principal in 'View\Agenda.View.Principal.pas' {FrmPrincipal},
  Agenda.View.Configuracoes in 'View\Agenda.View.Configuracoes.pas' {FrmParametros},
  Agenda.Model.Interfaces.Conexao in 'Model\Conexao\Interfaces\Agenda.Model.Interfaces.Conexao.pas',
  Agenda.Model.Conexao.Parametros in 'Model\Conexao\Agenda.Model.Conexao.Parametros.pas',
  Agenda.Model.Conexao.Connection in 'Model\Conexao\Agenda.Model.Conexao.Connection.pas',
  Agenda.Model.Services.Interfaces in 'Model\Services\Interfaces\Agenda.Model.Services.Interfaces.pas',
  Agenda.Model.Services in 'Model\Services\Agenda.Model.Services.pas',
  Agenda.Model.Conexao.Factory in 'Model\Conexao\Agenda.Model.Conexao.Factory.pas',
  Agenda.Model.Entidades.Agenda in 'Model\Entidades\Agenda.Model.Entidades.Agenda.pas',
  Agenda.Controller.Dto.Interfaces in 'Controller\Dto\Interfaces\Agenda.Controller.Dto.Interfaces.pas',
  Agenda.Controller.Dto.Agenda in 'Controller\Dto\Agenda.Controller.Dto.Agenda.pas',
  Agenda.Controller.Entidades.Interfaces in 'Controller\Entidades\Interfaces\Agenda.Controller.Entidades.Interfaces.pas',
  Agenda.Controller.Entidades in 'Controller\Entidades\Agenda.Controller.Entidades.pas',
  Agenda.Controller.Utilitarios.Interfaces in 'Controller\Utilitarios\Interfaces\Agenda.Controller.Utilitarios.Interfaces.pas',
  Agenda.Controller.Utilitarios in 'Controller\Utilitarios\Agenda.Controller.Utilitarios.pas',
  Agenda.Controller.Rtti.Utilitarios in 'Controller\Utilitarios\Rtti\Agenda.Controller.Rtti.Utilitarios.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
