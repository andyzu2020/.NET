#Region " Hex To String Function "
 
    ' [ Hex To String Function ]
    '
    ' Examples :
    ' Dim str As String = Hex_To_String("456c656b74726f204840636b6572"))
 
    Private Function Hex_To_String(ByVal Source_String As String) As String
        Dim Hex_StringBuilder As New System.Text.StringBuilder()
        For x As Integer = 0 To Source_String.Length - 1 Step 2 : Hex_StringBuilder.Append(Chr(Val("&H" & Source_String.Substring(x, 2)))) : Next x
        Return Hex_StringBuilder.ToString()
    End Function
 
#End Region