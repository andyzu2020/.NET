Manipulación de        (23/8/2014) cadenas

http://msdn.microsoft.com/es-es/library/aa903372(v=vs.71).aspx        (23/8/2014)

Dim aString As String = "SomeString"
Dim bString As String
bString = Mid(aString, 3, 3)
En este ejemplo, la función Mid realiza una operación directa en aString y asigna el valor a bString.
También puede manipular cadenas con los métodos de la clase String. Existen dos tipos de métodos en String: métodos compartidos y métodos de instancia.
Un método compartido es un método que se deriva de la propia clase String y no necesita una instancia de dicha clase para funcionar. Estos métodos se pueden calificar con el nombre de la clase (String) en vez de con una instancia de dicha clase. Por ejemplo:
Dim aString As String
bString = String.Copy("A literal string")
En el ejemplo anterior, el método String.Copy es un método estático, que actúa sobre una expresión dada y asigna el valor resultante a bString.
En contraste, los métodos de instancia se derivan de una instancia concreta de String y deben calificarse con el nombre de la instancia. Por ejemplo:
Dim aString As String = "A String"
Dim bString As String
bString = aString.SubString(2,6) ' bString = "String"
En este ejemplo, el método SubString es un método de la instancia de String (es decir, aString). Realiza una operación en aString y asigna ese valor a bString.
Nothing y cadenas
El tiempo de ejecución de Visual Basic y .NET Framework evalúan Nothing de modo diferente cuando se trata de cadenas. Considere el ejemplo siguiente:
Dim MyString As String = "This is my string"
Dim stringLength As Integer
' Explicitly set the string to Nothing.
MyString = Nothing
' stringLength = 0
stringLength = Len(MyString)
' This line, however, causes an exception to be thrown.
stringLength = MyString.Length
El tiempo de ejecución de Visual Basic .NET evalúa Nothing como una cadena vacía, es decir, como "". Sin embargo, .NET Framework, no lo hace, e iniciará una excepción cuando se intente realizar una operación de cadena en Nothing.
Comparar cadenas
Puede comparar dos cadenas con el método String.Compare. Éste es un método estático sobrecargado de la clase de cadena base. En su forma más común, este método puede utilizarse para comparar directamente dos cadenas basándose en el orden alfabético. Funciona de manera similar a la función StrComp (Función) de Visual Basic. En el siguiente ejemplo se ilustra cómo se utiliza este método:
Dim myString As String = "Alphabetical"
Dim secondString As String = "Order"
Dim result As Integer
result = String.Compare (myString, secondString)
Este método devuelve un entero que indica la relación entre las dos cadenas comparadas basándose en el criterio de ordenación. Un resultado con un valor positivo indica que la primera cadena es mayor que la segunda. Un resultado negativo indica que la primera cadena es más pequeña y cero indica igualdad entre la dos cadenas. Cualquier cadena, incluida una cadena vacía, se evalúa como mayor que una referencia nula.
Las sobrecargas adicionales del método String.Compare permiten indicar si deben tenerse en cuenta los formatos de mayúsculas y minúsculas y las referencias culturales, y si deben compararse subcadenas dentro de las cadenas proporcionadas. Para obtener más información sobre cómo comparar cadenas, vea el método String.Compare (Método). Otros métodos relacionados son String.CompareOrdinal (Método) y String.CompareTo (Método).
Buscar cadenas dentro de cadenas
En ocasiones es útil tener información sobre los caracteres de una cadena y de su posición dentro de la cadena. Una cadena se puede considerar como una matriz de caracteres (instancias Char); se puede recuperar un carácter concreto haciendo referencia al índice de dicho carácter a través de la propiedad Chars. Por ejemplo:
Dim myString As String = "ABCDE"
Dim myChar As Char
myChar = myString.Chars(3) ' myChar = "D"
Puede utilizar el método String.IndexOf para que devuelva el índice donde se encuentra un carácter concreto, como en el siguiente ejemplo:
Dim myString As String = "ABCDE"
Dim myInteger As Integer
myInteger = myString.IndexOf("D")  ' myInteger = 3
En el ejemplo anterior, se utilizó el método IndexOf de myString para obtener el índice correspondiente a la primera instancia del carácter "C" de la cadena. IndexOf es un método sobrecargado; las otras sobrecargas proporcionan métodos para buscar cualquiera de los caracteres de un conjunto o una cadena dentro de otra cadena, entre otros. El comando InStr de Visual Basic .NET también permite realizar funciones similares. Para obtener más información sobre estos métodos, vea String.IndexOf (Método) e InStr (Función). También puede utilizar String.LastIndexOf (Método) para buscar la última aparición de un carácter en una cadena.
Crear nuevas cadenas a partir de cadenas existentes
Cuando utiliza cadenas, puede que desee modificar las que tiene para crear otras nuevas. Puede que desee hacer algo tan simple como convertir toda la cadena a mayúsculas o eliminar los espacios finales; o hacer algo más complejo, como extraer una subcadena de una cadena. La clase System.String proporciona una amplia gama de opciones para modificar, manipular y crear nuevas cadenas a partir de las existentes.
Para combinar varias cadenas, puede utilizar los operadores de concatenación (& o +). También puede utilizar String.Concat (Método) para concatenar una serie de cadenas o cadenas contenidas en objetos. A continuación se muestra un ejemplo del método String.Concat:
Dim aString As String = "A"
Dim bString As String = "B"
Dim cString As String = "C"
Dim dString As String = "D"
Dim myString As String
' myString = "ABCD"
myString = String.Concat(aString, bString, cString, dString) 
Las cadenas se pueden convertir en cadenas totalmente en mayúsculas o totalmente minúsculas con funciones de Visual Basic .NET UCase (Función) o LCase (Función) o mediante los métodos String.ToUpper (Método) y String.ToLower (Método). A continuación se muestra un ejemplo:
Dim myString As String = "UpPeR oR LoWeR cAsE"
Dim newString As String
' newString = "UPPER OR LOWER CASE"
newString = UCase(myString)
' newString = "upper or lower case"
newString = LCase(myString)
' newString = "UPPER OR LOWER CASE"
newString = myString.ToUpper
' newString = "upper or lower case"
newString = myString.ToLower
El método String.Format y el comando Format de Visual Basic .Net pueden generar una nueva cadena mediante la aplicación de formato a una cadena determinada. Para obtener información sobre estos comandos, vea Format (Función) o String.Format (Método).
A veces puede ser necesario eliminar espacios iniciales o finales de una cadena. Por ejemplo, podría estar analizando una cadena que tiene espacios insertados con fines de alineación. Puede eliminar esos espacios con la función String.Trim (Método) o con la función Trim de Visual Basic .NET. A continuación se muestra un ejemplo:
Dim spaceString As String = _
"        This string will have the spaces removed        "
Dim oneString As String
Dim twoString As String
' This removes all trailing and leading spaces.
oneString = spaceString.Trim
' This also removes all trailing and leading spaces.
twoString = Trim(spaceString)
Si sólo desea quitar los espacios finales, puede utilizar el método String.TrimEnd (Método) o la función RTrim. Del mismo modo, si desea quitar los espacios iniciales, puede utilizar el método String.TrimStart (Método) o la función LTrim. Para obtener más información, vea las funciones LTrim, RTrim y Trim (Funciones).
Las funciones String.Trim y otras relacionadas también permiten eliminar instancias de un carácter específico al final de las cadenas. El siguiente ejemplo elimina todas las instancias iniciales y finales del carácter "#":
Dim myString As String = "#####Remove those!######"
Dim oneString As String
OneString = myString.Trim("#")
También puede agregar caracteres iniciales o finales mediante los métodos String.PadLeft (Método) o String.PadRight (Método).
Si tiene exceso de caracteres en el cuerpo de la cadena, puede eliminarlos con String.Remove (Método), o puede reemplazarlos con otro carácter mediante String.Replace (Método). Por ejemplo:
Dim aString As String = "This is My Str@o@o@ing"
Dim myString As String
Dim anotherString As String
' myString = "This is My String"
myString = aString.Remove(14, 5)
' anotherString = "This is Another String"
anotherString = myString.Replace("My", "Another")
Puede utilizar el método String.Replace para reemplazar caracteres individuales o cadenas de caracteres. La instrucción Mid (Instrucción) de Visual Basic .NET también se puede utilizar para reemplazar una cadena interior por otra.
Asimismo, puede utilizar String.Insert (Método) para insertar una cadena dentro de otra, como en el ejemplo siguiente:

Dim aString As String = "This is My Stng"
Dim myString As String
' Results in a value of "This is My String".
myString = aString.Insert(13, "ri")
El primer parámetro del método String.Insert es el índice del carácter tras el cual se insertará la cadena, y el segundo parámetro es la cadena que se va a insertar.
Se puede concatenar una matriz de cadenas con una cadena separadora mediante String.Join (Método). El siguiente es un ejemplo:
Dim shoppingItem(2) As String
Dim shoppingList As String
shoppingItem(0) = "Milk"
shoppingItem(1) = "Eggs"
shoppingItem(2) = "Bread"
shoppingList = String.Join(",", shoppingItem)
El valor de shoppingList tras ejecutar este código es "Milk,Eggs,Bread". Es de reseñar que si la matriz tiene miembros vacíos, el método agrega igualmente una cadena separadora entre todas las instancias vacías de la matriz.
También se puede crear una matriz de cadenas a partir de una sola cadena mediante String.Split (Método). En el siguiente ejemplo se demuestra lo contrario que en el ejemplo anterior: se convierte una lista de la compra en una matriz de artículos de la compra. En este caso el separador es una instancia del tipo de datos Char; por tanto, se le agrega el carácter de tipo literal c.
Dim shoppingList As String = "Milk,Eggs,Bread"
Dim shoppingItem(2) As String
shoppingItem = shoppingList.Split(","c)
La función Mid (Función) de Visual Basic .NET puede utilizarse para agregar subcadenas a una cadena. En el siguiente ejemplo se muestra el uso de estas funciones:
Dim aString As String = "Left Center Right"
Dim rString, lString, mString As String
' rString = "Right"
rString = Mid(aString, 13)
' lString = "Left"
lString = Mid(aString, 1, 4)
' mString = "Center"
mString = Mid(aString, 6,6)
También se pueden generar subcadenas de una cadena con String.Substring (Método). Este método acepta dos argumentos: el índice del carácter donde debe comenzar la subcadena y la longitud de la subcadena. El método String.Substring funciona de modo similar a la función Mid. A continuación se muestra un ejemplo:
Dim aString As String = "Left Center Right"
Dim subString As String
' subString = "Center"
subString = aString.SubString(5,6)
Existe una diferencia muy importante entre el método String.SubString y la función Mid. La función Mid toma un argumento que indica la posición del carácter donde debe comenzar la subcadena, a partir de la posición 1. El método String.SubString toma un índice del carácter de la cadena donde debe comenzar la subcadena, a partir de la posición 0. Así, si tiene una cadena "ABCDE", los caracteres individuales se numeran 1,2,3,4,5 si se utilizan con la función Mid, y 0,1,2,3,4 si se utilizan con el función System.String.