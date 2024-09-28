$PBExportHeader$w_populate_ddlb_from_db.srw
$PBExportComments$Fill DDLB at runtime from database using generalized function
forward
global type w_populate_ddlb_from_db from w_center
end type
type st_7 from statictext within w_populate_ddlb_from_db
end type
type st_num_items from statictext within w_populate_ddlb_from_db
end type
type st_5 from statictext within w_populate_ddlb_from_db
end type
type st_4 from statictext within w_populate_ddlb_from_db
end type
type st_3 from statictext within w_populate_ddlb_from_db
end type
type st_1 from statictext within w_populate_ddlb_from_db
end type
type dw_tables from datawindow within w_populate_ddlb_from_db
end type
type dw_columns from datawindow within w_populate_ddlb_from_db
end type
type st_2 from statictext within w_populate_ddlb_from_db
end type
type ddlb_from_db from dropdownlistbox within w_populate_ddlb_from_db
end type
type cb_cancel from commandbutton within w_populate_ddlb_from_db
end type
end forward

shared variables
string style_name [8] = &
    {"detail_top_margin",  &
     "detail_bottom_margin", &
     "vertical_spread", &
     "vertical_size", &
     "header_top_margin", &
     "header_bottom_margin", &
     "left_margin", &
     "horizontal_spread"}
string style_size [8] = {"1","1","1","1","1","1","1","1"}
end variables

global type w_populate_ddlb_from_db from w_center
integer x = 151
integer y = 320
integer width = 2633
integer height = 1304
string title = "Populate a DropDownListBox from the Database"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
st_7 st_7
st_num_items st_num_items
st_5 st_5
st_4 st_4
st_3 st_3
st_1 st_1
dw_tables dw_tables
dw_columns dw_columns
st_2 st_2
ddlb_from_db ddlb_from_db
cb_cancel cb_cancel
end type
global w_populate_ddlb_from_db w_populate_ddlb_from_db

type variables
string is_table

string is_object_type = "lb"

end variables

event open;call super::open;//Open script for w_populate_ddlb_from_db

dw_columns.SetTransObject(sqlca)
dw_tables.SetTransObject(sqlca)

// In DW_TABLES, set proper SELECT statement for the current DBMS type 
if f_set_table_select(dw_tables) < 0 then
	MessageBox("Error", &
					"Unable to set SQL select statement for tables list", &
					StopSign!)
	this.TriggerEvent(Close!)
end if

//populate the tables datawindow w/valid tables from pb system table
dw_tables.Retrieve( )



end event

on w_populate_ddlb_from_db.create
int iCurrent
call super::create
this.st_7=create st_7
this.st_num_items=create st_num_items
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_1=create st_1
this.dw_tables=create dw_tables
this.dw_columns=create dw_columns
this.st_2=create st_2
this.ddlb_from_db=create ddlb_from_db
this.cb_cancel=create cb_cancel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_7
this.Control[iCurrent+2]=this.st_num_items
this.Control[iCurrent+3]=this.st_5
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.dw_tables
this.Control[iCurrent+8]=this.dw_columns
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.ddlb_from_db
this.Control[iCurrent+11]=this.cb_cancel
end on

on w_populate_ddlb_from_db.destroy
call super::destroy
destroy(this.st_7)
destroy(this.st_num_items)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_1)
destroy(this.dw_tables)
destroy(this.dw_columns)
destroy(this.st_2)
destroy(this.ddlb_from_db)
destroy(this.cb_cancel)
end on

event close;call super::close;//Close script for w_w_populate_ddlb_from_db

//this.Hide( )
//w_main.Show()
end event

type st_7 from statictext within w_populate_ddlb_from_db
integer x = 1746
integer y = 572
integer width = 736
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "Items in Drop Down Listbox:"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_num_items from statictext within w_populate_ddlb_from_db
integer x = 2002
integer y = 652
integer width = 183
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "0"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_populate_ddlb_from_db
integer x = 41
integer y = 68
integer width = 2501
integer height = 116
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "After you select a table and column, the Drop Down List Box (3) will contain the values in the database for that column."
boolean focusrectangle = false
end type

type st_4 from statictext within w_populate_ddlb_from_db
integer x = 41
integer y = 12
integer width = 2048
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "This example will populate a Drop Down List Box at runtime from the database."
boolean focusrectangle = false
end type

type st_3 from statictext within w_populate_ddlb_from_db
integer x = 1737
integer y = 296
integer width = 727
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean enabled = false
string text = "3) View Drop Down List Box"
boolean focusrectangle = false
end type

type st_1 from statictext within w_populate_ddlb_from_db
integer x = 32
integer y = 296
integer width = 503
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "1) Select a Table:"
end type

type dw_tables from datawindow within w_populate_ddlb_from_db
integer x = 32
integer y = 376
integer width = 805
integer height = 560
integer taborder = 20
string dataobject = "d_table_list"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;// Clicked script for dw_tables

string 	ls_table_key

//Change pointer to hourglass
SetPointer(Hourglass!)

//if heading or side was clicked, an invalid row number is returned
If row < 1 Then return

//select the clicked row
dw_tables.SelectRow(0, False)
dw_tables.SelectRow(row, True)

//get the table name
is_table = Lower(dw_tables.object.tname[row])

// In DW_COLUMNS, set proper SELECT statement to retrieve column names
If f_set_column_select(dw_columns, is_table) < 0 Then
	MessageBox("Error", &
					"Unable to set SQL select statement for columns list", &
					StopSign!)
	this.TriggerEvent(Close!)
End If

//load the columns for that table
dw_columns.Retrieve( )	  /* Note:  Retrieve argument not used any
									  longer, as F_SET_COLUMN_SELECT inserts
									  the proper table name */

end event

type dw_columns from datawindow within w_populate_ddlb_from_db
integer x = 887
integer y = 376
integer width = 805
integer height = 560
integer taborder = 30
string dataobject = "d_column_list"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event clicked;//Clicked script for dw_columns

int		li_ret
string	ls_column

//Change pointer to hourglass
SetPointer(Hourglass!)

//if heading or side was clicked, an invalid row number is returned
If row < 1 Then return

//Highlight row
dw_columns.SelectRow(0, False)
dw_columns.SelectRow(row, True)

//Get the column name
ls_column = Lower(dw_columns.object.cname[row])

li_ret = f_populate_ddlb_from_db (is_table, ls_column, ddlb_from_db)

if li_ret <> 0 then
	MessageBox("Error!", sqlca.sqlerrtext)
else
	ddlb_from_db.SelectItem(1)
	st_num_items.text = String( ddlb_from_db.totalitems ( ))
end if


end event

type st_2 from statictext within w_populate_ddlb_from_db
integer x = 887
integer y = 296
integer width = 613
integer height = 72
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
string text = "2) Select a Column:"
end type

type ddlb_from_db from dropdownlistbox within w_populate_ddlb_from_db
integer x = 1737
integer y = 376
integer width = 805
integer height = 560
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 74481808
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_cancel from commandbutton within w_populate_ddlb_from_db
integer x = 1152
integer y = 1004
integer width = 352
integer height = 104
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

on clicked;//Clicked script for cb_cancel

Close(parent)
end on

