module Main where

import Data.List (intercalate)
import System.IO (getLine)
import System.Environment (getArgs)
import Syntax.Lexer (alexScanTokens)
import Syntax.Parser (parse)
import Semantics.Interpreter (evalStmt, State)
import Syntax.CodeRepr (AExp(Num, Add))
import Semantics.Compiler (ilCompileAExp, CodeGenContext (CodeGenContext, locals, counter), ilCompileStmt, ilMaxStackStmt, ilLocals)
import Utils.Utils (formatLocals, envelopToIL)

getLines :: IO String
getLines = do
  line <- getLine
  if (null line) then return line else do
    rest <- getLines
    return (line ++ '\n':rest)

data ReplMode = OnlyTokens | OnlyAST | Evaluate | Compile deriving (Eq, Show)

getReplModeFromArgs :: [String] -> ReplMode
getReplModeFromArgs ("-t":_) = OnlyTokens
getReplModeFromArgs ("-a":_) = OnlyAST
getReplModeFromArgs ("-c":_) = Compile
getReplModeFromArgs [] = Evaluate
getReplModeFromArgs args = error ("Unrecognized args "++ (intercalate " " args))

repl :: ReplMode -> State -> IO ()
repl m s = do
  code <- getLines
  let tokens = alexScanTokens code
  if (m == OnlyTokens) then do
    print tokens
    repl m s
  else do
    let ast = parse tokens
    if (m == OnlyAST) then do
      print ast
      repl m s
    else do
      if (m == Compile) then do
        let ctx = CodeGenContext { locals = ilLocals ast, counter = 1 }
        let locals = ilLocals ast
        let il = ilCompileStmt ast ctx
        let asm = concat
              [
                [".method private hidebysig static void  Main(string[] args) cil managed"],
                ["{"],
                [".entrypoint"],
                [".maxstack " ++ show (ilMaxStackStmt ast)],
                [".locals" ++ formatLocals (length locals)],
                fst il,
                ["nop"],
                ["ret"],
                ["}"]
              ]
        putStrLn (envelopToIL (unlines asm))
      else do
        let s2 = evalStmt ast s
        putStrLn ("// "++ intercalate ", " [var ++"="++ (show val) | (var, val) <- s2] ++".")
        repl m s2

main :: IO ()
main = do
  print "Welcome to Whil REPL"
  args <- getArgs
  repl (getReplModeFromArgs args) []