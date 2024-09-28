$PBExportHeader$w_center.srw
$PBExportComments$Centers a window
forward
global type w_center from window
end type
end forward

global type w_center from window
integer width = 2706
integer height = 1620
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
event ue_setflag ( )
end type
global w_center w_center

type variables
eon_appeon_resize  ieon_resize
end variables

forward prototypes
public function integer f_center ()
end prototypes

event ue_setflag();//====================================================================
// 
//   event name : ue_setflag
//
//   Description:
//				   "1111" :"X","Y","Width","Height"
//                   X/Y:0 - Keeps unchanged; 1 - Changes proportionally; 2 - Moves to right horizontally.
//                   width: 0 - Keeps unchanged; 1 - Changes proportionally; 2 - Extends to right horizontally; 
//                             3 - Extends to left horizontally; 4 - Extends to right edge; 5 - Extends to left edge.
//                  Height: 0 - Keeps unchanged; 1 - Changes proportionally; 2 - Extends down vertically; 
//					         3 - Extends up vertically; 4 - Extends to the bottom; 5 - Extends to the top.
//
//   Argument：(None)
//				   
//
//   Return ：  (None)
//
//   Modify Date：2018-01-30
//====================================================================

end event

public function integer f_center ();//*-----------------------------------------------------------------*/
//*    f_Center:  Center the window
//*-----------------------------------------------------------------*/
int li_screenheight, li_screenwidth, li_rc, li_x=1, li_y=1
environment	lenv_obj

/*  Check for a window association with this object  */
If IsNull ( this ) Or Not IsValid ( this ) Then Return -1

/*  Get environment  */
If GetEnvironment ( lenv_obj ) = -1 Then Return -1

/*  Determine current screen resolution and validate  */
li_screenheight = PixelsToUnits ( lenv_obj.ScreenHeight, YPixelsToUnits! )
li_screenwidth  = PixelsToUnits ( lenv_obj.ScreenWidth, XPixelsToUnits! )
If Not ( li_screenheight > 0 ) Or Not ( li_screenwidth > 0 ) Then Return -1

/*  Get center points  */
If li_screenwidth > this.Width Then
	li_x = ( li_screenwidth / 2 ) - ( this.Width / 2 )
End If
If li_screenheight > this.Height Then
	li_y = ( li_screenheight / 2 ) - ( this.Height / 2 )
End If

/*  Center window  */
li_rc = this.Move ( li_x, li_y )
If li_rc <> 1 Then Return -1


Return 1
end function

on w_center.create
end on

on w_center.destroy
end on

event open;//Commment this code for the add DynamicTab Control in the main window on 2022/10/13.
//f_Center ( )

If gb_resize = true Then 
	ieon_resize = create eon_appeon_resize
	
	ieon_resize.of_init(this,true)
	
	ieon_resize.of_fontresize(true,3)
	ieon_resize.of_zoom( true, 3)
	
	event ue_setflag()

End If
end event

event close;//
If isvalid(ieon_resize) Then Destroy ieon_resize
end event

event resize;//
if Isvalid(ieon_resize) then
	ieon_resize.of_resize(this,newwidth,newheight,true)
end if
//

end event

