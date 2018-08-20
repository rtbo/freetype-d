import std.stdio;

import ft.freetype;

void main()
{
	FT_Library lib;

	FT_Init_FreeType(&lib);
	writeln("Freetype initialized!");
	FT_Done_FreeType(lib);
}
