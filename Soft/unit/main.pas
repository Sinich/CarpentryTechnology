unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCnc;

type
  TMainForm = class(TForm)
    procedure FormCreate(Sender: TObject);
   
  end;

const
  fWidth: Integer = 1150;
  fHeight: Integer = 650;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  with MainForm do
  begin
    Width:= fWidth;
    Height:= fHeight;
    Position:= poDesktopCenter; //����� �� ������
    BorderStyle:= bsSingle; //����� ������ ������ �������
  end;
  Cnc:= TCnc.Create;
end;

end.
