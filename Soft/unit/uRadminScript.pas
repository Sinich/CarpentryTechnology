(*
Наверное все знают о такои замечательнои программе для удалённого управления
компьютером, как Radmin.
Эту программу удобно использовать для управления домашним сервером, проще
говоря компьютером лишённым монитора, клавиатуры и мыши. Всё-бы хорошо, но
начиная с третьеи версии программы стало невозможным настроить подключение без
использования пароля.
Поэтому теперь приходится при создании подключении в RadminServer задавать
пароль.RadminView к тому-же не позволяет сохранять пароли, а это значит, что
каждыи раз при подключении к компьютеру с помощью Radmin'a приходится
вводить пароль. Было наидено решение, написание скрипта на VBS.

set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.Run "radmin.exe /connect:192.168.1.2:4899 /updates:10"
WScript.Sleep 4000
WshShell.AppActivate "Система безопасности Radmin: 192.168.1.2"
WScript.Sleep 500
WshShell.SendKeys "test"
WshShell.SendKeys "{TAB}"
WshShell.SendKeys "test"
WshShell.SendKeys "{ENTER}"

Нужно подправить текст в соответствии в нашими настроиками, а затем сохранить
это в фаил script.vbs и поместить в папку «C:\Program Files (x86)\Radmin
Viewer 3\script.vbs». И юзать с большим удобством.  
*)

unit uRadminScript;

interface

type
  TRadmin = class(TObject)

  public
    constructor Create(IP, Port, Login, Password: string);
    destructor Destroy; override;
  end;

implementation

constructor TRadmin.Create(IP, Port, Login, Password: string);
begin
end;

destructor TRadmin.Destroy;
begin
end;

end.
