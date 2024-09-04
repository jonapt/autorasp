#!/bin/bash
echo "Hola, Pasante Magma"
echo "Buscando nuevos repositorios"
sudo apt update
clear
echo "Actualizando todo"
sudo apt upgrade -y
clear
echo "removiendo todo lo que no sirve o no se utiliza"
sudo apt autoremove -y
clear
# ---------------

archivo="lista_de_aplicaciones.txt"

while IFS= read -r linea
do
    sudo apt-get install $linea -y
    clear
done < "$archivo"

echo "Aplicaciones instaladas"

while IFS= read -r linea
do
    echo $linea
done < "$archivo"


