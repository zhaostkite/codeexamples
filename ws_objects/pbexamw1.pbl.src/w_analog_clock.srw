$PBExportHeader$w_analog_clock.srw
$PBExportComments$Uses Analog clock User Object
forward
global type w_analog_clock from w_center
end type
type uo_clock from u_analog_clock within w_analog_clock
end type
end forward

global type w_analog_clock from w_center
integer x = 969
integer y = 564
integer width = 1001
integer height = 812
string title = "Analog Clock"
long backcolor = 78682240
toolbaralignment toolbaralignment = alignatleft!
uo_clock uo_clock
end type
global w_analog_clock w_analog_clock

event open;call super::open;// call the uf_start_ticking user object function to start the clock
uo_clock.uf_start_ticking()


end event

on timer;uo_clock.TriggerEvent("timer")

end on

event close;call super::close;// call the uf_stop_ticking user object function to stop the clock
uo_clock.uf_stop_ticking()

//w_main.Show()
end event

on w_analog_clock.create
int iCurrent
call super::create
this.uo_clock=create uo_clock
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_clock
end on

on w_analog_clock.destroy
call super::destroy
destroy(this.uo_clock)
end on

type uo_clock from u_analog_clock within w_analog_clock
integer x = 41
integer y = 8
integer width = 887
integer height = 692
boolean border = false
end type

on uo_clock.destroy
call u_analog_clock::destroy
end on

