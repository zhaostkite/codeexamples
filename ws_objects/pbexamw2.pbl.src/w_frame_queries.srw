$PBExportHeader$w_frame_queries.srw
$PBExportComments$Custom MDI frame with DW button bar user object
forward
global type w_frame_queries from w_center
end type
type mdi_1 from mdiclient within w_frame_queries
end type
type mditbb_1 from tabbedbar within w_frame_queries
end type
type uo_1 from u_dw_ribbon_2 within w_frame_queries
end type
end forward

global type w_frame_queries from w_center
integer width = 2935
integer height = 1980
string title = "Custom MDI Frame"
string menuname = "m_frame_queries"
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
long backcolor = 273241183
toolbaralignment toolbaralignment = alignatleft!
boolean tabbedview = true
mdi_1 mdi_1
mditbb_1 mditbb_1
uo_1 uo_1
end type
global w_frame_queries w_frame_queries

type variables

end variables

on resize;// Resize script for w_mdi_frame_2

int	nX, nY, nWidth, nHeight

nX = WorkSpaceX (this)
nY = WorkSpaceY (this)

nWidth  = this.WorkSpaceWidth( )
nHeight = this.WorkSpaceHeight( )

nHeight = nHeight - (uo_1.y + uo_1.height)
nHeight = nHeight - mdi_1.MicroHelpHeight

mdi_1.Move (0, uo_1.y + uo_1.height)
mdi_1.Resize (nWidth, nHeight + 4)

end on

on open;// disable all of the command buttons on the user object

uo_1.uf_set_buttons (false, false, false, false, false, false, false, false)

end on

on w_frame_queries.create
int iCurrent
call super::create
if this.MenuName = "m_frame_queries" then this.MenuID = create m_frame_queries
this.mdi_1=create mdi_1
this.mditbb_1=create mditbb_1
this.uo_1=create uo_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mdi_1
this.Control[iCurrent+2]=this.mditbb_1
this.Control[iCurrent+3]=this.uo_1
end on

on w_frame_queries.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.mditbb_1)
destroy(this.uo_1)
end on

on close;// Close script 

this.Hide()
w_main.Show()

end on

type mdi_1 from mdiclient within w_frame_queries
long BackColor=273241183
end type

type mditbb_1 from tabbedbar within w_frame_queries
int X=0
int Y=0
int Width=0
int Height=104
end type

type uo_1 from u_dw_ribbon_2 within w_frame_queries
integer width = 2921
integer height = 204
end type

on close;call u_dw_ribbon_2::close;// Close (user defined) script for uo_1 inherited from u_dw_ribbon_2

Close (parent) 

end on

on uo_1.destroy
call u_dw_ribbon_2::destroy
end on

