Dim folder As New DirectoryInfo("C:\") 
 
For Each file As FileInfo In folderbase.GetFiles() 
    ListBox1.Items.Add(file.Name) 
Next 