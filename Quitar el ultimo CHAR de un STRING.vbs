Dim str As String = "Texto de prueba"
str = str.Remove(str.Length - 1)

' Otra forma
Dim str As String = "Texto de prueba"
str.Substring(0, str.Length - 1)