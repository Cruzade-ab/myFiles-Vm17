#!/bin/bash


echo "Espacio disponible en el disco duro: "
df -h


echo "Entra el directorio para hacer backuo separado por espacios: "
read -r directory

for dir in $directory;do
 if [ ! -d "$dir" ];then
	echo "The directory $dir does not exist. Operation cancelled."
	exit 1
 fi
done

echo "Deseas excluir algun archivo durante el backup?: (y/n)"
read -r respuesta

if [ "$respuesta" = "y" ]; then
	echo "Ingrese archvo o directorio a excluir: "
	read -r excluir
	
	fecha=$(date +%Y-%m-%d)	
	archivo_backup="backup-$fecha.tar.gz"
	tar --exclude="$excluir" -cvf $archivo_backup $directory

	echo "The backup was created successfully to the file: $archivo_ackup with the exeption of: $excluir"
fi

if [ "$respuesta" = "n" ]; then
	fecha=$(date +%Y-%m-%d)
	archivo_backup="backup-$fecha.tar.gz"
	tar -czf $archivo_backup $directory
	echo "The backup was created successfully to the file: $archivo_backup"
fi


