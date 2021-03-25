 -- --1)
--a) esCero :: Int -> Bool, que verifica si un entero es igual a 0.
--b) esPositivo :: Int -> Bool, que verifica si un entero es estrictamente mayor a 0.
--c) esVocal :: Char -> Bool, que verifica si un car´acter es una vocal en minuscula

esCero :: Int -> Bool
esCero x 
  | x == 0 = True
  | otherwise = False

esPositivo :: Int -> Bool
esPositivo x 
  | x >= 0 = True
  | otherwise = False

esVocal :: Char -> Bool
esVocal x 
  | x =='a' || x == 'e'|| x =='i' || x == 'o' || x == 'u' = True
  | otherwise = False

-----2)Programa las siguientes funciones usando recursion o composicion:
--a) paratodo :: [Bool] -> Bool, que verifica que todos los elementos de una lista sean True.
--b) sumatoria :: [Int] -> Int, que calcula la suma de todos los elementos de una lista de enteros.
--c) productoria :: [Int] -> Int, que calcula el producto de todos los elementos una la lista de enteros.
--d) factorial :: Int -> Int, que toma un n´umero n y calcula n!.
--e) Utilizá la función sumatoria para definir, promedio :: [Int] -> Int, que toma una lista de números no vacia y calcula el valor --promedio (truncado, usando división entera).

paratodo :: [Bool] -> Bool
paratodo [] = True
paratodo (x:xs)= x == True && paratodo xs
---en el caso recursivo podemos definir : x && paratodos xs

sumatoria :: [Int] -> Int
sumatoria [] = 0
sumatoria (x :xs) = x + sumatoria xs

productoria :: [Int] -> Int
productoria [] = 1
productoria (x:xs) = x * productoria xs

factorial :: Int -> Int
factorial 0 = 1
factorial 1 = 1
factorial x = x * factorial (x-1)

promedio :: [Int] -> Int
promedio [] = 0
promedio (_:xs) = (sumatoria xs) `div` length xs

--3) Programa la funcion pertenece :: Int -> [Int] -> Bool, que verifica si un numero se encuentra en una lista

pertenece :: Int -> [Int] -> Bool
pertenece _ [] = False
pertenece n (x:xs) = (n == x) || pertenece n xs 

--4) Program´a las siguientes funciones que implementan los cuantificadores generales. Not´a queel segundo par´ametro de cada funcion, es otra funcion!
--a) paratodo’ :: [a] -> (a -> Bool) -> Bool, dada una lista xs de tipo [a] y un predicado t :: a -> Bool, determina si todos los elementos de xs satisfacen el predicado t.
--b) existe’ :: [a] -> (a -> Bool) -> Bool, dada una lista xs de tipo [a] y un
--predicado t :: a -> Bool, determina si alg´un elemento de xs satisface el predicado t.
--c) sumatoria’ :: [a] -> (a -> Int) -> Int, dada una lista xs de tipo [a] y una
--funci´on t :: a -> Int (toma elementos de tipo a y devuelve enteros), calcula la
--suma de los valores que resultan de la aplicaci´on de t a los elementos de xs.
--d) productoria’ :: [a] -> (a -> Int) -> Int, dada una lista de xs de tipo [a]
--y una funci´on t :: a -> Int, calcula el producto de los valores que resultan de la
--aplicaci´on de ta los elementos de xs.


paratodo' :: [a] -> (a -> Bool) -> Bool
paratodo'[] _ = True
paratodo'(x:xs) t = (t x) && (paratodo' xs t)

existe' :: [a] -> (a -> Bool) -> Bool
existe'[] _ = False
existe'(x:xs) t = t x || existe' xs t

sumatoria' :: [a] -> (a -> Int) -> Int
sumatoria' [] _  =  0
sumatoria' (x:xs) t = (t x) + sumatoria' xs t

productoria' :: [a] -> (a -> Int) -> Int
productoria' [] _ = 1
productoria' (x:xs) t = t x * productoria' xs t


--5. Definı́ nuevamente la función paratodo, pero esta vez usando la función paratodo’ (sin recursión ni análisis por casos!).
paraTodo :: [Bool] -> Bool
paraTodo xs  =  paratodo' xs id 

--6. Utilizando las funciones del ejercicio 4, programá las siguientes funciones por composición,sin usar recursión ni análisis por casos.
--a) todosPares :: [Int] -> Bool verifica que todos los números de una lista sean pares.
--b) hayMultiplo :: Int -> [Int] -> Bool verifica si existe algún número dentro del segundo parámetro que sea múltiplo del primer parámetro.
--c) sumaCuadrados :: Int -> Int, dado n, calcula la suma de P un número no negativo los primeros n cuadrados, es decir 
--i : 0 ≤ i < n : i 2 .
--Ayuda: En Haskell se puede escribir la lista que contiene el rango de números entre n y m como [n..m].
-- d) ¿Se te ocurre como redefinir factorial (ej. 2d) para evitar usar recursión?
--e) multiplicaPares :: [Int] -> Int que calcula el producto de todos los números pares de una lista.

--a)
par :: Int -> Bool
par x = (mod x 2) == 0

todosPares :: [Int] -> Bool
todosPares xs = paratodo' xs (par)

--b)
multiplo :: Int -> Int -> Bool
multiplo x y = (y `mod` x) == 0

hayMultiplo :: Int -> [Int] -> Bool
hayMultiplo z xs = existe' xs (multiplo z)



--c)
cuadrados :: Int -> Int
cuadrados n = n * n

sumaCuadrados :: Int -> Int
sumaCuadrados n = sumatoria'[0..(n-1)] (^2)

sumaCuadrados' :: Int -> Int
sumaCuadrados' n = sumatoria'[0..(n-1)] (\x -> x * x)

sumaCuadrados'':: Int -> Int
sumaCuadrados'' n = sumatoria' [0..(n - 1)] (cuadrados)
		 		    --where 
					--cuadrados :: Int -> Int	 
					--cuadrados x = x * x

--d)

factorial' :: Int -> Int
factorial' x = productoria' [0..x] (*1)

--e)
esPar  :: [Int]-> [Int]
esPar [] = []
esPar (x:xs) 
	| mod x 2 == 0 = x : esPar xs
	| otherwise = esPar xs

multiplicaPares :: [Int] -> Int
multiplicaPares xs = productoria' (esPar xs) id



--7. Indagá en Hoogle sobre las funciones map y filter. También podes consultar su tipo en ghci con el comando :t.
-- ¿Qué hacen estas funciones?
-- ¿A qué equivale la expresión map succ [1, -4, 6, 2, -8], donde succ n = n+1?
-- ¿Y la expresión filter esPositivo [1, -4, 6, 2, -8]?

--A)
-- "MAP" es una función usada para aplicar alguna función a los elementos de una lista, en especial si se trata con mapeados EJ: [x+3 | x <- [1,5,3,1,6]] Que le suma 3 a cada elemento de la lista.
--"FILTER": Es una funcion que toma un predicado (ina condición que dira si es verdadero o falso) y va a devolver solamente a quellos elementos que satisfagan el predicado.

--B)
-- ¿A qué equivale la expresión map succ [1, -4, 6, 2, -8], donde  succ n = n +1?
--La expresión equivale a sumar 1 a cada elemento de la lista : en el ejemplo anterior devolveria la siguiente lista  [2, -3, 7, 3, -7]
--C)
-- ¿Y la expresión filter esPositivo [1, -4, 6, 2, -8]?
-- Esta función va a devolver los elementos de la lista que cumplan con el predicado "esPositivo":
--[1, 6, 2]

--8. Programá una función que dada una lista de números xs, devuelve la lista que resulta de duplicar cada valor de xs.
--a) Definila usando recursión.
--b) Definila utilizando la función map.

duplica :: [Int]->[Int]
duplica [] = []
duplica (x:xs) = x*2 : duplica xs

duplica' :: [Int]->[Int]
duplica' xs = map (*2) xs

--9. Programá una función que dada una lista de números xs, calcula una lista que tiene como elementos aquellos números de xs que son pares.
--a) Definila usando recursión.
--b) Definila utilizando la función filter.
--c) Revisá tu definición del ejercicio 6e. ¿Cómo podes mejorarla?

sonPares' :: [Int]-> [Int]
sonPares' [] = []
sonPares' (x:xs) | mod x 2 == 0 = x : sonPares' xs
				 | otherwise = sonPares' xs

sonPares'' xs = filter (even) xs

multiplicaPares' xs = productoria' xs (\x -> if  mod x 2 == 0 then x else 1)

--10. La función primIgualesA toma un valor y una lista, y calcula el tramo inicial más largo de la lista cuyos elementos son iguales a ese valor. Por ejemplo:

--a) Programá primIgualesA por recursión.
--b) Programá nuevamente la función utilizando takeWhile.

primIgualesA :: Eq(a)=> a -> [a] -> [a]
primIgualesA _ [] = []
primIgualesA n (x:xs) 
	|  (n == x) = x : primIgualesA n xs
	|  otherwise = []
--cuando se evalue el tipo de a tenga definida la igualdad (Eq), el cual nos permite usar el operador ==.


-- takewhile :: (a-> Bool) -> [a] -> [a]   es parecido a filter pero este se detiene al no encontrar uno igual
-- takewhile p [] = []
-- takewhile p (x:xs) | p x = x : takewhile p xs
--					  | otherwise = []

primIgualesA':: Eq(a)=> a -> [a] -> [a]
primIgualesA' n  = takeWhile (== n) 


--11. La función primIguales toma una lista y devuelve el mayor tramo inicial de la lista cuyos elementos son todos iguales entre sı́.
--a) Programá primIguales por recursión.
--b) Usá cualquier versión de primIgualesA para programar primIguales. Está permitido dividir en casos, pero no usar recursión.

primIguales :: Eq(a) => [a] -> [a]
primIguales [] = []
primIguales [n] = [n]
primIguales (x:y:xs) 
	| (x == y) = x : primIguales(y:xs)
	| (x /= y) = primIguales[x]


primIguales' :: Eq(a) => [a] -> [a]
primIguales' (x:xs) = primIgualesA' x (x:xs)

primIguales'' :: Eq(a) => [a] -> [a]
primIguales'' xs = primIgualesA (head xs) xs


--12. (*) Para cada uno de los siguientes patrones, decidı́ si están bien tipados, y en tal caso da los tipos de cada subexpresión. En caso de estar bien tipado, ¿el patrón cubre todos los casos de definición?
--a) f :: (a, b) -> ...
--f x = ...
-- x es una tupla de tipo (a,b) funciona para cualquier caso.
--b) f :: (a, b) -> ...
--f (x , y) = ...
--(x,y) es una tupla en donde x representa un elemento de tipo a e y un elemento de tipo b. Funciona para cualquier caso

--c) f :: [(a, b)] -> ..
--f (a , b) = ...
--esta mal tipada porque la funcion toma listas pero la funcion esta usando un par

--d) f :: [(a, b)] -> ...
--f (x:xs) = ...
---- (x:xs) representa una lista de tuplas de tipo (a,b) en donde x representa la primer tupla y xs representa el resto de la lista  funciona para cualquier caso

--e) f :: [(a, b)] -> ...
--f ((x, y) : ((a, b) : xs)) = ...
--la funcion toma una lista de tuplas en donde (x,y) representa la primer tupla , (a,b) la segunda tupla y xs el resto de la lista. funciona para cualquier caso

--f ) f :: [(Int, a)] -> ...
--f [(0, a)] = ...
--la funcion toma una lista de tuplas y cada una eta formada de un int y otro tipo  la funcion usa solo una tupla de la forma int = 0 y una variable tipo a de caulquier tipo solo funciona cuando la lista tiene una sola tupla y esta tiene un 0 en la primer coordenada

--g ) f :: [(Int, a)] -> ...
--f ((x, 1) : xs) = ... 
---tiene una lista de pares, donde el primero es un entero y la segunda puede ser cualquier cosa, ya que a es una variable de tipo
--El patron no cubre con todos los casos. en este caso no se cumple g :: a -> Bool  g'' 1 = False
-- Adjunto la queja de haskell: • No instance for (Eq a) arising from the literal ‘1’
    --  Possible fix:
    --    add (Eq a) to the context of
    --      the type signature for:
    --        g :: a -> Bool
    -- • In the pattern: 1
    --  In an equation for ‘g’: g 1 = False
--
--h) f :: [(Int, a)] -> ...
--f ((1, x) : xs) = ...  
--esta bien tipada la funcion toma una lista de tuplas de la forma (int,a) donde a es una variable de tipos cualquiera y solo funciona si el int del primer miembro de la lista es 1

--i) f :: (Int -> Int) -> Int -> ...
--f a b = ...
-- a representa una funcion que toma int y devuelve int y b toma un int

--j) f :: (Int -> Int) -> Int -> ...
--f a 3 = ...
-- es como la anterior pero la funcion funcina solo si el int es 3 ( es una constante)

--k) f :: (Int -> Int) -> Int -> ...
--f 0 1 2 = ...
-- esta mal tipada ya que la funcion toma 2 elementos pero esta pidiendo 3

--l) f :: a -> (a -> a) -> ...
--f a g = ...
--la funcion toma una variable de tipo a y una funcion de tipo a que devuelve el mismo tipo a donde a representa la variable a y g la funcion

--13. (*) Para las siguientes declaraciones de funciones, da al menos una definción cuando sea posible (que no sea la expresión undefined). ¿Podés dar alguna otra definición alternativa a la que diste en cada caso? Por ejemplo, si la declaración es f :: (a, b) -> a,
--la respuesta es: f (x,y) = x
--a) f :: (a, b) -> b
--Un ejemplo de esta funcion seria la siguiente:
--segundo ::(a,b) -> b
--segundo (x,y) = y

--b) f :: (a, b) -> c
--No puede haber un ejemplo concreto de esta funcion ya que no hay forma que de una tupla (a,b) devuelva un resultado que puede ser de cualquier tipo c

--c) f :: a -> b
--No puede haber un ejemplo concreto de esta funcion ya que no hay forma que de una variable a devuelva una variable b desconocida 

--d) f :: (a -> b) -> a -> b   --- aplicamos la funcion que nos dan al parametro que recibimos, muy parecida a la funcion polimorfica applyTwice
--igual :: (Int,String) -> Int -> Bool
--igual (a, _) n = n == a
-- por lo tanto si podemos

--e) f :: (a -> b) -> [a] -> [b]
--- f = map
--tambien: f' h xs = []


--f) f :: (a -> b) -> a -> c
--No puede haber un ejemplo concreto de esta funcion ya que no hay forma que de que una tupla (a,b) devuelva una variable de tipo c desconocida 



--g ) f :: (a -> b) -> (b -> c) -> a -> c
		-- f (Int->String) -> (String -> Char)-> Int-> Char