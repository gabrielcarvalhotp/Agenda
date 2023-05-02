unit Agenda.Controller.Utilitarios.Interfaces;

interface

uses
  Vcl.Forms, Vcl.StdCtrls;

type
  iControllerUtilitariosFormularios = interface
    ['{3A898D01-9C2C-4441-9397-EEDFA079F047}']
   function PesquisaEmpresa(aValue : TComboBox): iControllerUtilitariosFormularios;
   function PesquisaSetor(aValue: TComboBox) : iControllerUtilitariosFormularios;
  end;

implementation

end.
