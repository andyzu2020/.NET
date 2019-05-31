#Region " Get Master Volume Function "
 
    ' [ Get Master Volume Function ]
    '
    ' // By Elektro H@cker
    '
    ' Examples :
    ' Dim Volume As Integer = Get_Master_Volume(Volume_Measure.As_Integer)
    ' Dim Volume As String = Get_Master_Volume(Volume_Measure.As_Percent)
 
    Public Enum Volume_Measure
        As_Integer
        As_Decimal
        As_Single
        As_Percent
    End Enum
 
    Private Function Get_Master_Volume(ByVal Volume_Measure As Volume_Measure)
       Select Case Volume_Measure
            Case Form1.Volume_Measure.As_Integer : Return CInt(Audio_Device.AudioEndpointVolume.MasterVolumeLevelScalar * 100)
            Case Form1.Volume_Measure.As_Decimal : Return (String.Format("{0:n2}", Audio_Device.AudioEndpointVolume.MasterVolumeLevelScalar))
            Case Form1.Volume_Measure.As_Single : Return CSng(Audio_Device.AudioEndpointVolume.MasterVolumeLevelScalar)
            Case Form1.Volume_Measure.As_Percent : Return CInt(Audio_Device.AudioEndpointVolume.MasterVolumeLevelScalar * 100) & "%"
            Case Else : Return Nothing
        End Select
    End Function
 
#End Region