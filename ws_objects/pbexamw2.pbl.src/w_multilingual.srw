$PBExportHeader$w_multilingual.srw
$PBExportComments$Select a language for the multilingual example
forward
global type w_multilingual from w_center
end type
type st_1 from statictext within w_multilingual
end type
type lb_1 from listbox within w_multilingual
end type
type cb_ok from commandbutton within w_multilingual
end type
type cb_cancel from commandbutton within w_multilingual
end type
end forward

global type w_multilingual from w_center
integer x = 882
integer y = 488
integer width = 1989
integer height = 1576
string title = "Multi-Lingual Example"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
st_1 st_1
lb_1 lb_1
cb_ok cb_ok
cb_cancel cb_cancel
end type
global w_multilingual w_multilingual

forward prototypes
protected subroutine wf_open_language (int ai_index)
end prototypes

protected subroutine wf_open_language (int ai_index);//////////////////////////////////////////////////////////////////////
//
// Function: wf_open_language
//
// Purpose: opens the correct multi-lingual window based on the index
//				that is passed to this function
//
//	Scope: protected
//
//	Arguments: ai_index	the index selection from the listbox of language choices.
//
//	Returns: none
//
//////////////////////////////////////////////////////////////////////

choose case ai_index

	case 1
		Open (w_ancestor)

	case 2
		Open (w_french)

	case 3
		Open (w_dutch)

	case 4
		Open (w_spanish)

end choose
end subroutine

event open;call super::open;// select the first item in the language choices listbox

lb_1.SelectItem (1)
end event

on w_multilingual.create
int iCurrent
call super::create
this.st_1=create st_1
this.lb_1=create lb_1
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.lb_1
this.Control[iCurrent+3]=this.cb_ok
this.Control[iCurrent+4]=this.cb_cancel
end on

on w_multilingual.destroy
call super::destroy
destroy(this.st_1)
destroy(this.lb_1)
destroy(this.cb_ok)
destroy(this.cb_cancel)
end on

event close;call super::close;//w_main.Show()
end event

type st_1 from statictext within w_multilingual
integer x = 32
integer y = 36
integer width = 1531
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
string text = "Select a window to open"
boolean focusrectangle = false
end type

type lb_1 from listbox within w_multilingual
integer x = 78
integer y = 164
integer width = 1774
integer height = 940
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
boolean vscrollbar = true
boolean sorted = false
string item[] = {"English - (ancestor window)","French - (inherited)","Dutch - (inherited)","Spanish - (inherited)"}
borderstyle borderstyle = stylelowered!
end type

on doubleclicked;cb_ok.TriggerEvent (clicked!)
end on

type cb_ok from commandbutton within w_multilingual
integer x = 521
integer y = 1236
integer width = 380
integer height = 118
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "OK"
boolean default = true
end type

on clicked;wf_open_language (lb_1.SelectedIndex())
end on

type cb_cancel from commandbutton within w_multilingual
integer x = 983
integer y = 1236
integer width = 379
integer height = 120
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancel"
boolean cancel = true
end type

on clicked;close (parent)
end on

