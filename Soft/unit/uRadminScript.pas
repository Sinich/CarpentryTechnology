(*
�������� ��� ����� � ����� ������������� ��������� ��� ��������� ����������
�����������, ��� Radmin.
��� ��������� ������ ������������ ��� ���������� �������� ��������, �����
������ ����������� �������� ��������, ���������� � ����. ��-�� ������, ��
������� � ������� ������ ��������� ����� ����������� ��������� ����������� ���
������������� ������.
������� ������ ���������� ��� �������� ����������� � RadminServer ��������
������.RadminView � ����-�� �� ��������� ��������� ������, � ��� ������, ���
������ ��� ��� ����������� � ���������� � ������� Radmin'a ����������
������� ������. ���� ������� �������, ��������� ������� �� VBS.

set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.Run "radmin.exe /connect:192.168.1.2:4899 /updates:10"
WScript.Sleep 4000
WshShell.AppActivate "������� ������������ Radmin: 192.168.1.2"
WScript.Sleep 500
WshShell.SendKeys "test"
WshShell.SendKeys "{TAB}"
WshShell.SendKeys "test"
WshShell.SendKeys "{ENTER}"

����� ���������� ����� � ������������ � ������ �����������, � ����� ���������
��� � ���� script.vbs � ��������� � ����� �C:\Program Files (x86)\Radmin
Viewer 3\script.vbs�. � ����� � ������� ���������.  
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
