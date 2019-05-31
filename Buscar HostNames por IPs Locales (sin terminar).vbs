' Limpio el DataGridView
dgvDetec.Rows.Clear()
dgvDetec.Columns.Clear()

For i = 1 To 254
    Me.Text = "Heimdall (Firewall) Buscando Host Online... Escaneando 192.168.1." & i.ToString
    Try
        Dim name As String = System.Net.Dns.GetHostEntry("192.168.1." & i.ToString).HostName.ToString
        Dim row As String()

        ' Declaro las columnas
        dgvDetec.ColumnCount = 3
        dgvDetec.Columns(0).Name = "Device Name"
        dgvDetec.Columns(1).Name = "IP"
        dgvDetec.Columns(2).Name = "MAC"

        If (Not (name = "192.168.1." & i.ToString)) Then
            ' Agrego la columna

            row = New String() {name, "192.168.1." & i.ToString, "En desarrollo"}
            dgvDetec.Rows.Add(row)
        End If
    Catch ex As Exception
    End Try
Next

Me.Enabled = True
Me.Text = "Heimdall (Firewall) Busqueda Finalizada!"