#Region " Binary To ASCII Function "
 
    ' [ Binary To ASCII Function ]
    '
    ' Examples :
    ' MsgBox(Binary_To_ASCII("01010100 01100101 01110011 01110100"))
    ' MsgBox(Binary_To_ASCII("01010100011001010111001101110100"))
 
    Private Function Binary_To_ASCII(ByVal str As String) As String
        Dim ASCII_String As String = Nothing
 
        ' Strip out spaces in case the string are separated by spaces.
        str = str.Replace(" ", "")
 
        For i As Integer = 0 To str.Length - 1 Step 8
            ASCII_String &= Chr(BinaryToLong(str.Substring(i, 8)))
        Next i
 
        Return ASCII_String
    End Function
 
    ' Convert this Binary value into a Long.
    Private Function BinaryToLong(ByVal binary_value As String) As Long
 
        ' Remove any leading &B if present.
        binary_value = binary_value.Trim().ToUpper()
        If binary_value.StartsWith("&B") Then binary_value = binary_value.Substring(2)
 
        ' Strip out spaces in case the bytes are separated by spaces.
        binary_value = binary_value.Replace(" ", "")
 
        ' Left pad with zeros so we have a full 64 bits.
        binary_value = binary_value.PadLeft(64, "0")
 
        ' Read the bits in nibbles from left to right. (A nibble is half a byte)
        Dim hex_result As String = ""
        For nibble_num As Integer = 0 To 15
 
            ' Convert this nibble into a hexadecimal string.
            Dim factor As Integer = 1
            Dim nibble_value As Integer = 0
 
            ' Read the nibble's bits from right to left.
            For bit As Integer = 3 To 0 Step -1
                If binary_value.Substring(nibble_num * 4 + bit, 1).Equals("1") Then
                    nibble_value += factor
                End If
                factor *= 2
            Next bit
 
            ' Add the nibble's value to the right of the result hex string.
            hex_result &= nibble_value.ToString("X")
        Next nibble_num
 
        ' Convert the result string into a long.
        Return Long.Parse(hex_result, Globalization.NumberStyles.HexNumber)
 
    End Function
 
#End Region