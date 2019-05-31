Imports System.Security.Principal

Dim esSystem As Boolean = WindowsIdentity.GetAnonymous.IsSystem
Dim esInvitado As Boolean = WindowsIdentity.GetAnonymous.IsGuest

