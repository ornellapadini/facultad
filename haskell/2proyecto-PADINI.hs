--Proyecto 2
--Ejercicio 1 y 2

data Carrera = Matematica | Fisica | Computacion | Astronomia deriving (Eq, Ord, Show, Bounded)

titulo :: Carrera -> String
titulo Matematica = "Licenciatura en Matematica"
titulo Fisica = "Licenciatura en Fisica"
titulo Computacion = "Licenciatura en Computacion"
titulo Astronomia = "Licenciatura en Astronomia"


-- Podemos mostrar el titulo de la carrera sin hacer Pattern Matching
titulo' :: Carrera -> String
titulo' c = "Lic en " ++ show c
--- Ejercicio 2-a) Para que en  las siguientes expresiones Haskell nos devuelva True debemos agregar Ord y Bounded
---En : Matematica <= Computacion haskell nos dice : No instance for (Ord Carrera) arising from a use of ‘<=’. Por esto mismo agregamos Ord al tipo Carrera
---En : Matematica 'min' Computacion pasa lo mismo, pero le agregamos Bounded
-- Ejercicio 3

---Ingreso es un sinonimo de tipo
type Ingreso = Int

---Cargo y Area son tipos enumerados
data Cargo = Titular | Asociado | Adjunto | Asistente | Auxiliar deriving (Eq, Show)

data Area = Administrativa | Enseñanza | Economica | Postgrado deriving Show

---Persona es un tipo algebraico y parametrico (tiene parametros)
data Persona = Decane-- constructor sin argumento
             |Docente  Cargo --- const con un argumento
             |NoDocente  Area-- const con un arg
             |Estudiante  Carrera Ingreso--- const. con dos argumentos
             deriving Show


--b)¿cual es el tipo del constructor docente? Docente :: Cargo -> Persona

esAsociado:: Persona -> Bool
esAsociado (Docente Asociado) = True
esAsociado _ = False


cuantos_doc :: [Persona] -> Cargo -> Int
cuantos_doc [] _ = 0
cuantos_doc ((Docente x):xs) c 
    | x == c = 1 + cuantos_doc xs c
    |otherwise = cuantos_doc xs c

cuantos_doc (_:xs) c = cuantos_doc xs c

aux_filter::[Persona] -> Cargo -> Int
aux_filter [] c = 0
aux_filter xs c = length (filter(esCargo c) xs)
                  where esCargo c (Docente n) = n == c

--aux_filter' :: [Persona] -> Cargo -> Int
--aux_filter' xs cargo = length $ filter (\p -> p == Docente cargo) xs


--4.Tipos enumerados con polimorfismo


primerElemento :: [a] -> Maybe a 
primerElemento [] = Nothing
primerElemento (x:xs) = Just x


--5.Tipos recursivos.


--lista_personas = [Docente, Docente Auxiliar, Estudiante Computacion, NoDocente Postgrado]
--cola_example = Encolada Docente (Encolada (Docente Auxiliar)(encolada (Estudiante Computacion)(enconlada NoDocente Postgrado)VaciaC))

data Cola = VaciaC | Encolada Persona Cola deriving Show

atender :: Cola -> Maybe Cola
atender VaciaC = Nothing
atender (Encolada _ c) = Just c


encolar :: Persona -> Cola -> Cola
encolar x VaciaC = Encolada x VaciaC
encolar x (Encolada u c) = Encolada u (encolar x c)


busca :: Cola -> Cargo -> Maybe Persona
busca VaciaC _ = Nothing
busca (Encolada (Docente y) x) c 
    | y == c = Just (Docente y)
    | otherwise = busca x c

busca (Encolada _  x) c = busca x c

busca' :: Cola -> Cargo -> Maybe Persona
busca' VaciaC _ = Nothing
busca' (Encolada (Docente Titular) _) Titular = Just (Docente Titular)
busca' (Encolada (Docente Asociado) _) Asociado = Just (Docente Asociado)
busca' (Encolada (Docente Adjunto) _) Adjunto = Just (Docente Adjunto)
busca' (Encolada (Docente Asistente) _) Asistente = Just (Docente Asistente)
busca' (Encolada (Docente Auxiliar) _) Auxiliar = Just (Docente Auxiliar)
busca' (Encolada _ l ) p = busca' l p


--B) ¿a que otro tipo se parece cola?
--El tipo cola se parece al de tipo Lista. EJ:
--Encolada Docente Titualar (Enconlada decane (VaciaC))
-- X : (Y: [])


--6. Tipos recursivos y polimórficos. Consideremos los siguientes problemas:
---Encontrar la definición de una palabra en un diccionario;
---encontrar el lugar de votación de una persona.
--a) ¿Como se debe instanciar el tipo ListaAsoc para representar la información almacenada en una guı́a telefónica?
--a deberia ser un Int, siendo este el numero de telefono y b deberia ser de tipo String indicando Nombre
type Guia telefonica = ListaAsoc String Int
--b) Programá las siguientes funciones:
---1) Programar la función la_long :: ListaAsoc a b -> Int que devuelve la cantidad de datos en una lista.
---2) la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b que devuelve la concatenación de dos listas de asociación.
---3) la_pares :: ListaAsoc a b -> [(a, b)] que transforma una lista de asociación en una lista de pares clave-dato.
---4) la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b que dada una lista y  una clave devuelve el dato asociado, si es que existe. 
---En caso contrario devuelve Nothing.
---5) la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b que dada una clave a elimina la entrada en la lista.
data ListaAsoc a b = Vacia | Nodo a b ( ListaAsoc a b ) deriving Show
type Diccionario = ListaAsoc String String
type Padron = ListaAsoc Int String

la_long :: ListaAsoc a b -> Int
la_long Vacia = 0
la_long (Nodo a b (c)) = 1 + la_long c

la_concat :: ListaAsoc a b -> ListaAsoc a b -> ListaAsoc a b
la_concat Vacia k = k
la_concat (Nodo a b c) d = (Nodo a b (la_concat c d))

la_pares :: ListaAsoc a b -> [(a, b)]
la_pares Vacia = []
la_pares (Nodo a b c) = (a, b): la_pares (Nodo a b c)

la_busca :: Eq a => ListaAsoc a b -> a -> Maybe b
la_busca Vacia _ = Nothing
{- la_busca (Nodo a b c) m = case (== a) m of
	                         True -> Just (b)
                             False -> la_busca c m  -}
la_busca (Nodo a b c) m | m == a = Just b 
                        | otherwise = la_busca c m

la_borrar :: Eq a => a -> ListaAsoc a b -> ListaAsoc a b 
la_borrar m Vacia = Vacia
la_borrar m (Nodo a b c) | m == a = Vacia
                         | m /= a = (Nodo m b c)

--7. (Punto ?)

data Arbol a = Hoja | Rama ( Arbol a ) a ( Arbol a ) deriving (Eq, Show)
type Prefijos = Arbol String
can, cana, canario, canas, cant, cantar, canto :: Prefijos
can = Rama cana "can" cant
cana = Rama canario "a" canas
canario = Rama Hoja "rio" Hoja
canas = Rama Hoja "s" Hoja
cant = Rama cantar "t" canto
cantar = Rama Hoja  "ar" Hoja
canto = Rama Hoja "o" Hoja

--a) a_long :: Arbol a -> Int que dado un árbol devuelve la cantidad de datos almacenados.
--b) a_hojas :: Arbol a -> Int que dado un árbol devuelve la cantidad de hojas.
--c) a_inc :: Num a => Arbol a -> Arbol a que dado un árbol que contiene números,los incrementa en uno.
--d) a_map :: (a -> b) -> Arbol a -> Arbol b que dada una función y un árbol,devuele el árbol con la misma estructura, que resulta de aplicar la función a cada uno
--de los elementos del árbol. Revisá la definción de la función anterior y reprogramalausando a_map.

a_long :: Arbol a -> Int
a_long Hoja = 0
a_long (Rama izq x der)= 1 + a_long izq + a_long der

a_hojas :: Arbol a -> Int
a_hojas Hoja = 1 
a_hojas (Rama izq x der) = a_hojas izq + a_hojas der

a_inc :: Arbol Int -> Arbol Int
a_inc Hoja = Hoja
a_inc (Rama izq x der) = Rama (a_inc izq ) (x+1) (a_inc der)

a_map :: (a -> b) -> Arbol a -> Arbol b
a_map t Hoja = Hoja
a_map t (Rama izq x der) = Rama (a_map t izq) (t x) (a_map t der) 