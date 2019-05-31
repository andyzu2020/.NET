Imports System.Net.NetworkInformation
Imports System.Net.Sockets
Imports System.Net

Module Module1

    Sub Main()
        NuevoComienzo()
        Console.ReadLine()
    End Sub

    Public Sub NuevoComienzo()
        For Each ni As NetworkInterface In NetworkInterface.GetAllNetworkInterfaces()
            If ni.OperationalStatus <> OperationalStatus.Up Then
                ' The interface is disabled; skip it.
                Continue For
            End If

            Console.WriteLine("Nombre de la red: {0}", ni.Name)

            Dim ipProp As IPInterfaceProperties = ni.GetIPProperties()
            Dim modoProm As Boolean = ni.IsReceiveOnly ' Modo Promiscuo
            Dim estado As String = ni.OperationalStatus.ToString ' Estado de la tarjeta de red

            'IPv4 y Mascara de red
            For Each ip As UnicastIPAddressInformation In ipProp.UnicastAddresses
                If ip.Address.AddressFamily <> AddressFamily.InterNetwork Then
                    ' The IP address is not an IPv4 address.
                    Continue For
                End If

                Console.WriteLine("Direccion IPv4: {0}", ip.Address)
                Console.WriteLine("Direccion IPv6: {0}", ipProp.UnicastAddresses(0).Address.ToString)
                Console.WriteLine("Mascara de red: {0}", ip.IPv4Mask)
                Exit For
            Next

            ' Obtener la MAC
            Dim dirFisica As PhysicalAddress = ni.GetPhysicalAddress()
            Dim addbyte As Byte() = dirFisica.GetAddressBytes()
            Dim mac As String = ""
            For i = 0 To addbyte.Length - 1
                mac &= addbyte(i).ToString("X2") ' Cambia de string a hexadecimal
                If i <> addbyte.Length - 1 Then
                    mac &= "-"
                End If
            Next
            Console.WriteLine("MAC: {0}", mac)

            For Each gateway As GatewayIPAddressInformation In ipProp.GatewayAddresses
                If gateway.Address.AddressFamily <> AddressFamily.InterNetwork Then
                    ' The gateway address is not an IPv4 address.
                    Continue For
                End If

                Console.WriteLine("Default gateway: {0}", gateway.Address)
                Exit For
            Next

            For Each ip As IPAddress In ipProp.DnsAddresses
                Console.WriteLine("DNS servers: {0}", ip)
            Next

            Console.WriteLine("Modo promiscuo: {0}", modoProm)
            Console.WriteLine("Estado de la tarjeta de red: {0}", estado)
            Exit For
        Next
    End Sub
End Module
