For Each foundFile As String In _
My.Computer.FileSystem.GetFiles("C:\TestDir")
    Dim check As String = _
    System.IO.Path.GetExtension(foundFile)
    MsgBox("The file extension is " & check)
Next