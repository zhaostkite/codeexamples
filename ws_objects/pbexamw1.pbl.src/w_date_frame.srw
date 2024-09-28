$PBExportHeader$w_date_frame.srw
$PBExportComments$MDI Frame for Year 2000 example
forward
global type w_date_frame from w_center
end type
type mdi_1 from mdiclient within w_date_frame
end type
type mditbb_1 from tabbedbar within w_date_frame
end type
end forward

global type w_date_frame from w_center
integer x = 5
integer y = 4
integer width = 2793
integer height = 1588
string title = "Year 2000 Example"
string menuname = "m_date_frame"
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
long backcolor = 277038117
boolean tabbedview = true
mdi_1 mdi_1
mditbb_1 mditbb_1
end type
global w_date_frame w_date_frame

on w_date_frame.create
int iCurrent
call super::create
if this.MenuName = "m_date_frame" then this.MenuID = create m_date_frame
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mdi_1
this.Control[iCurrent+2]=this.mditbb_1
end on

on w_date_frame.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
end on

event close;w_main.Show()

end event

type mdi_1 from mdiclient within w_date_frame
long BackColor=277038117
end type

type mditbb_1 from tabbedbar within w_date_frame
int X=0
int Y=0
int Width=0
int Height=104
end type

