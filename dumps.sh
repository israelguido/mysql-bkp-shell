#
# script by israelguido@gmail.com
#

echo "Digite seu dns"
read host
echo "Digite seu user"
read user
echo "Digite seu pass"
stty -echo
read pass
echo "Digite a base que deseja executar o backup"
stty echo
read base
echo "Voce deseja [I]mportar ou [E]xportar"
read typi
if [ $typi = "E" ]
then 
	mysqldump -h $host -u $user -p$pass $base > $base"_backup.sql"
	if [ -e $base"_backup.sql" ]
	then
		echo "Seu arquivo foi criado com sucesso em: " `pwd`"/"$base"_backup.sql"
	else
		echo "Houve algum problema"
	fi
else
	echo "Digite o caminho completo do seu aquivo SQL"
	read filename
	if [ -e $filename ] 
	then
		mysql -h $host -u $user -p$pass $base < $filename
		echo "Import efetuado com sucesso"
	fi
	
fi


