module Spec where

import PdePreludat hiding (foldr, sum, elem, all, any)
import Prelude (foldr, sum, elem, all, any)
import Library
import Test.Hspec
import Control.Exception (evaluate)

correrTests = hspec $ do
  describe "lookAndSay" $ do
    it "el primer termino es 1" $ do
      lookAndSay !! 0 `shouldBe` 1
    it "el segundo termino es 11" $ do
      lookAndSay !! 1 `shouldBe` 11
    it "cada termino se construye escribiendo la cantidad de repetidos seguidos en el termino anterior" $ do
      lookAndSay !! 5 `shouldBe` 312211
      lookAndSay !! 6 `shouldBe` 13112221
      lookAndSay !! 13 `shouldBe` 11131221131211131231121113112221121321132132211331222113112211
      lookAndSay !! 14 `shouldBe` 311311222113111231131112132112311321322112111312211312111322212311322113212221

  describe "foldr" $ do
    it "cuando el arbol tiene solo la raiz opera la semilla con la raiz" $ do
      foldr (+) 2 (RoseTree 5 []) `shouldBe` 7
    it "cuando el arbol tiene hijos los foldea segun la funcion dada" $ do
      foldr (*) 2 (RoseTree 5 [RoseTree 5 [], RoseTree 3 []]) `shouldBe` 150
    it "cuando el arbol tiene subarboles los foldea segun la funcion dada" $ do
      foldr (++) "." (RoseTree "hola" [RoseTree "," [RoseTree " " []],
                                       RoseTree "como" [RoseTree " " [],
                                                        RoseTree "va" [RoseTree "?" [RoseTree " " []]]
                                                       ],
                                       RoseTree "yo" [RoseTree " " []],
                                       RoseTree "todo" [RoseTree " " [],
                                                        RoseTree "bien" []
                                                       ]
                                      ]) `shouldBe` "hola, como va? yo todo bien."
    it "las funciones basadas en el foldr tambien funcionan correctamente" $ do
      sum (RoseTree 5 [RoseTree 5 [], RoseTree 3 []]) `shouldBe` 13
      elem "todo" (RoseTree "hola" [RoseTree "," [RoseTree " " []],
                               RoseTree "como" [RoseTree " " [],
                                                RoseTree "va" [RoseTree "?" [RoseTree " " []]]
                                                ],
                               RoseTree "yo" [RoseTree " " []],
                               RoseTree "todo" [RoseTree " " [],
                                                RoseTree "bien" []
                                               ]
                                      ]) `shouldBe` True
      all ((> 2).length) (RoseTree "hola" [RoseTree "," [RoseTree " " []],
                               RoseTree "como" [RoseTree " " [],
                                                RoseTree "va" [RoseTree "?" [RoseTree " " []]]
                                                ],
                               RoseTree "yo" [RoseTree " " []],
                               RoseTree "todo" [RoseTree " " [],
                                                RoseTree "bien" []
                                               ]
                                      ]) `shouldBe` False
