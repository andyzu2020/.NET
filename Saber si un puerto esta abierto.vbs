Imports System.Net.Sockets
 
Public Function IsPortOpen(ByVal Host As String, ByVal Port As Integer) As Boolean
    Dim m_sck As New Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp)
    Try
        m_sck.Connect(Host, Port)
        Return True
    Catch ex As SocketException
        'Código para manejar error del socket (cerrado, conexión rechazada)
    Catch ex As Exception
        'Código para manejar otra excepción
    End Try
    Return False
End Function