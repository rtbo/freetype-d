module ft.freetype;

import ft.image;
import ft.system;
import ft.types;

extern(C) nothrow @nogc:

struct FT_Glyph_Metrics
{
    FT_Pos  width;
    FT_Pos  height;

    FT_Pos  horiBearingX;
    FT_Pos  horiBearingY;
    FT_Pos  horiAdvance;

    FT_Pos  vertBearingX;
    FT_Pos  vertBearingY;
    FT_Pos  vertAdvance;
}

struct FT_Bitmap_Size
{
    FT_Short  height;
    FT_Short  width;

    FT_Pos    size;

    FT_Pos    x_ppem;
    FT_Pos    y_ppem;
}

struct FT_LibraryRec;
alias FT_Library = FT_LibraryRec*;

struct FT_ModuleRec;
alias FT_Module = FT_ModuleRec*;

struct FT_DriverRec;
alias FT_Driver = FT_DriverRec*;

struct FT_RendererRec;
alias FT_Renderer = FT_RendererRec*;


alias FT_Face = FT_FaceRec*;
struct FT_FaceRec
{
    FT_Long           num_faces;
    FT_Long           face_index;

    FT_Long           face_flags;
    FT_Long           style_flags;

    FT_Long           num_glyphs;

    FT_String*        family_name;
    FT_String*        style_name;

    FT_Int            num_fixed_sizes;
    FT_Bitmap_Size*   available_sizes;

    FT_Int            num_charmaps;
    FT_CharMap*       charmaps;

    FT_Generic        generic;

    FT_BBox           bbox;

    FT_UShort         units_per_EM;
    FT_Short          ascender;
    FT_Short          descender;
    FT_Short          height;

    FT_Short          max_advance_width;
    FT_Short          max_advance_height;

    FT_Short          underline_position;
    FT_Short          underline_thickness;

    FT_GlyphSlot      glyph;
    FT_Size           size;
    FT_CharMap        charmap;


    FT_Driver         driver;
    FT_Memory         memory;
    FT_Stream         stream;

    FT_ListRec        sizes_list;

    FT_Generic        autohint;   /* face-specific auto-hinter data */
    void*             extensions; /* unused                         */

    FT_Face_Internal  internal;
}

alias FT_Size = FT_SizeRec*;
struct FT_SizeRec
{
    FT_Face           face;      /* parent face object              */
    FT_Generic        generic;   /* generic pointer for client uses */
    FT_Size_Metrics   metrics;   /* size metrics                    */
    FT_Size_Internal  internal;
}

alias FT_GlyphSlot = FT_GlyphSlotRec*;
struct FT_GlyphSlotRec
{
    FT_Library        library;
    FT_Face           face;
    FT_GlyphSlot      next;
    FT_UInt           reserved;       /* retained for binary compatibility */
    FT_Generic        generic;

    FT_Glyph_Metrics  metrics;
    FT_Fixed          linearHoriAdvance;
    FT_Fixed          linearVertAdvance;
    FT_Vector         advance;

    FT_Glyph_Format   format;

    FT_Bitmap         bitmap;
    FT_Int            bitmap_left;
    FT_Int            bitmap_top;

    FT_Outline        outline;

    FT_UInt           num_subglyphs;
    FT_SubGlyph       subglyphs;

    void*             control_data;
    long              control_len;

    FT_Pos            lsb_delta;
    FT_Pos            rsb_delta;

    void*             other;

    FT_Slot_Internal  internal;
}

alias FT_CharMap = FT_CharMapRec*;
struct FT_CharMapRec
{
    FT_Face      face;
    FT_Encoding  encoding;
    FT_UShort    platform_id;
    FT_UShort    encoding_id;
}

enum FT_Encoding
{
    FT_ENCODING_NONE = 0,

    FT_ENCODING_MS_SYMBOL = makeTag!('s', 'y', 'm', 'b' ),
    FT_ENCODING_UNICODE = makeTag!('u', 'n', 'i', 'c' ),

    FT_ENCODING_SJIS = makeTag!('s', 'j', 'i', 's' ),
    FT_ENCODING_PRC = makeTag!('g', 'b', ' ', ' ' ),
    FT_ENCODING_BIG5 = makeTag!('b', 'i', 'g', '5' ),
    FT_ENCODING_WANSUNG = makeTag!('w', 'a', 'n', 's' ),
    FT_ENCODING_JOHAB = makeTag!('j', 'o', 'h', 'a' ),

    FT_ENCODING_GB2312     = FT_ENCODING_PRC,
    FT_ENCODING_MS_SJIS    = FT_ENCODING_SJIS,
    FT_ENCODING_MS_GB2312  = FT_ENCODING_PRC,
    FT_ENCODING_MS_BIG5    = FT_ENCODING_BIG5,
    FT_ENCODING_MS_WANSUNG = FT_ENCODING_WANSUNG,
    FT_ENCODING_MS_JOHAB   = FT_ENCODING_JOHAB,

    FT_ENCODING_ADOBE_STANDARD = makeTag!('A', 'D', 'O', 'B' ),
    FT_ENCODING_ADOBE_EXPERT = makeTag!('A', 'D', 'B', 'E' ),
    FT_ENCODING_ADOBE_CUSTOM = makeTag!('A', 'D', 'B', 'C' ),
    FT_ENCODING_ADOBE_LATIN_1 = makeTag!('l', 'a', 't', '1' ),

    FT_ENCODING_OLD_LATIN_2 = makeTag!('l', 'a', 't', '2' ),

    FT_ENCODING_APPLE_ROMAN = makeTag!('a', 'r', 'm', 'n' )
}


enum FT_ENCODING_NONE            = FT_Encoding.FT_ENCODING_NONE;
enum FT_ENCODING_UNICODE         = FT_Encoding.FT_ENCODING_UNICODE;
enum FT_ENCODING_SYMBOL          = FT_Encoding.FT_ENCODING_MS_SYMBOL;
enum FT_ENCODING_LATIN_1         = FT_Encoding.FT_ENCODING_ADOBE_LATIN_1;
enum FT_ENCODING_LATIN_2         = FT_Encoding.FT_ENCODING_OLD_LATIN_2;
enum FT_ENCODING_SJIS            = FT_Encoding.FT_ENCODING_SJIS;
enum FT_ENCODING_GB2312          = FT_Encoding.FT_ENCODING_PRC;
enum FT_ENCODING_BIG5            = FT_Encoding.FT_ENCODING_BIG5;
enum FT_ENCODING_WANSUNG         = FT_Encoding.FT_ENCODING_WANSUNG;
enum FT_ENCODING_JOHAB           = FT_Encoding.FT_ENCODING_JOHAB;

enum FT_ENCODING_ADOBE_STANDARD  = FT_Encoding.FT_ENCODING_ADOBE_STANDARD;
enum FT_ENCODING_ADOBE_EXPERT    = FT_Encoding.FT_ENCODING_ADOBE_EXPERT;
enum FT_ENCODING_ADOBE_CUSTOM    = FT_Encoding.FT_ENCODING_ADOBE_CUSTOM;
enum FT_ENCODING_APPLE_ROMAN     = FT_Encoding.FT_ENCODING_APPLE_ROMAN;


struct FT_Face_InternalRec;
alias FT_Face_Internal = FT_Face_InternalRec*;


enum FT_FACE_FLAG_SCALABLE          = 1L <<  0;
enum FT_FACE_FLAG_FIXED_SIZES       = 1L <<  1;
enum FT_FACE_FLAG_FIXED_WIDTH       = 1L <<  2;
enum FT_FACE_FLAG_SFNT              = 1L <<  3;
enum FT_FACE_FLAG_HORIZONTAL        = 1L <<  4;
enum FT_FACE_FLAG_VERTICAL          = 1L <<  5;
enum FT_FACE_FLAG_KERNING           = 1L <<  6;
enum FT_FACE_FLAG_FAST_GLYPHS       = 1L <<  7;
enum FT_FACE_FLAG_MULTIPLE_MASTERS  = 1L <<  8;
enum FT_FACE_FLAG_GLYPH_NAMES       = 1L <<  9;
enum FT_FACE_FLAG_EXTERNAL_STREAM   = 1L << 10;
enum FT_FACE_FLAG_HINTER            = 1L << 11;
enum FT_FACE_FLAG_CID_KEYED         = 1L << 12;
enum FT_FACE_FLAG_TRICKY            = 1L << 13;
enum FT_FACE_FLAG_COLOR             = 1L << 14;
enum FT_FACE_FLAG_VARIATION         = 1L << 15;


extern(D)
{
    bool FT_HAS_HORIZONTAL(const(FT_Face) face)
    {
        return (face.face_flags & FT_FACE_FLAG_HORIZONTAL) != 0;
    }

    bool FT_HAS_VERTICAL(const(FT_Face) face)
    {
        return (face.face_flags & FT_FACE_FLAG_VERTICAL) != 0;
    }

    bool FT_HAS_KERNING(const(FT_Face) face)
    {
        return (face.face_flags & FT_FACE_FLAG_KERNING) != 0;
    }

    bool FT_IS_SCALABLE(const(FT_Face) face)
    {
        return (face.face_flags & FT_FACE_FLAG_SCALABLE) != 0;
    }

    bool FT_HAS_SFNT(const(FT_Face) face)
    {
        return (face.face_flags & FT_FACE_FLAG_SFNT) != 0;
    }

    bool FT_IS_FIXED_WIDTH(const(FT_Face) face)
    {
        return (face.face_flags & FT_FACE_FLAG_FIXED_WIDTH) != 0;
    }

    bool FT_IS_FIXED_SIZES(const(FT_Face) face)
    {
        return (face.face_flags & FT_FACE_FLAG_FIXED_SIZES) != 0;
    }

    bool FT_HAS_FAST_GLYPHS(const(FT_Face) face)
    {
        return false;
    }

    bool FT_HAS_GLYPH_NAMES(const(FT_Face) face)
    {
        return (face.face_flags & FT_FACE_FLAG_GLYPH_NAMES) != 0;
    }

    bool FT_HAS_MULTIPLE_MASTERS(const(FT_Face) face)
    {
        return (face.face_flags & FT_FACE_FLAG_MULTIPLE_MASTERS) != 0;
    }

    bool FT_IS_NAMED_INSTANCE(const(FT_Face) face)
    {
        return (face.face_index & 0x7fff0000) != 0;
    }

    bool FT_IS_VARIATION(const(FT_Face) face)
    {
        return (face.face_flags & FT_FACE_FLAG_VARIATION) != 0;
    }

    bool FT_IS_CID_KEYED(const(FT_Face) face)
    {
        return (face.face_flags & FT_FACE_FLAG_CID_KEYED) != 0;
    }

    bool FT_IS_TRICKY(const(FT_Face) face)
    {
        return (face.face_flags & FT_FACE_FLAG_TRICKY) != 0;
    }

    bool FT_HAS_COLOR(const(FT_Face) face)
    {
        return (face.face_flags & FT_FACE_FLAG_COLOR) != 0;
    }

}


enum FT_STYLE_FLAG_ITALIC = 1;
enum FT_STYLE_FLAG_BOLD = 2;

struct FT_Size_InternalRec;
alias FT_Size_Internal = FT_Size_InternalRec*;


struct FT_Size_Metrics
{
    FT_UShort  x_ppem;      /* horizontal pixels per EM               */
    FT_UShort  y_ppem;      /* vertical pixels per EM                 */

    FT_Fixed   x_scale;     /* scaling values used to convert font    */
    FT_Fixed   y_scale;     /* units to 26.6 fractional pixels        */

    FT_Pos     ascender;    /* ascender in 26.6 frac. pixels          */
    FT_Pos     descender;   /* descender in 26.6 frac. pixels         */
    FT_Pos     height;      /* text height in 26.6 frac. pixels       */
    FT_Pos     max_advance; /* max horizontal advance, in 26.6 pixels */
}


struct FT_SubGlyphRec;
alias FT_SubGlyph = FT_SubGlyphRec*;

struct FT_Slot_InternalRec;
alias FT_Slot_Internal = FT_Slot_InternalRec*;

enum FT_OPEN_MEMORY = 0x1;
enum FT_OPEN_STREAM = 0x2;
enum FT_OPEN_PATHNAME = 0x4;
enum FT_OPEN_DRIVER = 0x8;
enum FT_OPEN_PARAMS = 0x10;

enum ft_open_memory = FT_OPEN_MEMORY;
enum ft_open_stream = FT_OPEN_STREAM;
enum ft_open_pathname = FT_OPEN_PATHNAME;
enum ft_open_driver = FT_OPEN_DRIVER;
enum ft_open_params = FT_OPEN_PARAMS;


enum FT_LOAD_DEFAULT = 0x0;
enum FT_LOAD_NO_SCALE                     = 1L << 0;
enum FT_LOAD_NO_HINTING                   = 1L << 1;
enum FT_LOAD_RENDER                       = 1L << 2;
enum FT_LOAD_NO_BITMAP                    = 1L << 3;
enum FT_LOAD_VERTICAL_LAYOUT              = 1L << 4;
enum FT_LOAD_FORCE_AUTOHINT               = 1L << 5;
enum FT_LOAD_CROP_BITMAP                  = 1L << 6;
enum FT_LOAD_PEDANTIC                     = 1L << 7;
enum FT_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH  = 1L << 9;
enum FT_LOAD_NO_RECURSE                   = 1L << 10;
enum FT_LOAD_IGNORE_TRANSFORM             = 1L << 11;
enum FT_LOAD_MONOCHROME                   = 1L << 12;
enum FT_LOAD_LINEAR_DESIGN                = 1L << 13;
enum FT_LOAD_NO_AUTOHINT                  = 1L << 15;
enum FT_LOAD_COLOR                        = 1L << 20;
enum FT_LOAD_COMPUTE_METRICS              = 1L << 21;
enum FT_LOAD_BITMAP_METRICS_ONLY          = 1L << 22;

enum FT_LOAD_ADVANCE_ONLY                 = 1L << 8;
enum FT_LOAD_SBITS_ONLY                   = 1L << 14;

struct FT_Parameter
{
    FT_ULong    tag;
    FT_Pointer  data;
}


struct FT_Open_Args
{
    FT_UInt         flags;
    const FT_Byte*  memory_base;
    FT_Long         memory_size;
    FT_String*      pathname;
    FT_Stream       stream;
    FT_Module       driver;
    FT_Int          num_params;
    FT_Parameter*   params;
}


enum FT_Size_Request_Type
{
    FT_SIZE_REQUEST_TYPE_NOMINAL,
    FT_SIZE_REQUEST_TYPE_REAL_DIM,
    FT_SIZE_REQUEST_TYPE_BBOX,
    FT_SIZE_REQUEST_TYPE_CELL,
    FT_SIZE_REQUEST_TYPE_SCALES,

    FT_SIZE_REQUEST_TYPE_MAX
}


struct FT_Size_RequestRec
{
    FT_Size_Request_Type  type;
    FT_Long               width;
    FT_Long               height;
    FT_UInt               horiResolution;
    FT_UInt               vertResolution;
}

alias FT_Size_Request = FT_Size_RequestRec*;


private template loadTarget (FT_Render_Mode x)
{
    enum loadTarget = (int(x) & 15) << 16;
}


enum FT_LOAD_TARGET_NORMAL  = loadTarget!( FT_Render_Mode.FT_RENDER_MODE_NORMAL );
enum FT_LOAD_TARGET_LIGHT   = loadTarget!( FT_Render_Mode.FT_RENDER_MODE_LIGHT  );
enum FT_LOAD_TARGET_MONO    = loadTarget!( FT_Render_Mode.FT_RENDER_MODE_MONO   );
enum FT_LOAD_TARGET_LCD     = loadTarget!( FT_Render_Mode.FT_RENDER_MODE_LCD    );
enum FT_LOAD_TARGET_LCD_V   = loadTarget!( FT_Render_Mode.FT_RENDER_MODE_LCD_V  );

FT_Render_Mode FT_LOAD_TARGET_MODE(int loadTarget)
{
    return cast(FT_Render_Mode)((loadTarget >> 16) & 15);
}

enum FT_Kerning_Mode
{
    FT_KERNING_DEFAULT = 0,
    FT_KERNING_UNFITTED,
    FT_KERNING_UNSCALED
}


enum FT_KERNING_DEFAULT = FT_Kerning_Mode.FT_KERNING_DEFAULT;
enum FT_KERNING_UNFITTED = FT_Kerning_Mode.FT_KERNING_UNFITTED;
enum FT_KERNING_UNSCALED = FT_Kerning_Mode.FT_KERNING_UNSCALED;



enum FT_Render_Mode
{
    FT_RENDER_MODE_NORMAL = 0,
    FT_RENDER_MODE_LIGHT,
    FT_RENDER_MODE_MONO,
    FT_RENDER_MODE_LCD,
    FT_RENDER_MODE_LCD_V,

    FT_RENDER_MODE_MAX
}


enum FT_RENDER_MODE_NORMAL = FT_Render_Mode.FT_RENDER_MODE_NORMAL;
enum FT_RENDER_MODE_MONO = FT_Render_Mode.FT_RENDER_MODE_MONO;

enum FT_SUBGLYPH_FLAG_ARGS_ARE_WORDS = 1;
enum FT_SUBGLYPH_FLAG_ARGS_ARE_XY_VALUES = 2;
enum FT_SUBGLYPH_FLAG_ROUND_XY_TO_GRID = 4;
enum FT_SUBGLYPH_FLAG_SCALE = 8;
enum FT_SUBGLYPH_FLAG_XY_SCALE = 0x40;
enum FT_SUBGLYPH_FLAG_2X2 = 0x80;
enum FT_SUBGLYPH_FLAG_USE_MY_METRICS = 0x200;

enum FT_FSTYPE_INSTALLABLE_EMBEDDING = 0x0000;
enum FT_FSTYPE_RESTRICTED_LICENSE_EMBEDDING = 0x0002;
enum FT_FSTYPE_PREVIEW_AND_PRINT_EMBEDDING = 0x0004;
enum FT_FSTYPE_EDITABLE_EMBEDDING = 0x0008;
enum FT_FSTYPE_NO_SUBSETTING = 0x0100;
enum FT_FSTYPE_BITMAP_EMBEDDING_ONLY = 0x0200;


enum FREETYPE_MAJOR = 2;
enum FREETYPE_MINOR = 9;
enum FREETYPE_PATCH = 1;



FT_Error FT_Init_FreeType(FT_Library *alibrary);

FT_Error
FT_Done_FreeType( FT_Library  library );


FT_Error
FT_New_Face( FT_Library   library,
            const(char)*  filepathname,
            FT_Long      face_index,
            FT_Face     *aface );


FT_Error
FT_New_Memory_Face( FT_Library      library,
                    const(FT_Byte)*  file_base,
                    FT_Long         file_size,
                    FT_Long         face_index,
                    FT_Face        *aface );


FT_Error
FT_Open_Face( FT_Library           library,
                const(FT_Open_Args)*  args,
                FT_Long              face_index,
                FT_Face             *aface );


FT_Error
FT_Attach_File( FT_Face      face,
                const(char)*  filepathname );


FT_Error
FT_Attach_Stream( FT_Face        face,
                    FT_Open_Args*  parameters );


FT_Error
FT_Reference_Face( FT_Face  face );


FT_Error
FT_Done_Face( FT_Face  face );


FT_Error
FT_Select_Size( FT_Face  face,
                FT_Int   strike_index );



FT_Error
FT_Request_Size( FT_Face          face,
                FT_Size_Request  req );


FT_Error
FT_Set_Char_Size( FT_Face     face,
                    FT_F26Dot6  char_width,
                    FT_F26Dot6  char_height,
                    FT_UInt     horz_resolution,
                    FT_UInt     vert_resolution );


FT_Error
FT_Set_Pixel_Sizes( FT_Face  face,
                    FT_UInt  pixel_width,
                    FT_UInt  pixel_height );


FT_Error
FT_Load_Glyph( FT_Face   face,
                FT_UInt   glyph_index,
                FT_Int32  load_flags );


FT_Error
FT_Load_Char( FT_Face   face,
                FT_ULong  char_code,
                FT_Int32  load_flags );


void
FT_Set_Transform( FT_Face     face,
                    FT_Matrix*  matrix,
                    FT_Vector*  delta );



FT_Error
FT_Render_Glyph( FT_GlyphSlot    slot,
                FT_Render_Mode  render_mode );



FT_Error
FT_Get_Kerning( FT_Face     face,
                FT_UInt     left_glyph,
                FT_UInt     right_glyph,
                FT_UInt     kern_mode,
                FT_Vector  *akerning );


FT_Error
FT_Get_Track_Kerning( FT_Face    face,
                        FT_Fixed   point_size,
                        FT_Int     degree,
                        FT_Fixed*  akerning );


FT_Error
FT_Get_Glyph_Name( FT_Face     face,
                    FT_UInt     glyph_index,
                    FT_Pointer  buffer,
                    FT_UInt     buffer_max );


const(char)*
FT_Get_Postscript_Name( FT_Face  face );


FT_Error
FT_Select_Charmap( FT_Face      face,
                    FT_Encoding  encoding );


FT_Error
FT_Set_Charmap( FT_Face     face,
                FT_CharMap  charmap );

FT_Int
FT_Get_Charmap_Index( FT_CharMap  charmap );


FT_UInt
FT_Get_Char_Index( FT_Face   face,
                    FT_ULong  charcode );


FT_ULong
FT_Get_First_Char( FT_Face   face,
                    FT_UInt  *agindex );


FT_ULong
FT_Get_Next_Char( FT_Face    face,
                    FT_ULong   char_code,
                    FT_UInt   *agindex );

FT_Error
FT_Face_Properties( FT_Face        face,
                    FT_UInt        num_properties,
                    FT_Parameter*  properties );


FT_UInt
FT_Get_Name_Index( FT_Face     face,
                    FT_String*  glyph_name );

FT_Error
FT_Get_SubGlyph_Info( FT_GlyphSlot  glyph,
                        FT_UInt       sub_index,
                        FT_Int       *p_index,
                        FT_UInt      *p_flags,
                        FT_Int       *p_arg1,
                        FT_Int       *p_arg2,
                        FT_Matrix    *p_transform );

FT_UShort
FT_Get_FSType_Flags( FT_Face  face );




FT_UInt
FT_Face_GetCharVariantIndex( FT_Face   face,
                            FT_ULong  charcode,
                            FT_ULong  variantSelector );


FT_Int
FT_Face_GetCharVariantIsDefault( FT_Face   face,
                                FT_ULong  charcode,
                                FT_ULong  variantSelector );


FT_UInt32*
FT_Face_GetVariantSelectors( FT_Face  face );


FT_UInt32*
FT_Face_GetVariantsOfChar( FT_Face   face,
                            FT_ULong  charcode );


FT_UInt32*
FT_Face_GetCharsOfVariant( FT_Face   face,
                            FT_ULong  variantSelector );




FT_Long
FT_MulDiv( FT_Long  a,
            FT_Long  b,
            FT_Long  c );


FT_Long
FT_MulFix( FT_Long  a,
            FT_Long  b );


FT_Long
FT_DivFix( FT_Long  a,
            FT_Long  b );


FT_Fixed
FT_RoundFix( FT_Fixed  a );


FT_Fixed
FT_CeilFix( FT_Fixed  a );


FT_Fixed
FT_FloorFix( FT_Fixed  a );


void
FT_Vector_Transform( FT_Vector*        vec,
                    const(FT_Matrix)*  matrix );


void
FT_Library_Version( FT_Library   library,
                    FT_Int      *amajor,
                    FT_Int      *aminor,
                    FT_Int      *apatch );


FT_Bool
FT_Face_CheckTrueTypePatents( FT_Face  face );


FT_Bool
FT_Face_SetUnpatentedHinting( FT_Face  face,
                              FT_Bool  value );
