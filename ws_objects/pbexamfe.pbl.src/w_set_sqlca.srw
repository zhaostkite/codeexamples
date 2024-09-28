$PBExportHeader$w_set_sqlca.srw
$PBExportComments$Change to new sample database
forward
global type w_set_sqlca from w_center
end type
type sle_logpass from singlelineedit within w_set_sqlca
end type
type sle_logid from singlelineedit within w_set_sqlca
end type
type sle_server from singlelineedit within w_set_sqlca
end type
type sle_database from singlelineedit within w_set_sqlca
end type
type sle_dbpass from singlelineedit within w_set_sqlca
end type
type sle_userid from singlelineedit within w_set_sqlca
end type
type sle_dbms from singlelineedit within w_set_sqlca
end type
type st_12 from statictext within w_set_sqlca
end type
type st_11 from statictext within w_set_sqlca
end type
type st_10 from statictext within w_set_sqlca
end type
type sle_dbparm from singlelineedit within w_set_sqlca
end type
type cb_cancel from commandbutton within w_set_sqlca
end type
type cb_ok from commandbutton within w_set_sqlca
end type
type st_9 from statictext within w_set_sqlca
end type
type st_6 from statictext within w_set_sqlca
end type
type st_5 from statictext within w_set_sqlca
end type
type st_4 from statictext within w_set_sqlca
end type
type st_3 from statictext within w_set_sqlca
end type
type st_2 from statictext within w_set_sqlca
end type
type st_1 from statictext within w_set_sqlca
end type
type st_7 from statictext within w_set_sqlca
end type
end forward

global type w_set_sqlca from w_center
integer x = 681
integer y = 268
integer width = 2373
integer height = 1744
string title = "Set Value for Transaction Object"
windowtype windowtype = response!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
sle_logpass sle_logpass
sle_logid sle_logid
sle_server sle_server
sle_database sle_database
sle_dbpass sle_dbpass
sle_userid sle_userid
sle_dbms sle_dbms
st_12 st_12
st_11 st_11
st_10 st_10
sle_dbparm sle_dbparm
cb_cancel cb_cancel
cb_ok cb_ok
st_9 st_9
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
st_7 st_7
end type
global w_set_sqlca w_set_sqlca

event open;call super::open;f_Center ( )

// Open script for W_SET_SQLCA
sle_dbms.Text = sqlca.DBMS
sle_database.Text = sqlca.database
sle_userid.Text	= sqlca.userid
sle_dbpass.Text	= sqlca.dbpass
sle_logid.Text		= sqlca.logid
sle_logpass.Text	= sqlca.logpass
sle_server.Text	= sqlca.servername	
sle_dbparm.Text	= sqlca.dbparm
end event

on w_set_sqlca.create
int iCurrent
call super::create
this.sle_logpass=create sle_logpass
this.sle_logid=create sle_logid
this.sle_server=create sle_server
this.sle_database=create sle_database
this.sle_dbpass=create sle_dbpass
this.sle_userid=create sle_userid
this.sle_dbms=create sle_dbms
this.st_12=create st_12
this.st_11=create st_11
this.st_10=create st_10
this.sle_dbparm=create sle_dbparm
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.st_9=create st_9
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.st_7=create st_7
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_logpass
this.Control[iCurrent+2]=this.sle_logid
this.Control[iCurrent+3]=this.sle_server
this.Control[iCurrent+4]=this.sle_database
this.Control[iCurrent+5]=this.sle_dbpass
this.Control[iCurrent+6]=this.sle_userid
this.Control[iCurrent+7]=this.sle_dbms
this.Control[iCurrent+8]=this.st_12
this.Control[iCurrent+9]=this.st_11
this.Control[iCurrent+10]=this.st_10
this.Control[iCurrent+11]=this.sle_dbparm
this.Control[iCurrent+12]=this.cb_cancel
this.Control[iCurrent+13]=this.cb_ok
this.Control[iCurrent+14]=this.st_9
this.Control[iCurrent+15]=this.st_6
this.Control[iCurrent+16]=this.st_5
this.Control[iCurrent+17]=this.st_4
this.Control[iCurrent+18]=this.st_3
this.Control[iCurrent+19]=this.st_2
this.Control[iCurrent+20]=this.st_1
this.Control[iCurrent+21]=this.st_7
end on

on w_set_sqlca.destroy
call super::destroy
destroy(this.sle_logpass)
destroy(this.sle_logid)
destroy(this.sle_server)
destroy(this.sle_database)
destroy(this.sle_dbpass)
destroy(this.sle_userid)
destroy(this.sle_dbms)
destroy(this.st_12)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.sle_dbparm)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.st_9)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_7)
end on

type sle_logpass from singlelineedit within w_set_sqlca
integer x = 640
integer y = 1052
integer width = 1125
integer height = 80
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_logid from singlelineedit within w_set_sqlca
integer x = 640
integer y = 936
integer width = 1125
integer height = 80
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_server from singlelineedit within w_set_sqlca
integer x = 640
integer y = 820
integer width = 1125
integer height = 80
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_database from singlelineedit within w_set_sqlca
integer x = 640
integer y = 704
integer width = 1125
integer height = 80
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_dbpass from singlelineedit within w_set_sqlca
integer x = 640
integer y = 588
integer width = 1125
integer height = 80
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_userid from singlelineedit within w_set_sqlca
integer x = 640
integer y = 472
integer width = 1125
integer height = 80
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_dbms from singlelineedit within w_set_sqlca
integer x = 640
integer y = 356
integer width = 1125
integer height = 80
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
borderstyle borderstyle = stylelowered!
end type

type st_12 from statictext within w_set_sqlca
integer x = 41
integer y = 196
integer width = 2240
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Database option to modify these at any time."
long bordercolor = 8388608
boolean focusrectangle = false
end type

type st_11 from statictext within w_set_sqlca
integer x = 41
integer y = 100
integer width = 2240
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "samples can be run.  The Code Examples front-end menu has a Change"
long bordercolor = 8388608
boolean focusrectangle = false
end type

type st_10 from statictext within w_set_sqlca
integer x = 41
integer y = 12
integer width = 2240
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Transaction values must be set properly before database or DataWindow"
long bordercolor = 8388608
boolean focusrectangle = false
end type

type sle_dbparm from singlelineedit within w_set_sqlca
integer x = 640
integer y = 1168
integer width = 1125
integer height = 80
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
borderstyle borderstyle = stylelowered!
end type

type cb_cancel from commandbutton within w_set_sqlca
integer x = 1216
integer y = 1400
integer width = 466
integer height = 108
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
boolean cancel = true
end type

event clicked;CloseWithReturn (Parent, -1)
end event

type cb_ok from commandbutton within w_set_sqlca
integer x = 672
integer y = 1400
integer width = 466
integer height = 108
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "OK"
boolean default = true
end type

event clicked;SetPointer (HourGlass!)

// Disconnect from the "old" DBMS
Disconnect;

// Set new values in transaction object
sqlca.DBMS = sle_dbms.Text
sqlca.database = sle_database.Text
sqlca.userid = sle_userid.Text
sqlca.dbpass = sle_dbpass.Text
sqlca.logid = sle_logid.Text
sqlca.logpass = sle_logpass.Text
sqlca.servername = sle_server.Text
sqlca.dbparm = sle_dbparm.Text

// Connect to the "new" DBMS
Connect;

//w_main.st_connecting.Hide ()
If sqlca.sqlcode < 0 Then
	MessageBox ("Error:  Unable to Connect to Database", &
					sqlca.sqlerrtext, Exclamation!)
	Return
End If

// New Connect was successful...
// Save paremeters to INI file or registry
f_set_profile("sqlca", "dbms", sle_dbms.Text)
f_set_profile("sqlca", "database", sle_database.Text)
f_set_profile("sqlca", "userid", sle_userid.Text)
f_set_profile("sqlca", "dbpass", sle_dbpass.Text)
f_set_profile("sqlca", "logid", sle_logid.Text)
f_set_profile("sqlca", "logpass", sle_logpass.Text)
f_set_profile("sqlca", "servername", sle_server.Text)
f_set_profile("sqlca", "dbparm", sle_dbparm.Text)

CloseWithReturn (Parent,1)
end event

type st_9 from statictext within w_set_sqlca
integer x = 37
integer y = 1168
integer width = 585
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "DBPARM:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_6 from statictext within w_set_sqlca
integer x = 37
integer y = 1052
integer width = 585
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Logon Password:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_5 from statictext within w_set_sqlca
integer x = 37
integer y = 936
integer width = 585
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Logon ID:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_4 from statictext within w_set_sqlca
integer x = 37
integer y = 588
integer width = 585
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Password:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_set_sqlca
integer x = 37
integer y = 472
integer width = 585
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "User ID:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_set_sqlca
integer x = 37
integer y = 704
integer width = 585
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Database:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_set_sqlca
integer x = 37
integer y = 356
integer width = 585
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "DBMS:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_7 from statictext within w_set_sqlca
integer x = 37
integer y = 820
integer width = 585
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Server Name:"
alignment alignment = right!
boolean focusrectangle = false
end type

