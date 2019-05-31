' Este codigo va en el Form1

Imports System.Security.Principal

Public Class Elevar_privilegios_de_aplicacion_a_admin
    Friend Function IsRunAsAdmin() As Boolean
        Dim principal As New WindowsPrincipal(WindowsIdentity.GetCurrent)
        Return principal.IsInRole(WindowsBuiltInRole.Administrator)
    End Function



    Public Sub Elevar_privilegios()
        ' Eleva el proceso si no es administrador
        If (Not Me.IsRunAsAdmin) Then
            'Lanza de forma segura el administrador
            Dim proc As New ProcessStartInfo
            proc.UseShellExecute = True
            proc.WorkingDirectory = Environment.CurrentDirectory
            proc.FileName = Application.ExecutablePath
            proc.Verb = "runas"

            Try
                Process.Start(proc)
            Catch ex As Exception
                MessageBox.Show(ex.Message & " Error al elevar los privilegios de la aplicacion.")
                Return
            End Try

            Application.Exit()  'Cerrar de forma segura, modificar segun el caso.
        Else
            MessageBox.Show("El proceso esta corriendo como administrador.", "UAC")
        End If
    End Sub
End Class