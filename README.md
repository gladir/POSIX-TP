# POSIX-TP
Clone des fonctions de la bibliothèque POSIX en Turbo Pascal

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

