/+ dub.sdl:
    name "build"
    dependency "dbuild" version="*"
+/
module build;

import dbuild;
version(Windows) {
    import dbuild.msvc;
}
import std.exception;

void main(string[] args)
{
    string[string] env;

    version (Windows) {
        auto msvcInstalls = detectMsvcInstalls();
        enforce(msvcInstalls.length, "could not detect msvc");
        env = msvcEnvironment(msvcInstalls[0].vcvarsBat, ["x86"]);
    }

    auto src = SrcFetch
            // .fromUrl("https://download.savannah.gnu.org/releases/freetype/freetype-2.9.1.tar.gz")
            // .md5("3adb0e35d3c100c456357345ccfa8056");
            // .fromUrl("https://download.savannah.gnu.org/releases/freetype/freetype-2.9.1.tar.bz2")
            // .md5("60ef7d8160cd4bf8cb118ee9d65367ca");
            .fromUrl("http://git.sv.nongnu.org/r/freetype/freetype2.git")
            // .commitRef("VER-2-9-1");
            .commitRef("660afb5ce8"); // this is 2.9.1 with windows cmake install unbreak 
    
    auto bld = Build
            .dubWorkDir()
            .src(src)
            .release()
            .build(cmake("NMake Makefiles", null, env));
}
