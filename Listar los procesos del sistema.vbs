Dim myProcesses() as Process
Dim myProcess As Process
myProcesses = Process.GetProcesses()
' Iterate through the process array.
For Each myProcess in myProcesses
   Console.WriteLine(myProcess.ProcessName)
Next