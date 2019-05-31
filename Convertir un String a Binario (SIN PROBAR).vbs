#Region " ASCII To Binary Function "
 
    ' [ ASCII To Binary Function ]
    '
    ' Examples :
    ' MsgBox(ASCII_To_Binary("Test"))
 
    Private Function ASCII_To_Binary(ByVal str As String) As String
        Dim Binary_String As String = Nothing
 
        For i As Integer = 0 To str.Length - 1
            Binary_String &= LongToBinary(Asc(str.Substring(i, 1))).Substring(LongToBinary(Asc(str.Substring(i, 1))).Length - 8)
        Next i
 
        Return Binary_String
    End Function
 
    ' Convert this Long value into a Binary string.
    Private Function LongToBinary(ByVal long_value As Long, Optional ByVal separate_bytes As Boolean = True) As String
 
        ' Convert into hex.
        Dim hex_string As String = long_value.ToString("X")
 
        ' Zero-pad to a full 16 characters.
        hex_string = hex_string.PadLeft(16, "0")
 
        ' Read the hexadecimal digits one at a time from right to left.
        Dim result_string As String = ""
        For digit_num As Integer = 0 To 15
 
            ' Convert this hexadecimal digit into a binary nibble.
            Dim digit_value As Integer = Integer.Parse(hex_string.Substring(digit_num, 1), Globalization.NumberStyles.HexNumber)
 
            ' Convert the value into bits.
            Dim factor As Integer = 8
            Dim nibble_string As String = ""
            For bit As Integer = 0 To 3
                If digit_value And factor Then
                    nibble_string &= "1"
                Else
                    nibble_string &= "0"
                End If
                factor \= 2
            Next bit
 
            ' Add the nibble's string to the left of the result string.
            result_string &= nibble_string
        Next digit_num
 
        ' Add spaces between bytes if desired.
        If separate_bytes Then
            Dim tmp As String = ""
            For i As Integer = 0 To result_string.Length - 8 Step 8
                tmp &= result_string.Substring(i, 8) & " "
            Next i
            result_string = tmp.Substring(0, tmp.Length - 1)
        End If
 
        ' Return the result.
        Return result_string
 
    End Function
 
#End Region