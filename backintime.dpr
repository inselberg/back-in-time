program backintime;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  dates in '..\..\!units\dates.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'BackInTime';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
