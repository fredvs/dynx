- For dynamic loading of Xlib, Xft and Pthread.

  Please, copy + paste all files in /src/dynX11 into your project directory.

  Also, depend of the fpGui branch you are using,
  copy + paste all files in /src/xxx_dynx11 into your project directory.

  Finally copy + paste all files in /src/pthread into your project directory. 

Add in uses section : xdynload.
To load the libraries, add xdynloadlib() before fpgApplication.Initialize.
To unload the libraries, add xdynunloadlib() after fpgApplication.Run;

  
- For static loading of Xlib, Xft and Pthread.
  Delete all files in your project directory that are also in /src/dynX11. 
  Delete all files in your project directory  that are also in /src/xxx_dynx11.
  Delete all files in your project directory that are also in /src/pthread.
  Edit fpg_x11.pas and change {$DEFINE DYNLOAD} to {$.DEFINE DYNLOAD}

