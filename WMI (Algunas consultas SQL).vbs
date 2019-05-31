'Añadimos la referencia a WMI (Windows Management Instrumentation) 
'System.Management.dll (De Windows)
'Para ver otras consutas buscarla en "WMICodeCreator (Oficial de Microsoft)"
'la carpeta con este nombre esta en esta carpeta.

Imports System.Management 

Public Class Form1 
    Private Sub Form1_Load( _ 
              ByVal sender As System.Object, _ 
              ByVal e As System.EventArgs) Handles MyBase.Load 
        ' Obtener información del sistema operativo 
        Dim consultaSQLSO As String = "SELECT * FROM Win32_OperatingSystem" 
        Dim objSO As New ManagementObjectSearcher(consultaSQLSO) 
        For Each info As ManagementObject In objSO.Get() 
            lInfoSistemaOperativo.Text = 
                info.Properties("Caption").Value.ToString().Trim() 
            lInfoVersionSistemaOperativo.Text = 
                info.Properties("Version").Value.ToString() & _ 
                " Service Pack " & 
                info.Properties("ServicePackMajorVersion").Value.ToString() & "." & _ 
            info.Properties("ServicePackMinorVersion").Value.ToString() 
        Next info 

        ' Obtener número de cores del procesador 
        Dim consultaSQLCores As String = "SELECT * FROM Win32_ComputerSystem" 
        Dim objCores As New ManagementObjectSearcher(consultaSQLCores) 
        For Each info As ManagementObject In objCores.Get() 
            lInfoNumeroCoresCPU.Text = 
                info.Properties("NumberOfLogicalProcessors").Value.ToString() 
        Next info 

        ' obtener arquitectura procesador (64 bits 32 bits) 
        Dim consultaSQLArquitectura As String = "SELECT * FROM Win32_Processor" 
        Dim objArquitectura As New ManagementObjectSearcher(consultaSQLArquitectura) 
        For Each info As ManagementObject In objArquitectura.Get() 
            lInfoArquitecturaCPU.Text = 
                info.Properties("AddressWidth").Value.ToString() & " bits" 
        Next info 
    End Sub 
End Class 