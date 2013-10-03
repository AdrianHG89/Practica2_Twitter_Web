Practica2_Twitter_Web
=====================
Objetivo
=====================
	Convierta el programa de ejemplo usado en la sección Ejemplo en Ruby: Accediendo a Twitter
	en una aplicación Rack que muestre en su página los últimos twitts de una lista de usuarios
	obtenidos desde un formulario (puede modificar/diseñar la interfaz como crea conveniente)

Ejecución
------------

	Podemos ejecutarlo de dos formas:
	1. ruby ultimotweet.rb
	2. rake
	
	Luego debemos ir al navegador y en la barra de direcciones poner "http://localhost:8080",
	entonces tendremos acceso a la aplicacion.
	Recuerda que para parar el servidor web Ctrl+C. De otra forma deberas matar el proceso:
		1. Para listar los puertos usados se utiliza el comando

			netstat -putan

		2. Se busca el número del proceso y con el siguiente comando lo matamos

			kill -9 numero_proceso.
