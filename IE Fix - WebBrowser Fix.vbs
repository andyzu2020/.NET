Imports System.IO
Imports Microsoft.VisualBasic
Imports System
Imports System.Security.Permissions
Imports Microsoft.Win32
' VERSION REDUCIDA, FUNCIONA DE FORMA OK
' Este es mi codigo en base al original que esta abajo, el mio esta actualizado y es completamente funcional en VS 2017
' Invoco en el Load del programa 
SetBrowserFeatureControl()


' SE NECESITAN PRIVILEGIOS DE ADMINISTRADOR EN LA APP
#Region "IE Fix (Version 2.0 sin errores)"
    Private Sub SetBrowserFeatureControl()
        Try
            ' http://msdn.microsoft.com/en-us/library/ee330720(v=vs.85).aspx

            ' FeatureControl settings are per-process
            Dim fileName = System.IO.Path.GetFileName(Process.GetCurrentProcess().MainModule.FileName)

            ' make the control is not running inside Visual Studio Designer
            If [String].Compare(fileName, "devenv.exe", True) = 0 OrElse [String].Compare(fileName, "XDesProc.exe", True) = 0 Then
                Return
            End If

            Try ' IE7 = 7000 // IE8 = 8000 // IE9 = 9000 // IE10 = 10000 // IE11 o Edge = 11001
                If My.Computer.Registry.GetValue("HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_BROWSER_EMULATION\" & myNameApp, "11001", Nothing) Is Nothing Then

                    My.Computer.Registry.SetValue("HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_BROWSER_EMULATION\" & myNameApp, 11001, RegistryValueKind.DWord)
                End If
            Catch ex As Exception
                rtxtLogs.Text = rtxtLogs.Text & vbCrLf & "Error al agregar llave al registro. " & vbCrLf & ex.Message
            End Try

            wbAux2.ObjectForScripting = True
            wbAux2.ScriptErrorsSuppressed = True
        Catch ex As Exception
            rtxtLogs.Text = rtxtLogs.Text & vbCrLf & "Error en el nucleo del navegador. " & vbCrLf & ex.Message
        End Try

    End Sub
#End Region

'######################################################################################################################
'######################################################################################################################
'######################################################################################################################

Imports System.IO
Imports Microsoft.VisualBasic
Imports System
Imports System.Security.Permissions
Imports Microsoft.Win32
' VERSION REDUCIDA, FUNCIONA DE FORMA OK
' Este es mi codigo en base al original que esta abajo, el mio esta actualizado y es completamente funcional en VS 2017
' Invoco en el Load del programa 
SetBrowserFeatureControl()

#Region "IE Fix (Version 3.0 sin errores)"
    Public Shared Sub SetBrowserFeatureControlKey(feature As String, value As UInteger)
        Dim fullName As String = System.Reflection.Assembly.GetEntryAssembly().Location
        Dim myNameApp As String = Path.GetFileName(fullName)

        If Environment.Is64BitOperatingSystem Then
            Try                                                                                                                                                                 ' si da problemas lo de abajo se borra
                If My.Computer.Registry.GetValue("HKEY_LOCAL_MACHINE\Software\Wow6432Node\Microsoft\Internet Explorer\Main\FeatureControl\" & feature & "\" & myNameApp, value, RegistryKeyPermissionCheck.ReadWriteSubTree) Is Nothing Then

                    My.Computer.Registry.SetValue("HKEY_LOCAL_MACHINE\Software\Wow6432Node\Microsoft\Internet Explorer\Main\FeatureControl\" & feature & "\" & myNameApp, value, RegistryValueKind.DWord)
                End If
            Catch ex As Exception
                MessageBox.Show("Error al agregar llave al registro, para plataformas x64. " & vbCrLf &
                  "Llave: " & feature & vbCrLf &
                  ex.Message, "Error al establecer las modificaciones para la estabilidad del navegador", MessageBoxButtons.OK, MessageBoxIcon.Error)
            End Try
        End If

        Try                                                                                                                                                                 ' si da problemas lo de abajo se borra
            If My.Computer.Registry.GetValue("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\FeatureControl\" & feature & "\" & myNameApp, value, RegistryKeyPermissionCheck.ReadWriteSubTree) Is Nothing Then

                My.Computer.Registry.SetValue("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\FeatureControl\" & feature & "\" & myNameApp, value, RegistryValueKind.DWord)
            End If
        Catch ex As Exception
            MessageBox.Show("Error al agregar llave al registro. " & vbCrLf &
                  "Llave: " & feature & vbCrLf &
                  ex.Message, "Error al establecer las modificaciones para la estabilidad del navegador", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Public Sub SetBrowserFeatureControl()
        Try
            ' http://msdn.microsoft.com/en-us/library/ee330720(v=vs.85).aspx

            ' FeatureControl settings are per-process
            Dim fileName = System.IO.Path.GetFileName(Process.GetCurrentProcess().MainModule.FileName)

            ' make the control is not running inside Visual Studio Designer
            If [String].Compare(fileName, "devenv.exe", True) = 0 OrElse [String].Compare(fileName, "XDesProc.exe", True) = 0 Then
                Return
            End If

            SetBrowserFeatureControlKey("FEATURE_BROWSER_EMULATION", GetBrowserEmulationMode())

            'Webpages containing standards-based !DOCTYPE directives are displayed in IE10 Standards mode.
            SetBrowserFeatureControlKey("FEATURE_AJAX_CONNECTIONEVENTS", 1)

            SetBrowserFeatureControlKey("FEATURE_ENABLE_CLIPCHILDREN_OPTIMIZATION", 1)
            SetBrowserFeatureControlKey("FEATURE_MANAGE_SCRIPT_CIRCULAR_REFS", 1)
            SetBrowserFeatureControlKey("FEATURE_DOMSTORAGE ", 1)

            SetBrowserFeatureControlKey("FEATURE_GPU_RENDERING ", 1)
            SetBrowserFeatureControlKey("FEATURE_IVIEWOBJECTDRAW_DMLT9_WITH_GDI  ", 0)
            SetBrowserFeatureControlKey("FEATURE_DISABLE_LEGACY_COMPRESSION", 1)
            SetBrowserFeatureControlKey("FEATURE_LOCALMACHINE_LOCKDOWN", 0)
            SetBrowserFeatureControlKey("FEATURE_BLOCK_LMZ_OBJECT", 0)
            SetBrowserFeatureControlKey("FEATURE_BLOCK_LMZ_SCRIPT", 0)
            SetBrowserFeatureControlKey("FEATURE_DISABLE_NAVIGATION_SOUNDS", 1)

            SetBrowserFeatureControlKey("FEATURE_SCRIPTURL_MITIGATION", 1)
            SetBrowserFeatureControlKey("FEATURE_SPELLCHECKING", 0)
            SetBrowserFeatureControlKey("FEATURE_STATUS_BAR_THROTTLING", 1)
            SetBrowserFeatureControlKey("FEATURE_TABBED_BROWSING", 1)
            SetBrowserFeatureControlKey("FEATURE_VALIDATE_NAVIGATE_URL", 1)
            SetBrowserFeatureControlKey("FEATURE_WEBOC_DOCUMENT_ZOOM", 1)
            SetBrowserFeatureControlKey("FEATURE_WEBOC_POPUPMANAGEMENT", 0)
            SetBrowserFeatureControlKey("FEATURE_WEBOC_MOVESIZECHILD", 1)
            SetBrowserFeatureControlKey("FEATURE_ADDON_MANAGEMENT", 0)
            SetBrowserFeatureControlKey("FEATURE_WEBSOCKET", 1)
            SetBrowserFeatureControlKey("FEATURE_WINDOW_RESTRICTIONS ", 0)
            SetBrowserFeatureControlKey("FEATURE_XMLHTTP", 1)
        Catch ex As Exception
            MessageBox.Show("Error en el nucleo del navegador. " & vbCrLf & ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try

    End Sub

    Public Function GetBrowserEmulationMode() As UInt32
        Dim browserVersion As Integer = 11
        Dim mode As UInt32 = 11001
        Dim flag As Boolean = True

        While flagDownCap
            Try
                Select Case browserVersion
                    Case 11
                        mode = 11001
                        ' Internet Explorer 11. Webpages containing standards-based !DOCTYPE directives are displayed in IE9 mode. Default value for Internet Explorer 9.
                        Exit Select
                    Case 10
                        mode = 10000
                        ' Internet Explorer 10. Webpages containing standards-based !DOCTYPE directives are displayed in IE9 mode. Default value for Internet Explorer 9.
                        Exit Select
                    Case 9
                        mode = 9000
                        ' Internet Explorer 9. Webpages containing standards-based !DOCTYPE directives are displayed in IE9 mode. Default value for Internet Explorer 9.
                        Exit Select
                    Case 8
                        mode = 8000
                        ' Webpages containing standards-based !DOCTYPE directives are displayed in IE8 mode. Default value for Internet Explorer 8
                        Exit Select
                    Case 7
                        mode = 7000
                        ' Webpages containing standards-based !DOCTYPE directives are displayed in IE7 Standards mode. Default value for applications hosting the WebBrowser Control.
                        Exit Select
                    Case Else
                        MessageBox.Show("Error fatal, el programa no es compatible con el Sistema Operativo anfitrion", "Error fatal", MessageBoxButtons.OK, MessageBoxIcon.Hand)
                        frmPpal.Close()
                        Exit Select
                End Select
                If My.Computer.Registry.GetValue("HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_BROWSER_EMULATION\" & myNameApp, CStr(mode), Nothing) Is Nothing Then
                    My.Computer.Registry.SetValue("HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_BROWSER_EMULATION\" & myNameApp, mode, RegistryValueKind.DWord)
                End If
                flagDownCap = False
            Catch ex As Exception
                browserVersion = browserVersion - 1
            End Try
        End While

        Return mode
    End Function
#End Region

'######################################################################################################################
'######################################################################################################################
'######################################################################################################################

Imports System.IO
Imports Microsoft.VisualBasic
Imports System
Imports System.Security.Permissions
Imports Microsoft.Win32

#Region "Variables globales"
    Dim fullName As String = System.Reflection.Assembly.GetEntryAssembly().Location
    Dim myNameApp As String = Path.GetFileName(fullName)
#End Region
' Este codigo original.
' Invoco en el Load del programa 
SetBrowserFeatureControl()


' SE NECESITAN PRIVILEGIOS DE ADMINISTRADOR EN LA APP
#Region "IE Fix (Version 1.0 antiguo en base obsoleto y con errores, pero mas completo)"
    Private Shared Sub SetBrowserFeatureControlKey(feature As String, appName As String, value As UInteger)
        If Environment.Is64BitOperatingSystem Then

            Using key = Registry.LocalMachine.CreateSubKey([String].Concat("HKEY_LOCAL_MACHINE\Software\Wow6432Node\Microsoft\Internet Explorer\Main\FeatureControl\", feature), RegistryKeyPermissionCheck.ReadWriteSubTree)
                key.SetValue(appName, DirectCast(value, UInt32), RegistryValueKind.DWord)

            End Using
        End If


        Using key = Registry.CurrentUser.CreateSubKey([String].Concat("HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\FeatureControl\", feature), RegistryKeyPermissionCheck.ReadWriteSubTree)
            key.SetValue(appName, DirectCast(value, UInt32), RegistryValueKind.DWord)
        End Using
    End Sub

    Private Sub SetBrowserFeatureControl()
        Try
            ' http://msdn.microsoft.com/en-us/library/ee330720(v=vs.85).aspx

            ' FeatureControl settings are per-process
            Dim fileName = System.IO.Path.GetFileName(Process.GetCurrentProcess().MainModule.FileName)

            ' make the control is not running inside Visual Studio Designer
            If [String].Compare(fileName, "devenv.exe", True) = 0 OrElse [String].Compare(fileName, "XDesProc.exe", True) = 0 Then
                Return
            End If

            SetBrowserFeatureControlKey("FEATURE_BROWSER_EMULATION", fileName, GetBrowserEmulationMode())

            Webpages containing standards-based !DOCTYPE directives are displayed in IE10 Standards mode.
            SetBrowserFeatureControlKey("FEATURE_AJAX_CONNECTIONEVENTS", fileName, 1)
            SetBrowserFeatureControlKey("FEATURE_ENABLE_CLIPCHILDREN_OPTIMIZATION", fileName, 1)
            SetBrowserFeatureControlKey("FEATURE_MANAGE_SCRIPT_CIRCULAR_REFS", fileName, 1)
            SetBrowserFeatureControlKey("FEATURE_DOMSTORAGE ", fileName, 1)

            SetBrowserFeatureControlKey("FEATURE_GPU_RENDERING ", fileName, 1)
            SetBrowserFeatureControlKey("FEATURE_IVIEWOBJECTDRAW_DMLT9_WITH_GDI  ", fileName, 0)
            SetBrowserFeatureControlKey("FEATURE_DISABLE_LEGACY_COMPRESSION", fileName, 1)
            SetBrowserFeatureControlKey("FEATURE_LOCALMACHINE_LOCKDOWN", fileName, 0)
            SetBrowserFeatureControlKey("FEATURE_BLOCK_LMZ_OBJECT", fileName, 0)
            SetBrowserFeatureControlKey("FEATURE_BLOCK_LMZ_SCRIPT", fileName, 0)
            SetBrowserFeatureControlKey("FEATURE_DISABLE_NAVIGATION_SOUNDS", fileName, 1)

            SetBrowserFeatureControlKey("FEATURE_SCRIPTURL_MITIGATION", fileName, 1)
            SetBrowserFeatureControlKey("FEATURE_SPELLCHECKING", fileName, 0)
            SetBrowserFeatureControlKey("FEATURE_STATUS_BAR_THROTTLING", fileName, 1)
            SetBrowserFeatureControlKey("FEATURE_TABBED_BROWSING", fileName, 1)
            SetBrowserFeatureControlKey("FEATURE_VALIDATE_NAVIGATE_URL", fileName, 1)
            SetBrowserFeatureControlKey("FEATURE_WEBOC_DOCUMENT_ZOOM", fileName, 1)
            SetBrowserFeatureControlKey("FEATURE_WEBOC_POPUPMANAGEMENT", fileName, 0)
            SetBrowserFeatureControlKey("FEATURE_WEBOC_MOVESIZECHILD", fileName, 1)
            SetBrowserFeatureControlKey("FEATURE_ADDON_MANAGEMENT", fileName, 0)
            SetBrowserFeatureControlKey("FEATURE_WEBSOCKET", fileName, 1)
            SetBrowserFeatureControlKey("FEATURE_WINDOW_RESTRICTIONS ", fileName, 0)
            SetBrowserFeatureControlKey("FEATURE_XMLHTTP", fileName, 1)
        Catch ex As Exception
            rtxtLogs.Text = rtxtLogs.Text & vbCrLf & "Error en el nucleo del navegador. " & vbCrLf & ex.Message
        End Try

    End Sub

    Private Function GetBrowserEmulationMode() As UInt32
        Dim browserVersion As Integer = 7
        Using ieKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\Microsoft\Internet Explorer", RegistryKeyPermissionCheck.ReadSubTree, System.Security.AccessControl.RegistryRights.QueryValues)
            Dim version = ieKey.GetValue("svcVersion")
            If Nothing = version Then
                version = ieKey.GetValue("Version")
                If Nothing = version Then
                    Throw New ApplicationException("Microsoft Internet Explorer is required!")
                End If
            End If
            Integer.TryParse(version.ToString().Split("."c)(0), browserVersion)
        End Using

        Dim mode As UInt32 = 10000
        ' Internet Explorer 10. Webpages containing standards-based !DOCTYPE directives are displayed in IE10 Standards mode. Default value for Internet Explorer 10.
        Select Case browserVersion
            Case 7
                mode = 7000
                ' Webpages containing standards-based !DOCTYPE directives are displayed in IE7 Standards mode. Default value for applications hosting the WebBrowser Control.
                Exit Select
            Case 8
                mode = 8000
                ' Webpages containing standards-based !DOCTYPE directives are displayed in IE8 mode. Default value for Internet Explorer 8
                Exit Select
            Case 9
                mode = 9000
                ' Internet Explorer 9. Webpages containing standards-based !DOCTYPE directives are displayed in IE9 mode. Default value for Internet Explorer 9.
                Exit Select
            Case 10
                mode = 10000
                ' Internet Explorer 10. Webpages containing standards-based !DOCTYPE directives are displayed in IE9 mode. Default value for Internet Explorer 9.
                Exit Select
            Case 11
                mode = 11001
                ' Internet Explorer 11. Webpages containing standards-based !DOCTYPE directives are displayed in IE9 mode. Default value for Internet Explorer 9.
                Exit Select
            Case Else
                ' use IE10 mode by default
                Exit Select
        End Select

        Return mode
    End Function
#End Region
