$PBExportHeader$w_decimal_test.srw
$PBExportComments$Shows various uses of decimal data with truncation and rounding
forward
global type w_decimal_test from w_center
end type
type st_15 from statictext within w_decimal_test
end type
type st_14 from statictext within w_decimal_test
end type
type st_13 from statictext within w_decimal_test
end type
type st_12 from statictext within w_decimal_test
end type
type st_11 from statictext within w_decimal_test
end type
type st_10 from statictext within w_decimal_test
end type
type st_dec10 from statictext within w_decimal_test
end type
type st_dec8 from statictext within w_decimal_test
end type
type st_dec6 from statictext within w_decimal_test
end type
type st_dec4 from statictext within w_decimal_test
end type
type st_dec2 from statictext within w_decimal_test
end type
type st_dec0 from statictext within w_decimal_test
end type
type st_3 from statictext within w_decimal_test
end type
type ddlb_1 from dropdownlistbox within w_decimal_test
end type
type em_2 from editmask within w_decimal_test
end type
type em_1 from editmask within w_decimal_test
end type
type st_2 from statictext within w_decimal_test
end type
type st_1 from statictext within w_decimal_test
end type
type cb_close from commandbutton within w_decimal_test
end type
end forward

global type w_decimal_test from w_center
integer x = 137
integer y = 384
integer width = 2633
integer height = 1132
string title = "Decimal Data Type Precision"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
st_15 st_15
st_14 st_14
st_13 st_13
st_12 st_12
st_11 st_11
st_10 st_10
st_dec10 st_dec10
st_dec8 st_dec8
st_dec6 st_dec6
st_dec4 st_dec4
st_dec2 st_dec2
st_dec0 st_dec0
st_3 st_3
ddlb_1 ddlb_1
em_2 em_2
em_1 em_1
st_2 st_2
st_1 st_1
cb_close cb_close
end type
global w_decimal_test w_decimal_test

forward prototypes
protected subroutine wf_calculate ()
end prototypes

protected subroutine wf_calculate ();//////////////////////////////////////////////////////////////////////
//
// Function: wf_calculate
//
// Purpose: calculate the result applying the operator to the two
//				values, and display the different decimal precision values
//				of the result.
//
//	Scope: protected
//
//	Arguments: none
//
//	Returns: none
//
//////////////////////////////////////////////////////////////////////

dec{0}	lc_0
dec{2}	lc_2
dec{4}	lc_4
dec{6}	lc_6
dec{8}	lc_8
dec{10}	lc_10
dec		lc_op1, lc_op2
string	ls_operator


// get the two values as decimals
lc_op1 = Dec (em_1.text)
lc_op2 = Dec (em_2.text)

// get the operator
ls_operator = ddlb_1.text

// calculate results
choose case ls_operator

	case '+'
		lc_0 = lc_op1 + lc_op2
		lc_2 = lc_op1 + lc_op2
		lc_4 = lc_op1 + lc_op2
		lc_6 = lc_op1 + lc_op2
		lc_8 = lc_op1 + lc_op2
		lc_10 = lc_op1 + lc_op2

	case '-'
		lc_0 = lc_op1 - lc_op2
		lc_2 = lc_op1 - lc_op2
		lc_4 = lc_op1 - lc_op2
		lc_6 = lc_op1 - lc_op2
		lc_8 = lc_op1 - lc_op2
		lc_10 = lc_op1 - lc_op2

	case '*'
		lc_0 = lc_op1 * lc_op2
		lc_2 = lc_op1 * lc_op2
		lc_4 = lc_op1 * lc_op2
		lc_6 = lc_op1 * lc_op2
		lc_8 = lc_op1 * lc_op2
		lc_10 = lc_op1 * lc_op2

	case '/'
		// check for division by zero
		if lc_op2 = 0 then
			MessageBox ('Error', 'Division by zero is not allowed!', exclamation!)
			em_2.SetFocus()
			em_2.SelectText (1, Len (em_2.text))
			return
		end if
		lc_0 = lc_op1 / lc_op2
		lc_2 = lc_op1 / lc_op2
		lc_4 = lc_op1 / lc_op2
		lc_6 = lc_op1 / lc_op2
		lc_8 = lc_op1 / lc_op2
		lc_10 = lc_op1 / lc_op2

end choose

// display results
st_dec0.text = String (lc_0, '#####0.0000000000')
st_dec2.text = String (lc_2, '#####0.0000000000')
st_dec4.text = String (lc_4, '#####0.0000000000')
st_dec6.text = String (lc_6, '#####0.0000000000')
st_dec8.text = String (lc_8, '#####0.0000000000')
st_dec10.text = String (lc_10, '#####0.0000000000')
end subroutine

event open;call super::open;// Set the initial operator to addition

ddlb_1.SelectItem (1)
end event

on w_decimal_test.create
int iCurrent
call super::create
this.st_15=create st_15
this.st_14=create st_14
this.st_13=create st_13
this.st_12=create st_12
this.st_11=create st_11
this.st_10=create st_10
this.st_dec10=create st_dec10
this.st_dec8=create st_dec8
this.st_dec6=create st_dec6
this.st_dec4=create st_dec4
this.st_dec2=create st_dec2
this.st_dec0=create st_dec0
this.st_3=create st_3
this.ddlb_1=create ddlb_1
this.em_2=create em_2
this.em_1=create em_1
this.st_2=create st_2
this.st_1=create st_1
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_15
this.Control[iCurrent+2]=this.st_14
this.Control[iCurrent+3]=this.st_13
this.Control[iCurrent+4]=this.st_12
this.Control[iCurrent+5]=this.st_11
this.Control[iCurrent+6]=this.st_10
this.Control[iCurrent+7]=this.st_dec10
this.Control[iCurrent+8]=this.st_dec8
this.Control[iCurrent+9]=this.st_dec6
this.Control[iCurrent+10]=this.st_dec4
this.Control[iCurrent+11]=this.st_dec2
this.Control[iCurrent+12]=this.st_dec0
this.Control[iCurrent+13]=this.st_3
this.Control[iCurrent+14]=this.ddlb_1
this.Control[iCurrent+15]=this.em_2
this.Control[iCurrent+16]=this.em_1
this.Control[iCurrent+17]=this.st_2
this.Control[iCurrent+18]=this.st_1
this.Control[iCurrent+19]=this.cb_close
end on

on w_decimal_test.destroy
call super::destroy
destroy(this.st_15)
destroy(this.st_14)
destroy(this.st_13)
destroy(this.st_12)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.st_dec10)
destroy(this.st_dec8)
destroy(this.st_dec6)
destroy(this.st_dec4)
destroy(this.st_dec2)
destroy(this.st_dec0)
destroy(this.st_3)
destroy(this.ddlb_1)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_close)
end on

event close;call super::close;//w_main.Show()
end event

type st_15 from statictext within w_decimal_test
integer x = 2295
integer y = 848
integer width = 247
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "dec {10}"
boolean focusrectangle = false
end type

type st_14 from statictext within w_decimal_test
integer x = 2295
integer y = 732
integer width = 247
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "dec {8}"
boolean focusrectangle = false
end type

type st_13 from statictext within w_decimal_test
integer x = 2295
integer y = 620
integer width = 247
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "dec {6}"
boolean focusrectangle = false
end type

type st_12 from statictext within w_decimal_test
integer x = 2295
integer y = 508
integer width = 247
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "dec {4}"
boolean focusrectangle = false
end type

type st_11 from statictext within w_decimal_test
integer x = 2295
integer y = 396
integer width = 247
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "dec {2}"
boolean focusrectangle = false
end type

type st_10 from statictext within w_decimal_test
integer x = 2295
integer y = 284
integer width = 247
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "dec {0}"
boolean focusrectangle = false
end type

type st_dec10 from statictext within w_decimal_test
integer x = 1669
integer y = 836
integer width = 576
integer height = 88
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_dec8 from statictext within w_decimal_test
integer x = 1669
integer y = 724
integer width = 576
integer height = 88
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_dec6 from statictext within w_decimal_test
integer x = 1669
integer y = 612
integer width = 576
integer height = 88
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_dec4 from statictext within w_decimal_test
integer x = 1669
integer y = 500
integer width = 576
integer height = 88
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_dec2 from statictext within w_decimal_test
integer x = 1669
integer y = 388
integer width = 576
integer height = 88
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_dec0 from statictext within w_decimal_test
integer x = 1669
integer y = 276
integer width = 576
integer height = 88
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_decimal_test
integer x = 1577
integer y = 284
integer width = 73
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "="
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_decimal_test
integer x = 677
integer y = 272
integer width = 247
integer height = 408
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
boolean sorted = false
boolean vscrollbar = true
string item[] = {"+","-","*","/"}
borderstyle borderstyle = stylelowered!
end type

on selectionchanged;// call window function to calculate result

wf_calculate()
end on

type em_2 from editmask within w_decimal_test
integer x = 960
integer y = 272
integer width = 576
integer height = 100
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "######.######00"
end type

on modified;// call window function to calculate result

wf_calculate()
end on

type em_1 from editmask within w_decimal_test
integer x = 64
integer y = 272
integer width = 576
integer height = 100
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "######.########00"
end type

on modified;// call window function to calculate result

wf_calculate()
end on

type st_2 from statictext within w_decimal_test
integer x = 23
integer y = 80
integer width = 2025
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "that have been declared of data type decimal {n}."
boolean focusrectangle = false
end type

type st_1 from statictext within w_decimal_test
integer x = 23
integer y = 20
integer width = 2025
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Enter two values and an operator.  The results that are displayed are variables"
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_decimal_test
integer x = 2336
integer y = 36
integer width = 247
integer height = 108
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

on clicked;close (parent)
end on

