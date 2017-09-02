unit fpg_dynload;

{$mode objfpc}{$H+}

interface

uses
  {$IFDEF UNIX}
  sysutils, xlib, xftlib;
  {$ENDIF}
  
 const
  fX11='libX11.so.6';
  fXft='libXft.so.2';  
  
Function fpg_loaddynlib(const libfilename1:string = '' ; const libfilename2:string = '') :boolean;
procedure fpg_unloaddynlib();

implementation

Function fpg_loaddynlib(const libfilename1:string = '' ; const libfilename2:string = '') :boolean;
var
libX11, libXft: string; 
begin
if (libfilename1 = '') and (libfilename2 = '') then
begin
libX11 := fX11;
libXft := fXft;
end else
begin
libX11 := libfilename1;
libXft := libfilename2;
end;

if x_Load(libX11) then
 
 result := xft_Load(libXft);
  
end;

procedure fpg_unloaddynlib() ;
begin

  xft_unLoad();
  x_unLoad();
    
end;

end.

