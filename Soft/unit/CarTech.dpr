program CarTech;

uses
  Forms,
  main in 'main.pas' {MainForm},
  uCnc in 'uCnc.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
