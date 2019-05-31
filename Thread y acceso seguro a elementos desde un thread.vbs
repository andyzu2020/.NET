Imports System.Threading

Private trd As Thread

Private sub IniciarSubproceso()
    trd = New Thread(AddressOf ThreadTask)
    trd.IsBackground = True
    trd.Start()
End Sub

Private Sub ThreadTask()
    'Lo que quiero que haga el subproceso.

End Sub



'********************************************************
'* Si se intenta acceder a un elemento de un formulario *
'********************************************************
'NOTA: Aveces se pone puto y no inicia en el load, despues funciona ok.

Imports System.Threading

Private sub IniciarSubproceso()
    Dim trd2 As New Thread(AddressOf enOtroHilo)
    trd2.IsBackground = True
    trd2.Start()
End Sub

Private Sub enOtroHilo()
    SetText("Esto NO dará error")
End Sub

Delegate Sub SetTextCallback(ByVal text As String)

Private Sub SetText(ByVal text As String)
    If TextBox1.InvokeRequired Then
        Dim d As New SetTextCallback(AddressOf SetText)
        Me.Invoke(d, New Object() {text})
    Else
        Me.TextBox1.Text = text
    End If
End Sub