$PBExportHeader$w_about_system.srw
$PBExportComments$Displays system information in an about-box style.
forward
global type w_about_system from w_center
end type
type cb_close from commandbutton within w_about_system
end type
type dw_about from uo_about within w_about_system
end type
end forward

global type w_about_system from w_center
integer x = 105
integer y = 160
integer width = 2437
integer height = 1664
string title = "System Information"
long backcolor = 78682240
toolbaralignment toolbaralignment = alignatleft!
cb_close cb_close
dw_about dw_about
end type
global w_about_system w_about_system

type prototypes


end prototypes

forward prototypes
public subroutine centerwindow (window awin)
end prototypes

public subroutine centerwindow (window awin);//////////////////////////////////////////////////////////////////////
// Center a window based on the screen dimensions.
//////////////////////////////////////////////////////////////////////
environment le_env
int screenheight, screenwidth

/* get screen measurements */

GetEnvironment(le_env)
screenheight = PixelsToUnits(le_env.screenheight,YPixelsToUnits!)
screenwidth = PixelsToUnits(le_env.screenwidth,XPixelsToUnits!)

/* now position window */

aWin.Move( (ScreenWidth - aWin.Width) / 2, (ScreenHeight - aWin.Height) / 2 )

end subroutine

event open;call super::open;//////////////////////////////////////////////////////////////////////
// Call window function to center the window.  This window function is
// normally not necessary to center a window.  Windows can be centered
// when they are built in the window painter.  The purpose of this 
// window function is to make an external function call to determine
// the screen dimensions and center the window based on the screen 
// dimensions.
//////////////////////////////////////////////////////////////////////

// this.centerwindow (this)


//////////////////////////////////////////////////////////////////////
// Trigger an event on the datawindow (which is a standard user object)
// to populate the datawindow with system information.
//////////////////////////////////////////////////////////////////////

dw_about.insertrow(0)
dw_about.triggerevent("ue_populate")
end event

event close;call super::close;//w_main.Show()
end event

on w_about_system.create
int iCurrent
call super::create
this.cb_close=create cb_close
this.dw_about=create dw_about
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_close
this.Control[iCurrent+2]=this.dw_about
end on

on w_about_system.destroy
call super::destroy
destroy(this.cb_close)
destroy(this.dw_about)
end on

type cb_close from commandbutton within w_about_system
integer x = 1001
integer y = 1352
integer width = 402
integer height = 118
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

on clicked;close (parent)
end on

type dw_about from uo_about within w_about_system
integer x = 23
integer y = 32
integer width = 2318
integer height = 1232
integer taborder = 10
boolean border = false
boolean livescroll = false
end type

