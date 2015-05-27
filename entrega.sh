#!/bin/bash

# este script tiene que recibir un parametro( nombre del comprimido )

# se ejecuta en el directorio donde se encuentra lib, include, etc
# guarda lib, include, src y nombres.txt si en el examen hay que entregar algo
# mas modificar comando para comprimir(linea 22)

# esto creará el comprimido correctamente sin que tengas que quitar nada del src
# y tampoco se tengan que borrar los .o
if [ -n "$1" ]; then
    echo "parametro introducido $1"
# guardamos el nombre del comprimido con la extension
nombre="${1}.tgz"
    echo "el archivo se guardara como $nombre"
mkdir aux_o
mkdir aux_src

mv lib/*.o aux_o
mv src/* aux_src

tar -czvf $nombre include/ lib/ nombres.txt src/

mv aux_o/* lib/
mv aux_src/* src/

rmdir aux_o
rmdir aux_src

else
    echo "parametro no introducido"
fi

