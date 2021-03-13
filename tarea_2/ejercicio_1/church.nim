# definicion de numerales de church
type 
    ChurchType = enum Zero, Suc

    Church = ref object
        case kind: ChurchType
            of ChurchType.Zero: discard
            of ChurchType.Suc:
                last: Church

# Funcion debug solamente
func value(num: Church): int =  
    case num.kind
        of ChurchType.Zero: return 0
        of ChurchType.Suc: return 1 + num.last.value

# retorna el siguiente numero natural
func next(num: Church): Church = 
    return Church(kind: Suc, last: num)        

# Funcion de suma
func sum(l: Church, r: Church): Church = 

    result = Church(kind: Zero)

    var curr = l
    while curr.kind != Zero:
        result = Church(kind: Suc, last: result)
        curr = curr.last

    curr = r
    while curr.kind != Zero:
        result = Church(kind: Suc, last: result)
        curr = curr.last

# Funcion de multiplicacion
func mult(l: Church, r: Church): Church = 
    
    result = Church(kind: Zero)

    var iter1 = l
    
    while iter1.kind != Zero:
        var iter2 = r
        while iter2.kind != Zero:
            result = Church(kind: Suc, last: result)
            iter2 = iter2.last

        iter1 = iter1.last
        

let zero = Church(kind: Zero)
let two = zero.next.next
let three = zero.next.next.next

assert (sum(two, three).value   == 5) 
assert (sum(zero, three).value  == 3) 
assert (sum(two, zero).value    == 2) 

assert (mult(zero, two).value   == 0)
assert (mult(three, zero).value == 0)
assert (mult(two, three).value  == 6)