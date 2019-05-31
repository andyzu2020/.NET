#Region " Get URL SourceCode "
 
    ' [ Get URL SourceCode Function ]
    '
    ' Examples :
    ' MsgBox(Get_URL_SourceCode("http://www.SPAM(1)"))
 
    Function Get_URL_SourceCode(ByVal url As String) As String
 
        Dim sourcecode As String = String.Empty
 
        Try
            Dim request As System.Net.HttpWebRequest = System.Net.HttpWebRequest.Create(url)
            Dim response As System.Net.HttpWebResponse = request.GetResponse()
            Dim sr As System.IO.StreamReader = New System.IO.StreamReader(response.GetResponseStream())
            sourcecode = sr.ReadToEnd()
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
 
        Return sourcecode
 
    End Function
 
#End Region