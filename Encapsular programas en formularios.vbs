En el formualario en donde se van a encapsular 
o en otra clase.vb:

Imports Microsoft.VisualBasic
Imports System
Imports System.Windows.Forms
Imports System.Drawing

Public Class Form1
    Inherits System.Windows.Forms.Form
    '
#Region " Código generado por el Diseñador de Windows Forms "
#End Region
    '
    Private hWndPrograma As IntPtr = IntPtr.Zero
    '
    <STAThread()> Shared Sub Main()
        Application.EnableVisualStyles()
        Application.DoEvents()
        '
        Application.Run(New Form1)
    End Sub
    Public Sub New()
        MyBase.New()

        'El Diseñador de Windows Forms requiere esta llamada.
        InitializeComponent()

        'Agregar cualquier inicialización después de la llamada a InitializeComponent()

    End Sub

    Private Sub iniciar(ByVal path As String)
        ' Iniciar el proceso indicado en el parámetro
        Dim pro As New Process
        Dim proInfo As New ProcessStartInfo()

        proInfo.FileName = path
        pro.StartInfo = proInfo
        pro.Start()
        pro.WaitForInputIdle()

        hWndPrograma = WinApi.FindWindow(Nothing, pro.MainWindowTitle)

        WinApi.MoveWindow(hWndPrograma, 0, 0, Me.pnlPpal2.Bounds.Width - 4, Me.pnlPpal2.Bounds.Height - 4, 1)
        WinApi.SetParent(hWndPrograma, pnlPpal2.Handle)
    End Sub
End Class

Clase llamada WinApi:

'------------------------------------------------------------------------------
' Clase con las funciones del API de Windows                        (14/Ago/05)
' Las funciones están declaradas como compartidas
' para usarlas sin crear una instancia.
'
' ©Guillermo 'guille' Som, 2005
'------------------------------------------------------------------------------
Imports Microsoft.VisualBasic
Imports System

Public Class WinApi
    ' Hace que una ventana sea hija (o esté contenida) en otra
    <System.Runtime.InteropServices.DllImport("user32.dll")> Public Shared Function SetParent(ByVal hWndChild As IntPtr, ByVal hWndNewParent As IntPtr) As IntPtr
    End Function
    ' Devuelve el Handle (hWnd) de una ventana de la que sabemos el título
    <System.Runtime.InteropServices.DllImport("user32.dll")> Public Shared Function FindWindow(ByVal lpClassName As String, ByVal lpWindowName As String) As IntPtr
    End Function
    ' Cambia el tamaño y la posición de una ventana
    <System.Runtime.InteropServices.DllImport("user32.dll")> Public Shared Function MoveWindow(ByVal hWnd As IntPtr, ByVal x As Integer, _
ByVal y As Integer, ByVal nWidth As Integer, ByVal nHeight As Integer, ByVal bRepaint As Integer) As Integer
    End Function
End Class