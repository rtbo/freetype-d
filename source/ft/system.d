module ft.system;

import core.stdc.config : c_long, c_ulong;

extern(C) nothrow
{
    alias FT_Alloc_Func = void* function (FT_Memory memory, c_long size);

    alias FT_Free_Func = void function (FT_Memory memory, void* block);

    alias FT_Realloc_Func = void* function (FT_Memory memory,
                                            c_long cur_size,
                                            c_long new_size,
                                            void* block);
}

struct FT_MemoryRec
{
    void*            user;
    FT_Alloc_Func    alloc;
    FT_Free_Func     free;
    FT_Realloc_Func  realloc;
}

alias FT_Memory = FT_MemoryRec*;


union FT_StreamDesc
{
    c_long value;
    void* pointer;
}

extern(C) nothrow
{
    alias FT_Stream_IoFunc = c_ulong function (FT_Stream stream,
                                               c_ulong   offset,
                                               ubyte*  buffer,
                                               c_ulong   count );

    alias FT_Stream_CloseFunc = void function (FT_Stream stream);
}

struct FT_StreamRec
{
    ubyte*               base;
    c_ulong              size;
    c_long               pos;

    FT_StreamDesc        descriptor;
    FT_StreamDesc        pathname;
    FT_Stream_IoFunc     read;
    FT_Stream_CloseFunc  close;

    FT_Memory            memory;
    ubyte*               cursor;
    ubyte*               limit;
}

alias FT_Stream = FT_StreamRec*;