Compiling Armagetron Advanced on Windows with Code::Blocks
----------------------------------------------------------

Code::Blocks is an open source, cross platform C/C++ IDE.
It has multiple compiler support, and it comes in two presentations:
MinGW bundle or Standalone for use with other compilers.

More info and download of Code::Blocks: http://www.codeblocks.org

Armagetron Advanced can be compiled with this compiler:
* MinGw: obtained in the MinGW bundle download of Code::Blocks

The sources are distributed over three BZR branches:
* 0.2.8_armagetronad_work: containing generic sources; you'll need to
  give this branch the local name 'armagetronad'
* 0.2.8_armagetronad_build_codeblocks_work: containing codeblocks project files
* 0.2.8_armagetronad_winlibs_work: containing the libraries Armagetron
  Advanced depends on; needs to be named 'winlibs' locally.

1.  Create a project directory (e.g. C:\Projects\Armagetron Advanced)
2.  Put the armagetronad source files there
3.  In the same directory, put the armagetronad_build_codeblocks files
4.  In the same directory, put the armagetronad_winlibs files
5.  It should look something like this:
    +- Armagetron Advanced
       +- armagetronad
       +- build_codeblocks
       +- winlibs
6.  Go to the build_codeblocks directory
8.  Run the batch file makedist.bat
8.  Start the Armagetron Advanced workspace (Armagetron.workspace)
9.  To compile you will need to change the active project and build target 
    (it defaults to Armagetron Advanced Client and Win32 Release build target)

The instructions above are for builds from bzr; for builds from
source zip, the relevant batch files and project files are already
included in the win32 subfolder.

In case of problems, visit forums.armagetronad.net and ask for help.