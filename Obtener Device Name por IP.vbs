For i = 1 To 254
    Try
        RichTextBox1.AppendText("Host name =  " & System.Net.Dns.GetHostEntry("192.168.1." & i.ToString).HostName.ToString & vbCrLf & vbCrLf)
    Catch ex As Exception
    End Try
Next