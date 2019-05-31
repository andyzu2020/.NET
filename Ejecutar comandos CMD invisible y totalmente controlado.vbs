Private Sub COMANDOS()
	Dim info As New ProcessStartInfo("cmd")
	info.CreateNoWindow = True
	info.RedirectStandardInput = True
	info.RedirectStandardOutput = True
	info.UseShellExecute = False
	Using proc As Process = Process.Start(info)
		proc.StandardInput.WriteLine("arp -d *")
		proc.StandardInput.WriteLine("exit")
	End Using
End Sub