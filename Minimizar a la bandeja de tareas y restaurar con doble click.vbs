' Setear las propiedades del NotifyIcon:
' visible = false
' name = trayIcon
' un icono


'Codigo para ocultar el programa en la barra de tareas
Private Sub frmPpal_Res(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Me.Resize
	If (FormWindowState.Minimized = WindowState) Then
		Hide()
		trayIcon.Visible = True
	End If
End Sub

'Codigo para que cuando se haga doble click sobre el icono se restaure el programa
Private Sub frmPpal_MDC(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles trayIcon.DoubleClick
	Me.Show()
	Me.WindowState = FormWindowState.Normal 'Maximizo la ventana
	Me.CenterToScreen()
	trayIcon.Visible = False
End Sub