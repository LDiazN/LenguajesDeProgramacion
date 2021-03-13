
# Ejemplo de arbol binario de tipo recursivo en nim
type 
    TreeType = enum Hoja, Rama

    Arbol[T] = ref object 
        case kind: TreeType 
        of TreeType.Rama: 
            elem: T
            izq : Arbol[T]
            der : Arbol[T]
        of TreeType.Hoja:
            val: T

    

func busquedaAux[T](tree: Arbol[T]): (bool, int, int) = # is_tree, min, max 

    case tree.kind
        of TreeType.Hoja: return (true, tree.val, tree.val)
        of TreeType.Rama: discard


    let (l_is_tree, l_min, l_max) = busquedaAux tree.izq
    let (r_is_tree, r_min, r_max) = busquedaAux tree.der

    let new_mini = min(l_min, min(r_min, tree.elem))
    let new_maxi = min(l_max, min(r_max, tree.elem))

    return (l_is_tree and r_is_tree and l_max <= tree.elem and tree.elem < r_min, new_mini, new_maxi)

func esDeBusqueda[T](tree: Arbol[T]): bool = 

    case tree.kind 
        of TreeType.Hoja: return true
        of TreeType.Rama: discard

    let (is_tree, _, _) = busquedaAux tree

    return is_tree


var arbol : Arbol[int] =  Arbol[int](
                                kind: TreeType.Rama, 
                                elem: 2,  
                                izq: Arbol[int](kind: TreeType.Hoja, val: 1), 
                                der: Arbol[int](kind: TreeType.Hoja, val: 4))

echo esDeBusqueda(arbol)    