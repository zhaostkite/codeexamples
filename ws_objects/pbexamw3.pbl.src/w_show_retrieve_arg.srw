$PBExportHeader$w_show_retrieve_arg.srw
$PBExportComments$Allows user to specify retrieval arguments and retrieve a DataWindow.  The DataWindow shows their retrieval arguments that they entered.
forward
global type w_show_retrieve_arg from w_center
end type
type cb_close from commandbutton within w_show_retrieve_arg
end type
type cb_retrieve from commandbutton within w_show_retrieve_arg
end type
type em_end_date from editmask within w_show_retrieve_arg
end type
type em_start_date from editmask within w_show_retrieve_arg
end type
type st_4 from statictext within w_show_retrieve_arg
end type
type st_3 from statictext within w_show_retrieve_arg
end type
type st_2 from statictext within w_show_retrieve_arg
end type
type ddlb_customer from dropdownlistbox within w_show_retrieve_arg
end type
type st_1 from statictext within w_show_retrieve_arg
end type
type dw_1 from datawindow within w_show_retrieve_arg
end type
end forward

global type w_show_retrieve_arg from w_center
integer x = 169
integer y = 24
integer width = 2592
integer height = 1868
string title = "Referencing Retrieval Arguments in a DataWindow"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_open pbm_custom01
cb_close cb_close
cb_retrieve cb_retrieve
em_end_date em_end_date
em_start_date em_start_date
st_4 st_4
st_3 st_3
st_2 st_2
ddlb_customer ddlb_customer
st_1 st_1
dw_1 dw_1
end type
global w_show_retrieve_arg w_show_retrieve_arg

on ue_open;//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Load the ddlb with customer names from the customer table.
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

string	ls_select, ls_lname,ls_fname,ls_add


dw_1.SetTransObject (sqlca)
dw_1.InsertRow (0)

em_start_date.text = "01/01/" + String (Year (Today()))
em_end_date.text = String (Today())

declare lcur_cust cursor for
  SELECT distinct fname,lname 
    FROM customer,   
         sales_order  
   WHERE ( customer.id = sales_order.cust_id )   ;
open lcur_cust;

if sqlca.sqlcode < 0 then
	MessageBox ("DataBase Error!", sqlca.sqlerrtext, exclamation!)
	return
end if 

ddlb_customer.SetRedraw(false)

do while sqlca.sqlcode = 0
	fetch lcur_cust into :ls_lname,:ls_fname;
	if sqlca.sqlcode = 0 then
		ls_add = ls_lname + ', '+ls_fname
		ddlb_customer.AddItem (ls_add)
	elseif sqlca.sqlcode < 0 then
		MessageBox ("DataBase Error", sqlca.sqlerrtext, exclamation!)
		return
	else
		exit
	end if
loop

ddlb_customer.SetRedraw(true)
close lcur_cust;

end on

event close;call super::close;//w_main.Show()
end event

event open;call super::open;this.PostEvent ("ue_open")


end event

on w_show_retrieve_arg.create
int iCurrent
call super::create
this.cb_close=create cb_close
this.cb_retrieve=create cb_retrieve
this.em_end_date=create em_end_date
this.em_start_date=create em_start_date
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.ddlb_customer=create ddlb_customer
this.st_1=create st_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_close
this.Control[iCurrent+2]=this.cb_retrieve
this.Control[iCurrent+3]=this.em_end_date
this.Control[iCurrent+4]=this.em_start_date
this.Control[iCurrent+5]=this.st_4
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.ddlb_customer
this.Control[iCurrent+9]=this.st_1
this.Control[iCurrent+10]=this.dw_1
end on

on w_show_retrieve_arg.destroy
call super::destroy
destroy(this.cb_close)
destroy(this.cb_retrieve)
destroy(this.em_end_date)
destroy(this.em_start_date)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.ddlb_customer)
destroy(this.st_1)
destroy(this.dw_1)
end on

type cb_close from commandbutton within w_show_retrieve_arg
integer x = 2185
integer y = 168
integer width = 279
integer height = 108
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

on clicked;close (parent)
end on

type cb_retrieve from commandbutton within w_show_retrieve_arg
integer x = 2185
integer y = 40
integer width = 279
integer height = 108
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Retrieve"
boolean default = true
end type

on clicked;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Verify that the customer name retrieval argument has been entered, and then retrieve the
// DataWindow with arguments the user entered.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

date	ld_start, &
		ld_end
integer posi
string lname,fname


if Len (ddlb_customer.text) = 0 then
	MessageBox ("Required Field", "Please specify a value for the Customer Name retrieval argument.")
else
	em_start_date.GetData (ld_start)
	em_end_date.GetData (ld_end)
	posi = pos(ddlb_customer.text,',')
	lname = trim(left(ddlb_customer.text,posi -1))
	fname = trim(mid(ddlb_customer.text,posi +1))
	dw_1.Retrieve (ld_start, ld_end,fname,lname)
end if
end on

type em_end_date from editmask within w_show_retrieve_arg
integer x = 809
integer y = 388
integer width = 265
integer height = 92
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
string text = "01/01/94"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yy"
end type

type em_start_date from editmask within w_show_retrieve_arg
integer x = 809
integer y = 276
integer width = 265
integer height = 92
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
string text = "01/01/94"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/dd/yy"
end type

type st_4 from statictext within w_show_retrieve_arg
integer x = 41
integer y = 20
integer width = 1673
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Please enter the retrieval arguments for the DataWindow below."
boolean focusrectangle = false
end type

type st_3 from statictext within w_show_retrieve_arg
integer x = 101
integer y = 396
integer width = 681
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Sales Order End Date:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_show_retrieve_arg
integer x = 69
integer y = 284
integer width = 713
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Sales Order Start Date:"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_customer from dropdownlistbox within w_show_retrieve_arg
integer x = 809
integer y = 168
integer width = 713
integer height = 388
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_show_retrieve_arg
integer x = 261
integer y = 172
integer width = 521
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Customer Name:"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_show_retrieve_arg
integer x = 73
integer y = 536
integer width = 2409
integer height = 1156
integer taborder = 60
string dataobject = "d_sales_orders_args"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

