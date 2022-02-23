program SomaCapsulas.DesignPattern;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  SomaCapsulas.DesignPattern.Types in 'SomaCapsulas.DesignPattern.Types.pas',
  SomaCapsulas.DesignPattern.Interfaces in 'SomaCapsulas.DesignPattern.Interfaces.pas',
  SomaCapsulas.DesignPattern.Source.Observer in 'source\observer\SomaCapsulas.DesignPattern.Source.Observer.pas',
  SomaCapsulas.DesignPattern.Source.Iterator in 'source\iterator\SomaCapsulas.DesignPattern.Source.Iterator.pas',
  SomaCapsulas.DesignPattern.Source.Factory.Iterator in 'source\iterator\factory\SomaCapsulas.DesignPattern.Source.Factory.Iterator.pas',
  SomaCapsulas.DesignPattern.Message in 'SomaCapsulas.DesignPattern.Message.pas';

var
  LReadLnToWait: string;
begin
  try
    Writeln('SOMA Cápsulas - Design Pattern');
    Writeln(EmptyStr);
    Writeln('              .--._.--.               ');
    Writeln('             ( O     O )              ');
    Writeln('             /   . .   \              ');
    Writeln('            .`._______.''.            ');
    Writeln('           /(           )\            ');
    Writeln('         _/  \  \   /  /  \_          ');
    Writeln('      .~   `  \  \ /  /  ''   ~.      ');
    Writeln('     {    -.   \  V  /   .-    }      ');
    Writeln('   _ _`.    \  |  |  |  /    .''_ _   ');
    Writeln('   >_       _} |  |  | {_       _<    ');
    Writeln('    /. - ~ ,_-''  .^.  `-_, ~ - .\    ');
    Writeln('            ''-''|/   \|`-`           ');
    Read(LReadLnToWait);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
