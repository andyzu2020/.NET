'Nombre de espacio que me permite trabajar
Imports System.Drawing

'Codigo para el evento Load del Formulario

'Empezamos declarando la variable y el tipo
Dim objDraw As System.Drawing.Drawing2D.GraphicsPath = _
New System.Drawing.Drawing2D.GraphicsPath

'Definimos la Elipse (con esto le damos una forma redonda al Formulario)
objDraw.AddEllipse(0, 0, Me.Width, Me.Height)
Me.Region = New Region(objDraw)