unit fpg_dynload;

{$mode objfpc}{$H+}

interface

uses
  {$IFDEF UNIX}
  sysutils, xlib, xftlib;
  {$ENDIF}
  
    const
    
    {$IFDEF LINUX}
 {$if defined(cpu64)} 
  libX11='/usr/lib/x86_64-linux-gnu/libX11.so.6';
  libXft='/usr/lib/x86_64-linux-gnu/libXft.so.2'; 
 {$ENDIF}
 {$if defined(cpu86)}
  libX11='/usr/lib/i386-linux-gnu/libX11.so.6';
  libXft='/usr/lib/i386-linux-gnu/libXft.so.2'; 
 {$ENDIF}
  {$ENDIF}
 
  {$IFDEF FREEBSD} 
  libX11='/usr/local/lib/libX11.so.6';
  libXft='/usr/local/lib/libXft.so.2';
 {$ENDIF}
   

Function fpg_loaddynlib(const libfilename1:string = libX11 ; const libfilename2:string = libXft) :boolean;
procedure fpg_unloaddynlib();

implementation

Function fpg_loaddynlib(const libfilename1:string = libX11 ; const libfilename2:string = libXft) :boolean;

begin
result := false;
 if x_Load(libfilename1) then
 
 result := xft_Load(libfilename2);
  
end;

procedure fpg_unloaddynlib() ;
begin

  xft_unLoad();
  x_unLoad();
    
end;

end.

