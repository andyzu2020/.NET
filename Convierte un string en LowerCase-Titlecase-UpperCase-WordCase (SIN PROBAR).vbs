#Region " String to Case "
 
    ' [ String to Case Function ]
    '
    ' // By Elektro H@cker
    '
    ' Examples :
    ' MsgBox(String_To_Case("THiS is a TeST", StringCase.Titlecase))
    ' Var = String_To_WordCase(Var, StringCase.LowerCase)
 
    Public Enum StringCase
        LowerCase
        Titlecase
        UpperCase
        WordCase
    End Enum
 
    Private Function String_To_Case(ByVal str As String, ByVal StringCase As StringCase) As String
        Select Case StringCase
            Case Form1.StringCase.LowerCase : Return System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToLower(str)
            Case Form1.StringCase.Titlecase : Return Char.ToUpper(str(0)) + StrConv(str.Substring(1), VbStrConv.Lowercase)
            Case Form1.StringCase.UpperCase : Return System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToUpper(str)
            Case Form1.StringCase.WordCase : Return System.Globalization.CultureInfo.CurrentCulture.TextInfo.ToTitleCase(str)
            Case Else : Return Nothing
        End Select
    End Function
 
#End Region