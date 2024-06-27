# Entrega Karis Quijano - 280306

#/bin/bash

clear

esUnaLetra(){
	valido=0
	while [ $valido -ne 1 ]
	do
		read -n 1 -p "Ingrese una letra: " letra
		if [[ "$letra" =~ [abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ] ]]; then
			echo ""
			echo "Es una letra"
			sleep 1
			valido=1
		else
			echo ""
			read -n 1 -p " No es una letra, si quiere finalizar ingrese 1, en otro caso ingrese 0: " valido
			echo ""
		letra="" 
		fi
	done
}

esUnNumero(){
	valido1=0
	while [ $valido1 -ne 1 ]
	do
		read -n 1 -p "Ingrese un numero: " numero
		if [[ "$numero" =~ [0123456789] ]]; then
			echo ""
			echo "Es un numero"
			sleep 1
			valido1=1
		else
			echo ""
			read -n 1 -p " No es un numero, si quiere finalizar ingrese 1, en otro caso ingrese 0: " valido1
			echo ""
		numero="" 
		fi
	done
}

esUnaVocal(){
	valido2=0
	while [ $valido2 -ne 1 ]
	do
		read -n 1 -p "Ingrese vocal: " vocal
		if [[ "$vocal" =~ [aeiouAEIOU] ]]; then
			echo ""
			echo "Es una vocal"
			sleep 1
			valido2=1
		else 
			echo ""
			read -n 1 -p "No es una vocal, si quiere finalizar ingrese 1, en otro caso ingrese 0: " valido2
			echo ""
			vocal=""
		fi
	done
}

algoritmo() {
      read -p "Ingrese palabra a evaluar: " capicuaNormal
      capicua=$(echo "$capicuaNormal" | tr '[:upper:]' '[:lower:]')
      longitud=$(echo -n "$capicua" | wc -m)
      for ((i=$longitud; i>=0; i--)); do
          reves=${capicua:$i:1}
          revesPalabra=${revesPalabra}${reves}
      done
      if [ "$capicua" == "$revesPalabra" ]; then
          echo "Es capicúa"
          sleep 3
      else
          echo "No es capicúa"
          sleep 3
      fi
      revesPalabra=""
}

salir(){
	read -n 1 -p "Para confirmar que quiere salir ingrese 1, en otro caso ingrese 0: " continuar
}

otroCaso(){
	echo "No es una opción válida"
    sleep 2
}

continuar=0
while [ $continuar -ne 1 ]
do

clear
	echo "Menú Principal"
	echo "Ingrese el número de la opción a la que desee ingresar"
    echo "1) Verificar que es una letra"
    echo "2) Verificar que es un numero"
    echo "3) Verificar que es una vocal"
    echo "4) Verificar si palabra es capicua"
    echo "5) Salir"

eleccion=""
	read -p "Ingrese opción: " eleccion

    case $eleccion in
    1) esUnaLetra
    ;;
    2) esUnNumero
    ;;
    3) esUnaVocal
    ;;
    4) algoritmo
    ;;
    5) salir
    ;;
    *) otroCaso
    esac
done

clear
