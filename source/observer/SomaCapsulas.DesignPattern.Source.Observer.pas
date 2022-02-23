unit SomaCapsulas.DesignPattern.Source.Observer;

interface

uses
  System.Classes, System.SysUtils, Generics.Collections, SomaCapsulas.DesignPattern.Interfaces;

type
  /// <summary>
  ///   Base class for subject behavior in observer pattern.
  /// </summary>
  /// <remarks>
  ///   Abstract class. Uses Observer pattern.
  /// </remarks>
  TSubject<TAction, TData> = class abstract(TInterfacedObject, ISubject<TAction, TData>)
  private
    FObserversList: TList<IObserver>;
    function GetSubjectAction: TAction;
    function GetSubjectData: TData;
  protected
    FSubjectAction: TAction;
    FSubjectData: TData;
    /// <summary>
    ///   Notifies all the observers objects.
    /// </summary>
    procedure NotifyObservers; virtual;
  public
    /// <summary>
    ///   Adds a new observer object to the list.
    /// </summary>
    /// <param name="AObserver">
    ///   Object which can observe this subject.
    /// </param>
    procedure AddObserver(AObserver: IObserver); virtual;
    /// <summary>
    ///   Removes a observer object from the list.
    /// </summary>
    /// <param name="AObserver">
    ///   Object which can observe this subject.
    /// </param>
    procedure RemoveObserver(AObserver: IObserver); virtual;
    /// <summary>
    ///   Action which triggers the NotifyObservers method.
    /// </summary>
    property SubjectAction: TAction read GetSubjectAction;
    /// <summary>
    ///   Data which can be used by observers.
    /// </summary>
    property SubjectData: TData read GetSubjectData;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TSubject<TAction, TData> }

constructor TSubject<TAction, TData>.Create;
begin
  Self.FObserversList := TList<IObserver>.Create;
end;

destructor TSubject<TAction, TData>.Destroy;
begin
  if Assigned(Self.FObserversList) then
    Self.FObserversList.Free;
  inherited;
end;

procedure TSubject<TAction, TData>.AddObserver(AObserver: IObserver);
begin
  Self.FObserversList.Add(AObserver);
end;

procedure TSubject<TAction, TData>.RemoveObserver(AObserver: IObserver);
begin
  Self.FObserversList.Remove(AObserver);
end;

function TSubject<TAction, TData>.GetSubjectAction: TAction;
begin
  Result := Self.FSubjectAction;
end;

function TSubject<TAction, TData>.GetSubjectData: TData;
begin
  Result := Self.FSubjectData;
end;

procedure TSubject<TAction, TData>.NotifyObservers;
var
  LObserver: IObserver;
begin
  for LObserver in Self.FObserversList do
    LObserver.UpdateObserver;
end;

end.
