$PBExportHeader$w_train.srw
$PBExportComments$Graphic train chugging along; shows use of animation
forward
global type w_train from w_center
end type
type st_timer_interval from statictext within w_train
end type
type cb_close from commandbutton within w_train
end type
type cb_slower from commandbutton within w_train
end type
type cb_faster from commandbutton within w_train
end type
type cb_stop from commandbutton within w_train
end type
type cb_start from commandbutton within w_train
end type
type train4 from picture within w_train
end type
type train3 from picture within w_train
end type
type train2 from picture within w_train
end type
type train1 from picture within w_train
end type
end forward

shared variables
end variables

global type w_train from w_center
integer x = 727
integer y = 572
integer width = 2437
integer height = 936
string title = "Draw() - Train Example"
windowtype windowtype = popup!
long backcolor = 16777215
toolbaralignment toolbaralignment = alignatleft!
st_timer_interval st_timer_interval
cb_close cb_close
cb_slower cb_slower
cb_faster cb_faster
cb_stop cb_stop
cb_start cb_start
train4 train4
train3 train3
train2 train2
train1 train1
end type
global w_train w_train

type prototypes

end prototypes

type variables
 real   ir_timer_interval
 integer ii_pos
 integer ii_sound
 integer ii_index

end variables

event close;call super::close;//Close script for w_train
//w_main.Show( )
end event

on timer;//Timer script for w_train

picture lp_train

	// set ii_index between 1 and 4 to rotate between 
	// 4 bitmaps, producing animation effect. Train 1 thru 4 are picture
	// objects outside of the visible boundaries of the window. To see
	// them, make the window wider. These are assign to the picture object
	// train, which is drawn and moved across the visible window. 

	ii_index = ii_index + 1
	if (ii_index > 4) then
		ii_index = 1
	end if

	if (ii_index = 1)     then
		lp_train = train1
	elseif (ii_index = 2) then
		lp_train = train2
	elseif (ii_index = 3) then
		lp_train = train3
	elseif (ii_index = 4) then
		lp_train = train4
 	end if

	/*** move train to left by decrementing pos. When ***/
	/*** pos is less than minus train width, train is ***/
	/*** off window. Reset pos to window width (right ***/
	/*** side of window. Then draw tain.              ***/

	if (ii_pos <= -train1.width) then
		ii_pos = this.width
	else
		ii_pos = ii_pos - 5
	end if

	lp_train.Draw(ii_pos, 10)
	



end on

event open;call super::open;//Open script for w_train

// Initially, position the train at the right boundary of the window.

ii_pos = this.width
ir_timer_interval =  0.1
end event

on w_train.create
int iCurrent
call super::create
this.st_timer_interval=create st_timer_interval
this.cb_close=create cb_close
this.cb_slower=create cb_slower
this.cb_faster=create cb_faster
this.cb_stop=create cb_stop
this.cb_start=create cb_start
this.train4=create train4
this.train3=create train3
this.train2=create train2
this.train1=create train1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_timer_interval
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.cb_slower
this.Control[iCurrent+4]=this.cb_faster
this.Control[iCurrent+5]=this.cb_stop
this.Control[iCurrent+6]=this.cb_start
this.Control[iCurrent+7]=this.train4
this.Control[iCurrent+8]=this.train3
this.Control[iCurrent+9]=this.train2
this.Control[iCurrent+10]=this.train1
end on

on w_train.destroy
call super::destroy
destroy(this.st_timer_interval)
destroy(this.cb_close)
destroy(this.cb_slower)
destroy(this.cb_faster)
destroy(this.cb_stop)
destroy(this.cb_start)
destroy(this.train4)
destroy(this.train3)
destroy(this.train2)
destroy(this.train1)
end on

type st_timer_interval from statictext within w_train
integer x = 165
integer y = 552
integer width = 1641
integer height = 116
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 16777215
boolean enabled = false
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_train
integer x = 1984
integer y = 684
integer width = 306
integer height = 120
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

on clicked;//Clicked script for cb_5

Close(parent)
end on

type cb_slower from commandbutton within w_train
integer x = 1509
integer y = 684
integer width = 306
integer height = 120
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Slower"
end type

on clicked;//Clicked script for cb_4
long ll_rc

// Increment timer interval to slow train down.
// Put a 2second limit on how slow it can go
	If (ir_timer_interval <= .091 ) Then
		ir_timer_interval = ir_timer_interval + .01
		Timer(0)
		Timer(ir_timer_interval)
		st_timer_interval.text = "Timer Event Every "+String(ir_timer_interval,"0.00") + " Seconds"
	Else
		 //This is a external function that is handled by a global user object
		 //aware of different operating systems
		gu_ext_func.uf_PlaySound("trainslo.wav",1)
	End If 

end on

type cb_faster from commandbutton within w_train
integer x = 1033
integer y = 684
integer width = 306
integer height = 120
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Faster"
end type

on clicked;//Clicked script for cb_faster

long	ll_rc
// Make timer interval smaller so that train goes faster. Restrict
// how small the timer can get and notify the user.

	If (ir_timer_interval >= 0.011) Then
		ir_timer_interval = ir_timer_interval - .01
		Timer(0)
		Timer(ir_timer_interval)		
		st_timer_interval.text = "Timer Event Every "+String(ir_timer_interval,"0.00") + " Seconds"
	Else
		 //This is a external function that is handled by a global user object
		 //aware of different operating systems
		gu_ext_func.uf_PlaySound("trainfas.wav",1)
	End If // timer
end on

type cb_stop from commandbutton within w_train
integer x = 558
integer y = 684
integer width = 306
integer height = 120
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Sto&p"
end type

on clicked;//Clicked script for cb_stop

// Turn off timer

Timer(0)

st_timer_interval.text = "Timer Is Off"

end on

type cb_start from commandbutton within w_train
integer x = 82
integer y = 684
integer width = 306
integer height = 120
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "S&tart"
end type

on clicked;//Clicked script for cb_start


// See script for timer event on window to see how train is drawn and moved.
// This will restart the timer to whatever value is set in the value instance variable timer_interval

Timer(ir_timer_interval)
st_timer_interval.text = "Timer Event Every "+String(ir_timer_interval,"0.00") + " Seconds"


end on

type train4 from picture within w_train
boolean visible = false
integer x = 2103
integer y = 832
integer width = 274
integer height = 160
string picturename = "train4.bmp"
end type

type train3 from picture within w_train
boolean visible = false
integer x = 2103
integer y = 596
integer width = 274
integer height = 160
string picturename = "train3.bmp"
end type

type train2 from picture within w_train
boolean visible = false
integer x = 2103
integer y = 384
integer width = 274
integer height = 160
string picturename = "train2.bmp"
end type

type train1 from picture within w_train
boolean visible = false
integer x = 2103
integer y = 168
integer width = 274
integer height = 160
string picturename = "train1.bmp"
end type

