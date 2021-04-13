

class Secuencia

    def initialize
        raise NotImplementedError, "This is an interface"
    end

    def agregar(elem)
        raise NotImplementedError, "This is an interface"
    end

    def remover
        raise NotImplementedError, "This is an interface"
    end

    def vacio
        raise NotImplementedError, "This is an interface"
    end
end

class Pila < Secuencia
    
    def initialize()
        @elems = []
    end

    def agregar(elem)
        @elems.push(elem)
    end 

    def remover
        @elems.pop
    end 

    def vacio
        @elems.length == 0 
    end

end

class Cola < Secuencia
    def initialize()
        @elems = []
    end

    def agregar(elem)
        @elems.push(elem)
    end 

    def remover
        @elems.shift
    end 

    def vacio
        @elems.length == 0 
    end
end
