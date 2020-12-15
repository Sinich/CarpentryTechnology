program CarTech;

uses
  Forms,
  main in 'main.pas' {MainForm},
  uCnc in 'uCnc.pas',
  uZastavka in 'uZastavka.pas' {frmZastavka},
  uRadminScript in 'uRadminScript.pas';

{$R *.res}

begin
  Application.Initialize;
  frmZastavka := TfrmZastavka.Create(Application);
  frmZastavka.Show;
  frmZastavka.Update;
  while frmZastavka.Timer1.Enabled do
    Application.ProcessMessages;
  Application.CreateForm(TMainForm, MainForm);
  frmZastavka.Hide;
  frmZastavka.Free;
  Application.Run;
end.
