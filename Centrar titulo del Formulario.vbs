Private Sub centrarTituloDelForm()
	Dim g As Graphics = Me.CreateGraphics()
	Dim startingPoint As Double = (Me.Width / 2) - (g.MeasureString(Me.Text.Trim(), Me.Font).Width / 2)
	Dim widthOfASpace As Double = g.MeasureString(" ", Me.Font).Width
	Dim tmp As String = " "
	Dim tmpWidth As Double = 0

	While ((tmpWidth + widthOfASpace) < startingPoint)

		tmp += " "
		tmpWidth += widthOfASpace
	End While

	Me.Text = tmp + Me.Text.Trim()
End Sub