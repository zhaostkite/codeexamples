$PBExportHeader$w_dwbuffers_frame.srw
$PBExportComments$MDI Frame for DataWindow buffers example
forward
global type w_dwbuffers_frame from w_center
end type
type mdi_1 from mdiclient within w_dwbuffers_frame
end type
type mditbb_1 from tabbedbar within w_dwbuffers_frame
end type
end forward

global type w_dwbuffers_frame from w_center
integer x = 5
integer y = 4
integer width = 2967
integer height = 1868
string title = "DataWindow Buffers"
string menuname = "m_dwbuffers"
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
long backcolor = 273241183
boolean tabbedview = true
mdi_1 mdi_1
mditbb_1 mditbb_1
end type
global w_dwbuffers_frame w_dwbuffers_frame

type variables
String	is_DBParm
end variables

on w_dwbuffers_frame.create
int iCurrent
call super::create
if this.MenuName = "m_dwbuffers" then this.MenuID = create m_dwbuffers
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mdi_1
this.Control[iCurrent+2]=this.mditbb_1
end on

on w_dwbuffers_frame.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
end on

event open;call super::open;m_dwbuffers	lm_Menu

SetPointer(HourGlass!)

// Set DisableBind DBParm so the SQL Preview will show the full SQL statement
is_DBParm = sqlca.DBParm
sqlca.DBParm = sqlca.DBParm + ", DisableBind=1"

// Open all windows
lm_Menu = This.MenuID
lm_Menu.m_buffers.m_openall.Post Event clicked()

// Retrieve data
lm_Menu.m_file.m_retrieve.Post Event clicked()

end event

event close;// Restore the DBParm attribute
sqlca.DBParm = is_DBParm

Show(w_main)

end event

type mdi_1 from mdiclient within w_dwbuffers_frame
long BackColor=273241183
end type

type mditbb_1 from tabbedbar within w_dwbuffers_frame
int X=0
int Y=0
int Width=0
int Height=104
end type

