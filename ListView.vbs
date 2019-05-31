Agregar un elemento:
ListView.Items.Add(text, 1)


Remover un elemento:

De manera simple:
ListView.Items.Remove(lvi) ' lvi es un objeto ListViewItem


Recorriendo todos los elementos del objeto ListView
Dim lvi As ListViewItem
For Each lvi In ListView.Items
    If lvi.Name = text Then
        ListView.Items.Remove(lvi)
    End If
Next