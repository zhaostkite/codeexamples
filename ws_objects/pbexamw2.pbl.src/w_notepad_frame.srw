$PBExportHeader$w_notepad_frame.srw
$PBExportComments$Main MDI frame for w_notepad
forward
global type w_notepad_frame from w_center
end type
type mdi_1 from mdiclient within w_notepad_frame
end type
type mditbb_1 from tabbedbar within w_notepad_frame
end type
end forward

global type w_notepad_frame from w_center
integer x = 23
integer y = 32
integer width = 2871
integer height = 1908
string title = "PowerBuilt Notepad"
string menuname = "m_notepad"
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
long backcolor = 268435456
boolean tabbedview = true
event ue_postopen pbm_custom01
mdi_1 mdi_1
mditbb_1 mditbb_1
end type
global w_notepad_frame w_notepad_frame

type variables
int   i_document_number=0
end variables

event ue_postopen;w_notepad w_sheet

OpenSheet (w_sheet, this, 5, Cascaded!)

end event

event close;f_save_toolbar_profile(This)
Show (w_main)

end event

event open;call super::open;f_get_toolbar_profile(This, 1)

This.PostEvent("ue_postopen")

end event

on w_notepad_frame.create
int iCurrent
call super::create
if this.MenuName = "m_notepad" then this.MenuID = create m_notepad
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mdi_1
this.Control[iCurrent+2]=this.mditbb_1
end on

on w_notepad_frame.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
end on

type mdi_1 from mdiclient within w_notepad_frame
long BackColor=268435456
end type

type mditbb_1 from tabbedbar within w_notepad_frame
int X=0
int Y=0
int Width=0
int Height=104
end type

