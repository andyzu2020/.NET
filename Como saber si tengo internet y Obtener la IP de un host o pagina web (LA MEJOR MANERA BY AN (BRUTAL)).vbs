Imports System.Net.Sockets
Imports System.Net

Public Class SaberSiEstoyOnline
#Region "06 - Detectar si tengo internet (esta prueba paso el mejor firewall de Capa 5 del modelo OSI)"
    Public Function estoyOnline() As Boolean

        Try
            Dim TcpClient As New TcpClient
            Dim IP As IPAddress
            Dim Host As String = "www.google.com.uy"

            ' Obtener la/s IP/IPs de www.google.com.uy aun si el sistema esta Firewaleado 
            Dim IPs As IPHostEntry = Dns.GetHostEntry(Host)
            Dim Direcciones As IPAddress() = IPs.AddressList

            ' Se carga la unica o la ultima IP
            For i_cont As Integer = 0 To i_cont = Direcciones.Length
                IP = Direcciones(i_cont)
            Next

            TcpClient.Connect(IP, "80")
            TcpClient.Close()
        Catch ex As Exception
            frmPpal.rtxtLogs.Text = frmPpal.rtxtLogs.Text & vbCrLf & "Error al obtener la IP de www.google.com.uy en la clase SaberSiEstoyOnline " & vbCrLf & ex.Message & vbCrLf
            Return False
        End Try
        Return True

    End Function
#End Region
End Class