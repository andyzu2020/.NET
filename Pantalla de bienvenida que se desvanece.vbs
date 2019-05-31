Private Sub frmBienvenida_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
	Temporizador.Start()
End Sub

Sub Temporizador_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Temporizador.Tick
	While Me.Opacity > 0
		Me.Opacity -= 0.00001
	End While

	Me.Close()
End Sub