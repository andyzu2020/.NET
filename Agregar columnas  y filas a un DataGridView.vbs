'****************************
' CON DATOS SIMPLES (SUELTOS)
'****************************

Dim row As String() = {"algo", "asi"}

DataGridView.ColumnCount = 2
DataGridView.Columns(0).Name = "Columna 1"
DataGridView.Columns(1).Name = "Columna 2"

dgvDetec.Rows.Add(row)

'NOTA IMPORTANTE: 
'Recordar que "DataGridView.ColumnCount" no considera el 0, eso quiere decir que del 0 al 4 van 5!!
