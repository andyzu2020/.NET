' Es la unica fomra, las demas formas sencillas que se encuentran en internet te abren lo que quieren, 
' aunque la ruta este bien.

Shell("rundll32.exe url.dll,FileProtocolHandler " & ("ruta"), 1)

' Application.StartupPath obtiene la ruta de la app