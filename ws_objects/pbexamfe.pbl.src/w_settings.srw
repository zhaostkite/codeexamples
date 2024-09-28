$PBExportHeader$w_settings.srw
forward
global type w_settings from w_center
end type
type st_autosize1 from statictext within w_settings
end type
type st_autosize from statictext within w_settings
end type
type ddlb_1 from dropdownlistbox within w_settings
end type
type ddlb_theme from dropdownlistbox within w_settings
end type
type st_theme from statictext within w_settings
end type
type cbx_enable_autoresize from checkbox within w_settings
end type
type cb_close from commandbutton within w_settings
end type
type cb_save from commandbutton within w_settings
end type
type gb_settings from groupbox within w_settings
end type
end forward

global type w_settings from w_center
integer width = 2034
integer height = 1652
string title = "Settings"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
st_autosize1 st_autosize1
st_autosize st_autosize
ddlb_1 ddlb_1
ddlb_theme ddlb_theme
st_theme st_theme
cbx_enable_autoresize cbx_enable_autoresize
cb_close cb_close
cb_save cb_save
gb_settings gb_settings
end type
global w_settings w_settings

type variables
String 		is_inifile = "exampleapp.ini"
String 		is_theme
String 		is_theme_path
Boolean	ib_enableautoresize

end variables

forward prototypes
public subroutine of_add_theme ()
end prototypes

public subroutine of_add_theme ();Int i
String ls_theme_name
String ls_current_path

//ls_current_path = GetCurrentDirectory( )
is_theme_path = gs_CurrentDirectory + "\Theme\"

ddlb_1.DirList(is_theme_path+'*.*', 32768+16) 

For i = 2 To ddlb_1.totalitems( )
	ls_theme_name = ddlb_1.text(i)
	IF Left(ls_theme_name,1) = "[" THEN ls_theme_name = Mid(ls_theme_name, 2)
	IF Right(ls_theme_name,1) = "]" THEN ls_theme_name = Left(ls_theme_name, Len(ls_theme_name) - 1)
	ls_theme_name = Trim(ls_theme_name)
	IF FileExists(is_theme_path + ls_theme_name + "\theme.json") THEN
		ddlb_theme.Additem(ls_theme_name)
	END IF
Next 
ddlb_theme.Additem("Do Not Use Themes")

ChangeDirectory(ls_current_path)
end subroutine

on w_settings.create
int iCurrent
call super::create
this.st_autosize1=create st_autosize1
this.st_autosize=create st_autosize
this.ddlb_1=create ddlb_1
this.ddlb_theme=create ddlb_theme
this.st_theme=create st_theme
this.cbx_enable_autoresize=create cbx_enable_autoresize
this.cb_close=create cb_close
this.cb_save=create cb_save
this.gb_settings=create gb_settings
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_autosize1
this.Control[iCurrent+2]=this.st_autosize
this.Control[iCurrent+3]=this.ddlb_1
this.Control[iCurrent+4]=this.ddlb_theme
this.Control[iCurrent+5]=this.st_theme
this.Control[iCurrent+6]=this.cbx_enable_autoresize
this.Control[iCurrent+7]=this.cb_close
this.Control[iCurrent+8]=this.cb_save
this.Control[iCurrent+9]=this.gb_settings
end on

on w_settings.destroy
call super::destroy
destroy(this.st_autosize1)
destroy(this.st_autosize)
destroy(this.ddlb_1)
destroy(this.ddlb_theme)
destroy(this.st_theme)
destroy(this.cbx_enable_autoresize)
destroy(this.cb_close)
destroy(this.cb_save)
destroy(this.gb_settings)
end on

event open;call super::open;String ls_theme, ls_enableautoresize


This.SetRedraw(False)
f_Center ( )

//ls_theme = ProfileString(gs_CurrentDirectory+"\" +is_inifile, "Application", "Theme", "Flat Design Blue")

ls_theme = GetTheme()
If ls_theme="" Then ls_theme = "Do Not Use Themes"
of_add_theme()
ddlb_theme.Text = ls_theme
is_theme = ls_theme


cbx_enable_autoresize.checked = gb_resize
ib_enableautoresize = gb_resize

This.SetRedraw(True)


end event

type st_autosize1 from statictext within w_settings
integer x = 293
integer y = 1024
integer width = 1618
integer height = 212
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Additionally, texts may become blurry when the font size increases."
boolean focusrectangle = false
end type

type st_autosize from statictext within w_settings
integer x = 293
integer y = 576
integer width = 1618
integer height = 448
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Note: When this feature is enabled, elements in windows and DataWindows will resize according to the size of the screen. It may cause texts to overflow due to the original locations not big enough to contain the texts. "
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_settings
boolean visible = false
integer x = 1280
integer width = 1029
integer height = 504
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type ddlb_theme from dropdownlistbox within w_settings
integer x = 562
integer y = 132
integer width = 1029
integer height = 504
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_theme from statictext within w_settings
integer x = 69
integer y = 144
integer width = 462
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Theme:"
alignment alignment = right!
boolean focusrectangle = false
end type

type cbx_enable_autoresize from checkbox within w_settings
string tag = "Enable automatic resizing for all windows"
integer x = 293
integer y = 448
integer width = 1426
integer height = 96
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "Enable automatic resizing for all windows"
boolean lefttext = true
end type

type cb_close from commandbutton within w_settings
integer x = 1102
integer y = 1368
integer width = 421
integer height = 120
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "Close"
end type

event clicked;Close(parent)
end event

type cb_save from commandbutton within w_settings
integer x = 480
integer y = 1368
integer width = 421
integer height = 120
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "Save"
end type

event clicked;String 			ls_msg, ls_theme, ls_enableautoresize
Int 				li_ret, li_flag = 0 
Boolean		lb_enable


If cbx_enable_autoresize.checked <> ib_enableautoresize Then
	li_flag += 1
	If cbx_enable_autoresize.checked = True Then
		ls_enableautoresize="1"
	Else
		ls_enableautoresize="0"
	End If
	SetProfileString(gs_CurrentDirectory + "\" + is_inifile, "Application", "Enableautoresize", ls_enableautoresize)
End If

ls_theme = Trim(ddlb_theme.Text )
IF ls_theme <> is_theme  THEN			//AND  ls_theme = "Do Not Use Themes"
	li_flag += 2	
	SetProfileString(gs_CurrentDirectory + "\" + is_inifile, "Application", "Theme", ls_theme)
END IF

Choose Case li_flag		
	Case 0 
//		li_ret =Messagebox("Settings", "No change. ~r~nDo you want to close this window?", Question!, YesNo!, 2)
//		If  li_ret = 1 Then
//			cb_close.event clicked( )	//Close(parent)
//		Else
			Return
//		End If				
//	Case 1
//		ls_msg = "~r~nYou modified the automatic resizing for all windows."
//	Case 2
//		ls_msg = "~r~nYou modified the theme."
//	Case 3
//		ls_msg = "~r~nYou modified the theme and the automatic resizing for all windows."
End Choose 

If li_flag <> 0 Then
	ls_msg += "Settings have been saved successfully.~r~n" +&
			"You must restart your application for the changes to take effect.~r~n" +&
			"Do you want to exit the application now?"
	li_ret = Messagebox("Settings", ls_msg, Question!, YesNo!, 2)
	IF li_ret = 1 THEN
		Halt Close 	//cb_close.event clicked( )		//Close(parent)
	Else
//		If Isvalid(w_main) Then 
//			w_main.Dynamic of_closeallsheetwindow()				
//			w_main.Event ue_resize( )
//		End If
	End If
End If 
end event

type gb_settings from groupbox within w_settings
integer x = 256
integer y = 320
integer width = 1719
integer height = 960
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 67108864
string text = "AutoSize"
end type

