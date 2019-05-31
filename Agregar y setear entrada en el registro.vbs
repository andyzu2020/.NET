Dim runK As RegistryKey = Registry.CurrentUser.OpenSubKey("Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\", True)

runK.SetValue("NoViewContextMenu", "1", RegistryValueKind.QWord)