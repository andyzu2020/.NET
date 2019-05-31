    Public Sub mysqlEstaInstalado()
        Dim sRegKey As String = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
        Dim Keys As RegistryKey = Registry.LocalMachine.OpenSubKey(sRegKey)

        For Each sNombreKey As String In Keys.GetSubKeyNames
            Dim Key As RegistryKey = Keys.OpenSubKey(sNombreKey)
            Dim nombre As String = CStr(Key.GetValue("DisplayName"))

            If (Not nombre = "") Then
                Console.WriteLine(Key.GetValue("DisplayName"))
            ElseIf nombre = "Aplicacion Buscada" Then
                MsgBox("Lo encontro!!")
                Exit For
            End If
        Next
    End Sub