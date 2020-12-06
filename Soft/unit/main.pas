unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCnc, Menus;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
   
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
    Position:= poDesktopCenter; //форма по центру
    BorderStyle:= bsSingle; //форме нельзя менять размеры
  end;
  Cnc:= TCnc.Create;
end;

procedure TMainForm.N1Click(Sender: TObject);
begin
  ShowMessage('Добавление объекта');
end;

end.
