use platform

xrepo install "mingw-w64 8.1.0"

var pkg_info = (xrepo fetch --json mingw-w64 | from-json)
var mingw_path = $pkg_info[0][artifacts][installdir]

if $platform:is-windows {
  set paths = [
    ~/scoop/shims/
    $mingw_path/bin
  ]
}

rm -rf .xmake
rm -rf build
xmake config --yes -vD --plat=mingw --mode=releasedbg --mingw=$mingw_path
