' primero asignar las columnas como no sortables, osea, no ordenables
dgv1.Columns("nombre_columna").SortMode = DataGridViewColumnSortMode.NotSortable

' segundo asignarle que se centre el texto de la columna
dgv1.ColumnHeadersDefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter