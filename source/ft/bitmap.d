module ft.bitmap;

import ft.freetype : FT_GlyphSlot, FT_Library;
import ft.image : FT_Bitmap, FT_Pos;
import ft.types : FT_Error, FT_Int;

extern(C) nothrow @nogc:

void
FT_Bitmap_Init( FT_Bitmap*  abitmap );

FT_Error
FT_Bitmap_Copy( FT_Library        library,
                const(FT_Bitmap)* source,
                FT_Bitmap*        target );

FT_Error
FT_Bitmap_Embolden( FT_Library  library,
                    FT_Bitmap*  bitmap,
                    FT_Pos      xStrength,
                    FT_Pos      yStrength );

FT_Error
FT_Bitmap_Convert( FT_Library        library,
                   const(FT_Bitmap)* source,
                   FT_Bitmap*        target,
                   FT_Int            alignment );

FT_Error
FT_GlyphSlot_Own_Bitmap( FT_GlyphSlot  slot );

FT_Error
FT_Bitmap_Done( FT_Library  library,
                FT_Bitmap*  bitmap );
