#Region " Copy File In Chunks "
 
    ' [ Copy File In Chunks Function ]
    '
    ' // By Elektro H@cker
    '
    ' Examples :
    ' Copy_File_In_Chunks("C:\BigFile.mkv", "C:\BigFile_copy.mkv")
    ' Copy_File_In_Chunks("C:\BigFile.mkv", "C:\BigFile_copy.mkv", 9999, True, True)
 
    Dim Cancel_Copy As Boolean = False
 
    Public Function Copy_File_In_Chunks(ByVal InputFile As String, ByVal OutputFile As String, _
                                        Optional ByVal BufferSize As Int16 = 1024, _
                                        Optional ByVal Overwrite As Boolean = False, _
                                        Optional ByVal DeleteFileOnCancel As Boolean = False) As Boolean
 
        Dim InputStream As New IO.FileStream(InputFile, IO.FileMode.Open, IO.FileAccess.Read)
        Dim OutputStream As IO.FileStream
 
        If Overwrite Then
            OutputStream = New IO.FileStream(OutputFile, IO.FileMode.Create, IO.FileAccess.Write)
        Else
            OutputStream = New IO.FileStream(OutputFile, IO.FileMode.CreateNew, IO.FileAccess.Write)
        End If
 
        Dim Buffer = New Byte(BufferSize) {}
        Dim BytesRead As Integer = 0
 
        Do : If Cancel_Copy Then : GoTo Close_Copy
            Else
                Application.DoEvents() ' Remove it if you don't like...
                BytesRead = InputStream.Read(Buffer, 0, Buffer.Length)
                If BytesRead > 0 Then OutputStream.Write(Buffer, 0, BytesRead)
            End If
        Loop While (BytesRead > 0)
 
Close_Copy:
 
        OutputStream.Flush() : InputStream.Close() : OutputStream.Close()
 
        If DeleteFileOnCancel Then
            Try : IO.File.Delete(OutputFile) : Catch : End Try
            Return False
        Else : Return True
        End If
 
    End Function
 
#End Region