--  Creamos un tipo y constructor de matriz para ayudarnos con las pruebas
local Matrix = {}

-- Crea una nueva matriz
function Matrix.new(n_rows,m_cols)
    local m = {}
    m.rows = n_rows
    m.cols = m_cols
    for i=1,n_rows do 
        m[i] = {}
        for j = 1, m_cols do 
            m[i][j] = 0
        end
    end
    return m
end

-- Multiplicacion se matrices
function Matrix.mult(a,b)
    if a.cols ~= b.rows then
        error("los tamaños de a y b no coinciden")
    end

    local out = Matrix.new(a.rows, b.cols)
    local n = a.rows
    local m = a.cols
    local p = b.cols
    for i=1,n do
        for j = 1, p do
            local sum = 0
            for k = 1, m do
                sum = sum + a[i][k] * b[k][j]
            end
            out[i][j] = sum
        end
    end

    return out
end

-- Para mostrar matrices
function Matrix.show(m)
    for i = 1, m.rows do
        for j = 1, m.cols do 
            io.write(m[i][j], " ")
        end
        io.write('\n')
    end
end

return Matrix