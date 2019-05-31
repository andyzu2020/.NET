#Region " Rec Sound Function "
 
    ' [ Rec Sound Function ]
    '
    ' Examples :
    ' Rec_Sound("C:\Audio.wav", Rec.Start_Record)
    ' Rec_Sound("C:\Audio.wav", Rec.Stop_Record)
 
    Private Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Integer, ByVal hwndCallback As Integer) As Integer
 
    Public Enum Rec
        Start_Record
        Stop_Record
    End Enum
 
    Private Function Rec_Sound(ByVal Path As String, ByVal Rec As Rec) As Boolean
        Select Case Rec
            Case Rec.Start_Record
                mciSendString("open new Type waveaudio Alias recsound", "", 0, 0)
                mciSendString("record recsound", "", 0, 0)
                Return True
            Case Rec.Stop_Record
                mciSendString("save recsound " & Path & "", "", 0, 0)
                mciSendString("close recsound", "", 0, 0)
                Return True
            Case Else : Return Nothing
        End Select
    End Function
 
#End Region