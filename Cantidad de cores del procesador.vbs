'Añadimos la referencia a WMI (Windows Management Instrumentation) 
'System.Management.dll (De Windows)

Imports System.Management

Sub ObtenerNumProce()
    Dim consultaSQLCores As String = "SELECT * FROM Win32_ComputerSystem"
    Dim objCores As New ManagementObjectSearcher(consultaSQLCores)
    For Each info As ManagementObject In objCores.Get()
        numCores = CInt(info.Properties("NumberOfLogicalProcessors").Value.ToString())
    Next info
End Sub