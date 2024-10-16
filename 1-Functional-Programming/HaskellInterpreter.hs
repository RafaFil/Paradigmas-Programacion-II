data AExp = Num Int | Var String
        | Add AExp AExp | Sub AExp AExp
        | Mult AExp AExp deriving (Eq, Show)
data BExp = BoolLit Bool 
        | CompEq AExp AExp | CompLtEq AExp AExp
        | Neg BExp | And BExp BExp deriving (Eq, Show)
data Stmt = Assign String AExp
        | Seq [Stmt]
        | IfThenElse BExp Stmt Stmt
        | WhileDo BExp Stmt deriving (Eq, Show)

skip :: Stmt
skip = Seq []

type State = [(String, Int)]

evalAExp :: AExp -> State -> Int
evalAExp (Num n) _ = n
evalAExp (Var x) s = let (Just v) = (lookup x s) in v
evalAExp (Add a1 a2) s = (evalAExp a1 s) + (evalAExp a2 s)
evalAExp (Sub a1 a2) s = (evalAExp a1 s) - (evalAExp a2 s)
evalAExp (Mult a1 a2) s = (evalAExp a1 s) * (evalAExp a2 s)


updateState :: String -> Int -> State -> State
updateState x v s = (x, v):(filter (\(y, _) -> x /= y) s)

evalBExp :: BExp -> State -> Bool
evalBExp (BoolLit a1) s = a1
evalBExp (CompEq a1 a2) s = evalAExp a1 s == evalAExp a2 s
evalBExp (CompLtEq a1 a2) s = evalAExp a1 s > evalAExp a2 s
evalBExp (Neg a1) s = not (evalBExp a1 s)
evalBExp (And a1 a2) s = evalBExp a1 s && evalBExp a2 s

evalStmt :: Stmt -> State -> State
evalStmt (Assign var a1) s = updateState var (evalAExp a1 s) s
evalStmt (Seq seqs) s = foldl (flip evalStmt) s seqs --CHECK
evalStmt (IfThenElse cond a1 a2) s = if evalBExp cond s then  evalStmt a1 s else evalStmt a2 s
evalStmt (WhileDo cond body) s = if evalBExp cond s then evalStmt body s else evalStmt skip s --CHECK