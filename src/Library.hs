module Library where
import PdePreludat hiding (foldr, sum, elem, all)
import Prelude (foldr, sum, elem, all, Foldable(..))

-- Desafio 1: Look and say, o https://es.wikipedia.org/wiki/Constante_de_Conway
--
-- Construir la siguiente sucesión:
-- 1
-- 11
-- 21
-- 1211
-- 111221
-- 312211
-- etc...
-- 

lookAndSay :: [Number]
lookAndSay = implementame 

--------------------------------------------------------------------

-- Desafio 2: Un foldr para una flor
--
-- En computación, un "rose tree" es un árbol donde cada nodo puede tener una
-- cantidad ilimitada de nodos hijos.

data RoseTree a = RoseTree a [RoseTree a]

-- Entonces, si quisiesemos representar un arbol como este:
--            "hola"
--           /   |    \
--       "soy" "el" "arbol"
-- lo podríamos escribir como:
holaSoyElArbol = RoseTree "hola" [RoseTree "soy" [],
                                  RoseTree "el" [],
                                  RoseTree "arbol" []]

-- y para mostrar otro mas complicado,
--             5
--          / / \ \  \
--         2 3  1 7   9
--        / \   |   / | \
--      10  11  4  0  6  20 
-- lo podríamos escribir como:
otroArbol = RoseTree 5 [RoseTree 2 [RoseTree 10 [],
                                    RoseTree 11 []],
                        RoseTree 3 [],
                        RoseTree 1 [RoseTree 4 []],
                        RoseTree 7 [],
                        RoseTree 9 [RoseTree 0 [],
                                    RoseTree 6 [],
                                    RoseTree 20 []]]

-- Algo que no vimos durante la cursada es que foldr en realidad es parte de una typeclass,
-- Foldable, o sea que no solo las listas se pueden foldear.
--
-- Como en el PdePreludat limitamos el tipo a que solo admita listas para hacerlo más simple,
-- en este ejercicio los imports están un poco tocados para traer el foldr que viene de haskell
-- en vez del del PdePreludat.
--
-- El desafío es hacer una implementación del foldr para esta estructura que haga pasar los tests.
--
-- Y algo interesante es que al implementar el foldr algunas funciones (como sum, all, any y elem)
-- las vamos a tener "gratis" para este tipo.
instance Foldable RoseTree where
  foldr = implementame