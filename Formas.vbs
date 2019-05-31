Dim bm1 As Bitmap = Image.FromFile(txtFile1.Text)
Dim bm2 As Bitmap = Image.FromFile(txtFile2.Text)

' Make a difference image.
Dim wid As Integer = Math.Min(bm1.Width, bm2.Width)
Dim hgt As Integer = Math.Min(bm1.Height, bm2.Height)
Dim bm3 As New Bitmap(wid, hgt)

' Create the difference image.
Dim are_identical As Boolean = True
Dim r1, g1, b1, r2, g2, b2, r3, g3, b3 As Integer
Dim eq_color As Color = Color.White
Dim ne_color As Color = Color.Red
For x As Integer = 0 To wid - 1
	For y As Integer = 0 To hgt - 1
		If bm1.GetPixel(x, y).Equals(bm2.GetPixel(x, _
			y)) Then
			bm3.SetPixel(x, y, eq_color)
		Else
			bm3.SetPixel(x, y, ne_color)
			are_identical = False
		End If
	Next y
Next x

' Display the result.
picResult.Image = bm3

Me.Cursor = Cursors.Default
If (bm1.Width <> bm2.Width) OrElse (bm1.Height <> _
	bm2.Height) Then are_identical = False
If are_identical Then
	MessageBox.Show("The images are identical")
Else
	MessageBox.Show("The images are different")
End If

bm1.Dispose()
bm2.Dispose()

'#########################################################################################################
'#########################################################################################################	
'#########################################################################################################	
	
Public Function GetPixels(ByVal I As Bitmap) As List(Of Integer)
	GetPixels = New List(Of Integer)
	Dim X As Integer = 0, Y As Integer = 0

	While X <> I.Width AndAlso Y <> I.Height
		GetPixels.Add(I.GetPixel(X, Y).ToArgb)
		X += 1
		Y += 1
	End While

End Function
	
	
Public Function porcentajeDeDiferencia(ByVal pathImagen1 As String, ByVal pathImagen2 As String) As String
	
	Try
		Dim I1 As New Bitmap(pathImagen1) ' ("C:\1.jpg")
		Dim I2 As New Bitmap(pathImagen2) ' ("C:\2.jpg")

		Dim A As Long = 0
		Dim B As Long = 0

	For Each C As Integer In GetPixels(I1)
		For Each D As Integer In GetPixels(I2)
			If C <> D Then
				A += 1
			End If
			B += 1
		Next
	Next

	Return ("Similares: " & A &
		   vbNewLine & _ 
		   "Análizados: " & B _
		   & vbNewLine & _
		   "Porcentaje de igualdad: " & Math.Round(A / B * 100, 2) & "%")
	Catch ex As Exception
		MessageBox.Show("Error en el procesamiento de las imagenes." & vbCrLf & ex.Message, "Error al comparar", MessageBoxButtons.OK, MessageBoxIcon.Error)
	Return "Error al procesar las imagenes"
	End Try
		
End Function
		
		
		
		
		
		
		
		
		
		
		