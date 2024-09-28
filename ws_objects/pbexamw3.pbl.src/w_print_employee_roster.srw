$PBExportHeader$w_print_employee_roster.srw
$PBExportComments$Produces printed report with control breaks; demonstatrates use of several print functions
forward
global type w_print_employee_roster from w_center
end type
type st_2 from statictext within w_print_employee_roster
end type
type st_1 from statictext within w_print_employee_roster
end type
type st_rows from statictext within w_print_employee_roster
end type
type cb_close from commandbutton within w_print_employee_roster
end type
type dw_employee_roster from datawindow within w_print_employee_roster
end type
type st_please_wait from statictext within w_print_employee_roster
end type
type cb_pr_setup from commandbutton within w_print_employee_roster
end type
type cb_print from commandbutton within w_print_employee_roster
end type
type cb_retrieve from commandbutton within w_print_employee_roster
end type
end forward

global type w_print_employee_roster from w_center
integer x = 197
integer y = 300
integer width = 2720
integer height = 2028
string title = "Printing DataWindows from a Script"
windowstate windowstate = maximized!
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
st_2 st_2
st_1 st_1
st_rows st_rows
cb_close cb_close
dw_employee_roster dw_employee_roster
st_please_wait st_please_wait
cb_pr_setup cb_pr_setup
cb_print cb_print
cb_retrieve cb_retrieve
end type
global w_print_employee_roster w_print_employee_roster

event open;call super::open;////////////////////////////////////////////////////////////////////////////////////////////////////////
//Open script for w_print_employee_roster
////////////////////////////////////////////////////////////////////////////////////////////////////////

dw_employee_roster.SetTransObject(sqlca)
end event

on w_print_employee_roster.create
int iCurrent
call super::create
this.st_2=create st_2
this.st_1=create st_1
this.st_rows=create st_rows
this.cb_close=create cb_close
this.dw_employee_roster=create dw_employee_roster
this.st_please_wait=create st_please_wait
this.cb_pr_setup=create cb_pr_setup
this.cb_print=create cb_print
this.cb_retrieve=create cb_retrieve
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.st_rows
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.dw_employee_roster
this.Control[iCurrent+6]=this.st_please_wait
this.Control[iCurrent+7]=this.cb_pr_setup
this.Control[iCurrent+8]=this.cb_print
this.Control[iCurrent+9]=this.cb_retrieve
end on

on w_print_employee_roster.destroy
call super::destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_rows)
destroy(this.cb_close)
destroy(this.dw_employee_roster)
destroy(this.st_please_wait)
destroy(this.cb_pr_setup)
destroy(this.cb_print)
destroy(this.cb_retrieve)
end on

event close;call super::close;////////////////////////////////////////////////////////////////////////////////////////////////////////
//Close script for w_print_employee_roster
////////////////////////////////////////////////////////////////////////////////////////////////////////

//this.Hide( )
//w_main.Show( )
end event

type st_2 from statictext within w_print_employee_roster
integer x = 165
integer y = 80
integer width = 2450
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Notice the names displayed in the lower left corner as each line is manually printed by the script."
boolean focusrectangle = false
end type

type st_1 from statictext within w_print_employee_roster
integer x = 165
integer y = 8
integer width = 2007
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Click Retrieve to load the Datawindow.  Then hit the Print Button to begin printing."
boolean focusrectangle = false
end type

type st_rows from statictext within w_print_employee_roster
integer x = 9
integer y = 1712
integer width = 626
integer height = 128
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
alignment alignment = center!
end type

type cb_close from commandbutton within w_print_employee_roster
integer x = 1929
integer y = 1688
integer width = 311
integer height = 96
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;////////////////////////////////////////////////////////////////////////////////////////////////////////
//Clicked script for cb_close
////////////////////////////////////////////////////////////////////////////////////////////////////////

Close(parent)
end event

type dw_employee_roster from datawindow within w_print_employee_roster
integer x = 165
integer y = 196
integer width = 2359
integer height = 1436
integer taborder = 10
string dataobject = "d_employees_by_dept"
boolean vscrollbar = true
boolean livescroll = true
end type

type st_please_wait from statictext within w_print_employee_roster
boolean visible = false
integer y = 1640
integer width = 626
integer height = 64
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helv"
long backcolor = 12632256
string text = "Printing, please wait..."
alignment alignment = center!
end type

type cb_pr_setup from commandbutton within w_print_employee_roster
integer x = 1385
integer y = 1688
integer width = 480
integer height = 96
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Printer &Setup..."
end type

event clicked;////////////////////////////////////////////////////////////////////////////////////////////////////////
//Clicked script for cb_pr_setup
////////////////////////////////////////////////////////////////////////////////////////////////////////

if PrintSetup( ) = -1 then
	MessageBox("Error!","PrintSetup Failed")
end if
end event

type cb_print from commandbutton within w_print_employee_roster
integer x = 1033
integer y = 1688
integer width = 311
integer height = 96
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Print"
end type

event clicked;////////////////////////////////////////////////////////////////////////////////////////////////////////
//Clicked script for cb_print
////////////////////////////////////////////////////////////////////////////////////////////////////////

int			li_print_ret
int			li_current_dept, li_new_dept
int			li_font_height
longptr			ll_print_job
long			ll_dw_row, ll_max_row
string		ls_current_name
string		ls_font_facename

decimal{2}	lc_current_salary, lc_department_total_salary , lc_grand_total_salary

ll_max_row = dw_employee_roster.RowCount( )

// Open print job and assign job number
ll_print_job = PrintOpen( )				
if ll_print_job < 0 then
	MessageBox("Error in PrintOpen",ll_print_job,StopSign!)
	return
end if

st_please_wait.Show( )

// Define font #1 as Bold with default printer font 
ls_font_facename = "Arial"				// Change font to Arial
li_font_height = 0						// current height remains the same
li_print_ret = PrintDefineFont(ll_print_job,1, &
					ls_font_facename, &
					li_font_height,   &
					700,           &
					Default!,      &
					AnyFont!,      &
					False,         	/* Italic */	&
					False)				/* Underline */

// Define font #2 as Bold/Underline with default printer font 
li_print_ret = PrintDefineFont(ll_print_job,2, &
					ls_font_facename, &
					li_font_height,   &
					700,           &
					Default!,      &
					AnyFont!,      &
					False,         	/* Italic */	&
					True)					/* Underline */


// Initialize loop counter
ll_dw_row  = 1						

// Initialize grand total	
lc_grand_total_salary = 0.00			


////////////////////////////////////////////////////////////////////////////////////////////////////////
// Print Report Title and Current Date 
////////////////////////////////////////////////////////////////////////////////////////////////////////

// Set Bold font
li_print_ret = PrintSetFont(ll_print_job,1)		

li_print_ret = Print(ll_print_job, "Employee Compensation Report", 4500)

li_print_ret = Print(ll_print_job, String(Today( ),"mmmm d, yyyy"))

// Restore default font
li_print_ret = PrintSetFont(ll_print_job,0)		

// Print 2 blank lines
li_print_ret = Print(ll_print_job, " ")			
li_print_ret = Print(ll_print_job, " ")

do While ll_dw_row <= ll_max_row

	// Begin processing a Department 
	li_print_ret = PrintSetFont(ll_print_job,2)
	li_print_ret = Print(ll_print_job, 2200, "Department Number:  ", 1)

	li_current_dept = dw_employee_roster.Object.dept_id[ll_dw_row]
	li_print_ret = Print(ll_print_job, String(li_current_dept))

	// Restore default font
	li_print_ret = PrintSetFont(ll_print_job,0)	

	// Print a blank line
	li_print_ret = Print(ll_print_job," ")			

	// Begin loop for employees within this department 
	li_new_dept = li_current_dept
	lc_department_total_salary = 0.00			// Initialize group total
	Do While li_new_dept = li_current_dept

		// Concatenate Lastname, Firstname 
		string ls_fname, ls_lname
		ls_fname = dw_employee_roster.Object.emp_fname[ll_dw_row] 
		ls_lname = dw_employee_roster.Object.emp_lname[ll_dw_row]
		ls_current_name = ls_fname + ', ' + ls_lname

		//update status display
		st_rows.text = "Printing Employee:  " + ls_current_name

		lc_current_salary = dw_employee_roster.Object.salary[ll_dw_row]
		lc_department_total_salary = lc_department_total_salary + lc_current_salary
		li_print_ret = Print(ll_print_job, ls_current_name, 5000)
		li_print_ret = Print(ll_print_job, &
							f_right_adjust_dec(lc_current_salary,"$###,###"))
		ll_dw_row = ll_dw_row + 1
		if ll_dw_row > ll_max_row then exit
		li_new_dept = dw_employee_roster.Object.dept_id[ll_dw_row]
	loop	// Loop for employees within this department 

	li_print_ret = Print(ll_print_job, " ")
	li_print_ret = Print(ll_print_job, 3000, "Department total:", 5000)
		li_print_ret = Print(ll_print_job, &
							f_right_adjust_dec(lc_department_total_salary,"$###,###"))
	li_print_ret = Print(ll_print_job, " ")
	li_print_ret = Print(ll_print_job, " ")
	li_current_dept = li_new_dept
	lc_grand_total_salary = lc_grand_total_salary + lc_department_total_salary

loop	// Loop for each department 

// Now print grand total 
li_print_ret = Print(ll_print_job, " ")
li_print_ret = Print(ll_print_job, 3400, "Grand total:", 5000)
li_print_ret = Print(ll_print_job, &
					f_right_adjust_dec(lc_grand_total_salary,"$###,###"))

// Close print job
li_print_ret = PrintClose(ll_print_job)
if li_print_ret < 0 then
	MessageBox("Error on PrintClose", li_print_ret, StopSign!)
end if

st_please_wait.Hide( ) 
st_rows.text = ""

end event

type cb_retrieve from commandbutton within w_print_employee_roster
integer x = 658
integer y = 1688
integer width = 311
integer height = 96
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Retrieve"
end type

event clicked;////////////////////////////////////////////////////////////////////////////////////////////////////////
//Clicked script for cb_retrieve
////////////////////////////////////////////////////////////////////////////////////////////////////////

// Retrieve the employee data
dw_employee_roster.Retrieve( )

// Enable the print button
cb_print.enabled = true
end event

