
require "./secuencia.rb"

class Busqueda
    def initialize
        @adjacency_list = {}
    end

    def add_edge(source, target)
        if !@adjacency_list[source]
            @adjacency_list[source] = []
        end

        @adjacency_list[source].push(target)
    end

    def to_s
        @adjacency_list.to_s
    end

    # Retorna el tipo de secuencia que usamos para buscar
    def get_sequence
        raise NotImplementedError, "This is an abstract class"
    end

    # contamos tanto el primer elemento como el ultimo
    def buscar(d, h)
        # inicializar conteo y tipo de secuencia 
        count = 0
        seq = self.get_sequence
        seq.agregar(d)
        memo = []

        while !seq.vacio 
            # obtiene ele siguiente elemento y aumenta el contador. 
            # Si es h, retorna el conteo. De lo contrario, sigue 
            # adelante
            next_elem = seq.remover 
            count += 1
            memo.push(next_elem)

            if next_elem == h
                return count 
            end

            list = @adjacency_list[next_elem]

            # si no esta en el grafo, es sumidero
            if !list 
                next
            end 

            # Para cada elemento asociado a este...
            for elem in list 
                if memo.include?(elem)
                    next
                end

                seq.agregar(elem)
            end 
        end
        return -1
    end
end

class BFS < Busqueda
    def get_sequence
        Cola.new()
    end
end

class DFS < Busqueda
    def get_sequence
        Pila.new()
    end
end
