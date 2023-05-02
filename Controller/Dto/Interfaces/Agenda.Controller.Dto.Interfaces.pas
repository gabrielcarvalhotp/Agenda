unit Agenda.Controller.Dto.Interfaces;

interface

uses
  Agenda.Model.Services.Interfaces, 
  Agenda.Model.Entidades.Agenda, Vcl.Forms;
  
type
  iControllerDtoAgenda = interface
    ['{B7964F41-37B0-4C3A-B8F1-21595276466C}']
    function Cod_Agenda(aValue: string): iControllerDtoAgenda; overload;
    function Empresa(aValue: string): iControllerDtoAgenda; overload;
    function Setor(aValue: string): iControllerDtoAgenda; overload;
    function Nome(aValue: string): iControllerDtoAgenda; overload;
    function Funcao(aValue: string): iControllerDtoAgenda; overload;
    function Ramal(aValue: string): iControllerDtoAgenda; overload;
    function Celular_Empresa(aValue: string): iControllerDtoAgenda; overload;
    function Celular_Pessoal(aValue: string): iControllerDtoAgenda; overload;
    function Email1(aValue: string): iControllerDtoAgenda; overload;
    function Email2(aValue: string): iControllerDtoAgenda; overload;
    function Cod_Agenda: integer; overload;
    function Empresa: string; overload;
    function Setor: string; overload;
    function Nome: string; overload;
    function Funcao: string; overload;
    function Ramal: string; overload;
    function Celular_Empresa: string; overload;
    function Celular_Pessoal: string; overload;
    function Email1: string; overload;
    function Email2: string; overload;
    function Build : iService<TTB_Agenda>;
    function PreencherEntidade(Sender : TForm): iControllerDtoAgenda;  
    function PesquisaPersonalizada(aEmpresa, aSetor, aNome: string) : iControllerDtoAgenda;
    end;

implementation

end.
