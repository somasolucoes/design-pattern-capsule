unit SomaCapsulas.DesignPattern.Source.Factory.Iterator;

interface

uses
  System.Classes, System.SysUtils, SomaCapsulas.DesignPattern.Types, SomaCapsulas.DesignPattern.Interfaces,
  Generics.Collections;

type
  TIteratorFactory = class sealed
  public
    class function Assemble<TCollection>(ACollection: TList<TCollection>; AIteratorType: TIteratorType): IIterator<TCollection>; static;
  end;

implementation

uses
  SomaCapsulas.DesignPattern.Source.Iterator, SomaCapsulas.DesignPattern.Exception,
  SomaCapsulas.DesignPattern.Message;

{ TIteratorFactory }

class function TIteratorFactory.Assemble<TCollection>(
  ACollection: TList<TCollection>;
  AIteratorType: TIteratorType): IIterator<TCollection>;
begin
  case AIteratorType of
    itASC:
      Result := TAscListIterator<TCollection>.Create(ACollection);
    itDESC:
      Result := TDescListIterator<TCollection>.Create(ACollection);
    else
      raise ESomaCapsulasDesignPatternFactoryMethod.Create(E_SSDP_0001);
  end;
end;

end.
