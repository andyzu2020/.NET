WebBrowser1.Url = New System.Uri("http://192.168.1.1/", System.UriKind.Absolute)
WaitForPageLoad()


WebBrowser1.Document.All("Username").SetAttribute("value", "user")
WebBrowser1.Document.All("Password").SetAttribute("value", "user")
WebBrowser1.Document.All("LoginId").InvokeMember("click")



#Region "Esperar a que la pagina se cargue"
    Private Sub WaitForPageLoad()
        AddHandler WebBrowser1.DocumentCompleted, New WebBrowserDocumentCompletedEventHandler(AddressOf PageWaiter)
        While Not pageready
            Application.DoEvents()
        End While
        pageready = False
    End Sub

    Private Sub PageWaiter(ByVal sender As Object, ByVal e As WebBrowserDocumentCompletedEventArgs)
        If WebBrowser1.ReadyState = WebBrowserReadyState.Complete Then
            pageready = True
            RemoveHandler WebBrowser1.DocumentCompleted, New WebBrowserDocumentCompletedEventHandler(AddressOf PageWaiter)
        End If
    End Sub
#End Region