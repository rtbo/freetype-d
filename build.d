/+ dub.sdl:
    dependency "dbuild" version="*"
    dependency "pkg-config" version="*"
+/

import dbuild;
import pkg_config;
import std.array : join;
import std.exception : enforce;
import std.regex;
import std.stdio;

auto findOptionRegex(string option)
{
    // unset options are commented, and the line does not start with #define
    return regex(r"^#define\s+"~option);
}

void main(string[] args)
{
    //if (!pkgConfigDubLines("freetype2"))
    {
        auto src = archiveFetchSource(
            "https://download.savannah.gnu.org/releases/freetype/freetype-2.9.1.tar.gz",
            "3adb0e35d3c100c456357345ccfa8056");
            // "https://download.savannah.gnu.org/releases/freetype/freetype-2.9.1.tar.bz2",
            // "60ef7d8160cd4bf8cb118ee9d65367ca");
            // "http://git.sv.nongnu.org/r/freetype/freetype2.git", "VER-2-9-1");
            // "http://git.sv.nongnu.org/r/freetype/freetype2.git", "660afb5ce8"); // this is 2.9.1 with windows cmake install unbreak

        auto bs = CMake.create().buildSystem();

        auto res = Build
                .dubWorkDir()
                .src(src)
                .release()
                .target(libTarget("freetype"))
                .build(bs);

        auto pngFinder = findOptionRegex("FT_CONFIG_OPTION_USE_PNG");
        auto hbFinder = findOptionRegex("FT_CONFIG_OPTION_USE_HARFBUZZ");
        auto bz2Finder = findOptionRegex("FT_CONFIG_OPTION_USE_BZIP2");

        string[] libs;

        const option = res.dirs.install("include", "freetype2", "freetype", "config", "ftoption.h");
        foreach (l; File(option, "r").byLine) {
            if (matchAll(l, pngFinder)) {
                libs ~= "\"png\"";
            }
            if (matchAll(l, hbFinder)) {
                libs ~= "\"harfbuzz\"";
            }
            if (matchAll(l, bz2Finder)) {
                libs ~= "\"bz2\"";
            }
        }

        writefln("dub:sdl:sourceFiles \"%s\"", res.artifact("freetype"));
        if (libs.length) writefln("dub:sdl:libs %s", libs.join(" "));
    }
}
