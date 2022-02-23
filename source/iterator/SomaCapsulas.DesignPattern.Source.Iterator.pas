unit SomaCapsulas.DesignPattern.Source.Iterator;

interface

uses
  System.Classes, System.SysUtils, System.Generics.Collections, SomaCapsulas.DesignPattern.Interfaces;

type
  /// <summary>
  ///   Base class for all iterators.
  /// </summary>
  /// <remarks>
  ///   Abstract class. Used Iterator pattern.
  /// </remarks>
  TIterator<TCollection, TReturn> =
    class abstract(TInterfacedObject, IIterator<TReturn>)
  protected
    /// <summary>
    ///   Collection used by the iterator.
    /// </summary>
    Collection: TCollection;
    /// <summary>
    ///   Current position of the colletion.
    /// </summary>
    CurrentIndex: Integer;
    /// <summary>
    ///   Corverts the collection to an array.
    /// </summary>
    /// <remarks>
    ///   Not implemented.
    /// </remarks>
    /// <returns>
    ///   Returns an array with all collection itens, an empty array otherwise.
    /// </returns>
    function ToArray: TArray<TReturn>; virtual; abstract;
    function GetCount: Integer; virtual; abstract;
  public
    /// <summary>
    ///   Element count in collection.
    /// </summary>
    property Count: Integer read GetCount;
    /// <summary>
    ///   Checks if has a next item to iterate.
    /// </summary>
    /// <remarks>
    ///   Not implemented.
    /// </remarks>
    /// <returns>
    ///   Returns True if do, False otherwise.
    /// </returns>
    function HasNext: Boolean; virtual; abstract;
    /// <summary>
    ///   Gets the next item from collection.
    /// </summary>
    /// <remarks>
    ///   Not implemented.
    /// </remarks>
    /// <returns>
    ///   Returns an item from collection, nil otherwise.
    /// </returns>
    function GetNext: TReturn; virtual; abstract;
    constructor Create(ACollection: TCollection); virtual;
  end;

  /// <summary>
  ///   Base class for all iterators which uses a TList collection.
  /// </summary>
  /// <remarks>
  ///   Abstract class. Used Iterator pattern.
  /// </remarks>
  TListIterator<TReturn> =
    class abstract(TIterator<TList<TReturn>, TReturn>)
  protected
    function GetCount: Integer; override;
  public
    /// <summary>
    ///   Corverts the collection to an array.
    /// </summary>
    /// <returns>
    ///   Returns an array with all collection itens, an empty array otherwise.
    /// </returns>
    function ToArray: TArray<TReturn>; override;
    destructor Destroy; override;
  end;

  /// <summary>
  ///   Base class for all iterators that use a TList collection and ascending
  ///   order iteration.
  /// </summary>
  /// <remarks>
  ///   Abstract class. Used Iterator pattern.
  /// </remarks>
  TAscListIterator<TReturn> = class(TListIterator<TReturn>)
  public
    /// <summary>
    ///   Checks if has a next item to iterate.
    /// </summary>
    /// <returns>
    ///   Returns True if do, False otherwise.
    /// </returns>
    function HasNext: Boolean; override;
    /// <summary>
    ///   Gets the next item from collection.
    /// </summary>
    /// <returns>
    ///   Returns an item from collection, nil otherwise.
    /// </returns>
    function GetNext: TReturn; override;
  end;

  /// <summary>
  ///   Base class for all iterators that use a TList collection and descending
  ///   order iteration.
  /// </summary>
  /// <remarks>
  ///   Abstract class. Used Iterator pattern.
  /// </remarks>
  TDescListIterator<TReturn> = class(TListIterator<TReturn>)
  public
    /// <summary>
    ///   Checks if has a next item to iterate.
    /// </summary>
    /// <returns>
    ///   Returns True if do, False otherwise.
    /// </returns>
    function HasNext: Boolean; override;
    /// <summary>
    ///   Gets the next item from collection.
    /// </summary>
    /// <returns>
    ///   Returns an item from collection, nil otherwise.
    /// </returns>
    function GetNext: TReturn; override;
    constructor Create(ACollection: TList<TReturn>); override;
  end;

implementation

uses
  Math, System.SyncObjs;

{ TIterator<TCollection, TReturn> }

constructor TIterator<TCollection, TReturn>.Create(ACollection: TCollection);
begin
  Self.Collection := ACollection;
  Self.CurrentIndex := ZeroValue;
end;

{ TListIterator<TReturn> }

destructor TListIterator<TReturn>.Destroy;
begin
  if Assigned(Self.Collection) then
    Self.Collection.Free;
  inherited;
end;

function TListIterator<TReturn>.GetCount: Integer;
begin
  Result := Self.Collection.Count;
end;

function TListIterator<TReturn>.ToArray: TArray<TReturn>;
begin
  Result := Self.Collection.ToArray;
end;

{ TAscListIterator<TReturn> }

function TAscListIterator<TReturn>.GetNext: TReturn;
begin
  Result := Self.Collection.Items[Self.CurrentIndex];
  TInterlocked.Increment(Self.CurrentIndex);
end;

function TAscListIterator<TReturn>.HasNext: Boolean;
begin
  Result := (Assigned(Self.Collection)) and (Self.CurrentIndex < Self.Count);
end;

{ TDescListIterator<TReturn> }

constructor TDescListIterator<TReturn>.Create(
  ACollection: TList<TReturn>);
begin
  inherited;
  Self.CurrentIndex := Pred(Self.Count);
end;

function TDescListIterator<TReturn>.GetNext: TReturn;
begin
  Result := Self.Collection.Items[Self.CurrentIndex];
  TInterlocked.Decrement(Self.CurrentIndex);
end;

function TDescListIterator<TReturn>.HasNext: Boolean;
begin
  Result := (Assigned(Self.Collection)) and (Self.CurrentIndex >= ZeroValue);
end;

end.
