{-# OPTIONS_GHC -w #-}
module Syntax.Parser where

import Syntax.CodeRepr
import Syntax.Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

data HappyAbsSyn 
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 (Stmt)
	| HappyAbsSyn5 ([Stmt])
	| HappyAbsSyn6 (BExp)
	| HappyAbsSyn7 (AExp)

{- to allow type-synonyms as our monads (likely
 - with explicitly-specified bind and return)
 - in Haskell98, it seems that with
 - /type M a = .../, then /(HappyReduction M)/
 - is not allowed.  But Happy is a
 - code-generator that can just substitute it.
type HappyReduction m = 
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> m HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> m HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> m HappyAbsSyn
-}

action_0,
 action_1,
 action_2,
 action_3,
 action_4,
 action_5,
 action_6,
 action_7,
 action_8,
 action_9,
 action_10,
 action_11,
 action_12,
 action_13,
 action_14,
 action_15,
 action_16,
 action_17,
 action_18,
 action_19,
 action_20,
 action_21,
 action_22,
 action_23,
 action_24,
 action_25,
 action_26,
 action_27,
 action_28,
 action_29,
 action_30,
 action_31,
 action_32,
 action_33,
 action_34,
 action_35,
 action_36,
 action_37,
 action_38,
 action_39,
 action_40,
 action_41,
 action_42,
 action_43,
 action_44,
 action_45,
 action_46,
 action_47,
 action_48,
 action_49,
 action_50,
 action_51,
 action_52,
 action_53,
 action_54,
 action_55 :: () => Prelude.Int -> ({-HappyReduction (HappyIdentity) = -}
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (HappyIdentity) HappyAbsSyn)

happyReduce_1,
 happyReduce_2,
 happyReduce_3,
 happyReduce_4,
 happyReduce_5,
 happyReduce_6,
 happyReduce_7,
 happyReduce_8,
 happyReduce_9,
 happyReduce_10,
 happyReduce_11,
 happyReduce_12,
 happyReduce_13,
 happyReduce_14,
 happyReduce_15,
 happyReduce_16,
 happyReduce_17,
 happyReduce_18,
 happyReduce_19,
 happyReduce_20,
 happyReduce_21,
 happyReduce_22,
 happyReduce_23 :: () => ({-HappyReduction (HappyIdentity) = -}
	   Prelude.Int 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (HappyIdentity) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (HappyIdentity) HappyAbsSyn)

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,131) ([640,4128,0,1024,32768,0,0,0,8,0,2,10240,1536,1,0,640,4192,0,0,192,448,48,112,8,24,9272,32768,32768,1,0,0,0,1024,129,15872,24,48,112,12,28,0,0,8257,0,0,0,0,160,1032,192,448,48,112,1040,2,24828,0,0,8192,24576,2048,6144,512,1536,128,384,32,96,8,24,2,10246,512,49153,515,0,0,0,0,0,0,896,2,0,0,8248,0,2062,0,0,0,0,0,0,0,0,4096,0,0,0,0,10240,512,1,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","Stmt","Stmts","BExp","AExp","'if'","'else'","'while'","'!'","'('","')'","'*'","'+'","'-'","'=='","'<='","'&&'","'='","';'","'{'","'}'","'/'","'>='","'||'","bool","num","id","%eof"]
        bit_start = st Prelude.* 30
        bit_end = (st Prelude.+ 1) Prelude.* 30
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..29]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (8) = happyShift action_4
action_0 (10) = happyShift action_5
action_0 (22) = happyShift action_6
action_0 (29) = happyShift action_2
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (29) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (20) = happyShift action_12
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (30) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (12) = happyShift action_11
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (12) = happyShift action_10
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (8) = happyShift action_4
action_6 (10) = happyShift action_5
action_6 (22) = happyShift action_6
action_6 (23) = happyShift action_9
action_6 (29) = happyShift action_2
action_6 (4) = happyGoto action_7
action_6 (5) = happyGoto action_8
action_6 _ = happyFail (happyExpListPerState 6)

action_7 _ = happyReduce_7

action_8 (8) = happyShift action_4
action_8 (10) = happyShift action_5
action_8 (22) = happyShift action_6
action_8 (23) = happyShift action_24
action_8 (29) = happyShift action_2
action_8 (4) = happyGoto action_23
action_8 _ = happyFail (happyExpListPerState 8)

action_9 _ = happyReduce_3

action_10 (11) = happyShift action_19
action_10 (12) = happyShift action_20
action_10 (27) = happyShift action_21
action_10 (28) = happyShift action_15
action_10 (29) = happyShift action_16
action_10 (6) = happyGoto action_22
action_10 (7) = happyGoto action_18
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (11) = happyShift action_19
action_11 (12) = happyShift action_20
action_11 (27) = happyShift action_21
action_11 (28) = happyShift action_15
action_11 (29) = happyShift action_16
action_11 (6) = happyGoto action_17
action_11 (7) = happyGoto action_18
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (12) = happyShift action_14
action_12 (28) = happyShift action_15
action_12 (29) = happyShift action_16
action_12 (7) = happyGoto action_13
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (14) = happyShift action_31
action_13 (15) = happyShift action_32
action_13 (16) = happyShift action_33
action_13 (21) = happyShift action_40
action_13 (24) = happyShift action_36
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (12) = happyShift action_14
action_14 (28) = happyShift action_15
action_14 (29) = happyShift action_16
action_14 (7) = happyGoto action_39
action_14 _ = happyFail (happyExpListPerState 14)

action_15 _ = happyReduce_17

action_16 _ = happyReduce_18

action_17 (13) = happyShift action_38
action_17 (19) = happyShift action_26
action_17 (26) = happyShift action_27
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (14) = happyShift action_31
action_18 (15) = happyShift action_32
action_18 (16) = happyShift action_33
action_18 (17) = happyShift action_34
action_18 (18) = happyShift action_35
action_18 (24) = happyShift action_36
action_18 (25) = happyShift action_37
action_18 _ = happyFail (happyExpListPerState 18)

action_19 (11) = happyShift action_19
action_19 (12) = happyShift action_20
action_19 (27) = happyShift action_21
action_19 (28) = happyShift action_15
action_19 (29) = happyShift action_16
action_19 (6) = happyGoto action_30
action_19 (7) = happyGoto action_18
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (11) = happyShift action_19
action_20 (12) = happyShift action_20
action_20 (27) = happyShift action_21
action_20 (28) = happyShift action_15
action_20 (29) = happyShift action_16
action_20 (6) = happyGoto action_28
action_20 (7) = happyGoto action_29
action_20 _ = happyFail (happyExpListPerState 20)

action_21 _ = happyReduce_9

action_22 (13) = happyShift action_25
action_22 (19) = happyShift action_26
action_22 (26) = happyShift action_27
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_8

action_24 _ = happyReduce_2

action_25 (8) = happyShift action_4
action_25 (10) = happyShift action_5
action_25 (22) = happyShift action_6
action_25 (29) = happyShift action_2
action_25 (4) = happyGoto action_53
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (11) = happyShift action_19
action_26 (12) = happyShift action_20
action_26 (27) = happyShift action_21
action_26 (28) = happyShift action_15
action_26 (29) = happyShift action_16
action_26 (6) = happyGoto action_52
action_26 (7) = happyGoto action_18
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (11) = happyShift action_19
action_27 (12) = happyShift action_20
action_27 (27) = happyShift action_21
action_27 (28) = happyShift action_15
action_27 (29) = happyShift action_16
action_27 (6) = happyGoto action_51
action_27 (7) = happyGoto action_18
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (13) = happyShift action_50
action_28 (19) = happyShift action_26
action_28 (26) = happyShift action_27
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (13) = happyShift action_41
action_29 (14) = happyShift action_31
action_29 (15) = happyShift action_32
action_29 (16) = happyShift action_33
action_29 (17) = happyShift action_34
action_29 (18) = happyShift action_35
action_29 (24) = happyShift action_36
action_29 (25) = happyShift action_37
action_29 _ = happyFail (happyExpListPerState 29)

action_30 _ = happyReduce_13

action_31 (12) = happyShift action_14
action_31 (28) = happyShift action_15
action_31 (29) = happyShift action_16
action_31 (7) = happyGoto action_49
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (12) = happyShift action_14
action_32 (28) = happyShift action_15
action_32 (29) = happyShift action_16
action_32 (7) = happyGoto action_48
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (12) = happyShift action_14
action_33 (28) = happyShift action_15
action_33 (29) = happyShift action_16
action_33 (7) = happyGoto action_47
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (12) = happyShift action_14
action_34 (28) = happyShift action_15
action_34 (29) = happyShift action_16
action_34 (7) = happyGoto action_46
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (12) = happyShift action_14
action_35 (28) = happyShift action_15
action_35 (29) = happyShift action_16
action_35 (7) = happyGoto action_45
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (12) = happyShift action_14
action_36 (28) = happyShift action_15
action_36 (29) = happyShift action_16
action_36 (7) = happyGoto action_44
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (12) = happyShift action_14
action_37 (28) = happyShift action_15
action_37 (29) = happyShift action_16
action_37 (7) = happyGoto action_43
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (8) = happyShift action_4
action_38 (10) = happyShift action_5
action_38 (22) = happyShift action_6
action_38 (29) = happyShift action_2
action_38 (4) = happyGoto action_42
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (13) = happyShift action_41
action_39 (14) = happyShift action_31
action_39 (15) = happyShift action_32
action_39 (16) = happyShift action_33
action_39 (24) = happyShift action_36
action_39 _ = happyFail (happyExpListPerState 39)

action_40 _ = happyReduce_1

action_41 _ = happyReduce_19

action_42 (9) = happyShift action_54
action_42 _ = happyReduce_5

action_43 (14) = happyShift action_31
action_43 (15) = happyShift action_32
action_43 (16) = happyShift action_33
action_43 (24) = happyShift action_36
action_43 _ = happyReduce_15

action_44 (14) = happyFail []
action_44 (15) = happyFail []
action_44 (16) = happyFail []
action_44 (24) = happyFail []
action_44 _ = happyReduce_23

action_45 (14) = happyShift action_31
action_45 (15) = happyShift action_32
action_45 (16) = happyShift action_33
action_45 (24) = happyShift action_36
action_45 _ = happyReduce_12

action_46 (14) = happyShift action_31
action_46 (15) = happyShift action_32
action_46 (16) = happyShift action_33
action_46 (24) = happyShift action_36
action_46 _ = happyReduce_11

action_47 (14) = happyFail []
action_47 (15) = happyFail []
action_47 (16) = happyFail []
action_47 (24) = happyFail []
action_47 _ = happyReduce_21

action_48 (14) = happyFail []
action_48 (15) = happyFail []
action_48 (16) = happyFail []
action_48 (24) = happyFail []
action_48 _ = happyReduce_20

action_49 (14) = happyFail []
action_49 (15) = happyFail []
action_49 (16) = happyFail []
action_49 (24) = happyFail []
action_49 _ = happyReduce_22

action_50 _ = happyReduce_10

action_51 (19) = happyShift action_26
action_51 _ = happyReduce_16

action_52 _ = happyReduce_14

action_53 _ = happyReduce_6

action_54 (8) = happyShift action_4
action_54 (10) = happyShift action_5
action_54 (22) = happyShift action_6
action_54 (29) = happyShift action_2
action_54 (4) = happyGoto action_55
action_54 _ = happyFail (happyExpListPerState 54)

action_55 _ = happyReduce_4

happyReduce_1 = happyReduce 4 4 happyReduction_1
happyReduction_1 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenId happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (Assign happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_2 = happySpecReduce_3  4 happyReduction_2
happyReduction_2 _
	(HappyAbsSyn5  happy_var_2)
	_
	 =  HappyAbsSyn4
		 (Seq happy_var_2
	)
happyReduction_2 _ _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_2  4 happyReduction_3
happyReduction_3 _
	_
	 =  HappyAbsSyn4
		 (skip
	)

happyReduce_4 = happyReduce 7 4 happyReduction_4
happyReduction_4 ((HappyAbsSyn4  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (IfThenElse happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 5 4 happyReduction_5
happyReduction_5 ((HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (IfThenElse happy_var_3 happy_var_5 skip
	) `HappyStk` happyRest

happyReduce_6 = happyReduce 5 4 happyReduction_6
happyReduction_6 ((HappyAbsSyn4  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (WhileDo happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_7 = happySpecReduce_1  5 happyReduction_7
happyReduction_7 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_2  5 happyReduction_8
happyReduction_8 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_1 ++ [happy_var_2]
	)
happyReduction_8 _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  6 happyReduction_9
happyReduction_9 (HappyTerminal (TokenBool happy_var_1))
	 =  HappyAbsSyn6
		 (BoolLit happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  6 happyReduction_10
happyReduction_10 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  6 happyReduction_11
happyReduction_11 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (CompEq happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_3  6 happyReduction_12
happyReduction_12 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (CompEq happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_2  6 happyReduction_13
happyReduction_13 (HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (Neg happy_var_2
	)
happyReduction_13 _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  6 happyReduction_14
happyReduction_14 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (And happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  6 happyReduction_15
happyReduction_15 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (CompGtEq happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  6 happyReduction_16
happyReduction_16 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn6
		 (Or happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  7 happyReduction_17
happyReduction_17 (HappyTerminal (TokenNum happy_var_1))
	 =  HappyAbsSyn7
		 (Num happy_var_1
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_1  7 happyReduction_18
happyReduction_18 (HappyTerminal (TokenId happy_var_1))
	 =  HappyAbsSyn7
		 (Var happy_var_1
	)
happyReduction_18 _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  7 happyReduction_19
happyReduction_19 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn7
		 (happy_var_2
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  7 happyReduction_20
happyReduction_20 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Add happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  7 happyReduction_21
happyReduction_21 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Sub happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  7 happyReduction_22
happyReduction_22 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Mult happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  7 happyReduction_23
happyReduction_23 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn7
		 (Div happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 30 30 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenIf -> cont 8;
	TokenElse -> cont 9;
	TokenWhile -> cont 10;
	TokenNot -> cont 11;
	TokenOParen -> cont 12;
	TokenCParen -> cont 13;
	TokenMult -> cont 14;
	TokenAdd -> cont 15;
	TokenSub -> cont 16;
	TokenEq -> cont 17;
	TokenLtEq -> cont 18;
	TokenAnd -> cont 19;
	TokenAssign -> cont 20;
	TokenSemi -> cont 21;
	TokenOBrace -> cont 22;
	TokenCBrace -> cont 23;
	TokenDiv -> cont 24;
	TokenGtEq -> cont 25;
	TokenOr -> cont 26;
	TokenBool happy_dollar_dollar -> cont 27;
	TokenNum happy_dollar_dollar -> cont 28;
	TokenId happy_dollar_dollar -> cont 29;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 30 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
parse tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError _ = error "Parse error"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
