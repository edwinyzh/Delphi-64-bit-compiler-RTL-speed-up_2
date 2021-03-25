unit D64TBB;

// Intel Threading Building Block Scalable Allocator
// 22 Febr 2019 Roberto Della Pasqua www.dellapasqua.com
// 24 March 2021 updated to latest stable version branch

interface

{$IFDEF WIN64}
uses D64IPP;
{$ENDIF}

implementation

{$IFDEF WIN64}
const
  DMalloc = 'D64TBB.DLL';
{$ENDIF}
{$IFDEF WIN32}
const
  DMalloc = 'D32TBB.DLL';
{$ENDIF}

function D64Malloc(Size: NativeUint): Pointer; cdecl; external DMalloc name 'scalable_malloc';
procedure D64Freemem(P: Pointer); cdecl; external DMalloc name 'scalable_free';
function D64Realloc(P: Pointer; Size: NativeUint): Pointer; cdecl; external DMalloc name 'scalable_realloc';

function RDPGetMem(Size: Nativeint): Pointer; inline;
begin
  Result := D64Malloc(Size);
end;

function RDPFreeMem(P: Pointer): Integer; inline;
begin
  D64Freemem(P);
  Result := 0;
end;

function RDPReallocMem(P: Pointer; Size: Nativeint): Pointer; inline;
begin
  Result := D64Realloc(P, Size);
end;

function RDPAllocMem(Size: Nativeint): Pointer; inline;
begin
  Result := D64Malloc(Size);
  if (Result <> nil) then
  {$IFDEF WIN64}
  DZero(Result, Size);
  {$ENDIF}
  {$IFDEF WIN32}
  FillChar(Result, Size, 0);
  {$ENDIF}
end;

function QRegisterExpectedMemoryLeak(P: Pointer): Boolean; inline;
begin
  Result := False;
end;

function QUnregisterExpectedMemoryLeak(P: Pointer): Boolean; inline;
begin
  Result := False;
end;

const
  RDPMemoryManager: TMemoryManagerEx = (
  Getmem: RDPGetMem;
  Freemem: RDPFreeMem;
  Reallocmem: RDPReallocMem;
  Allocmem: RDPAllocMem;
  RegisterExpectedMemoryLeak: QRegisterExpectedMemoryLeak;
  UnregisterExpectedMemoryLeak: QRegisterExpectedMemoryLeak
  );

var
  OldMemoryManager: TMemoryManagerEx;

initialization
  GetMemoryManager(OldMemoryManager);
  SetMemoryManager(RDPMemoryManager);

finalization
 SetMemoryManager(OldMemoryManager);

end.
