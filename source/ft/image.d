module ft.image;

import core.stdc.config : c_long, c_ulong;
import ft.types : makeTag;

extern(C) nothrow:


alias FT_Pos = c_long;


struct FT_Vector
{
    FT_Pos  x;
    FT_Pos  y;
}

struct FT_BBox
{
    FT_Pos  xMin, yMin;
    FT_Pos  xMax, yMax;
}


enum FT_Pixel_Mode
{
    FT_PIXEL_MODE_NONE = 0,
    FT_PIXEL_MODE_MONO,
    FT_PIXEL_MODE_GRAY,
    FT_PIXEL_MODE_GRAY2,
    FT_PIXEL_MODE_GRAY4,
    FT_PIXEL_MODE_LCD,
    FT_PIXEL_MODE_LCD_V,
    FT_PIXEL_MODE_BGRA,

    FT_PIXEL_MODE_MAX      /* do not remove */
}

enum FT_PIXEL_MODE_NONE = FT_Pixel_Mode.FT_PIXEL_MODE_NONE;
enum FT_PIXEL_MODE_MONO = FT_Pixel_Mode.FT_PIXEL_MODE_MONO;
enum FT_PIXEL_MODE_GRAY = FT_Pixel_Mode.FT_PIXEL_MODE_GRAY;
enum FT_PIXEL_MODE_GRAY2 = FT_Pixel_Mode.FT_PIXEL_MODE_GRAY2;
enum FT_PIXEL_MODE_GRAY4 = FT_Pixel_Mode.FT_PIXEL_MODE_GRAY4;
enum FT_PIXEL_MODE_LCD = FT_Pixel_Mode.FT_PIXEL_MODE_LCD;
enum FT_PIXEL_MODE_LCD_V = FT_Pixel_Mode.FT_PIXEL_MODE_LCD_V;
enum FT_PIXEL_MODE_BGRA = FT_Pixel_Mode.FT_PIXEL_MODE_BGRA;
enum FT_PIXEL_MODE_MAX = FT_Pixel_Mode.FT_PIXEL_MODE_MAX;


struct FT_Bitmap
{
    uint    rows;
    uint    width;
    int     pitch;
    ubyte*  buffer;
    ushort  num_grays;
    ubyte   pixel_mode;
    ubyte   palette_mode;
    void*   palette;
}



struct FT_Outline
{
    short       n_contours;      /* number of contours in glyph        */
    short       n_points;        /* number of points in the glyph      */

    FT_Vector*  points;          /* the outline's points               */
    char*       tags;            /* the points flags                   */
    short*      contours;        /* the contour end points             */

    int         flags;           /* outline masks                      */
}

enum FT_OUTLINE_CONTOURS_MAX = short.max;
enum FT_OUTLINE_POINTS_MAX = short.max;

enum FT_OUTLINE_NONE = 0x0;
enum FT_OUTLINE_OWNER = 0x1;
enum FT_OUTLINE_EVEN_ODD_FILL = 0x2;
enum FT_OUTLINE_REVERSE_FILL = 0x4;
enum FT_OUTLINE_IGNORE_DROPOUTS = 0x8;
enum FT_OUTLINE_SMART_DROPOUTS = 0x10;
enum FT_OUTLINE_INCLUDE_STUBS = 0x20;

enum FT_OUTLINE_HIGH_PRECISION = 0x100;
enum FT_OUTLINE_SINGLE_PASS = 0x200;


extern(D)
auto FT_CURVE_TAG(T)(T flag)
{
    return flag & 3;
}

enum FT_CURVE_TAG_ON = 1;
enum FT_CURVE_TAG_CONIC = 0;
enum FT_CURVE_TAG_CUBIC = 2;

enum FT_CURVE_TAG_HAS_SCANMODE = 4;

enum FT_CURVE_TAG_TOUCH_X = 8;
enum FT_CURVE_TAG_TOUCH_Y = 16;

enum FT_CURVE_TAG_TOUCH_BOTH = FT_CURVE_TAG_TOUCH_X | FT_CURVE_TAG_TOUCH_Y;

enum FT_Curve_Tag_On = FT_CURVE_TAG_ON;
enum FT_Curve_Tag_Conic = FT_CURVE_TAG_CONIC;
enum FT_Curve_Tag_Cubic = FT_CURVE_TAG_CUBIC;
enum FT_Curve_Tag_Touch_X = FT_CURVE_TAG_TOUCH_X;
enum FT_Curve_Tag_Touch_Y = FT_CURVE_TAG_TOUCH_Y;


alias FT_Outline_MoveToFunc = int function ( const(FT_Vector)* to,
                                             void*             user );

alias FT_Outline_MoveTo_Func = FT_Outline_MoveToFunc;


alias FT_Outline_LineToFunc = int function ( const(FT_Vector)* to,
                                             void*             user );

alias FT_Outline_LineTo_Func = FT_Outline_LineToFunc;


alias FT_Outline_ConicToFunc = int function ( const(FT_Vector)*  control,
                                              const(FT_Vector)*  to,
                                              void*             user );

alias FT_Outline_ConicTo_Func = FT_Outline_ConicToFunc;


alias FT_Outline_CubicToFunc = int function ( const(FT_Vector)*  control1,
                                              const(FT_Vector)*  control2,
                                              const(FT_Vector)*  to,
                                              void*             user );

alias FT_Outline_CubicTo_Func = FT_Outline_CubicToFunc;


struct FT_Outline_Funcs
{
    FT_Outline_MoveToFunc   move_to;
    FT_Outline_LineToFunc   line_to;
    FT_Outline_ConicToFunc  conic_to;
    FT_Outline_CubicToFunc  cubic_to;

    int                     shift;
    FT_Pos                  delta;
}


enum FT_Glyph_Format
{
    FT_GLYPH_FORMAT_NONE = 0,

    FT_GLYPH_FORMAT_COMPOSITE = makeTag!('c', 'o', 'm', 'p' ),
    FT_GLYPH_FORMAT_BITMAP = makeTag!('b', 'i', 't', 's' ),
    FT_GLYPH_FORMAT_OUTLINE = makeTag!('o', 'u', 't', 'l' ),
    FT_GLYPH_FORMAT_PLOTTER = makeTag!('p', 'l', 'o', 't' )
}

enum FT_GLYPH_FORMAT_NONE = FT_Glyph_Format.FT_GLYPH_FORMAT_NONE;
enum FT_GLYPH_FORMAT_COMPOSITE = FT_Glyph_Format.FT_GLYPH_FORMAT_COMPOSITE;
enum FT_GLYPH_FORMAT_BITMAP = FT_Glyph_Format.FT_GLYPH_FORMAT_BITMAP;
enum FT_GLYPH_FORMAT_OUTLINE = FT_Glyph_Format.FT_GLYPH_FORMAT_OUTLINE;
enum FT_GLYPH_FORMAT_PLOTTER = FT_Glyph_Format.FT_GLYPH_FORMAT_PLOTTER;

struct FT_RasterRec;
alias FT_Raster = FT_RasterRec*;

struct FT_Span
{
    short   x;
    ushort  len;
    ubyte   coverage;
}


alias FT_SpanFunc = void function ( int             y,
                                    int             count,
                                    const(FT_Span)* spans,
                                    void*           user );

alias FT_Raster_Span_Func = FT_SpanFunc;


alias FT_Raster_BitTest_Func = int function ( int    y,
                                              int    x,
                                              void*  user );

alias FT_Raster_BitSet_Func = void function ( int    y,
                                              int    x,
                                              void*  user );

enum FT_RASTER_FLAG_DEFAULT = 0x0;
enum FT_RASTER_FLAG_AA = 0x1;
enum FT_RASTER_FLAG_DIRECT = 0x2;
enum FT_RASTER_FLAG_CLIP = 0x4;

struct FT_Raster_Params
{
    const(FT_Bitmap)*       target;
    const(void)*            source;
    int                     flags;
    FT_SpanFunc             gray_spans;
    FT_SpanFunc             black_spans;  /* unused */
    FT_Raster_BitTest_Func  bit_test;     /* unused */
    FT_Raster_BitSet_Func   bit_set;      /* unused */
    void*                   user;
    FT_BBox                 clip_box;
}


alias FT_Raster_NewFunc = int function (void* memory, FT_Raster* raster);

alias FT_Raster_New_Func = FT_Raster_NewFunc;

alias FT_Raster_DoneFunc = void function (FT_Raster raster);

alias FT_Raster_Done_Func = FT_Raster_DoneFunc;

alias FT_Raster_ResetFunc = void function ( FT_Raster       raster,
                                            ubyte*  pool_base,
                                            c_ulong   pool_size );

alias FT_Raster_Reset_Func = FT_Raster_ResetFunc;


alias FT_Raster_SetModeFunc = int function ( FT_Raster      raster,
                                             c_ulong  mode,
                                             void*          args );

alias FT_Raster_Set_Mode_Func = FT_Raster_SetModeFunc;


alias FT_Raster_RenderFunc = int function ( FT_Raster                raster,
                                            const(FT_Raster_Params)* params );

alias FT_Raster_Render_Func = FT_Raster_RenderFunc;



struct FT_Raster_Funcs
{
    FT_Glyph_Format        glyph_format;

    FT_Raster_NewFunc      raster_new;
    FT_Raster_ResetFunc    raster_reset;
    FT_Raster_SetModeFunc  raster_set_mode;
    FT_Raster_RenderFunc   raster_render;
    FT_Raster_DoneFunc     raster_done;
}
