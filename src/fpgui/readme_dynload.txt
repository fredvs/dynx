- For dynamic loading of Xlib, Xft and Pthread.

  Please, copy + paste all files in /src/dynX11 into your project directory.

  Also, depend of the fpGui branch you are using,
  copy + paste all files in /src/xxx_dynx11 into your project directory.

  Finally copy + paste all files in /src/pthread into your project directory.  

- For static loading of Xlib, Xft and Pthread.
  Delete all files in your project directory that are also in /src/dynX11. 
  Delete all files in your project directory  that are also in /src/xxx_dynx11.
  Delete all files in your project directory that are also in /src/pthread.
  Edit define.inc and comment {$.DEFINE DYNLOAD}

To load the libraries, add xdynloadlib() before fpgApplication.Initialize.
To unload the libraries, add xdynunloadlib() after fpgApplication.Run;