/*
TEST_OUTPUT:
---
fail_compilation/test21008.d(110): Error: function `test21008.C.after` circular reference to class `C`
fail_compilation/test21008.d(117): Error: need `this` for `toString` of type `string()`
fail_compilation/test21008.d(117): Error: need `this` for `toHash` of type `nothrow @trusted $?:32=uint|64=ulong$()`
fail_compilation/test21008.d(117): Error: function `object.Object.opCmp(Object o)` is not callable using argument types `()`
fail_compilation/test21008.d(117):        missing argument for parameter #1: `Object o`
fail_compilation/test21008.d(117): Error: function `object.Object.opEquals(Object o)` is not callable using argument types `()`
fail_compilation/test21008.d(117):        missing argument for parameter #1: `Object o`
fail_compilation/test21008.d(117): Error: `Monitor` has no effect
fail_compilation/test21008.d(117): Error: function `object.Object.factory(string classname)` is not callable using argument types `()`
fail_compilation/test21008.d(117):        missing argument for parameter #1: `string classname`
fail_compilation/test21008.d(105):        called from here: `handleMiddlewareAnnotation()`
fail_compilation/test21008.d(108): Error: class `test21008.C` no size because of forward reference
---
*/

// https://issues.dlang.org/show_bug.cgi?id=21008

#line 100

class Base
{
    bool after();

    mixin(handleMiddlewareAnnotation);
}

class C : Base
{
    override bool after();
}

string handleMiddlewareAnnotation()
{
    foreach (member; __traits(allMembers, C))
    {
        __traits(getMember, C, member);
    }
}
