module Semantics.Compiler where
import Syntax.CodeRepr
import Data.List (nub)
import Data.List (elemIndex)

ilLocals :: Stmt -> [String]
ilLocals (Assign x _) = [x]
ilLocals (Seq stmts) = nub (concat (map ilLocals stmts))
ilLocals (IfThenElse b s1 s2) = nub (concat (map ilLocals [s1, s2]))
ilLocals (WhileDo b s) = ilLocals s

ilMaxStackAExp :: AExp -> Int
ilMaxStackAExp (Num _) = 1
ilMaxStackAExp (Var _) = 1
ilMaxStackAExp (Add a1 a2) =
  max (ilMaxStackAExp a1) (1 + ilMaxStackAExp a2)
ilMaxStackAExp (Mult a1 a2) =
  max (ilMaxStackAExp a1) (1 + ilMaxStackAExp a2)
ilMaxStackAExp (Sub a1 a2) =
  max (ilMaxStackAExp a1) (1 + ilMaxStackAExp a2)
ilMaxStackAExp (Div a1 a2) =
  max (ilMaxStackAExp a1) (1 + ilMaxStackAExp a2)

ilMaxStackBExp :: BExp -> Int
ilMaxStackBExp (BoolLit _) = 1
ilMaxStackBExp (CompEq a1 a2) =
  max (ilMaxStackAExp a1) (1 + ilMaxStackAExp a2)
ilMaxStackBExp (CompLtEq a1 a2) =
  max (ilMaxStackAExp a1) (1 + ilMaxStackAExp a2)
ilMaxStackBExp (Neg b1) = ilMaxStackBExp b1
ilMaxStackBExp (And b1 b2) =
  max (ilMaxStackBExp b1) (1 + ilMaxStackBExp b2)
ilMaxStackBExp (Or b1 b2) =
  max (ilMaxStackBExp b1) (1 + ilMaxStackBExp b2)
ilMaxStackBExp (CompGtEq b1 b2) =
  max (ilMaxStackAExp b1) (1 + ilMaxStackAExp b2)

ilMaxStackBExp (CompLess b1 b2) =
  max (ilMaxStackAExp b1) (1 + ilMaxStackAExp b2)
ilMaxStackBExp (CompGt b1 b2) =
  max (ilMaxStackAExp b1) (1 + ilMaxStackAExp b2)

ilMaxStackStmt :: Stmt -> Int
ilMaxStackStmt (Assign x a) = ilMaxStackAExp a
ilMaxStackStmt (Seq stmts) =
  maximum (map ilMaxStackStmt stmts)
ilMaxStackStmt (IfThenElse b s1 s2) =
  maximum [ilMaxStackBExp b, ilMaxStackStmt s1, ilMaxStackStmt s2]
ilMaxStackStmt (WhileDo b s) =
  maximum [ilMaxStackBExp b, ilMaxStackStmt s]


data CodeGenContext = CodeGenContext {
    locals :: [String],
    counter :: Integer
    } deriving (Show)

ilCompileAExp :: AExp -> CodeGenContext -> [String]
ilCompileAExp (Num n) _ = ["ldc.i4 "++ (show n)]
ilCompileAExp (Var x) ctx = ["ldloc.s "++ (show i)]
  where (Just i) = elemIndex x (locals ctx)
ilCompileAExp (Add a1 a2) ctx =
  concat [ilCompileAExp a1 ctx, ilCompileAExp a2 ctx, ["add"]]
ilCompileAExp (Mult a1 a2) ctx =
  concat [ilCompileAExp a1 ctx, ilCompileAExp a2 ctx, ["mul"]]
ilCompileAExp (Sub a1 a2) ctx =
  concat [ilCompileAExp a1 ctx, ilCompileAExp a2 ctx, ["sub"]]
ilCompileAExp (Div a1 a2) ctx =
  concat [ilCompileAExp a1 ctx, ilCompileAExp a2 ctx, ["div"]]

ilCompileBExp :: BExp -> CodeGenContext -> [String]
ilCompileBExp (BoolLit b) _ = if b then ["ldc.i4.1"] else ["ldc.i4.0"]
ilCompileBExp (CompEq a1 a2) ctx = concat [ilCompileAExp a1 ctx, ilCompileAExp a2 ctx, ["ceq"]]
ilCompileBExp (CompLtEq a1 a2) ctx = concat [ilCompileAExp a1 ctx, ilCompileAExp a2 ctx, ["clt"]]
ilCompileBExp (CompGtEq a1 a2) ctx = concat [ilCompileAExp a1 ctx, ilCompileAExp a2 ctx, ["clt"],["ldc.i4.0"],["ceq"]]
ilCompileBExp (And b1 b2) ctx = concat [ilCompileBExp b1 ctx, ilCompileBExp b2 ctx, ["and"]]
ilCompileBExp (Or b1 b2) ctx = concat [ilCompileBExp b1 ctx, ilCompileBExp b2 ctx, ["or"]]
ilCompileBExp (Neg b) ctx = "neg" : ilCompileBExp b ctx

ilCompileBExp (CompLess a1 a2) ctx = concat [ilCompileAExp a1 ctx, ilCompileAExp a2 ctx, ["clt"]]
ilCompileBExp (CompGt a1 a2) ctx = concat [ilCompileAExp a1 ctx, ilCompileAExp a2 ctx, ["cgt"]]


ilCompileStmt :: Stmt -> CodeGenContext -> ([String], CodeGenContext)
ilCompileStmt (Assign val a) ctx = (ilCompileAExp a ctx ++ ["stloc." ++ show i], ctx)
  where (Just i) = elemIndex val (locals ctx)

-- ilCompileStmt (Seq stmts) ctx = foldl (\acc stmt -> acc ++ ilCompileStmt stmt ctx) [] stmts
ilCompileStmt (Seq (head:tail)) ctx = (headOut ++ tailOut, finalCtx)
  where
    (headOut, newCtx) = ilCompileStmt head ctx
    (tailOut, finalCtx) = ilCompileStmt (Seq tail) newCtx

ilCompileStmt (IfThenElse b s1 s2) ctx =
    (concat [
      ilCompileBExp b ctx,
      ["brtrue.s " ++ ifLabel],
      ["br.s " ++ elseLabel],
      [ifLabel ++ ":"],
      ifbody,
      ["br.s " ++ end],
      [elseLabel ++ ":"],
      elsebody,
      [end ++ ":"]
    ], finalCtx)
  where
    ifLabel = "IFLABEL" ++ show (counter ctx)
    elseLabel = "ELSELABEL" ++ show (counter ctx)
    end = "ENDLABEL" ++ show (counter ctx)
    newCtx = ctx { counter = counter ctx + 1 }
    (ifbody, ifCtx) = ilCompileStmt s1 newCtx
    (elsebody, finalCtx) = ilCompileStmt s2 ifCtx


ilCompileStmt (WhileDo b s) ctx =
  (concat [
    [conditionLabel ++ ":"],
    ilCompileBExp b ctx,
    ["brfalse.s " ++ end],
    body,
    ["br" ++ conditionLabel],
    [end ++ ":"]
  ], finalctx)
  where
    conditionLabel = "CONDITIONLABEL" ++ show (counter ctx)
    bodyLabel = "BODYLABEL"
    end = "ENDLABEL" ++ show (counter ctx)

    newctx = CodeGenContext { locals = locals ctx, counter = counter ctx + 1 }
    (body, finalctx) = ilCompileStmt s newctx

ilCompileStmt _ ctx = ([], ctx) 