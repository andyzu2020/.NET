Dim carpeta As New DirectoryInfo("C:\")
        'listar las carpetas de C
        For Each D As DirectoryInfo In carpeta.GetDirectories
                        listview1.items.add(D.Name)
        Next
 
        'listar los carchivos de C
        For Each F As FileInfo In carpeta.GetFiles
            listview2.items.add(F.FullName)
        Next
