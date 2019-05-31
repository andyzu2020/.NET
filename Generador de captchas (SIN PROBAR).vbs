#Region " Captcha Generator Function "
 
    ' [ Captcha Generator Function ]
    '
    ' Instructions:
    ' Copy the Captcha Class into a new Class "Captcha.vb"
    '
    ' Examples :
    ' Dim myCaptcha As New Captcha
    ' PictureBox1.Image = myCaptcha.GenerateCaptcha(5) ' Generate a captcha of 5 letters
    ' MsgBox(myCaptcha.Check(TextBox1.Text, True)) ' Check if the given text is correct
 
 
    ' Captcha.vb
#Region " Captcha Class "
 
    Imports System.Drawing
    Imports System.Drawing.Drawing2D
 
    Public Class Captcha
 
        Dim cap As String
 
        Public ReadOnly Property CaptchaString As String
            Get
                Return cap
            End Get
        End Property
 
        ' Generate Captcha
        Function GenerateCaptcha(ByVal NumberOfCharacters As Integer) As Bitmap
            Dim R As New Random
            Dim VerticalLineSpaceing As Integer = R.Next(5, 10) ' The space between each horizontal line
            Dim HorisontalLineSpaceing As Integer = R.Next(5, 10) ' The space between each Vertical line
            Dim CWidth As Integer = (NumberOfCharacters * 120) 'Generating the width
            Dim CHeight As Integer = 180 ' the height
            Dim CAPTCHA As New Bitmap(CWidth, CHeight)
            Dim allowedCharacters() As Char = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM123456789".ToCharArray 'Guess
            Dim str(NumberOfCharacters - 1) As Char ' The String to turn into a captcha
 
            For i = 0 To NumberOfCharacters - 1
                str(i) = allowedCharacters(R.Next(0, 61)) ' Generating random characters
            Next
 
            Using g As Graphics = Graphics.FromImage(CAPTCHA)
 
                ' the gradient brush for the background
                Dim gradient As New Drawing2D.LinearGradientBrush(New Point(0, CInt(CHeight / 2)), New Point(CWidth, CInt(CHeight / 2)), Drawing.Color.FromArgb(R.Next(&HFF7D7D7D, &HFFFFFFFF)), Drawing.Color.FromArgb(R.Next(&HFF7D7D7D, &HFFFFFFFF)))
 
                g.FillRectangle(gradient, New Rectangle(0, 0, CWidth, CHeight))
                Dim plist As New List(Of Point) ' the list of points the curve goes through
 
                For i = 0 To str.Length - 1
                    Dim FHeight As Integer = R.Next(60, 100) 'Font height in EM
                    Dim Font As New Font("Arial", FHeight)
                    Dim Y As Integer = R.Next(0, (CHeight - FHeight) - 40) 'Generating the Y value of a char: will be between the top  and (bottom - 40) to prevent half characters
                    Dim X As Integer = CInt((((i * CWidth) - 10) / NumberOfCharacters))  'Some formula that made sense At the time that I typed it to generate the X value
                    Dim p As New Point(X, Y)
 
                    g.DrawString(str(i).ToString, Font, Brushes.Black, p)
 
                    plist.Add(New Point(X, R.Next(CInt((CHeight / 2) - 40), CInt((CHeight / 2) + 40)))) ' add the points to the array
                Next
 
                plist.Add(New Point(CWidth, CInt(CHeight / 2))) 'for some reason it doesn't go to the end so we manually add the last point
                Dim ppen As New Pen(Brushes.Black, R.Next(5, 10)) ' the pen used to draw the curve
                g.DrawCurve(ppen, plist.ToArray)
                Dim pen As New Pen(Brushes.SteelBlue, CSng(R.Next(1, 2))) 'the pen that will draw the horisontal and vertical lines.
 
                ' Drawing the vertical lines
                For i = 1 To CWidth
                    Dim ptop As New Point(i * VerticalLineSpaceing, 0)
                    Dim pBottom As New Point(i * VerticalLineSpaceing, CHeight)
                    g.DrawLine(pen, ptop, pBottom)
                Next
 
                ' Drawing the horizontal lines
                For i = 1 To CHeight
                    Dim ptop As New Point(0, i * HorisontalLineSpaceing)
                    Dim pBottom As New Point(CWidth, i * HorisontalLineSpaceing)
                    g.DrawLine(pen, ptop, pBottom)
                Next
 
                ' Drawing the Black noise particles
                Dim numnoise As Integer = CInt(CWidth * CHeight / 25) 'calculating the  number of noise for the block. This will generate 1 Noise per 25X25 block of pixels if im correct
 
                For i = 1 To numnoise / 2
                    Dim X As Integer = R.Next(0, CWidth)
                    Dim Y As Integer = R.Next(0, CHeight)
                    Dim int As Integer = R.Next(1, 2)
                    g.FillEllipse(Brushes.Black, New Rectangle(X, Y, R.Next(2, 5), R.Next(2, 5))) 'Size of the white noise
                Next
 
                ' Drawing the white noise particles
                For i = 1 To numnoise / 2
                    Dim X As Integer = R.Next(0, CWidth)
                    Dim Y As Integer = R.Next(0, CHeight)
                    Dim int As Integer = R.Next(1, 2)
                    g.FillEllipse(Brushes.White, New Rectangle(X, Y, R.Next(2, 5), R.Next(2, 5))) 'Size of the white noise
                Next
 
            End Using
 
            cap = str
            Return CAPTCHA
        End Function
 
        ' Check captcha
        Function Check(ByVal captcha As String, Optional ByVal IgnoreCase As Boolean = False) As Boolean
            If IgnoreCase Then
                If captcha.ToLower = CaptchaString.ToLower Then
                    Return True
                Else
                    Return False
                End If
            Else
                If captcha = CaptchaString Then
                    Return True
                Else
                    Return False
                End If
            End If
        End Function
 
    End Class
 
#End Region
 
#End Region