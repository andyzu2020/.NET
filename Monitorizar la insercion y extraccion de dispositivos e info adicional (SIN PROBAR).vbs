#Region " Monitorize Drives "
 
    ' Diccionario para guardar información (letra, información)
    Public CurrentDrives As New Dictionary(Of Char, DriveInfoGhost)
 
    Public Event DriveConnected(ByVal e As IO.DriveInfo)
    Public Event DriveDisconnected(ByVal e As DriveInfoGhost)
 
    ' Estructura que replica el contenido de DriveInfo
    Public Structure DriveInfoGhost
 
        Public Name As String
        Public AvailableFreeSpace As Long
        Public DriveFormat As String
        Public DriveType As IO.DriveType
        Public RootDirectory As String
        Public TotalFreeSpace As Long
        Public TotalSize As Long
        Public VolumeLabel As String
 
        Public Sub New(ByVal e As IO.DriveInfo)
            Name = e.Name
            AvailableFreeSpace = e.AvailableFreeSpace
            DriveFormat = e.DriveFormat
            DriveType = e.DriveType
            RootDirectory = e.RootDirectory.FullName
            TotalFreeSpace = e.TotalFreeSpace
            TotalSize = e.TotalSize
            VolumeLabel = e.VolumeLabel
        End Sub
 
    End Structure
 
    ' Estructura nativa de Windows para almacenar información de dispositivos
    Public Structure WindowsDrive
        Public Size As Integer
        Public Type As Integer
        Public Reserved As Integer
        Public Mask As Integer
    End Structure
 
    ' Constantes que necesitamos
    Public Enum ConstWindowsDrivers As Integer
        Change = &H219
        Arrival = &H8000
        QueryRemove = &H8001
        QueryRemoveFailed = &H8002
        RemovePending = &H8003
        RemoveComplete = &H8004
        TypeVolume = &H2
    End Enum
 
    Protected Overrides Sub WndProc(ByRef [Message] As Message)
 
        Select Case [Message].Msg ' Filtramos los mensajes
            Case ConstWindowsDrivers.Change ' Si el Hardware cambió
                ' Transformamos el puntero del primer parametro en una estructura de datos
                Dim CurrentWDrive As WindowsDrive = CType(System.Runtime.InteropServices.Marshal.PtrToStructure([Message].LParam, GetType(WindowsDrive)), WindowsDrive)
                ' Transformamos la estructura en información de la unidad
                Dim CurrentDrive As IO.DriveInfo = New IO.DriveInfo(GetDriveLetter(CurrentWDrive.Mask))
                ' El segundo parametros nos indica si se esta desconectando o conectando
                Select Case [Message].WParam.ToInt32
                    ' Se esta conectando...
                    Case ConstWindowsDrivers.Arrival
                        ' Si es un dispositivo de almacenamiento
                        If System.Runtime.InteropServices.Marshal.ReadInt32([Message].LParam, 4) = ConstWindowsDrivers.TypeVolume Then
                            ' Llamamos un evento que controla la conexión
                            RaiseEvent DriveConnected(CurrentDrive)
                            ' Guardamos la información del dispositivo en un diccionario fantasma (letra, información),
                            ' ya que cuando se desconecte habremos perdido toda la información,
                            ' sólamente nos quedara la letra de la unidad, con ella podremos volver a obtener la información a traves del diccionario'
                            CurrentDrives.Add(GetDriveLetter(CurrentWDrive.Mask), New DriveInfoGhost(CurrentDrive))
                        End If
                        ' Si es desconectado...
                    Case ConstWindowsDrivers.RemoveComplete
                        ' Llamamos al evento de desconexión con la información en el diccionario fantasma,
                        ' ya que no tenemos acceso a la información, porque el hardware ha sido desconectado
                        RaiseEvent DriveDisconnected(CurrentDrives(GetDriveLetter(CurrentWDrive.Mask)))
                        ' Removemos el hardware del diccionario
                        CurrentDrives.Remove(GetDriveLetter(CurrentWDrive.Mask))
                End Select
        End Select
 
        MyBase.WndProc([Message])
 
    End Sub
 
    ' Nos traduce el código de los parametros a letras
    Private Function GetDriveLetter(ByVal Mask As Integer) As Char
 
        Dim Names() As Char = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"}
        Dim Devices As New BitArray(System.BitConverter.GetBytes(Mask))
 
        For x As Integer = 0 To Devices.Length
            If Devices(x) Then
                Return Names(x)
            End If
        Next
 
    End Function
 
    ' Eventos
 
    Private Sub Main_DriveConnected(ByVal e As System.IO.DriveInfo) Handles Me.DriveConnected
        MessageBox.Show(String.Format("Se ha conectado la unidad {0}", e.Name))
    End Sub
 
    Private Sub Main_DriveDisconnected(ByVal e As DriveInfoGhost) Handles Me.DriveDisconnected
        MessageBox.Show(String.Format("Se ha desconectado la unidad {0}", e.Name))
    End Sub
 
#End Region