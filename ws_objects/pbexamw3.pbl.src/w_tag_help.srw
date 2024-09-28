﻿$PBExportHeader$w_tag_help.srw
$PBExportComments$Sheet window for Context-Sensitive MicroHelp example.
forward
global type w_tag_help from w_center
end type
type dw_1 from datawindow within w_tag_help
end type
end forward

global type w_tag_help from w_center
int X=150
int Y=141
int Width=2621
int Height=1652
boolean TitleBar=true
string Title="Untitled"
string MenuName="m_tag_help"
long BackColor=74481808
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
ToolBarAlignment ToolBarAlignment=AlignAtLeft!
event ue_retrieve pbm_custom01
event ue_insert_row pbm_custom02
event ue_delete_row pbm_custom03
event ue_update pbm_custom04
event ue_print pbm_custom05
dw_1 dw_1
end type
global w_tag_help w_tag_help

type variables
window   iw_frame
m_tag_help   im_menuid

end variables

on ue_retrieve;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Retrieve the DataWindow and force the itemfocuschanged event to occur, so that the
// microhelp is displayed for the current column of the DataWindow.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

dw_1.SetRedraw (false)

// Enable the Delete Row menu item if rows were retrieved
if dw_1.Retrieve() > 0 then
	im_menuid.m_rows.m_deleterow.enabled = true
else
	im_menuid.m_rows.m_deleterow.enabled = false
end if

dw_1.TriggerEvent (itemfocuschanged!)
dw_1.SetRedraw (true)

// Disable the update menu item
im_menuid.m_rows.m_update.enabled = false




end on

on ue_insert_row;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Insert a row into the DataWindow prior to the current row
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

long	ll_new_row


ll_new_row = dw_1.InsertRow(dw_1.GetRow())
dw_1.ScrollToRow(ll_new_row)
dw_1.SetColumn(1)

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Enable the Delete Row menu item if it was previously disabled
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if im_menuid.m_rows.m_deleterow.enabled = false then
	im_menuid.m_rows.m_deleterow.enabled = true
end if

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Enable the update menu item if it was previously disabled
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if im_menuid.m_rows.m_update.enabled = false then
	im_menuid.m_rows.m_update.enabled = true
end if

end on

on ue_delete_row;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Delete the current row from the Datawindow
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if dw_1.RowCount() > 0 then
	dw_1.DeleteRow (0)
end if

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// If there are no more rows in the DataWindow, disable the Delete Row menu item
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if dw_1.RowCount() = 0 then
	im_menuid.m_rows.m_deleterow.enabled = false
end if

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Enable the update menu item if it was previously disabled
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
if im_menuid.m_rows.m_update.enabled = false then
	im_menuid.m_rows.m_update.enabled = true
end if

end on

on ue_update;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Update the database
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if dw_1.Update() = 1 then
	commit;
else
	rollback;
end if

// Disable the update menu item until the data in the DataWindow changes
im_menuid.m_rows.m_update.enabled = false
end on

on ue_print;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Print the DataWindow
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

dw_1.Print()
end on

on open;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Obtain the dataobject that was passed from the message object
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
dw_1.dataobject = message.StringParm
dw_1.SetTransObject (SQLCA)

if dw_1.dataobject = "d_cust" then
	this.title = "Customers"
else
	this.title = "Sales Orders"
end if

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Store a reference to the parent window (frame window) and menuid in an instance variable
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
iw_frame = this.ParentWindow()
im_menuid = this.menuid
end on

on resize;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Resize the DataWindow to the size of the window
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

dw_1.Resize (this.WorkSpaceWidth(), this.WorkSpaceHeight())
end on

on w_tag_help.create
if this.MenuName = "m_tag_help" then this.MenuID = create m_tag_help
this.dw_1=create dw_1
this.Control[]={ this.dw_1}
end on

on w_tag_help.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_1)
end on

type dw_1 from datawindow within w_tag_help
int Width=2593
int Height=1367
int TabOrder=1
BorderStyle BorderStyle=StyleLowered!
boolean VScrollBar=true
boolean LiveScroll=true
end type

on itemfocuschanged;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Change the MicroHelp on the frame window to the tag value of the current column in the 
// DataWindow.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

string	ls_tag
int		li_col


li_col = this.GetColumn()
if li_col > 0 then
	ls_tag = this.Describe ("#" + String (li_col) + ".tag")
end if

iw_frame.SetMicroHelp (ls_tag)
end on

on rbuttondown;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Have the Rows menu pop-up when the right mouse button is clicked on the DataWindow.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

im_menuid.m_rows.PopMenu (parent.PointerX(), parent.PointerY())
end on

on itemchanged;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Enable the update menu item
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

im_menuid.m_rows.m_update.enabled = true
end on

on editchanged;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Enable the update menu item
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

im_menuid.m_rows.m_update.enabled = true
end on

