How it works:
Connecting without proxy:
1. Request Connection to DestinationServer:DestinationPort
2. Destination Connected 
3. Start Receiving/Sending Data to Destination

Connecting with proxy: 
1. Request Connection to ProxyServer:ProxyPort
2. If needed, provide Authentication Details for proxy server
3. ProxyServer connected
4. Passing our DestinationServer/port Details to Proxy Server
5. ProxyServer itself connects to the DestinationServer
6. Start Receiving/Sending Data to Destination

Code
Lets have 2 reusable class files for Proxy Connection
Vamos a tener 2 archivos de clases reutilizables para conexión Proxy



Proxy.vb

Public MustInherit Class Proxy
Private _server As String
Private _port As Integer
Private _user As String
Private _password As String
Public Property Server() As String
   Get
       Return _server
   End Get
   Set(ByVal value As String)
       _server = value
   End Set
End Property
Public Property Port() As Integer
   Get
       Return _port
   End Get
   Set(ByVal value As Integer)
       _port = value
   End Set
End Property
Public Property User() As String
   Get
       Return _user
   End Get
   Set(ByVal value As String)
       _user = User
   End Set
End Property
Public Property Password() As String
   Get
       Return _password
   End Get
   Set(ByVal value As String)
       _password = Password
   End Set
End Property
Public ReadOnly Property ProxyIPEndPoint() As IPEndPoint
   Get
       Return New IPEndPoint(Dns.GetHostEntry(_server).AddressList(0), _port)
   End Get
End Property
Public Sub New(ByVal Server As String, ByVal Port As Integer, ByVal User As String, ByVal Password As String)
   _server = Server
   _port = Port
   _user = User
   _password = Password
End Sub

End Class



SocksProxy.vb

Imports System.Net.Sockets
Imports System.Net
Imports System.Text



Public Class SocksProxy
Inherits Proxy
Private _cSocket As Socket
Private _destHost As String
Private _destPort As String
Enum ProxyState
RequestAuthenticate
Authenticate
     ConnectServer
     Done
End Enum
Private sPxy As ProxyState
Private Const BUFFER_SIZE As Integer = 512
Private transferBuffer(BUFFER_SIZE) As Byte
Public Event Completed(ByVal sender As Object, ByVal e As SocketAsyncEventArgs)
Public Sub New(ByVal Server As String, ByVal Port As Integer, ByVal User As String, ByVal Password As String)
MyBase.New(Server, Port, User, Password)
End Sub
Public Sub New(ByVal p As Proxy)
MyBase.New(p.Server, p.Port, p.User, p.Password)
End Sub

Public Sub Connect(ByVal s As Socket, ByVal destHost As String, ByVal destPort As Integer)
Dim connectEventArgs As New SocketAsyncEventArgs
_destHost = destHost
_destPort = destPort
_cSocket = s
connectEventArgs.RemoteEndPoint = ProxyIPEndPoint
AddHandler connectEventArgs.Completed, AddressOf connectEventProxyArgs_Completed
_cSocket.ConnectAsync(connectEventArgs)
End Sub
#Region "SOCKS5 Proxy Functions"
Private Sub connectEventProxyArgs_Completed(ByVal sender As Object, ByVal e As SocketAsyncEventArgs)
If e.SocketError <> SocketError.Success Then
 Throw New Exception(e.SocketError.ToString)
 Return
End If

RemoveHandler e.Completed, AddressOf connectEventProxyArgs_Completed
     AddHandler e.Completed, AddressOf receiveEventProxyArgs_Completed

     e.SetBuffer(transferBuffer, 0, transferBuffer.Length)
     _cSocket.ReceiveAsync(e)

sPxy = ProxyState.RequestAuthenticate
sendProxyData()
End Sub
Private Sub receiveEventProxyArgs_Completed(ByVal sender As Object, ByVal e As SocketAsyncEventArgs)
If e.SocketError <> SocketError.Success Then
 Throw New Exception(e.SocketError.ToString)
 Return
End If
Try
 Dim bRec(e.BytesTransferred) As Byte
 Buffer.BlockCopy(transferBuffer, e.Offset, bRec, 0, e.BytesTransferred)
 Process_Proxy_Data(bRec, e)
         If sPxy <> ProxyState.Done Then _cSocket.ReceiveAsync(e)
Catch ex As Exception
 Throw New Exception(ex.Message)
End Try

End Sub
Private Sub sendProxyData()
Dim request(257) As Byte
Dim rawBytes() As Byte
Dim nIndex As UShort = 0
Try
 Select Case sPxy
   Case ProxyState.RequestAuthenticate
     request(nIndex) = &H5 : nIndex += 1 ' Version 5.
     If User <> "" Then 'only if provided
       request(nIndex) = &H2 : nIndex += 1 '  2 Authentication methods are in packet...
       request(nIndex) = &H0 : nIndex += 1  ' NO AUTHENTICATION REQUIRED
       request(nIndex) = &H2 : nIndex += 1  ' USERNAME/PASSWORD
     Else
       request(nIndex) = &H1 : nIndex += 1 '  1 Authentication method in packet...
       request(nIndex) = &H0 : nIndex += 1  ' NO AUTHENTICATION REQUIRED
     End If
     ' Send the authentication negotiation request...
                 _cSocket.Send(request, nIndex, SocketFlags.None)
             Case ProxyState.Authenticate
                 'Username/Password Authentication protocol
                 request(nIndex) = &H1 : nIndex += 1    ' Current version of the subnegotiation.
                 ' add user name
                 request(nIndex) = CType(User.Length, Byte) : nIndex += 1
                 rawBytes = Encoding.Default.GetBytes(User)
                 rawBytes.CopyTo(request, nIndex)
                 nIndex += CType(rawBytes.Length, UShort)

                 ' add password
                 request(nIndex) = CType(Password.Length, Byte) : nIndex += 1
                 rawBytes = Encoding.Default.GetBytes(Password)
                 rawBytes.CopyTo(request, nIndex)
                 nIndex += CType(rawBytes.Length, UShort)

                 ' Send the Username/Password request
                 _cSocket.Send(request, nIndex, SocketFlags.None)
   Case ProxyState.ConnectServer
     Dim destIP As IPAddress = Nothing
     Try
       destIP = IPAddress.Parse(_destHost)
     Catch ex As Exception
     End Try
     request(nIndex) = &H5 : nIndex += 1 ' version 5.
     request(nIndex) = &H1 : nIndex += 1 ' command = connect.(connect=1; bind=2; UDP=3)
     request(nIndex) = &H0 : nIndex += 1 ' Reserve = must be 0x00

     If (Not destIP Is Nothing) Then
       ' Destination adress in an IP.
       Select Case (destIP.AddressFamily)
         Case AddressFamily.InterNetwork
           ' Address is IPV4 format(IP-V4=1; domain name=3; IP-V6=4)
           request(nIndex) = &H1 : nIndex += 1
           rawBytes = destIP.GetAddressBytes()
           rawBytes.CopyTo(request, nIndex)
           nIndex += CType(rawBytes.Length, UShort)
         Case AddressFamily.InterNetworkV6
           ' Address is IPV6 format
           request(nIndex) = &H4 : nIndex += 1
           rawBytes = destIP.GetAddressBytes()
           rawBytes.CopyTo(request, nIndex)
           nIndex += CType(rawBytes.Length, UShort)
       End Select
     Else
       ' Dest. address is domain name.
       request(nIndex) = &H3 : nIndex += 1 ' Address is full-qualified domain name.
       request(nIndex) = Convert.ToByte(_destHost.Length) : nIndex += 1 ' length of addres_cSocket.
       rawBytes = Encoding.Default.GetBytes(_destHost)
       rawBytes.CopyTo(request, nIndex)
       nIndex += CType(rawBytes.Length, Short)
     End If
     request(nIndex) = Convert.ToByte((_destPort And &HFF00) >> 8) : nIndex += 1
     request(nIndex) = Convert.ToByte(_destPort And &HFF) : nIndex += 1
     ' send connect request.
     _cSocket.Send(request, nIndex, SocketFlags.None)
 End Select
Catch ex As Exception
 Throw New Exception(ex.Message)
End Try
End Sub
Private Sub Process_Proxy_Data(ByVal pMessage() As Byte, ByVal e As SocketAsyncEventArgs)
If pMessage.Length < 2 Then Return
Dim response(257) As Byte

Dim nIndex As UShort = 0


Select Case sPxy
 Case ProxyState.RequestAuthenticate
   If pMessage(1) = &H0 Then
     'No Authentication required
     sPxy = ProxyState.ConnectServer
     sendProxyData()
   ElseIf pMessage(1) = &H2 Then
     'Authentication required
     sPxy = ProxyState.Authenticate
     sendProxyData()
   Else
     Throw New Exception("None of the authentication method was accepted by proxy server.")
   End If
 Case ProxyState.Authenticate
   If pMessage(1) = &H0 Then
     'Authentication Success
     sPxy = ProxyState.ConnectServer
     sendProxyData()
   Else
     Throw New Exception("Bad Username/Password.")
   End If
 Case ProxyState.ConnectServer
   If pMessage(1) = &H0 Then
     'Connected
                 ' Change the Handler to Regular Receive Event
                 RemoveHandler e.Completed, AddressOf receiveEventProxyArgs_Completed
                 sPxy = ProxyState.Done
     RaiseEvent Completed(_cSocket, e)
   Else
     Throw New Exception("Unable to connect Proxy Server.")
             End If
     End Select
End Sub
#End Region
End Class



After including the above 2 class files, you can connect to a destination either directly or via proxy(if defined)

Public Class MyClass
Private _cSocket As Socket

Public Function Connect() As Boolean
Dim server As String = "[destinationServer]"
Dim port As Integer ="[destinationPort]"
Dim clientproxy As Proxy = Nothing

  clientproxy=new Proxy("[proxyServer]","[proxyPort]","[uname]","[pwd]")

  _cSocket = New Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp)
  Dim connectEventArgs As New SocketAsyncEventArgs

        If clientproxy Is Nothing Then
            connectEventArgs.RemoteEndPoint = New IPEndPoint(Dns.GetHostEntry(server).AddressList(0), port)
            AddHandler connectEventArgs.Completed, AddressOf connectEventArgs_Completed
            _cSocket.ConnectAsync(connectEventArgs)
        Else
            socksProxy = New SocksProxy(clientproxy)
            AddHandler socksProxy.Completed, AddressOf connectEventArgs_Completed
            socksProxy.Connect(_cSocket, server, port)
        End If
  Return True

End Function