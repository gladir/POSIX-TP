# POSIX-TP
Clone des fonctions de la bibliothèque POSIX en Turbo Pascal

<h3>Liste des fonctions</h3>

Voici la liste des fonctions reconnus dans l'unité POSIX :

<table>
	<tr>
		<th>Nom</th>
		<th>Description</th>
	</tr>
    <tr>
		<td><b>ABORT</b></td>
		<td>Cette fonction permet d'interrompre l'exécution du programme de façon anormale.</td>
	</tr>
    <tr>
		<td><b>ABS</b></td>
		<td>Cette fonction permet de retourner la valeur absolue d'un nombre.</td>
	</tr>
    <tr>
		<td><b>ACCESS</b></td>
		<td>Cette fonction permet de fixer l'accessibilité d'un fichier.</td>
	</tr>
    <tr>
		<td><b>ACOS</b></td>
		<td>Cette fonction trigonométrique retourne l'«<i>ArcCosinus</i>».</td>
	</tr>
    <tr>
		<td><b>ALARM</b></td>
		<td>Cette fonction permet de fixer le nombre de seconde de «<i>SIGALARM</i>».</td>
	</tr>
    <tr>
		<td><b>ASCTIME</b></td>
		<td>Cette fonction permet de convertir l'heure en chaine de caractères.</td>
	</tr>
    <tr>
		<td><b>ASIN</b></td>
		<td>Cette fonction trigonométrique retourne l'«<i>ArcSinus</i>».</td>
	</tr>
    <tr>
		<td><b>ASSERT</b></td>
		<td>Cette fonction permet de vérifié le programme. Officiellement, cette fonction ne fonctionne pas.</td>
	</tr>
    <tr>
		<td><b>ATAN</b></td>
		<td>Cette fonction trigonométrique retourne l'«<i>ArcTangente</i>».</td>
	</tr>
    <tr>
		<td><b>ATAN2</b></td>
		<td>Cette fonction trigonométrique retourne l'«<i>Arc Tangente</i>» de <i>Y</i>/<i>X</i>.</td>
	</tr>
    <tr>
		<td><b>ATEXIT</b></td>
		<td>Cette fonction doit être appelée à la fin d'un programme pour le terminer.</td>
	</tr>
    <tr>
		<td><b>ATOF</b></td>
		<td>Cette fonction permet de convertir une chaîne de caractères en une valeur à virgule flottante.</td>
	</tr>
    <tr>
		<td><b>ATOI</b></td>
		<td>Cette fonction convertie une chaîne de caractères en une valeur entière.</td>
	</tr>
    <tr>
		<td><b>ATOL</b></td>
		<td>Cette fonction convertie une chaîne de caractères en une valeur entière longue.</td>
	</tr>
    <tr>
		<td><b>BSEARCH</b></td>
		<td>Cette fonction effectue une recherche binaire (<a href="https://www.gladir.com/CODER/STRUCTURE/recherche-dichotomique.htm">dichotomique</a>) dans un tableau. Officiellement, cette fonction ne fonctionne pas. Il est recommandé d'utilisé «<i>Search::Dict</i>».</td>
	</tr>
    <tr>
		<td><b>CALLOC</b></td>
		<td>Cette fonction permet d'effectuer une réservation de <i>n</i>*taille d'octets de mémoire dynamique.</td>
	</tr>
    <tr>
		<td><b>CEIL</b></td>
		<td>Cette fonction retourne la valeur maximale d’un nombre, soit l’entier le plus proche supérieur ou égal au nombre.</td>
	</tr>
    <tr>
		<td><b>CHDIR</b></td>
		<td>Cette fonction permet de changer de répertoire de travail.</td>
	</tr>
    <tr>
		<td><b>CHMOD</b></td>
		<td>Cette fonction permet de changer les droits d'accès des répertoires et des fichiers.</td>
	</tr>
    <tr>
		<td><b>CHOWN</b></td>
		<td>Cette fonction permet de changer les propriétaires et les groupes de propriétaire (GID) des fichiers.</td>
	</tr>
    <tr>
		<td><b>CLEARERR</b></td>
		<td>Cette fonction permet de réinitialiser les indices d'erreurs et de fin de fichier attend dans un flux de données.</td>
	</tr>
    <tr>
		<td><b>CLOCK</b></td>
		<td>Cette fonction indique le temps que l'ordinateur a utilisé depuis le début de son exécution.</td>
	</tr>
    <tr>
		<td><b>CLOSE</b></td>
		<td>Cette fonction permet de fermer un fichier.</td>
	</tr>
    <tr>
		<td><b>CLOSEDIR</b></td>
		<td>Cette fonction permet de fermer un répertoire ouvert préalablement par «<i>opendir</i>».</td>
	</tr>
    <tr>
		<td><b>COS</b></td>
		<td>Cette fonction trigonométrique retourne le «<i>Cosinus</i>».</td>
	</tr>
    <tr>
		<td><b>COSH</b></td>
		<td>Cette fonction trigonométrique retourne le «<i>Cosinus</i>» hyperbolique.</td>
	</tr>
    <tr>
		<td><b>CREAT</b></td>
		<td>Cette fonction permet de créer un nouveau fichier.</td>
	</tr>
    <tr>
		<td><b>CTERMID</b></td>
		<td>Cette fonction permet de générer le chemin et le nom de fichier pour un contrôle de terminal.</td>
	</tr>
    <tr>
		<td><b>CTIME</b></td>
		<td>Cette fonction permet de convertir une heure sous forme de chaine de caractères.</td>
	</tr>
    <tr>
		<td><b>CUSERID</b></td>
		<td>Cette fonction permet de demander l'identificateur d'utilisateur du propriétaire du processus courant.</td>
	</tr>
    <tr>
		<td><b>DIFFTIME</b></td>
		<td>Cette fonction permet de calculer la différence entre deux dates en secondes.</td>
	</tr>
    <tr>
		<td><b>DIV</b></td>
		<td>Cette fonction permet retourne le quotient et le reste séparément en effectuant la division <i>a</i> par <i>b</i>.</td>
	</tr>
    <tr>
		<td><b>DUP</b></td>
		<td>Cette fonction permet de dupliquer le descripteur de fichier.</td>
	</tr>
    <tr>
		<td><b>DUP2</b></td>
		<td>Cette fonction permet de dupliquer le descripteur de fichier dans un autre fichier de descripteur connu.</td>
	</tr>
    <tr>
		<td><b>ERRNO</b></td>
		<td>Cette fonction permet de retourner le code d'erreur courant.</td>
	</tr>
    <tr>
		<td><b>EXECL</b></td>
		<td>Cette fonction permet d'exécuter un processus enfant avec une liste d'arguments.</td>
	</tr>
    <tr>
		<td><b>EXECLE</b></td>
		<td>Cette fonction permet d'exécuter un processus enfant avec une liste d'arguments et ses variables d'environnement.</td>
	</tr>
    <tr>
		<td><b>EXECLP</b></td>
		<td>Cette fonction permet d'exécuter un processus enfant avec une liste d'arguments et en recherchant le programme dans la variable d'environnement «<i>PATH</i>».</td>
	</tr>
    <tr>
		<td><b>EXECV</b></td>
		<td>Cette fonction permet d'exécuter un processus enfant avec un tableau d'arguments.</td>
	</tr>
    <tr>
		<td><b>EXECVE</b></td>
		<td>Cette fonction permet d'exécuter un processus enfant avec un tableau d'arguments et ses variables d'environnement.</td>
	</tr>
    <tr>
		<td><b>EXECVP</b></td>
		<td>Cette fonction permet d'exécuter un processus enfant avec un tableau d'arguments et en recherchant le programme dans la variable d'environnement «PATH».</td>
	</tr>
    <tr>
		<td><b>EXIT</b></td>
		<td>Cette fonction permet de terminer normalement un script <i>Perl</i>.</td>
	</tr>
    <tr>
		<td><b>EXP</b></td>
		<td>Cette fonction retourne la valeur «<i>exponentielle</i>» sur la base «<i>e</i>».</td>
	</tr>
    <tr>
		<td><b>FABS</b></td>
		<td>Cette fonction calcul la valeur absolue d'un nombre réel.</td>
	</tr>
    <tr>
		<td><b>FCLOSE</b></td>
		<td>Cette fonction permet d'effectuer la fermeture d'un fichier, comme la méthode «<i>IO::Handle::close()</i>».</td>
	</tr>
    <tr>
		<td><b>FCNTL</b></td>
		<td>Cette fonction permet d'effectuer des opérations de contrôle sur un descripteur de fichier.</td>
	</tr>
    <tr>
		<td><b>FDOPEN</b></td>
		<td>Cette fonction permet d'associer un identificateur de fichier <i>Handle</i> à un identificateur de fichier standard, comme la méthode «<i>IO::Handle::new_from_fd()</i>».</td>
	</tr>
    <tr>
		<td><b>FEOF</b></td>
		<td>Cette fonction indique si la fin du fichier est atteint, comme la méthode «<i>IO::Handle::eof()</i>».</td>
	</tr>
    <tr>
		<td><b>FERROR</b></td>
		<td>Cette fonction retourne le code d'erreur d'entrée/sortie du fichier, comme la méthode «<i>IO::Handle::error()</i>».</td>
	</tr>
    <tr>
		<td><b>FFLUSH</b></td>
		<td>Cette fonction vide le tampon du fichier, comme la méthode «<i>IO::Handle::flush()</i>».</td>
	</tr>
    <tr>
		<td><b>FGETC</b></td>
		<td>Cette fonction effectue la lecture d'un caractère dans un fichier, comme la méthode «<i>IO::Handle::getc()</i>».</td>
	</tr>
    <tr>
		<td><b>FGETPOS</b></td>
		<td>Cette fonction demande la position du pointeur dans un fichier, comme la méthode «<i>IO::Seekable::getpos()</i>».</td>
	</tr>
    <tr>
		<td><b>FGETS</b></td>
		<td>Cette fonction effectue la lecture d'une chaine de caractères dans un fichier, comme la méthode «<i>IO::Handle::gets()</i>».</td>
	</tr>
    <tr>
		<td><b>FILENO</b></td>
		<td>Cette fonction permet de demander l'identificateur <i>Handle</i> d'un fichier, comme la méthode «<i>IO::Handle::fileno()</i>».</td>
	</tr>
    <tr>
		<td><b>FLOOR</b></td>
		<td>Cette fonction retourne la valeur minimale d'un nombre, soit l'entier le plus proche inférieur ou égal au nombre.</td>
	</tr>
    <tr>
		<td><b>FMOD</b></td>
		<td>Cette fonction retourne le reste d'une division de <i>a</i>/<i>b</i>.</td>
	</tr>
    <tr>
		<td><b>FOPEN</b></td>
		<td>Cette fonction permet d'ouvrir un fichier, comme la méthode «<i>IO::File::open()</i>».</td>
	</tr>
    <tr>
		<td><b>FORK</b></td>
		<td>Cette fonction permet de créer un processus fils.</td>
	</tr>
    <tr>
		<td><b>FPATHCONF</b></td>
		<td>Cette fonction permet de demander la valeur d'une limite de configuration d'un fichier ou d'un répertoire.</td>
	</tr>
    <tr>
		<td><b>FPRINTF</b></td>
		<td>Cette fonction effectue l'écriture de texte selon un certain format dans un fichier.</td>
	</tr>
    <tr>
		<td><b>FPUTC</b></td>
		<td>Cette fonction effectue l'écriture de caractère dans un fichier.</td>
	</tr>
    <tr>
		<td><b>FPUTS</b></td>
		<td>Cette fonction effectue l'écriture d'une chaine de caractères dans un fichier.</td>
	</tr>
    <tr>
		<td><b>FREAD</b></td>
		<td>Cette fonction effectue la lecture d'un bloc de mémoire de taille <i>n</i>*<i>taille</i> octets dans un fichier.</td>
	</tr>
    <tr>
		<td><b>FREE</b></td>
		<td>Cette fonction permet de libérer un bloc de mémoire.</td>
	</tr>
    <tr>
		<td><b>FREOPEN</b></td>
		<td>Cette fonction ferme le fichier et réouvre un fichier en lui affectant un pointeur.</td>
	</tr>
    <tr>
		<td><b>FREXP</b></td>
		<td>Cette fonction permet d'effectuer la séparation de la mantisse et de l'exposant.</td>
	</tr>
    <tr>
		<td><b>FSCANF</b></td>
		<td>Cette fonction permet la lecture de texte suivant un certain format dans un fichier.</td>
	</tr>
    <tr>
		<td><b>FSEEK</b></td>
		<td>Cette fonction permet de positionner le pointeur d'un fichier, comme la méthode «<i>IO::Seekable::seek()</i>».</td>
	</tr>
    <tr>
		<td><b>FSETPOS</b></td>
		<td>Cette fonction permet de positionner le pointeur d'un fichier, comme la méthode «<i>IO::Seekable::setpos()</i>».</td>
	</tr>
    <tr>
		<td><b>FSTAT</b></td>
		<td>Cette fonction permet de demander l'état d'un fichier.</td>
	</tr>
    <tr>
		<td><b>FSYNC</b></td>
		<td>Cette fonction permet d'effectuer une synchronisation d'un fichier, comme la méthode «<i>IO::Handle::sync()</i>».</td>
	</tr>
    <tr>
		<td><b>FTELL</b></td>
		<td>Cette fonction permet de connaitre la position du pointeur de fichier, comme la méthode «<i>IO::Seekable::tell()</i>».</td>
	</tr>
    <tr>
		<td><b>FWRITE</b></td>
		<td>Cette fonction effectue l'écriture d'un bloc de mémoire de taille <i>n</i>*<i>taille</i> octets dans un fichier.</td>
	</tr>
    <tr>
		<td><b>GETC</b></td>
		<td>Cette fonction permet de lire un caractère dans un fichier et de déplacer le pointeur de fichier vers le caractère suivant.</td>
	</tr>
    <tr>
		<td><b>GETCHAR</b></td>
		<td>Cette fonction permet de lire un caractère dans la sortie standard et de déplacer le pointeur de la sortie standard vers le caractère suivant.</td>
	</tr>
    <tr>
		<td><b>GETCWD</b></td>
		<td>Cette fonction permet de demander le nom du répertoire de travail courant.</td>
	</tr>
    <tr>
		<td><b>GETEGID</b></td>
		<td>Cette fonction permet de demander l'identificateur de groupe effectif.</td>
	</tr>
    <tr>
		<td><b>GETENV</b></td>
		<td>Cette fonction permet de demander la valeur d'une variable d'environnement du système d'exploitation.</td>
	</tr>
    <tr>
		<td><b>GETEUID</b></td>
		<td>Cette fonction permet de demander l'identificateur d'utilisateur effectif.</td>
	</tr>
    <tr>
		<td><b>GETGID</b></td>
		<td>Cette fonction permet de demander l'identificateur de groupe réel.</td>
	</tr>    
    <tr>
		<td><b>GETGRGID</b></td>
		<td>Cette fonction permet de passer à l'élément spécifié du fichier «<i>/etc/groups</i>» à partir d'un numéro de groupe.</td>
	</tr> 
    <tr>
		<td><b>GETGRNAM</b></td>
		<td>Cette fonction permet de passer à l'élément spécifié du fichier «<i>/etc/groups</i>» à partir d'un nom de groupe.</td>
	</tr>
    <tr>
		<td><b>GETGROUPS</b></td>
		<td>Cette fonction permet de demander l'identificateur d'utilisateur supplémentaire de groupe.</td>
	</tr>
    <tr>
		<td><b>GETLOGIN</b></td>
		<td>Cette fonction permet de demander l'utilisateur courant.</td>
	</tr>
    <tr>
		<td><b>GETPGRP</b></td>
		<td>Cette fonction permet de demander le groupe de processus d'un numéro de processus (<i>PID</i>).</td>
	</tr>
    <tr>
		<td><b>GETPID</b></td>
		<td>Cette fonction permet de demander l'identificateur de processus.</td>
	</tr>
    <tr>
		<td><b>GETPPID</b></td>
		<td>Cette fonction permet de connaitre le numéro de processus d'un processus parent.</td>
	</tr>
    <tr>
		<td><b>GETPWNAM</b></td>
		<td>Cette fonction permet de passer à un élément du fichier «<i>/etc/passwd</i>» avec un nom utilisateur spécifié.</td>
	</tr>
    <tr>
		<td><b>GETPWUID</b></td>
		<td>Cette fonction permet de passer à un élément du fichier «<i>/etc/passwd</i>» avec un numéro d'utilisateur spécifié.</td>
	</tr>
    <tr>
		<td><b>GETS</b></td>
		<td>Cette fonction effectue la lecture d'une chaine de caractères à partir de la console standard.</td>
	</tr>
    <tr>
		<td><b>GETUID</b></td>
		<td>Cette fonction permet de demander l'identificateur de l'utilisateur.</td>
	</tr>
    <tr>
		<td><b>GMTIME</b></td>
		<td>Cette fonction convertie des secondes depuis le 1er janvier 1970 en date et heure de <i>Greenwish</i>.</td>
	</tr>
    <tr>
		<td><b>ISALNUM</b></td>
		<td>Cette fonction indique si le caractère est alphanumérique (A à Z et a à z et 0 à 9).</td>
	</tr>
    <tr>
		<td><b>ISALPHA</b></td>
		<td>Cette fonction indique si le caractère est alphabétique (A à Z et a à z).</td>
	</tr>
    <tr>
		<td><b>ISATTY</b></td>
		<td>Cette fonction permet d'indiquer si l'identificateur de fichier <i>Handle</i> est une connexion <i>TTY</i>.</td>
	</tr>
    <tr>
		<td><b>ISCNTRL</b></td>
        <td>Cette fonction indique si le caractère est un caractère de contrôle.</td>
	</tr>
    <tr>
		<td><b>ISDIGIT</b></td>
        <td>Cette fonction indique si le caractère est un nombre.</td>
	</tr>
    <tr>
		<td><b>ISGRAPH</b></td>
        <td>Cette fonction indique si le caractère est un caractère graphique.</td>
	</tr>
    <tr>
		<td><b>ISLOWER</b></td>
        <td>Cette fonction indique si le caractère est une lettre minuscule.</td>
	</tr>
    <tr>
		<td><b>ISPRINT</b></td>
        <td>Cette fonction indique si le caractère est imprimable.</td>
	</tr>
    <tr>
		<td><b>ISPUNCT</b></td>
        <td>Cette fonction indique si le caractère est un signe de ponctuation (!,?,...).</td>
	</tr>
    <tr>
		<td><b>ISSPACE</b></td>
        <td>Cette fonction indique si le caractère est un espace.</td>
	</tr>
    <tr>
		<td><b>ISUPPER</b></td>
        <td>Cette fonction indique si le caractère est une lettre majuscule.</td>
	</tr>
    <tr>
		<td><b>ISXDIGIT</b></td>
        <td>Cette fonction indique si le caractère est un nombre hexadécimal (0 à F).</td>
	</tr>
    <tr>
		<td><b>KILL</b></td>
        <td>Cette fonction permet d'effectuer des commandes sur des processus.</td>
	</tr>
    <tr>
		<td><b>LABS</b></td>
        <td>Cette fonction retourne la valeur absolue d'un entier de type «<i>long</i>».</td>
	</tr>
    <tr>
		<td><b>LDEXP</b></td>
        <td>Cette fonction retourne la valeur de produit par la puissance 2.</td>
	</tr>
    <tr>
		<td><b>LDIV</b></td>
        <td>Cette fonction retourne le reste et le quotient séparément en effectuant la division de <i>a</i> par <i>b</i>.</td>
	</tr>
    <tr>
		<td><b>LINK</b></td>
        <td>Cette fonction permet d'ajouter un lien vers un fichier.</td>
	</tr>
    <tr>
		<td><b>LOCALECONV</b></td>
        <td>Cette fonction permet de demander les informations de format numérique du poste de travail local.</td>
	</tr>
    <tr>
		<td><b>LOCALTIME</b></td>
        <td>Cette fonction convertie des secondes depuis le 1er janvier 1970 en date et heure.</td>
	</tr>
	 <tr>
		<td><b>LOG</b></td>
        <td>Cette fonction retourne le logarithme naturel ou népérien.</td>
	</tr>
    <tr>
		<td><b>LOG10</b></td>
        <td>Cette fonction retourne le logarithme décimal.</td>
	</tr>
    <tr>
		<td><b>LONGJMP</b></td>
        <td>Cette fonction permet d'effectuer la restauration de la pile dans un saut non local.</td>
	</tr>
    <tr>
		<td><b>LSEEK</b></td>
        <td>Cette fonction permet d'effectuer le positionnement du pointeur de fichier <i>Handle</i>.</td>
	</tr>
    <tr>
		<td><b>MALLOC</b></td>
        <td>Cette fonction permet une allocation de mémoire dynamique de «<i>n</i>» octets.</td>
	</tr>
    <tr>
		<td><b>MBLEN</b></td>
        <td>Cette fonction permet de retourner la longueur d'une chaine de caractères de format <i>Unicode</i> ou multi-octets. Officiellement, cette fonction n'est pas supportée par <i>Perl</i>.</td>
	</tr>
    <tr>
		<td><b>MBSTOWCS</b></td>
        <td>Cette fonction permet de convertir une chaine de caractères de format multi-octets en <i>Unicode</i>. Officiellement, cette fonction n'est pas supportée par <i>Perl</i>.</td>
	</tr>
    <tr>
		<td><b>MBTOWC</b></td>
        <td>Cette fonction permet de convertir une chaine de caractères de format multi-octets en <i>Unicode</i>. Officiellement, cette fonction n'est pas supportée par <i>Perl</i>.</td>
	</tr>
    <tr>
		<td><b>MEMCHR</b></td>
        <td>Cette fonction permet de rechercher un caractère dans le tampon de «<i>n</i>» octets.</td>
	</tr>	
    <tr>
		<td><b>MEMCMP</b></td>
        <td>Cette fonction permet de rechercher un tampon de recherche dans le tampon de données de «n» octets.</td>
	</tr>
    <tr>
		<td><b>MEMCPY</b></td>
        <td>Cette fonction permet de copier un tampon source dans un tampon de destination de «<i>n</i>» octets.</td>
	</tr>
    <tr>
		<td><b>MEMMOVE</b></td>
        <td>Cette fonction permet de copier un tampon source dans un tampon de destination de «<i>n</i>» octets.</td>
	</tr>
    <tr>
		<td><b>MEMSET</b></td>
        <td>Cette fonction permet de remplir avec un caractère un tampon de «<i>n</i>» octets.</td>
	</tr>
    <tr>
		<td><b>MKDIR</b></td>
        <td>Cette fonction permet de créer un nouveau répertoire.</td>
	</tr>
    <tr>
		<td><b>MKFIFO</b></td>
        <td>Cette fonction permet de créer un tube <i>FIFO</i> à l'emplacement spécifié.</td>
	</tr>
    <tr>
		<td><b>MKTIME</b></td>
        <td>Cette fonction permet de convertir les informations de date et heure en un temps de calendrier.</td>
	</tr>
    <tr>
		<td><b>MODF</b></td>
        <td>Cette fonction transforme un nombre réel en partie entière et en décimal (fraction).</td>
	</tr>
    <tr>
		<td><b>NICE</b></td>
        <td>Cette fonction permet de modifier les préférences de planification de tâche du processus courant.</td>
	</tr>
    <tr>
		<td><b>OFFSETOF</b></td>
		<td>Cette fonction permet de retourner le nombre d'octets d'un nom de champs à partir de la position du début de la structure d'enregistrement.</td>
	</tr>
    <tr>
		<td><b>OPEN</b></td>
        <td>Cette fonction permet d'effectuer l'ouverture d'un fichier en lecture et écriture.</td>
	</tr>
    <tr>
		<td><b>OPENDIR</b></td>
        <td>Cette fonction permet d'ouvrir un répertoire.</td>
	</tr>
    <tr>
		<td><b>PATHCONF</b></td>
        <td>Cette fonction permet de demander la valeur d'une limite de configuration d'un répertoire ou d'un fichier.</td>
	</tr>
    <tr>
		<td><b>PAUSE</b></td>
        <td>Cette fonction permet de suspendre l'exécution du processus courant jusqu'à ce qu'un signal soit reçu.</td>
	</tr>
    <tr>
		<td><b>PERROR</b></td>
        <td>Cette fonction envoi un message d'erreur sur la sortie standard d'erreur.</td>
	</tr>
    <tr>
		<td><b>PIPE</b></td>
        <td>Cette fonction permet d'effectuer la création d'un canal entre processus.</td>
	</tr>
    <tr>
		<td><b>POW</b></td>
        <td>Cette fonction retourne le calcul de <i>x</i> à la puissance <i>y</i>.</td>
	</tr>
    <tr>
		<td><b>PRINTF</b></td>
        <td>Cette fonction effectue l'écriture de texte selon un certain format sur la console.</td>
	</tr>
    <tr>
		<td><b>PUTC</b></td>
        <td>Cette fonction effectue l'écriture d'un caractère dans un fichier.</td>
	</tr>
    <tr>
		<td><b>PUTCHAR</b></td>
        <td>Cette fonction effectue l'écriture d'un caractère sur la console.</td>
	</tr>
    <tr>
		<td><b>PUTS</b></td>
        <td>Cette fonction effectue l'écriture d'une chaine de caractères sur la console.</td>
	</tr>
    <tr>
		<td><b>QSORT</b></td>
        <td>Cette fonction permet d'effectuer un tri d'un tableau avec la méthode «<i>QuickSort</i>».</td>
	</tr>
 <tr>
   <td>...</td>
   <td>...</td>
  </tr>
 </table>

<h3>Utilisation</h3>

<code>
  Program MonProgram;
  
  Uses POSIX;

  BEGIN
   { ... appeler les fonctions désirés ici }
  END.
</code>

<h3>Remarques</h3>
<ul>
  <li>Certaines fonctions comme IsAlNum, IsAlpha, IsATTY, IsCntrl, IsDigit, IsGraph, IsLower, IsPrint, IsPunct, IsSpace, IsUpper et IsXDigit retourne un type de données "BOOLEAN" et non pas Integer comme en langage de programation C.</li>
  <li>Lorsque la fonction ne dispose que d'un prototype sans corps de fonction, il retourne un message "NON IMPLEMENTEE". Cette situation se produit particulièrement lorsqu'il s'agit d'une fonction spécifique à UNIX.</li>
</ul>

