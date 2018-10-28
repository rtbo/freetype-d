module ft.outline;

import ft.freetype : FT_GlyphSlot, FT_Library;
import ft.image : FT_BBox, FT_Bitmap, FT_Outline, FT_Outline_Funcs, FT_Raster_Params, FT_Pos;
import ft.system : FT_Memory;
import ft.types : FT_Error, FT_Matrix, FT_Int, FT_UInt;

extern(C) nothrow @nogc:

FT_Error
FT_Outline_Decompose( FT_Outline*              outline,
                      const(FT_Outline_Funcs)* func_interface,
                      void*                    user );

FT_Error
FT_Outline_New( FT_Library   library,
                FT_UInt      numPoints,
                FT_Int       numContours,
                FT_Outline*  anoutline );

FT_Error
FT_Outline_New_Internal( FT_Memory    memory,
                         FT_UInt      numPoints,
                         FT_Int       numContours,
                         FT_Outline*  anoutline );

FT_Error
FT_Outline_Done( FT_Library   library,
                 FT_Outline*  outline );

FT_Error
FT_Outline_Done_Internal( FT_Memory    memory,
                          FT_Outline*  outline );

FT_Error
FT_Outline_Check( FT_Outline*  outline );

void
FT_Outline_Get_CBox( const(FT_Outline)* outline,
                     FT_BBox*           acbox );

void
FT_Outline_Translate( const(FT_Outline)* outline,
                      FT_Pos             xOffset,
                      FT_Pos             yOffset );

FT_Error
FT_Outline_Copy( const(FT_Outline)* source,
                 FT_Outline*        target );

void
FT_Outline_Transform( const(FT_Outline)* outline,
                      const(FT_Matrix)*  matrix );

FT_Error
FT_Outline_Embolden( FT_Outline*  outline,
                     FT_Pos       strength );

FT_Error
FT_Outline_EmboldenXY( FT_Outline*  outline,
                       FT_Pos       xstrength,
                       FT_Pos       ystrength );

void
FT_Outline_Reverse( FT_Outline*  outline );

FT_Error
FT_Outline_Get_Bitmap( FT_Library        library,
                       FT_Outline*       outline,
                       const(FT_Bitmap)* abitmap );

FT_Error
FT_Outline_Render( FT_Library         library,
                   FT_Outline*        outline,
                   FT_Raster_Params*  params );

enum FT_Orientation
{
    FT_ORIENTATION_TRUETYPE   = 0,
    FT_ORIENTATION_POSTSCRIPT = 1,
    FT_ORIENTATION_FILL_RIGHT = FT_ORIENTATION_TRUETYPE,
    FT_ORIENTATION_FILL_LEFT  = FT_ORIENTATION_POSTSCRIPT,
    FT_ORIENTATION_NONE
}

enum FT_ORIENTATION_TRUETYPE    = FT_Orientation.FT_ORIENTATION_TRUETYPE;
enum FT_ORIENTATION_POSTSCRIPT  = FT_Orientation.FT_ORIENTATION_POSTSCRIPT;
enum FT_ORIENTATION_FILL_RIGHT  = FT_Orientation.FT_ORIENTATION_FILL_RIGHT;
enum FT_ORIENTATION_FILL_LEFT   = FT_Orientation.FT_ORIENTATION_FILL_LEFT;
enum FT_ORIENTATION_NONE        = FT_Orientation.FT_ORIENTATION_NONE;

FT_Orientation
FT_Outline_Get_Orientation( FT_Outline*  outline );
