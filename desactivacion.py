from io import open
import json

ruta = 'C:/Users/ING HENRY/Desktop/python y robot/deactivationGetRequest.json' 

with open(ruta,'r') as file:
    data = json.load(file)

# se ingresa el item

data.setdefault('run',True)

# Modificar datos del action

capa2 =  (data['orderItems'])

for d in capa2:
    capa3 = (d['item'])
    print(capa3['action'])
    capa3['action']='suarez'

#modificar campos del productPrice

capa6 =  (data['orderItems'])

for m in capa6:
    capa7 = (m['item'])
    h = (capa3['product'])
    print(h['productPrice'])
    h['productPrice']='pedro'

f = open("deactivationNewRequest.json", "w")
f.write(json.dumps(data))
f.close()