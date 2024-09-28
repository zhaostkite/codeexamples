$PBExportHeader$w_update_prod.srw
$PBExportComments$Window to update a product, used by w_prod_listview
forward
global type w_update_prod from w_center
end type
type p_product from picture within w_update_prod
end type
type cb_cancel from commandbutton within w_update_prod
end type
type cb_ok from commandbutton within w_update_prod
end type
type dw_prod from datawindow within w_update_prod
end type
end forward

global type w_update_prod from w_center
integer x = 174
integer y = 228
integer width = 2866
integer height = 992
string title = "Edit Product"
windowtype windowtype = response!
long backcolor = 75530304
toolbaralignment toolbaralignment = alignatleft!
p_product p_product
cb_cancel cb_cancel
cb_ok cb_ok
dw_prod dw_prod
end type
global w_update_prod w_update_prod

type variables
Boolean	ib_Changed
end variables

event open;call super::open;Integer	li_ID
Blob		lblb_BMP
f_Center ( )
li_ID = Message.DoubleParm

// Retrieve data into DataWindow
dw_prod.SetTransObject(sqlca)
dw_prod.Retrieve(li_ID)

// Retrieve blob into picture
SelectBlob catalog_picture
into :lblb_BMP
from product
where id = :li_ID;

p_product.SetPicture(lblb_BMP)

ib_Changed = False

end event

on w_update_prod.create
int iCurrent
call super::create
this.p_product=create p_product
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.dw_prod=create dw_prod
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.p_product
this.Control[iCurrent+2]=this.cb_cancel
this.Control[iCurrent+3]=this.cb_ok
this.Control[iCurrent+4]=this.dw_prod
end on

on w_update_prod.destroy
call super::destroy
destroy(this.p_product)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.dw_prod)
end on

event closequery;Integer	li_Ans

If ib_Changed Then
	li_Ans = MessageBox("Update Product", "Changes to this product have been made.  Do you want to save them before you exit?", &
									Question!, YesNoCancel!)
	If li_Ans = 3 Then
		Message.ReturnValue = 1
	Elseif li_Ans = 1 Then
		dw_prod.Update()
		commit;
		Message.DoubleParm = 1
	End if
End if

end event

type p_product from picture within w_update_prod
integer x = 9
integer y = 12
integer width = 654
integer height = 588
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_cancel from commandbutton within w_update_prod
integer x = 1705
integer y = 688
integer width = 393
integer height = 120
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "Cancel"
boolean cancel = true
end type

event clicked;CloseWithReturn(Parent, 0)

end event

type cb_ok from commandbutton within w_update_prod
integer x = 1157
integer y = 688
integer width = 393
integer height = 120
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string text = "OK"
boolean default = true
end type

event clicked;dw_prod.AcceptText()

If ib_Changed Then
	dw_prod.Update()
	commit;
	ib_Changed = False
	CloseWithReturn(Parent, 1)
Else
	CloseWIthReturn(Parent, 0)
End if

end event

type dw_prod from datawindow within w_update_prod
integer x = 709
integer y = 12
integer width = 2053
integer height = 588
integer taborder = 10
string dataobject = "d_edit_product"
boolean border = false
boolean livescroll = true
end type

event itemchanged;ib_Changed = True

end event

