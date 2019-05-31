If My.Computer.Network.Ping("www.google.com", 1000) Then
  MsgBox("Server pinged successfully.")
Else
  MsgBox("Ping request timed out.")
End If