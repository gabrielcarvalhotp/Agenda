unit Agenda.Controller.Entidades.Interfaces;

interface

uses
  Agenda.Controller.Dto.Interfaces, Agenda.Model.Interfaces.Conexao;
  
type
  iControllerEntidades = interface
    ['{68945125-6D62-428B-B724-1A3FF14375D2}']
    function Agenda : iControllerDtoAgenda;
    function Paramentros : iModelConexaoParametros;
  end;

implementation

end.
