/+ dub.sdl:
    name "build"
    dependency "dbuild" version="*"
+/
module build;

import dbuild;

void main(string[] args)
{
    auto src = SrcFetch
            .fromUrl("https://download.savannah.gnu.org/releases/freetype/freetype-2.9.1.tar.gz")
            .md5("3adb0e35d3c100c456357345ccfa8056");
            // .fromUrl("https://download.savannah.gnu.org/releases/freetype/freetype-2.9.1.tar.bz2")
            // .md5("60ef7d8160cd4bf8cb118ee9d65367ca");
            // .fromUrl("http://git.sv.nongnu.org/r/freetype/freetype2.git")
            // .commitRef("VER-2-9-1");

    auto bld = Build
            .dubWorkDir()
            .src(src)
            .cmake()
            .release()
            .build();
}
