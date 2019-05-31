Dim info As New ProcessStartInfo("cmd")

info.CreateNoWindow = False ' Con = true/Sin = false, interfaz grafica.
info.RedirectStandardInput = True
info.RedirectStandardOutput = True
info.UseShellExecute = False

Using proc As Process = Process.Start(info)
	proc.StandardInput.WriteLine("ping 127.0.0.1")
	proc.StandardInput.WriteLine("exit")
	proc.WaitForExit() ' Espera hasta que termina
	proc.Close()
End Using