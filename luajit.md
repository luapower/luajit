---
project: luajit
tagline: LuaJIT binary
---

## What

LuaJIT binaries (frontend, static library, dynamic library) for all platforms.

Comes bundled the `luajit` command, which is a simple shell script that
finds and loads the appropriate luajit executable for your platform, so that
typing `./luajit` (or simply `luajit` on Windows) from the luapower directory
always works.

## How it was compiled

LuaJIT was compiled using its own makefile.<br>
The GCC flags `-msse -msse2` were added for 32bit platforms.

## Lua module paths

### Windows

`!\..\..\?.lua;!\..\..\?\init.lua` was added to the default package.path
in luaconf.h. This allows luapower modules to be found regardless of what
the current directory is, making the distribution portable.

The default `package.cpath` was also modified from `!\?.dll` to `!\clib\?.dll`.
This is to distinguish between Lua/C modules and other binary dependencies.

> Windows looks for dependent dlls in the directory of the executable first
by default, and that's where the luapower dlls are, so isolation from system
libraries is acheived automatically in this case.

### Linux and OSX

In Linux and OSX, luajit is a shell wrapper script that sets LUA_PATH
and LUA_CPATH to acheive the same effect and assure isolation from
system libraries.

> Linux binaries are built with `rpath=$ORIGIN`, and OSX binaries are
built with `rpath=@loader_path` in order to find shared libraries in the
directory of the executable first.

### The current directory

Lua modules (including Lua/C modules) are still searched for in the current
directory __first__ (on any platform), so the isolation from the host system
is not absolute.

This is the Lua's default setting and it's convenient for when you want to
have a single luapower tree, possibly added to the system PATH, to be shared
between many apps. In this case, starting luajit in the directory of the app
makes the app's modules accessible automatically.

### Going further

The above solves the problem of finding Lua modules and binary dependencies
relative to the directory of the luajit executable, and independent of the
directory that the script was started in.

To get the location of the running script, as opposed to that of the luajit
executable, use [glue.bin].

To add more paths to package.path and package.cpath at runtime,
use [glue.luapath] and [glue.cpath].


[glue.bin]:     glue#bin
[glue.luapath]: glue#luapath
[glue.cpath]:   glue#cpath

