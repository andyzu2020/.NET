Imports System.Threading


Public Sub inicializar()
    Dim trd2 As New Thread(AddressOf obtieneRAM)
    trd2.IsBackground = True
    trd2.Start()
End Sub

Private Sub obtieneRAM()
    Try
        Dim mem As String = ""
        While (1 = 1)
            mem = System.Environment.WorkingSet.ToString
            Thread.Sleep(500)
            seteaRAM(mem)
        End While
    Catch ex As Exception
    End Try
End Sub

Delegate Sub SetTextCallback(ByVal text As String)

Private Sub seteaRAM(ByVal memoria As String)
    Try
        If Form1.lblTi2.InvokeRequired Then
            Dim d As New SetTextCallback(AddressOf seteaRAM)
            Form1.Invoke(d, New Object() {memoria})
        Else
            Form1.lblTi2.Text = memoria
        End If
    Catch ex As Exception
        MessageBox.Show("Error con el chequeo de memoria.", "Error leve", MessageBoxButtons.OK, MessageBoxIcon.Error)
    End Try
End Sub