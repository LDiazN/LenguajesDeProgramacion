def zipWith(a,b,f):
    if a and b:
        yield f(a[0],b[0])
        for p in zipWith(a[1:], b[1:], f):
            yield p
def misterio(p):
    yield p 
    acum = []
    for p in zipWith([0, *p], [*p, 0], lambda x,y : x + y):
        acum += [p]
    for m in misterio(acum):
        yield m

def suspenso():
    for l in misterio([1]):
        for i in l:
            yield i

for i in suspenso():
    print(i)
    input()