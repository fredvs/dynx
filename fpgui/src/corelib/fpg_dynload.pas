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
fexist : boolean;
begin
result := false;
fexist := false;

if (libfilename1 = '') and (libfilename2 = '') then
begin
    {$IFDEF LINUX}
 {$if defined(cpu64)} 
  libX11 :='/usr/lib/x86_64-linux-gnu/' + fX11;
 
  if fileexists(libX11) then fexist := true else
  libX11 :='/lib/x86_64-linux-gnu/' + fX11;
  
  if (fexist = false) and fileexists(libX11) then
  fexist := true else if fexist = false then
  libX11 :='/usr/local/lib/' + fX11;
  
  if (fexist = false) and fileexists(libX11) then
  fexist := true else if fexist = false then
  libX11 :='/usr/lib/' + fX11;
  
  if (fexist = false) and fileexists(libX11) then
  fexist := true else if fexist = false then exit;
  
  fexist := false;
     
  libXft :='/usr/lib/x86_64-linux-gnu/' + fXft;
 
 if fileexists(libXft) then fexist := true else
  libXft :='/lib/x86_64-linux-gnu/' + fXft;
  
  if (fexist = false) and fileexists(libXft) then
  fexist := true else if fexist = false then
  libXft :='/usr/local/lib/' + fXft;
  
  if (fexist = false) and fileexists(libXft) then
  fexist := true else if fexist = false then
  libXft :='/usr/lib/' + fXft;
  
  if (fexist = false) and fileexists(libXft) then
  fexist := true else if fexist = false then exit;
  
 {$ENDIF}

 {$if defined(cpu86)}
 
  libX11 :='/usr/lib/i386-linux-gnu/' + fX11;
 
  if fileexists(libX11) then fexist := true else
  libX11 :='/lib/i386-linux-gnu/' + fX11;
  
  if (fexist = false) and fileexists(libX11) then
  fexist := true else if fexist = false then
  libX11 :='/usr/local/lib/' + fX11;
  
  if (fexist = false) and fileexists(libX11) then
  fexist := true else if fexist = false then
  libX11 :='/usr/lib/' + fX11;
  
  if (fexist = false) and fileexists(libX11) then
  fexist := true else if fexist = false then exit;
  
  fexist := false;
     
  libXft :='/usr/lib/i386-linux-gnu/' + fXft;
 
 if fileexists(libXft) then fexist := true else
  libXft :='/lib/i386-linux-gnu/' + fXft;
  
  if (fexist = false) and fileexists(libXft) then
  fexist := true else if fexist = false then
  libXft :='/usr/local/lib/' + fXft;
  
  if (fexist = false) and fileexists(libXft) then
  fexist := true else if fexist = false then
  libXft :='/usr/lib/' + fXft;
  
  if (fexist = false) and fileexists(libXft) then
  fexist := true else if fexist = false then exit;  
 {$ENDIF}

{$if defined(cpuarm) }
 libX11 :='/usr/lib/arm-linux-gnueabihf/' + fX11;
 
  if fileexists(libX11) then fexist := true else
  libX11 :='/lib/arm-linux-gnueabihf/' + fX11;
  
  if (fexist = false) and fileexists(libX11) then
  fexist := true else if fexist = false then
  libX11 :='/usr/local/lib/' + fX11;
  
  if (fexist = false) and fileexists(libX11) then
  fexist := true else if fexist = false then
  libX11 :='/usr/lib/' + fX11;
  
  if (fexist = false) and fileexists(libX11) then
  fexist := true else if fexist = false then exit;
  
  fexist := false;
     
  libXft :='/usr/lib/arm-linux-gnueabihf/' + fXft;
 
 if fileexists(libXft) then fexist := true else
  libXft :='/lib/arm-linux-gnueabihf/' + fXft;
  
  if (fexist = false) and fileexists(libXft) then
  fexist := true else if fexist = false then
  libXft :='/usr/local/lib/' + fXft;
  
  if (fexist = false) and fileexists(libXft) then
  fexist := true else if fexist = false then
  libXft :='/usr/lib/' + fXft;
  
  if (fexist = false) and fileexists(libXft) then
  fexist := true else if fexist = false then exit;  
{$endif}

{$ENDIF}
 
 {$IFDEF FREEBSD} 
  libX11='/usr/local/lib/libX11.so.6';
  libXft='/usr/local/lib/libXft.so.2';
 {$ENDIF}

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

