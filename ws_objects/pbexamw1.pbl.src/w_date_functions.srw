$PBExportHeader$w_date_functions.srw
$PBExportComments$Enter a day name/date combination to check if the date entered is valid for the day name entered.
forward
global type w_date_functions from w_center
end type
type cb_help from commandbutton within w_date_functions
end type
type st_1 from statictext within w_date_functions
end type
type st_3 from statictext within w_date_functions
end type
type st_2 from statictext within w_date_functions
end type
type dw_1 from datawindow within w_date_functions
end type
type cb_ok from commandbutton within w_date_functions
end type
type cb_cancel from commandbutton within w_date_functions
end type
type gb_1 from groupbox within w_date_functions
end type
end forward

global type w_date_functions from w_center
integer x = 521
integer y = 504
integer width = 2537
integer height = 1340
string title = "Date Functions"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
cb_help cb_help
st_1 st_1
st_3 st_3
st_2 st_2
dw_1 dw_1
cb_ok cb_ok
cb_cancel cb_cancel
gb_1 gb_1
end type
global w_date_functions w_date_functions

event open;call super::open;/////////////////////////////////////////////////////////////////////
// initialize datawindow, set test date default as current date
/////////////////////////////////////////////////////////////////////

dw_1.InsertRow (0)
dw_1.Object.test_date[1] = Today()
end event

event close;call super::close;//w_main.Show()
end event

on w_date_functions.create
int iCurrent
call super::create
this.cb_help=create cb_help
this.st_1=create st_1
this.st_3=create st_3
this.st_2=create st_2
this.dw_1=create dw_1
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_help
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.dw_1
this.Control[iCurrent+6]=this.cb_ok
this.Control[iCurrent+7]=this.cb_cancel
this.Control[iCurrent+8]=this.gb_1
end on

on w_date_functions.destroy
call super::destroy
destroy(this.cb_help)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_1)
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.gb_1)
end on

type cb_help from commandbutton within w_date_functions
integer x = 1984
integer y = 408
integer width = 443
integer height = 120
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Help"
end type

on clicked;f_open_help (parent.ClassName())
end on

type st_1 from statictext within w_date_functions
integer x = 82
integer y = 684
integer width = 1705
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
boolean focusrectangle = false
end type

type st_3 from statictext within w_date_functions
integer x = 82
integer y = 988
integer width = 1705
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
boolean focusrectangle = false
end type

type st_2 from statictext within w_date_functions
integer x = 82
integer y = 836
integer width = 1705
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
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_date_functions
integer x = 41
integer y = 48
integer width = 1518
integer height = 368
integer taborder = 10
string dataobject = "d_date_functions"
boolean border = false
end type

type cb_ok from commandbutton within w_date_functions
integer x = 1984
integer y = 56
integer width = 443
integer height = 120
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Test"
boolean default = true
end type

event clicked;////////////////////////////////////////////////////////////////////
// Purpose:  Determine whether the specified test date is valid for
//				 the specified day name.  Display information as to
//				 whether the date is valid or invalid.  
////////////////////////////////////////////////////////////////////

date		ld_testdate, &
			ld_closest
string	ls_dayname, &
			ls_when
long		ll_days


/////////////////////////////////////////////////////////////////////
// Check if both columns have been entered on the datawindow
/////////////////////////////////////////////////////////////////////
if dw_1.AcceptText() = -1 then
	return
end if


/////////////////////////////////////////////////////////////////////
// Get the data
/////////////////////////////////////////////////////////////////////
ls_dayname = dw_1.Object.day_name[1]
ld_testdate = dw_1.Object.test_date[1]


/////////////////////////////////////////////////////////////////////
// call the check_dayname function to determine whether the test date
// is valid for the day name.
/////////////////////////////////////////////////////////////////////
if f_check_dayname (ls_dayname, ld_testdate) then
	// Display message to show that test date is valid for day name
	st_1.text = 'Yes, ' + String (ld_testdate, 'mm/dd/yy') + ' is a ' + ls_dayname + '!'
	st_2.text = ''
	st_3.text = ''
else
	st_1.text = 'No, ' + String (ld_testdate, 'mm/dd/yy') + ' is a ' + &
					DayName (ld_testdate) + '.'

	// Determine which date is the closest [dayname] to [testdate]
	ld_closest = f_closest_date (ls_dayname, ld_testdate)
	st_2.text = 'The closest ' + ls_dayname + ' to ' + &
					String (ld_testdate, 'mm/dd/yy') + ' is ' + String (ld_closest, 'mmmm dd, yyyy')

	// Determine the relative number of days from closest date to test date
	ll_days = DaysAfter (ld_testdate, ld_closest)
	if ll_days > 0 then
		ls_when = ' after '
	else
		ls_when = ' before '
	end if
	st_3.text = 'which occurs ' + String (Abs (ll_days)) + ' days' + &
					ls_when + String (ld_testdate, 'mm/dd/yy') + '.'
end if



end event

type cb_cancel from commandbutton within w_date_functions
integer x = 1984
integer y = 232
integer width = 443
integer height = 120
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

on clicked;Close (parent)
end on

type gb_1 from groupbox within w_date_functions
integer x = 41
integer y = 576
integer width = 1815
integer height = 604
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "Date Information"
end type

