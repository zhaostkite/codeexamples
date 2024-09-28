$PBExportHeader$w_dde_server.srw
$PBExportComments$Works with w_dde_client to demonstrate how to do a PB DDE server
forward
global type w_dde_server from w_center
end type
type st_6 from statictext within w_dde_server
end type
type cbx_data3 from checkbox within w_dde_server
end type
type cbx_data2 from checkbox within w_dde_server
end type
type cbx_data1 from checkbox within w_dde_server
end type
type sle_data3 from singlelineedit within w_dde_server
end type
type st_4 from statictext within w_dde_server
end type
type mle_msg from multilineedit within w_dde_server
end type
type sle_data2 from singlelineedit within w_dde_server
end type
type sle_data1 from singlelineedit within w_dde_server
end type
type st_2 from statictext within w_dde_server
end type
type st_1 from statictext within w_dde_server
end type
type st_3 from statictext within w_dde_server
end type
type st_5 from statictext within w_dde_server
end type
end forward

global type w_dde_server from w_center
integer x = 23
integer y = 140
integer width = 1298
integer height = 948
string title = "DDE Server"
long backcolor = 78748035
toolbaralignment toolbaralignment = alignatleft!
st_6 st_6
cbx_data3 cbx_data3
cbx_data2 cbx_data2
cbx_data1 cbx_data1
sle_data3 sle_data3
st_4 st_4
mle_msg mle_msg
sle_data2 sle_data2
sle_data1 sle_data1
st_2 st_2
st_1 st_1
st_3 st_3
st_5 st_5
end type
global w_dde_server w_dde_server

type variables
String is_ddeappl = "DDE_Demo",is_ddetopic="DDE"
string is_item1="Data1",is_item2="Data2",is_item3="Data3"

end variables

forward prototypes
public subroutine set_msg (string msg)
public subroutine check_hotlink (checkbox status, string data, string item)
end prototypes

public subroutine set_msg (string msg);// display the message
mle_msg.text = msg
end subroutine

public subroutine check_hotlink (checkbox status, string data, string item);int resp 
// if the checkbox is checked then the field is hotlinked
if status.checked then
	// send the hotlinked data to the requestor application
	resp = setdatadde(data,is_ddeappl,is_ddetopic,item)
	if resp <> 1 then messagebox("Error on hotlink handler","Setdatadde Failed for data area = "+item+". Error code = "+string(resp))
end if
end subroutine

on remoterequest;string data,appl,topic
// who sent the request and what is it?
getdataddeorigin(appl,topic,data)
set_msg("Remoterequest triggered, ~r~n  Application = "+appl+"~r~n  Topic = "+topic+"~r~n  Request = "+data)
choose case data
	case is_item1
		data = sle_data1.text
	case is_item2
		data = sle_data2.text
	case is_item3
		data = sle_data3.text
	case else
		data = "Unknown Request"
end choose
// send the data back
setdatadde(data)

end on

event open;call super::open;// start the server and specify what it will support
if startserverdde(is_ddeappl,is_ddetopic,is_item1,is_item2,is_item3) = 1 then 
	set_msg("Server Started")
end if


end event

on remoteexec;string data,appl,topic
// who is the command from 
getcommandddeorigin(appl)
// what is the command
getcommanddde(data)
Set_msg("remoteexec triggered, ~r~n  Application = "+appl+"~r~n  Request = "+data)
// tell the sender that we got the message OK
respondremote(true)
end on

on w_dde_server.create
int iCurrent
call super::create
this.st_6=create st_6
this.cbx_data3=create cbx_data3
this.cbx_data2=create cbx_data2
this.cbx_data1=create cbx_data1
this.sle_data3=create sle_data3
this.st_4=create st_4
this.mle_msg=create mle_msg
this.sle_data2=create sle_data2
this.sle_data1=create sle_data1
this.st_2=create st_2
this.st_1=create st_1
this.st_3=create st_3
this.st_5=create st_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_6
this.Control[iCurrent+2]=this.cbx_data3
this.Control[iCurrent+3]=this.cbx_data2
this.Control[iCurrent+4]=this.cbx_data1
this.Control[iCurrent+5]=this.sle_data3
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.mle_msg
this.Control[iCurrent+8]=this.sle_data2
this.Control[iCurrent+9]=this.sle_data1
this.Control[iCurrent+10]=this.st_2
this.Control[iCurrent+11]=this.st_1
this.Control[iCurrent+12]=this.st_3
this.Control[iCurrent+13]=this.st_5
end on

on w_dde_server.destroy
call super::destroy
destroy(this.st_6)
destroy(this.cbx_data3)
destroy(this.cbx_data2)
destroy(this.cbx_data1)
destroy(this.sle_data3)
destroy(this.st_4)
destroy(this.mle_msg)
destroy(this.sle_data2)
destroy(this.sle_data1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.st_5)
end on

event close;call super::close;// stop the server
stopserverdde(is_ddeappl,is_ddetopic)
if isvalid(w_dde_client) then close(w_dde_client)

end event

on remotehotlinkstart;string item,appl,topic
// Who wants to be hotlinked and what do they want to be hotlinked on
getdataddeorigin(appl,topic,item)
Set_msg("remotehotlinkstart triggered, ~r~n  Application = "+appl+"~r~n  Topic = "+topic+"~r~n  Item = "+item)
choose case item
	case is_item1
		cbx_data1.checked = true
	case is_item2
		cbx_data2.checked = true
	case is_item3
		cbx_data3.checked = true
	case else
		messagebox("remotehotlinkstart","Unknown item requested. Item = "+item)
		respondremote(false)
		return
end choose
// tell the requesttor that we got the message OK
respondremote(true)


end on

on remotehotlinkstop;string item,appl,topic
beep(1)
// who wants to stop the hotlink and what do they want to stop linking on
getdataddeorigin(appl,topic,item)
Set_msg("remotehotlinkstop triggered, ~r~n  Application = "+appl+"~r~n  Topic = "+topic+"~r~n  Item = "+item)
choose case item
	case is_item1
		cbx_data1.checked = false
	case is_item2
		cbx_data2.checked = false
	case is_item3 
		cbx_data3.checked = false
	case else
		messagebox("remotehotlinkstart","Unknown item requested. Item = "+item)
		respondremote(false)
		return
end choose
// tell the requestor that we got the message OK
respondremote(true)


end on

type st_6 from statictext within w_dde_server
integer x = 9
integer y = 32
integer width = 261
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
boolean enabled = false
string text = "Data Area"
alignment alignment = center!
end type

type cbx_data3 from checkbox within w_dde_server
integer x = 1015
integer y = 308
integer width = 82
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
boolean enabled = false
end type

type cbx_data2 from checkbox within w_dde_server
integer x = 1015
integer y = 212
integer width = 82
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
boolean enabled = false
end type

type cbx_data1 from checkbox within w_dde_server
integer x = 1015
integer y = 116
integer width = 82
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
boolean enabled = false
end type

type sle_data3 from singlelineedit within w_dde_server
integer x = 178
integer y = 300
integer width = 713
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

on modified;// determine if the field is hotlinked
check_hotlink(cbx_data3,this.text,is_item3)

end on

type st_4 from statictext within w_dde_server
integer x = 55
integer y = 300
integer width = 105
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
boolean enabled = false
string text = "#3"
alignment alignment = center!
end type

type mle_msg from multilineedit within w_dde_server
integer x = 23
integer y = 464
integer width = 1189
integer height = 356
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_data2 from singlelineedit within w_dde_server
integer x = 178
integer y = 204
integer width = 713
integer height = 84
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

on modified;// determine if the field is hotlinked
check_hotlink(cbx_data2,this.text,is_item2)

end on

type sle_data1 from singlelineedit within w_dde_server
integer x = 178
integer y = 108
integer width = 713
integer height = 84
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

on modified;// determine if the field is hotlinked
check_hotlink(cbx_data1,this.text,is_item1)

end on

type st_2 from statictext within w_dde_server
integer x = 64
integer y = 208
integer width = 101
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
boolean enabled = false
string text = "#2"
alignment alignment = center!
end type

type st_1 from statictext within w_dde_server
integer x = 64
integer y = 116
integer width = 101
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
boolean enabled = false
string text = "#1"
alignment alignment = center!
end type

type st_3 from statictext within w_dde_server
integer x = 32
integer y = 404
integer width = 210
integer height = 48
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

type st_5 from statictext within w_dde_server
integer x = 901
integer y = 52
integer width = 306
integer height = 68
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 78748035
boolean enabled = false
string text = "Hot linked"
alignment alignment = center!
end type

