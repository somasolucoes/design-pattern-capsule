unit SomaCapsulas.DesignPattern.Interfaces;

interface

type
  IObserver = interface
  ['{7310EB7E-ABD1-4DC6-8D5C-C059D0CFA3EA}']
    procedure UpdateObserver;
  end;

  ISubject<TAction, TData> = interface
  ['{A3BE2F1C-BA19-4EA4-B3F7-FAB151470235}']
    procedure AddObserver(AObserver: IObserver);
    procedure RemoveObserver(AObserver: IObserver);
    procedure NotifyObservers;
    function GetSubjectAction: TAction;
    property SubjectAction: TAction read GetSubjectAction;
    function GetSubjectData: TData;
    property SubjectData: TData read GetSubjectData;
  end;

  IIterator<TReturn> = interface
  ['{E45FA961-6F08-4120-A467-EA4ADFF4F417}']
    function ToArray: TArray<TReturn>;
    function GetCount: Integer;
    property Count: Integer read GetCount;
    function HasNext: Boolean;
    function GetNext: TReturn;
    procedure Reset;
  end;

implementation end.
