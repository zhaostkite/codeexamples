$PBExportHeader$w_dde_client.srw
$PBExportComments$Works with w_dde_server to demonstrate how to do a PB DDE server
forward
global type w_dde_client from w_center
end type
type cb_exit from commandbutton within w_dde_client
end type
type cb_help from commandbutton within w_dde_client
end type
type rb_gr_data3 from radiobutton within w_dde_client
end type
type rb_gr_data2 from radiobutton within w_dde_client
end type
type rb_gr_data1 from radiobutton within w_dde_client
end type
type rb_data3 from radiobutton within w_dde_client
end type
type rb_data2 from radiobutton within w_dde_client
end type
type rb_data1 from radiobutton within w_dde_client
end type
type cb_stop from commandbutton within w_dde_client
end type
type cb_starthotlink from commandbutton within w_dde_client
end type
type st_1 from statictext within w_dde_client
end type
type sle_command from singlelineedit within w_dde_client
end type
type mle_msg from multilineedit within w_dde_client
end type
type cb_getremote from commandbutton within w_dde_client
end type
type cb_exec from commandbutton within w_dde_client
end type
type st_2 from statictext within w_dde_client
end type
type gb_getremote from groupbox within w_dde_client
end type
type gb_hotlinks from groupbox within w_dde_client
end type
end forward

global type w_dde_client from w_center
integer x = 1536
integer y = 180
integer width = 1335
integer height = 1228
string title = "DDE Client"
long backcolor = 78748035
toolbaralignment toolbaralignment = alignatleft!
cb_exit cb_exit
cb_help cb_help
rb_gr_data3 rb_gr_data3
rb_gr_data2 rb_gr_data2
rb_gr_data1 rb_gr_data1
rb_data3 rb_data3
rb_data2 rb_data2
rb_data1 rb_data1
cb_stop cb_stop
cb_starthotlink cb_starthotlink
st_1 st_1
sle_command sle_command
mle_msg mle_msg
cb_getremote cb_getremote
cb_exec cb_exec
st_2 st_2
gb_getremote gb_getremote
gb_hotlinks gb_hotlinks
end type
global w_dde_client w_dde_client

type variables
String is_ddeappl = "DDE_Demo",is_dde_topic="DDE"
String is_hotlink_field = "Data1"
String is_getremote_field = "Data1"
string is_hotlink_list[3]
integer ii_hotlink_cnt = 0
end variables

forward prototypes
public subroutine set_msg (string msg)
end prototypes

public subroutine set_msg (string msg);// display the message
mle_msg.text = msg
end subroutine

event close;call super::close;
integer i,resp
// if there are any running hotlinks then stop them before closing
for i = 1 to 3
	if len(is_hotlink_list[i]) > 0 then 
		resp = stophotlink(is_hotlink_list[i],is_ddeappl,is_dde_topic)
	end if
next
if isvalid(w_dde_server) then close(w_dde_server)
//w_main.show()

end event

on hotlinkalarm;string data,appl,topic,item
// who sent the alarm
getdataddeorigin(appl,topic,item)
// get the data
getdatadde(data)
// tell the sender that we handled the hotlink OK
respondremote(true)
set_msg("Hotlinkalarm triggered. ~r~n  Application = "+appl+" Topic= "+topic+"~r~n  Item = "+item+"~r~n  Data = "+data)
end on

event open;call super::open;Window  w_parent
w_parent = this.ParentWindow()

OpenSheet ( w_dde_server,  w_parent, 0, Layered! )
end event

on w_dde_client.create
int iCurrent
call super::create
this.cb_exit=create cb_exit
this.cb_help=create cb_help
this.rb_gr_data3=create rb_gr_data3
this.rb_gr_data2=create rb_gr_data2
this.rb_gr_data1=create rb_gr_data1
this.rb_data3=create rb_data3
this.rb_data2=create rb_data2
this.rb_data1=create rb_data1
this.cb_stop=create cb_stop
this.cb_starthotlink=create cb_starthotlink
this.st_1=create st_1
this.sle_command=create sle_command
this.mle_msg=create mle_msg
this.cb_getremote=create cb_getremote
this.cb_exec=create cb_exec
this.st_2=create st_2
this.gb_getremote=create gb_getremote
this.gb_hotlinks=create gb_hotlinks
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_exit
this.Control[iCurrent+2]=this.cb_help
this.Control[iCurrent+3]=this.rb_gr_data3
this.Control[iCurrent+4]=this.rb_gr_data2
this.Control[iCurrent+5]=this.rb_gr_data1
this.Control[iCurrent+6]=this.rb_data3
this.Control[iCurrent+7]=this.rb_data2
this.Control[iCurrent+8]=this.rb_data1
this.Control[iCurrent+9]=this.cb_stop
this.Control[iCurrent+10]=this.cb_starthotlink
this.Control[iCurrent+11]=this.st_1
this.Control[iCurrent+12]=this.sle_command
this.Control[iCurrent+13]=this.mle_msg
this.Control[iCurrent+14]=this.cb_getremote
this.Control[iCurrent+15]=this.cb_exec
this.Control[iCurrent+16]=this.st_2
this.Control[iCurrent+17]=this.gb_getremote
this.Control[iCurrent+18]=this.gb_hotlinks
end on

on w_dde_client.destroy
call super::destroy
destroy(this.cb_exit)
destroy(this.cb_help)
destroy(this.rb_gr_data3)
destroy(this.rb_gr_data2)
destroy(this.rb_gr_data1)
destroy(this.rb_data3)
destroy(this.rb_data2)
destroy(this.rb_data1)
destroy(this.cb_stop)
destroy(this.cb_starthotlink)
destroy(this.st_1)
destroy(this.sle_command)
destroy(this.mle_msg)
destroy(this.cb_getremote)
destroy(this.cb_exec)
destroy(this.st_2)
destroy(this.gb_getremote)
destroy(this.gb_hotlinks)
end on

type cb_exit from commandbutton within w_dde_client
integer x = 978
integer y = 972
integer width = 242
integer height = 108
integer taborder = 90
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Exit"
end type

on clicked;close(parent)
end on

type cb_help from commandbutton within w_dde_client
integer x = 978
integer y = 832
integer width = 242
integer height = 108
integer taborder = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Help"
end type

on clicked;f_open_help(classname(parent))
end on

type rb_gr_data3 from radiobutton within w_dde_client
integer x = 73
integer y = 972
integer width = 242
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "Data3"
end type

on clicked;if this.checked then is_getremote_field= this.text
end on

type rb_gr_data2 from radiobutton within w_dde_client
integer x = 73
integer y = 900
integer width = 242
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "Data2"
end type

on clicked;if this.checked then is_getremote_field= this.text
end on

type rb_gr_data1 from radiobutton within w_dde_client
integer x = 73
integer y = 832
integer width = 242
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "Data1"
boolean checked = true
end type

on clicked;if this.checked then is_getremote_field= this.text
end on

type rb_data3 from radiobutton within w_dde_client
integer x = 709
integer y = 640
integer width = 242
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "Data3"
end type

on clicked;if this.checked then is_hotlink_field = this.text
end on

type rb_data2 from radiobutton within w_dde_client
integer x = 709
integer y = 564
integer width = 242
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "Data2"
end type

on clicked;if this.checked then is_hotlink_field = this.text
end on

type rb_data1 from radiobutton within w_dde_client
integer x = 709
integer y = 496
integer width = 242
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "Data1"
boolean checked = true
end type

on clicked;if this.checked then is_hotlink_field = this.text
end on

type cb_stop from commandbutton within w_dde_client
integer x = 992
integer y = 596
integer width = 247
integer height = 108
integer taborder = 100
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Stop"
end type

on clicked;int resp
resp = stophotlink(is_hotlink_field,is_ddeappl,is_dde_topic)
if resp <> 1 then 
	messagebox("Stop Hotlink","Error code = "+string(resp))
	return
end if
// remove the hotlink field from the hotlink list
for resp = 1 to 3
	if is_hotlink_list[resp] = is_hotlink_field then 
		is_hotlink_list[resp] = ''
		return
	end if
next
end on

type cb_starthotlink from commandbutton within w_dde_client
integer x = 992
integer y = 468
integer width = 247
integer height = 108
integer taborder = 70
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Start "
end type

on clicked;int resp
resp = starthotlink(is_hotlink_field,is_ddeappl,is_dde_topic)
if resp <> 1 then 
	messagebox("Starthotlink Error",string(resp))
	return
end if
// place the hotlink filed into the hotlink list
for resp = 1 to 3
	if len(is_hotlink_list[resp]) = 0 then 
		is_hotlink_list[resp] = is_hotlink_field
		return
	end if
next
end on

type st_1 from statictext within w_dde_client
integer x = 41
integer y = 404
integer width = 521
integer height = 112
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
boolean enabled = false
string text = "Execute Remote Command"
end type

type sle_command from singlelineedit within w_dde_client
integer x = 41
integer y = 516
integer width = 553
integer height = 84
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type mle_msg from multilineedit within w_dde_client
integer x = 18
integer y = 84
integer width = 1257
integer height = 304
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 74481808
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_getremote from commandbutton within w_dde_client
integer x = 416
integer y = 884
integer width = 338
integer height = 108
integer taborder = 80
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Getremote "
end type

on clicked;int resp
string data
resp = getremote(is_getremote_field,data,is_ddeappl,is_dde_topic)
if resp = 1 then 
	set_msg("Getremote "+is_getremote_field+" = "+data)
else
	messagebox("getremote error",String(resp))
end if

end on

type cb_exec from commandbutton within w_dde_client
integer x = 41
integer y = 628
integer width = 562
integer height = 108
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Execute Command"
end type

on clicked;// tell the 
int resp
string data
// tell the server to execute a command
resp = execremote(sle_command.text,is_ddeappl,is_dde_topic)
if resp <> 1 then messagebox("error on execremote",string(resp))
end on

type st_2 from statictext within w_dde_client
integer x = 18
integer y = 20
integer width = 407
integer height = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
boolean enabled = false
string text = "Status :"
end type

type gb_getremote from groupbox within w_dde_client
integer x = 32
integer y = 780
integer width = 800
integer height = 292
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "GetRemote"
end type

type gb_hotlinks from groupbox within w_dde_client
integer x = 663
integer y = 404
integer width = 613
integer height = 324
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
string text = "Hot Links"
end type

