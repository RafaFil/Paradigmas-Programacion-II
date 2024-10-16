module Utils.Utils 
    where

import Data.List (intercalate)


formatLocals :: Int -> String
formatLocals count = " (" ++ args ++ ")"
    where
        vars = ["V_" ++ show i | i <- [0 .. count - 1]]
        args = intercalate ", " (map formatVar vars)
        formatVar var = "int32 " ++ var


envelopToIL :: String -> String
envelopToIL il = concat 
    [
        ".assembly extern mscorlib {\n" ++
       "  .publickeytoken = (B7 7A 5C 56 19 34 E0 89)\n" ++
       "  .ver 4:0:0:0\n" ++
       "}\n" ++
       ".assembly Program {\n" ++
       "  .custom instance void [mscorlib]System.Runtime.CompilerServices.CompilationRelaxationsAttribute::.ctor(int32) = (01 00 08 00 00 00 00 00)\n" ++
       "  .custom instance void [mscorlib]System.Runtime.CompilerServices.RuntimeCompatibilityAttribute::.ctor() = (01 00 01 00 54 02 16 57 72 61 70 4E 6F 6E 45 78 63 65 70 74 69 6F 6E 54 68 72 6F 77 73 01)\n" ++
       "  .hash algorithm 0x00008004\n" ++
       "  .ver 0:0:0:0\n" ++
       "}\n" ++
       ".module Program.exe\n" ++
       "// MVID: {FA75252B-8FB8-41CF-987E-73151B7A7B95}\n" ++
       ".custom instance void System.Runtime.CompilerServices.RefSafetyRulesAttribute::.ctor(int32) = (01 00 0B 00 00 00 00 00)\n" ++
       ".imagebase 0x00400000\n" ++
       ".file alignment 0x00000200\n" ++
       ".stackreserve 0x00100000\n" ++
       ".subsystem 0x0003 // WINDOWS_CUI\n" ++
       ".corflags 0x00000001 // ILONLY\n" ++
       "// Image base: 0x06790000\n" ++
       "// =============== CLASS MEMBERS DECLARATION ===================\n" ++
       ".class private auto ansi sealed beforefieldinit Microsoft.CodeAnalysis.EmbeddedAttribute extends [mscorlib]System.Attribute {\n" ++
       "  .custom instance void [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::.ctor() = (01 00 00 00)\n" ++
       "  .method public hidebysig specialname rtspecialname instance void .ctor() cil managed {\n" ++
       "    .maxstack 8\n" ++
       "    IL_0000: ldarg.0\n" ++
       "    IL_0001: call instance void [mscorlib]System.Attribute::.ctor()\n" ++
       "    IL_0006: nop\n" ++
       "    IL_0007: ret\n" ++
       "  }\n" ++
       "}\n" ++
       ".class private auto ansi sealed beforefieldinit System.Runtime.CompilerServices.RefSafetyRulesAttribute extends [mscorlib]System.Attribute {\n" ++
       "  .custom instance void [mscorlib]System.Runtime.CompilerServices.CompilerGeneratedAttribute::.ctor() = (01 00 00 00)\n" ++
       "  .custom instance void Microsoft.CodeAnalysis.EmbeddedAttribute::.ctor() = (01 00 00 00)\n" ++
       "  .custom instance void [mscorlib]System.AttributeUsageAttribute::.ctor(valuetype [mscorlib]System.AttributeTargets) = (01 00 02 00 00 00 02 00 54 02 0D 41 6C 6C 6F 77 4D 75 6C 74 69 70 6C 65 00 54 02 09 49 6E 68 65 72 69 74 65 64 00)\n" ++
       "  .field public initonly int32 Version\n" ++
       "  .method public hidebysig specialname rtspecialname instance void .ctor(int32 A_1) cil managed {\n" ++
       "    .maxstack 8\n" ++
       "    IL_0000: ldarg.0\n" ++
       "    IL_0001: call instance void [mscorlib]System.Attribute::.ctor()\n" ++
       "    IL_0006: nop\n" ++
       "    IL_0007: ldarg.0\n" ++
       "    IL_0008: ldarg.1\n" ++
       "    IL_0009: stfld int32 System.Runtime.CompilerServices.RefSafetyRulesAttribute::Version\n" ++
       "    IL_000e: ret\n" ++
       "  }\n" ++
       "}\n" ++
       ".class private auto ansi beforefieldinit demo_cs.RetroEng extends [mscorlib]System.Object {",
       il,
       ".method public hidebysig specialname rtspecialname\n" ++
       "         instance void .ctor() cil managed\n" ++
       "  {\n" ++
       "    // Code size       8 (0x8)\n" ++
       "    .maxstack  8\n" ++
       "    IL_0000:  ldarg.0\n" ++
       "    IL_0001:  call       instance void [mscorlib]System.Object::.ctor()\n" ++
       "    IL_0006:  nop\n" ++
       "    IL_0007:  ret\n" ++
       "  } // end of method RetroEng::.ctor\n\n" ++
       "} // end of class demo_cs.RetroEng"
    ]