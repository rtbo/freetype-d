module ft.types;

import core.stdc.config : c_long, c_ulong;

alias FT_Int32 = int;
alias FT_UInt32 = uint;

alias FT_Bool = bool;
alias FT_FWord = short;
alias FT_UFWord = ushort;
alias FT_Char = char;
alias FT_Byte = ubyte;
alias FT_Bytes = const(FT_Byte)*;
alias FT_Tag = FT_UInt32;
alias FT_String = char;
alias FT_Short = short;
alias FT_UShort = ushort;
alias FT_Int = int;
alias FT_UInt = uint;
alias FT_Long = c_long;
alias FT_ULong = c_ulong;
alias FT_F2Dot14 = short;
alias FT_F26Dot6 = c_long;
alias FT_Fixed = c_long;
alias FT_Error = int;
alias FT_Pointer = void*;
alias FT_Offset = size_t;
alias FT_PtrDist = ptrdiff_t;

struct FT_UnitVector
{
    FT_F2Dot14 x;
    FT_F2Dot14 y;
}

struct FT_Matrix
{
    FT_Fixed xx, xy;
    FT_Fixed yx, yy;
}

struct FT_Data
{
    const(FT_Byte)* pointer;
    FT_Int          length;
}


extern(C) nothrow
{
    alias FT_Generic_Finalizer = void function (void* object);
}

struct FT_Generic
{
    void* data;
    FT_Generic_Finalizer finalizer;
}

template makeTag(char a, char b, char c, char d)
{
    enum FT_Tag makeTag = (uint(a) << 24) | (uint(b) << 16) | (uint(c) << 8) | uint(d);
}

FT_Tag makeTag(in char a, in char b, in char c, in char d) pure nothrow @safe
{
    return (uint(a) << 24) | (uint(b) << 16) | (uint(c) << 8) | uint(d);
}

struct FT_ListNodeRec
{
    FT_ListNode prev;
    FT_ListNode next;
    void *data;
}
alias FT_ListNode = FT_ListNodeRec*;

struct FT_ListRec
{
    FT_ListNode head;
    FT_ListNode tail;
}
alias FT_List = FT_ListRec*;

FT_Error FT_ERROR_BASE(X)(in X x)
{
    return x & 0xFF;
}

FT_Error FT_ERROR_MODULE(X)(in X x)
{
    return x & 0xFF00;
}
