Private Sub FindAnimal()
    Dim ZooAnimals(2) As String
    ZooAnimals(0) = "lion"
    ZooAnimals(1) = "turtle"
    ZooAnimals(2) = "ostrich"
    Dim turtle As Integer
    turtle = (Array.IndexOf(ZooAnimals,"turtle"))
    MsgBox("The turtle is element " & turtle)
End Sub