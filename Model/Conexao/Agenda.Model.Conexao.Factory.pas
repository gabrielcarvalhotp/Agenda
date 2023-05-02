unit Agenda.Model.Conexao.Factory;

interface

uses
  Agenda.Model.Interfaces.Conexao;

type
  TModelConexaoFactory = class(TInterfacedObject, iModelConexaoFactory)
  private
    { private }
    FConnection : iModelConexaoConnection;
    FParametros : iModelConexaoParametros;
  public
    { public }
    constructor Create;
    destructor Destroy; override;
    class function New: iModelConexaoFactory;
    function Connection : iModelConexaoConnection;
    function Parametros : iModelConexaoParametros;
  end;

implementation

uses
  Agenda.Model.Conexao.Parametros,
  Agenda.Model.Conexao.Connection;

{ TModelConexaoFactory }

function TModelConexaoFactory.Connection: iModelConexaoConnection;
begin
  result := FConnection;
end;

constructor TModelConexaoFactory.Create;
begin
  FParametros := TModelConexaoParametros.New;
  FConnection := TModelConexaoConnection.New(FParametros);
end;

destructor TModelConexaoFactory.Destroy;
begin
  inherited;

end;

class function TModelConexaoFactory.New: iModelConexaoFactory;
begin
  result := self.Create;
end;

function TModelConexaoFactory.Parametros: iModelConexaoParametros;
begin
  result := FParametros;
end;

end.
