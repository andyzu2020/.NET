'EN LA PROPIEDAD FORM BORDER STYLE ELEGIR "NONE", YA QUE EL BORDE 
'SE LE APLICA AL CONTORNO DEL FORMULARIO PERO NO A LA BARA DE TITULO
'QUE LO ENVUELVE.


Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
    MyBase.OnPaint(e)
    Dim AnchoBorde As Integer = 10
    Dim ColorBorde As Color = Color.Gold
    ControlPaint.DrawBorder(e.Graphics, e.ClipRectangle, ColorBorde,
    AnchoBorde, ButtonBorderStyle.Outset, ColorBorde, AnchoBorde,
    ButtonBorderStyle.Outset, ColorBorde, AnchoBorde, ButtonBorderStyle.Inset,
    ColorBorde, AnchoBorde, ButtonBorderStyle.Inset)
End Sub

Dim ex, ey As Integer
Dim Arrastre As Boolean

'Estas tres subrutinas permiten desplazar el formulario. 
' SI CAMBIO MyBase en los Handles, POR OTRO ELEMENTO DEL FORMULARIO todo el formulario se mueve!!

Private Sub Form1_MouseDown(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles MyBase.MouseDown
    ex = e.X
    ey = e.Y
    Arrastre = True
End Sub

Private Sub Form1_MouseUp(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles MyBase.MouseUp
    Arrastre = False
End Sub

Private Sub Form1_MouseMove(ByVal sender As Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles MyBase.MouseMove
    'Si el formulario no tiene borde (FormBorderStyle = none) la siguiente linea funciona bien
    If Arrastre Then Me.Location = Me.PointToScreen(New Point(Control.MousePosition.X - Me.Location.X - ex, Control.MousePosition.Y - Me.Location.Y - ey))
    'pero si quieres dejar los bordes y la barra de titulo entonces es necesario descomentar la siguiente linea y comentar la anterior, osea ponerle el apostrofe
    'If Arrastre Then Me.Location = Me.PointToScreen(New Point(Me.MousePosition.X - Me.Location.X - ex - 8, Me.MousePosition.Y - Me.Location.Y - ey - 60))
End Sub