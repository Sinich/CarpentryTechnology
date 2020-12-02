unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  uCnc;

type
  TMainForm = class(TForm)
    procedure FormCreate(Sender: TObject);
   
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  MainForm.Position:= poDesktopCenter; //форма по центру
  MainForm.BorderStyle:= bsSingle;//форме нельзя менять размеры
end;

end.
