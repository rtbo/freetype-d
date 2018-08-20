module ft.bbox;

import ft.types : FT_Error;
import ft.image : FT_BBox, FT_Outline;

extern(C) nothrow @nogc:

FT_Error
FT_Outline_Get_BBox( FT_Outline*  outline,
                     FT_BBox*     abbox );
