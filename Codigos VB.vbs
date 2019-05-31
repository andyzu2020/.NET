'###########
'# AGREGAR #
'###########

'Variables de PLANTAS.
Dim fecha_de_agregado, hora, nombre, apellido As String

'Variables para QUERY
Dim values As String
Dim query As String

'Control y seteo de VALUES
fecha_de_agregado = "'" & dtp1.Text & "'"
nombre = "'" & txt2.Text & "'"
apellido = "'" & txt2.Text & "'"

If (txt2.TextLength > 0) Then
    'Codigo para conformar la hora de forma correcta.
    If (nmupdw1.Value < 10) Then
        If (nmupdw2.Value < 10) Then
            hora = "0" & nmupdw1.Value & ":" & "0" & nmupdw2.Value
        Else
            hora = "0" & nmupdw1.Value & ":" & nmupdw2.Value
        End If
    Else
        If (nmupdw2.Value < 10) Then
            hora = nmupdw1.Value & ":" & "0" & nmupdw2.Value
        Else
            hora = nmupdw1.Value & ":" & nmupdw2.Value
        End If
    End If

    hora = "'" & hora & "'"
    values = fecha_de_agregado & ", " & hora & ", " & nombre & ", " & apellido
    query = "INSERT INTO bdd_prog_gestion. VALUES (" & values & ");"

    consultasEnBDD(query)
    MsgBox("Se ha agregado la planta al inventario con exito.")

    'Limpiando campos
    dtp1.Text = ""
    txt2.Text = ""
    txt232.Text = ""
Else
    MsgBox("Debe ingresar por lo menos el nombre de la planta.")
End If



'############
'# BUSQUEDA #
'############

Dim paramBusqueda As String = corrector(cbbx1.SelectedItem.ToString.ToLower)
Dim query As String

If (txt33.TextLength > 0) Then
    'Control de código numerico.
    If (paramBusqueda = "codigo") Then
        If (Not IsNumeric(txt33.Text) Or (txt33.Text = "0")) Then
            MsgBox("Ingrese un código numérico y mayor a 0, en la casilla 'texto del parametro'.")
            Exit Sub
        End If
    End If
    If (paramBusqueda = "codigo") Then paramBusqueda = "id_planta"

    query = "QUERY " & paramBusqueda & " LIKE '" & txt33.Text & "' ORDER BY " & paramBusqueda & ";"

    Using con As New MySQLConnection(New MySQLConnectionString("127.0.0.1", "bdd_prog_gestion", "root", "root", 3306).AsString)

        Dim cmd As New MySQLCommand(query, con)
        Dim dt As New DataTable
        Dim da As New MySQLDataAdapter(cmd)

        Try
            da.Fill(dt)
            Me.dgv1.DataSource = dt
        Catch ex As Exception
            MsgBox("Error de bloque 3.")
        Finally
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
        End Try
    End Using
Else
    MsgBox("Ingrese el texto correspondiente al parametro de busqueda seleccionado, en la casilla 'texto del parametro'.")
End If

'######################
'# MODIFICAR          #
'# PARTE 1 (Búsqueda) #
'######################
Dim query As String

query = " QUERY " & TXT.Text & ";"

Using con As New MySQLConnection(New MySQLConnectionString("127.0.0.1", "bdd_prog_gestion", "root", "root", 3306).AsString)

    Dim cmd As New MySQLCommand(query, con)
    Dim da As New MySQLDataAdapter(cmd)
    Dim drd As MySqlDataReader

    Try
        con.open()
        drd = CType(cmd.ExecuteReader(), MySQLDataReader)

        If drd.Read() Then
            Me.txt21.Text() = drd.Item("nombre").ToString()
            Me.txt21.Text() = drd.Item("Apellido").ToString()
        End If

        drd.Close()
        con.Close()

    Catch ex As Exception
        MsgBox("Error de bloque 3.")
    Finally
        If con.State = ConnectionState.Open Then
            con.Close()
        End If
    End Try
End Using

'MODIFICAR 
'PARTE 2 (Guardando cambios)
Dim query As String

query = "QUERY " & txt79.Text & ";"

Using con As New MySQLConnection(New MySQLConnectionString("127.0.0.1", "bdd_prog_gestion", "root", "root", 3306).AsString)
   
    Dim cmd As New MySQLCommand(query, con)
    Dim da As New MySQLDataAdapter(cmd)
    Dim drd As MySQLDataReader

    Try
        con.Open()
        drd = CType(cmd.ExecuteReader(), MySQLDataReader)

        If drd.Read() Then
        'Cargando dátos en cajas de texto.
            Me.txt21.Text() = drd.Item("nombre").ToString()
            Me.txt238.Text() = drd.Item("nombre_comun").ToString()
        End If

        drd.Close()
        con.Close()

    Catch ex As Exception
        MsgBox("Error de bloque 3.")
    Finally
        If con.State = ConnectionState.Open Then
            con.Close()
        End If
    End Try
End Using


'############
'# ELIMINAR #
'############

Dim query As String

query = "QUERY " & txt85.Text & ";"

Using con As New MySQLConnection(New MySQLConnectionString("127.0.0.1", "bdd_prog_gestion", "root", "root", 3306).AsString)

    Dim cmd As New MySQLCommand(query, con)
    Dim da As New MySQLDataAdapter(cmd)
    Dim drd As MySQLDataReader

    Try
        con.Open()
        drd = CType(cmd.ExecuteReader(), MySQLDataReader)

        If drd.Read() Then
            Me.txt95.Text() = drd.Item("nombre").ToString()
            Me.txt244.Text() = drd.Item("nombre_comun").ToString()

        drd.Close()
        con.Close()

    Catch ex As Exception
        MsgBox("Error de bloque 3.")
    Finally
        If con.State = ConnectionState.Open Then
            con.Close()
        End If
    End Try
End Using