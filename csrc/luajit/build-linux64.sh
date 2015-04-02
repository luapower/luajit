MAKE=make P=linux64 LDFLAGS="-s -static-libgcc -Wl,-rpath,'\$\$ORIGIN'" \
	X0=luajit X=luajit-bin D=libluajit.so A=libluajit.a ./build.sh
