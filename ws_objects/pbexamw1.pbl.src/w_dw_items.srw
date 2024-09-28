$PBExportHeader$w_dw_items.srw
$PBExportComments$Demonstrates use of item vs text in a datawindow; use of accept text as well as itemchanged event
forward
global type w_dw_items from w_center
end type
type sle_item from singlelineedit within w_dw_items
end type
type sle_text from singlelineedit within w_dw_items
end type
type cb_help from commandbutton within w_dw_items
end type
type dw_1 from datawindow within w_dw_items
end type
type st_item_label from statictext within w_dw_items
end type
type st_text_label from statictext within w_dw_items
end type
type cb_close from commandbutton within w_dw_items
end type
type cb_3 from commandbutton within w_dw_items
end type
end forward

global type w_dw_items from w_center
integer x = 105
integer y = 132
integer width = 2702
integer height = 1660
string title = "DataWindow Column Text Value vs. Item Value"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_postopen pbm_custom01
sle_item sle_item
sle_text sle_text
cb_help cb_help
dw_1 dw_1
st_item_label st_item_label
st_text_label st_text_label
cb_close cb_close
cb_3 cb_3
end type
global w_dw_items w_dw_items

type variables

end variables

on ue_postopen;dw_1.SetTransObject (sqlca)
dw_1.Retrieve()
end on

event close;call super::close;//Close script for w_dw_items

//w_main.Show()

end event

on w_dw_items.create
int iCurrent
call super::create
this.sle_item=create sle_item
this.sle_text=create sle_text
this.cb_help=create cb_help
this.dw_1=create dw_1
this.st_item_label=create st_item_label
this.st_text_label=create st_text_label
this.cb_close=create cb_close
this.cb_3=create cb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_item
this.Control[iCurrent+2]=this.sle_text
this.Control[iCurrent+3]=this.cb_help
this.Control[iCurrent+4]=this.dw_1
this.Control[iCurrent+5]=this.st_item_label
this.Control[iCurrent+6]=this.st_text_label
this.Control[iCurrent+7]=this.cb_close
this.Control[iCurrent+8]=this.cb_3
end on

on w_dw_items.destroy
call super::destroy
destroy(this.sle_item)
destroy(this.sle_text)
destroy(this.cb_help)
destroy(this.dw_1)
destroy(this.st_item_label)
destroy(this.st_text_label)
destroy(this.cb_close)
destroy(this.cb_3)
end on

event open;call super::open;//Open script for w_dw_items
//Retrieve data in post open for faster window visible
this.postevent("ue_postopen")

end event

type sle_item from singlelineedit within w_dw_items
integer x = 229
integer y = 148
integer width = 777
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_text from singlelineedit within w_dw_items
integer x = 229
integer y = 48
integer width = 777
integer height = 80
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_help from commandbutton within w_dw_items
integer x = 2263
integer y = 316
integer width = 370
integer height = 108
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Help"
end type

on clicked;f_open_help ('w_dw_items')
end on

type dw_1 from datawindow within w_dw_items
integer x = 41
integer y = 268
integer width = 2162
integer height = 1252
integer taborder = 10
string dataobject = "d_retrieve_cust"
boolean vscrollbar = true
boolean livescroll = true
end type

on editchanged;/////////////////////////////////////////////////////////////////////
// 
// Purpose: to show the text value of the current column changing
//				as data is entered by the user.	
// 
// Log:
//	
//	  DATE	WHO	WHAT
//	--------	---	----
//	04/11/94	mco	initial version
//
/////////////////////////////////////////////////////////////////////


sle_text.text = dw_1.GetText()

end on

on itemfocuschanged;/////////////////////////////////////////////////////////////////////
// 
// Purpose: to show the text and item values of the current column
//		
// 
// Log:
//	
//	  DATE	WHO	WHAT
//	--------	---	----
//	04/11/94	mco	initial version
//
/////////////////////////////////////////////////////////////////////

string	ls_val


// Read & display the column data
if this.GetColumnName() = 'id' then
	ls_val = String (this.GetItemNumber (this.GetRow(), this.GetColumn()))
else
	ls_val = this.GetItemString (this.GetRow(), this.GetColumn())
end if

sle_text.text = ls_val
sle_item.text = ls_val


	
end on

type st_item_label from statictext within w_dw_items
integer x = 41
integer y = 148
integer width = 165
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Item:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_text_label from statictext within w_dw_items
integer x = 41
integer y = 48
integer width = 160
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Text:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_dw_items
integer x = 2263
integer y = 172
integer width = 370
integer height = 108
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Close"
end type

on clicked;// Clicked script for cb_close

Close (parent)
end on

type cb_3 from commandbutton within w_dw_items
integer x = 2263
integer y = 48
integer width = 370
integer height = 108
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Accept Text"
boolean default = true
end type

on clicked;/////////////////////////////////////////////////////////////////////
// 
// Purpose: perform the AcceptText() function to dw_1 and redisplay
//				the current row/column item value.
// 
// Log:
//	
//	  DATE	WHO	WHAT
//	--------	---	----
//	04/11/94	mco	initial version
//
/////////////////////////////////////////////////////////////////////

if dw_1.AcceptText() = 1 then
	if dw_1.GetColumnName() = 'id' then
		sle_item.text = String (dw_1.GetItemNumber (dw_1.GetRow(), dw_1.GetColumn()))
	else
		sle_item.text = dw_1.GetItemString (dw_1.GetRow(), dw_1.GetColumn())
	end if	
end if



end on

