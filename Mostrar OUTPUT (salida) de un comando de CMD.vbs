Dim oProcess As New Process()
Dim oStartInfo As New ProcessStartInfo("netsh.exe", "INTERFACE IPV4 SHOW INTERFACE")
oStartInfo.UseShellExecute = False
oStartInfo.RedirectStandardOutput = True
oProcess.StartInfo = oStartInfo
oProcess.Start()

Dim sOutput As String
Using oStreamReader As System.IO.StreamReader = oProcess.StandardOutput
	sOutput = oStreamReader.ReadToEnd()
End Using
textbox1.Text = sOutput