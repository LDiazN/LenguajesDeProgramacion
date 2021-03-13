type 
    TreeType = enum Hoja, Rama

    Arbol = ref object[T] 
        case kind 
        of TreeType.Rama: 
            elem: T
            izq : Arbol[T]
            der : Arbol[T]
        of TreeType.Hoja
            elem: T


