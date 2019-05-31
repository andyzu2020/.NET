#Region " FTP Upload Function "
 
    ' [ FTP Upload Function ]
    '
    ' Examples :
    ' FTP_Upload("C:\File.txt", "ftp://127.0.0.1/File.txt", "User")
    ' MsgBox(FTP_Upload("C:\File.txt", "ftp://127.0.0.1/File.txt", "User", "Pass"))
 
    Public Function FTP_Upload(ByVal FilePath As String, ByVal FTP_FilePath As String, _
                    Optional ByVal User As String = Nothing, _
                    Optional ByVal Pass As String = Nothing) As Boolean
 
        Dim FTP_request As System.Net.FtpWebRequest
        Dim FTP_stream As System.IO.Stream
        Dim FTP_bytes() As Byte
 
        Try
            FTP_request = DirectCast(System.Net.WebRequest.Create(FTP_FilePath), System.Net.FtpWebRequest)
            FTP_request.Credentials = New System.Net.NetworkCredential(User, Pass)
            FTP_request.Method = System.Net.WebRequestMethods.Ftp.UploadFile
            FTP_stream = FTP_request.GetRequestStream()
            FTP_bytes = System.IO.File.ReadAllBytes(FilePath)
 
            With FTP_stream
                .Write(FTP_bytes, 0, FTP_bytes.Length)
                .Close()
                .Dispose()
            End With
 
            Return True
 
        Catch ex As Exception : Return False
        End Try
 
    End Function
 
#End Region