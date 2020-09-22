VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Begin VB.Form frmMain 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "virtual start page (emu) by amaf"
   ClientHeight    =   2490
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4950
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2490
   ScaleWidth      =   4950
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.TextBox TxtWebPage 
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1095
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   7
      Text            =   "frmMain.frx":08CA
      Top             =   1320
      Width           =   4695
   End
   Begin InetCtlsObjects.Inet Inet1 
      Left            =   4800
      Top             =   2760
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
   End
   Begin MSWinsockLib.Winsock Winsock1 
      Left            =   4800
      Top             =   2160
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.CommandButton Command2 
      Caption         =   "stop"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   3840
      TabIndex        =   3
      Top             =   840
      Width           =   975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "start"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   2640
      TabIndex        =   2
      Top             =   840
      Width           =   975
   End
   Begin VB.Frame Frame1 
      Caption         =   "enter id number:"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   2640
      TabIndex        =   0
      Top             =   120
      Width           =   2175
      Begin VB.TextBox Text1 
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   1935
      End
   End
   Begin VB.Timer Timer1 
      Interval        =   60000
      Left            =   2880
      Top             =   2400
   End
   Begin VB.Label Label3 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "email: amaf@email.com"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   960
      Width           =   2415
   End
   Begin VB.Label Label2 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "url: www.envy.nu/amaf"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   720
      Width           =   2415
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "virtual start page emulator by amaf"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   120
      TabIndex        =   4
      Top             =   120
      Width           =   2415
   End
   Begin VB.Shape Shape1 
      BackStyle       =   1  'Opaque
      Height          =   1095
      Left            =   120
      Top             =   120
      Width           =   2415
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' virtual start page emulator by amaf
' -----------------------------------------------------
' this uses winsock and inet instead of the webbrowser
' component. you can use the winsock command below with
' ie_headers released. but atleast give me credit.
'
' amaf@email.com
' www.envy.nu/amaf
'


Private Sub Command1_Click()
' set timer to zero
' and connect to server using winsock
timer = 0
Winsock1.RemoteHost = "virtualstartpage.com"
Winsock1.RemotePort = 80
Winsock1.Connect
End Sub

Private Sub Command2_Click()
' set timer to zero
' and close winsock
timer = 0
Winsock1.Close
End Sub

Private Sub Timer1_Timer()
' add number
timer = timer + 1
' check if it's 20 minutes yet
If timer = 20 Then
' ok, refresh url now
Inet1.OpenURL "http://www.virtualstartpage.com/vsp/?" + Text1.Text
timer = 0 ' set timer to zero
End If
End Sub

Private Sub Winsock1_Connect()
' ok, emu connected
Dim strCommand As String
Dim strWebPage As String
strWebPage = "http://www.virtualstartpage.com/vsp/?" + Text1.Text
strCommand = "GET " + strWebPage + " HTTP/1.0" + vbCrLf
strCommand = strCommand + "Accept: */*" + vbCrLf
strCommand = strCommand + "Accept: text/html" + vbCrLf
strCommand = strCommand + vbCrLf
Winsock1.SendData strCommand
' get data
End Sub

Private Sub Winsock1_DataArrival(ByVal bytesTotal As Long)
' get data and send to textbox
Dim webData As String
Winsock1.GetData webData, vbString
TxtWebPage.Text = TxtWebPage.Text + webData
End Sub

