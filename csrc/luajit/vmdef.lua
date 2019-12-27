local ffi = require'ffi'
if ffi.os == 'Windows' then
	return require'vmdef_mingw64'
elseif ffi.os == 'Linux' then
	return require'vmdef_linux64'
elseif ffi.os == 'OSX' then
	return require'vmdef_osx64'
else
	error('vmdef_'..ffi.os:lower()..' missing')
end
