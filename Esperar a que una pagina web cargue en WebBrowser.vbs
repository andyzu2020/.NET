' PARA CONTROLES WEBBROWSER O SIMILARES QUE MANEJEN EL METODO DocumentCompleted


wbAux.Url = New System.Uri(ruta, System.UriKind.Absolute)
'wbAux.Navigate(ruta) ' Por lo gral NO es normal que sea necesario, navega solo con declararle la URL.
WaitForPageLoad()


#Region "Page Loading Functions"
	Private Property pageready As Boolean = False

    Private Sub WaitForPageLoad()
        AddHandler wbAux.DocumentCompleted, New WebBrowserDocumentCompletedEventHandler(AddressOf PageWaiter)
        While Not pageready
            Application.DoEvents()
        End While
        pageready = False
    End Sub

    Private Sub PageWaiter(ByVal sender As Object, ByVal e As WebBrowserDocumentCompletedEventArgs)
        If wbAux.ReadyState = WebBrowserReadyState.Complete Then
            pageready = True
            RemoveHandler wbAux.DocumentCompleted, New WebBrowserDocumentCompletedEventHandler(AddressOf PageWaiter)
        End If
    End Sub

#End Region




' PARA CONTROLES QUE NO MANEJEN EL EVENTO O COMO ALTERNATIVA AL CODIGO ANTERIOR


While wbAux2.IsBusy
	Application.DoEvents()
End While