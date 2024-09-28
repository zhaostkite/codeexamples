$PBExportHeader$w_stored_proc.srw
$PBExportComments$Stored Procedure source DataWindows example
forward
global type w_stored_proc from w_center
end type
type dw_cust from datawindow within w_stored_proc
end type
type cb_help from commandbutton within w_stored_proc
end type
type cb_close from commandbutton within w_stored_proc
end type
type dw_prod_info from datawindow within w_stored_proc
end type
type dw_prod_graph from datawindow within w_stored_proc
end type
type dw_sales_orders from datawindow within w_stored_proc
end type
end forward

global type w_stored_proc from w_center
integer x = 5
integer y = 16
integer width = 2921
integer height = 1900
string title = "Stored Procedure Source DataWindows Example"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
event ue_open pbm_custom01
dw_cust dw_cust
cb_help cb_help
cb_close cb_close
dw_prod_info dw_prod_info
dw_prod_graph dw_prod_graph
dw_sales_orders dw_sales_orders
end type
global w_stored_proc w_stored_proc

type variables
integer   ii_cust_id
end variables

on ue_open;DataWindowChild	ldw_child


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Set transaction objects
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_prod_graph.SetTransObject (sqlca)
dw_prod_info.SetTransObject (sqlca)
dw_sales_orders.SetTransObject (sqlca)


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Retrieve customers list
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_cust.GetChild ("cust_id", ldw_child)
ldw_child.SetTransObject (sqlca)
ldw_child.Retrieve()

dw_cust.InsertRow (0)



end on

event close;call super::close;//w_main.Show()
end event

event open;call super::open;this.PostEvent ("ue_open")
end event

on w_stored_proc.create
int iCurrent
call super::create
this.dw_cust=create dw_cust
this.cb_help=create cb_help
this.cb_close=create cb_close
this.dw_prod_info=create dw_prod_info
this.dw_prod_graph=create dw_prod_graph
this.dw_sales_orders=create dw_sales_orders
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_cust
this.Control[iCurrent+2]=this.cb_help
this.Control[iCurrent+3]=this.cb_close
this.Control[iCurrent+4]=this.dw_prod_info
this.Control[iCurrent+5]=this.dw_prod_graph
this.Control[iCurrent+6]=this.dw_sales_orders
end on

on w_stored_proc.destroy
call super::destroy
destroy(this.dw_cust)
destroy(this.cb_help)
destroy(this.cb_close)
destroy(this.dw_prod_info)
destroy(this.dw_prod_graph)
destroy(this.dw_sales_orders)
end on

type dw_cust from datawindow within w_stored_proc
integer x = 32
integer y = 40
integer width = 681
integer height = 104
integer taborder = 40
string dataobject = "d_choose_customer"
boolean border = false
end type

on itemchanged;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// A new customer has been selected, retrieve the product orders graph
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

ii_cust_id = Integer (this.GetText())
dw_prod_graph.Retrieve (ii_cust_id)


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Reset the product info and sales orders DataWindows
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_prod_info.Reset()
dw_sales_orders.Reset()
end on

type cb_help from commandbutton within w_stored_proc
integer x = 2615
integer y = 172
integer width = 247
integer height = 100
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Help"
end type

on clicked;f_open_help (parent.ClassName())
end on

type cb_close from commandbutton within w_stored_proc
integer x = 2615
integer y = 40
integer width = 247
integer height = 100
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
boolean cancel = true
end type

on clicked;close (parent)
end on

type dw_prod_info from datawindow within w_stored_proc
integer x = 9
integer y = 976
integer width = 1097
integer height = 796
integer taborder = 10
string dataobject = "d_product_info"
boolean border = false
end type

type dw_prod_graph from datawindow within w_stored_proc
integer x = 23
integer y = 180
integer width = 2496
integer height = 732
integer taborder = 20
string dataobject = "d_cust_products"
borderstyle borderstyle = stylelowered!
end type

on clicked;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Retrieve the product and sales order data for the category (product) that was clicked on
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

grObjectType	le_type
int				li_series, &
				li_category, &
				li_product_id


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Find out where the user clicked on the graph
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
le_type = this.ObjectAtPointer ("gr_1", li_series, li_category)


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// If user clicked on a category, retrieve the product information and sales orders
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if le_type = TypeData!  or le_type = TypeCategory!  then
	li_product_id  = Integer (this.CategoryName ("gr_1", li_category))

	SetPointer (hourglass!)
	dw_prod_info.Retrieve (li_product_id)
	dw_sales_orders.Retrieve (ii_cust_id, li_product_id)
end if
end on

type dw_sales_orders from datawindow within w_stored_proc
integer x = 1143
integer y = 976
integer width = 1719
integer height = 780
integer taborder = 30
string dataobject = "d_sp_orders"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

