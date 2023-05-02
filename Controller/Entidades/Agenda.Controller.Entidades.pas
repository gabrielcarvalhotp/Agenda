unit Agenda.Controller.Entidades;

interface

uses
  Agenda.Controller.Dto.Interfaces,
  Agenda.Controller.Entidades.Interfaces,
  Agenda.Model.Interfaces.Conexao;

type
  TControllerEntidades = class(TInterfacedObject, iControllerEntidades)
  private
    { private }
    FAgenda: iControllerDtoAgenda;
    FParametros: iModelConexaoParametros;
  public
    { public }
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerEntidades;
    function Agenda : iControllerDtoAgenda;
    function Paramentros: iModelConexaoParametros;
  end;

implementation

uses
  Agenda.Controller.Dto.Agenda, 
  Agenda.Model.Conexao.Parametros;

{ TControllerEntidades }

function TControllerEntidades.Agenda: iControllerDtoAgenda;
begin
  if not Assigned(FAgenda) then
    FAgenda := TControllerDtoAgenda.New;
  result := FAgenda;
end;

constructor TControllerEntidades.Create;
begin

end;

destructor TControllerEntidades.Destroy;
begin
  inherited;

end;

class function TControllerEntidades.New: iControllerEntidades;
begin
  result := self.Create;
end;

function TControllerEntidades.Paramentros: iModelConexaoParametros;
begin
  if not Assigned(FParametros) then
    FParametros := TModelConexaoParametros.New;
  result := FParametros;
end;

end.
