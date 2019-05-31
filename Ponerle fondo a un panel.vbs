En el evento Load establecer lo siguiente:

Me.pnlPpal.BackgroundImage = My.Resources.imagenPpal
'En este caso tengo una imagen llamada "imagenPpal" como recurso, sino iria 'entre parentesis y comillas la ruta absoluta.


Fuera del evento Load:

Private Sub Form_Resize()
    Me.pnlPpal.Width = Me.Width
    Me.pnlPpal.Height = Me.Height
End Sub