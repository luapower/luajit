MAKE=mingw32-make P=mingw32 CCOPT_x86="-march=i686 -msse -msse2" LDFLAGS=-static-libgcc \
	X=luajit.exe D=lua51.dll A=luajit.a ./build.sh
