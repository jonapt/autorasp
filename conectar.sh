interface=$(ip -o link show | awk -F': ' '{print $2}')
echo $interface | tr ' ' '\n' > interfaces.txt
archivo="interfaces.txt"


inter=()

while IFS= read -r line
do
    inter+=("$line")
done < "$archivo"

echo "$#{inter[@]}"

t=${#inter[@]}
echo $((t))
echo "Elige una interfaz de red"


for i in $(seq 1 $((t)))
do
	echo "$i. --> ${inter[$i-1]}"
done

read -p "Elige la interfaz de red: " opc
echo "Interfaz seleccionada --> ${inter[$opc-1]}"
sudo ifconfig ${inter[$opc-1]} up

iwlist ${inter[$opc-1]} scan
