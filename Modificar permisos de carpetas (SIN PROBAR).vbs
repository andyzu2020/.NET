#Region " Folder Access Function "
 
    ' [ Folder Access Function ]
    '
    ' // By Elektro H@cker
    '
    ' Examples :
    ' Set_Folder_Access("C:\Folder", Folder_Access.Create + Folder_Access.Write, Action.Allow)
    ' Set_Folder_Access("C:\Folder", Folder_Access.Delete, Action.Deny)
 
    Public Enum Folder_Access
        Create = System.Security.AccessControl.FileSystemRights.CreateDirectories + System.Security.AccessControl.FileSystemRights.CreateFiles
        Delete = System.Security.AccessControl.FileSystemRights.Delete + System.Security.AccessControl.FileSystemRights.DeleteSubdirectoriesAndFiles
        Write = System.Security.AccessControl.FileSystemRights.AppendData + System.Security.AccessControl.FileSystemRights.Write + Security.AccessControl.FileSystemRights.WriteAttributes + System.Security.AccessControl.FileSystemRights.WriteData + System.Security.AccessControl.FileSystemRights.WriteExtendedAttributes
    End Enum
 
    Public Enum Action
        Allow = 0
        Deny = 1
    End Enum
 
    Private Function Set_Folder_Access(ByVal Path As String, ByVal Folder_Access As Folder_Access, ByVal Action As Action) As Boolean
        Try
            Dim Folder_Info As IO.DirectoryInfo = New IO.DirectoryInfo(Path)
            Dim Folder_ACL As New System.Security.AccessControl.DirectorySecurity
            Folder_ACL.AddAccessRule(New System.Security.AccessControl.FileSystemAccessRule(My.User.Name, Folder_Access, System.Security.AccessControl.InheritanceFlags.ContainerInherit Or System.Security.AccessControl.InheritanceFlags.ObjectInherit, System.Security.AccessControl.PropagationFlags.None, Action))
            Folder_Info.SetAccessControl(Folder_ACL)
            Return True
        Catch ex As Exception
            Throw New Exception(ex.Message)
            ' Return False
        End Try
 
#End Region