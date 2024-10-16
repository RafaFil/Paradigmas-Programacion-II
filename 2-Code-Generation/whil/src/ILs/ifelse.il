.assembly extern mscorlib {
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89)
  .ver 4:0:0:0
}
.assembly Program {
  .custom instance void [mscorlib]System.Runtime.CompilerServices.CompilationRelaxationsAttribute::.ctor(int32) = (01 00 08 00 00 00 00 00)
  .custom instance void [mscorlib]System.Runtime.CompilerServices.RuntimeCompatibilityAttribute::.ctor() = (01 00 01 00 54 02 16 57 72 61 70 4E 6F 6E 45 78 63 65 70 74 69 6F 6E 54 68 72 6F 77 73 01)
  .hash algorithm 0x00008004
  .ver 0:0:0:0
}
.module Program.exe
// MVID: {FA75252B-8FB8-41CF-987E-73151B7A7B95}
.custom instance void System.Runtime.CompilerServices.RefSafetyRulesAttribute::.ctor(int32) = (01 00 0B 00 00 00 00 00)
.imagebase 0x00400000
.file alignment 0x00000200
.stackreserve 0x00100000
.subsystem 0x0003 // WINDOWS_CUI
.corflags 0x00000001 // ILONLY
// Image base: 0x06790000
// =============== CLASS MEMBERS DECLARATION ===================
.class private auto ansi sealed beforefieldinit Microsoft.CodeAnalysis.EmbeddedAttribute extends [mscorlib]System.Attribute {
  .custom instance void [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::.ctor() = (01 00 00 00)
  .method public hidebysig specialname rtspecialname instance void .ctor() cil managed {
    .maxstack 8
    IL_0000: ldarg.0
    IL_0001: call instance void [mscorlib]System.Attribute::.ctor()
    IL_0006: nop
    IL_0007: ret
  }
}
.class private auto ansi sealed beforefieldinit System.Runtime.CompilerServices.RefSafetyRulesAttribute extends [mscorlib]System.Attribute {
  .custom instance void [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::.ctor() = (01 00 00 00)
  .custom instance void Microsoft.CodeAnalysis.EmbeddedAttribute::.ctor() = (01 00 00 00)
  .custom instance void [mscorlib]System.AttributeUsageAttribute::.ctor(valuetype [mscorlib]System.AttributeTargets) = (01 00 02 00 00 00 02 00 54 02 0D 41 6C 6C 6F 77 4D 75 6C 74 69 70 6C 65 00 54 02 09 49 6E 68 65 72 69 74 65 64 00)
  .field public initonly int32 Version
  .method public hidebysig specialname rtspecialname instance void .ctor(int32 A_1) cil managed {
    .maxstack 8
    IL_0000: ldarg.0
    IL_0001: call instance void [mscorlib]System.Attribute::.ctor()
    IL_0006: nop
    IL_0007: ldarg.0
    IL_0008: ldarg.1
    IL_0009: stfld int32 System.Runtime.CompilerServices.RefSafetyRulesAttribute::Version
    IL_000e: ret
  }
}
.class private auto ansi beforefieldinit demo_cs.RetroEng extends [mscorlib]System.Object {.method private hidebysig static void  Main(string[] args) cil managed
{
.entrypoint
.maxstack 2
.locals (int32 V_0, int32 V_1)
ldc.i4.1
ldc.i4.0
or
brtrue.s IFLABEL
br.s ELSELABEL
IFLABEL:
ldc.i4 20
ldc.i4 10
div
stloc.0
br.s ENDLABEL
ELSELABEL:
ldc.i4 20
stloc.1
ENDLABEL:
nop
ret
}
.method public hidebysig specialname rtspecialname
         instance void .ctor() cil managed
  {
    // Code size       8 (0x8)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  call       instance void [mscorlib]System.Object::.ctor()
    IL_0006:  nop
    IL_0007:  ret
  } // end of method RetroEng::.ctor

} // end of class demo_cs.RetroEng