
Dim proceso As New Process
Dim path As String = My.Application.Info.DirectoryPath

path = path & "\MySQLServer\bin\mysqld.exe"
proceso = Process.Start(path, " --install")

'Espero a que termine para continuar'
proceso.WaitForExit()