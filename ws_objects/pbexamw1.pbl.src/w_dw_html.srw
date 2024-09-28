$PBExportHeader$w_dw_html.srw
$PBExportComments$Example used to create an HTML table or form from a DataWindow
forward
global type w_dw_html from w_center
end type
type tab_1 from tab within w_dw_html
end type
type tabpage_dw from userobject within tab_1
end type
type dw_1 from datawindow within tabpage_dw
end type
type tabpage_dw from userobject within tab_1
dw_1 dw_1
end type
type tabpage_html from userobject within tab_1
end type
type mle_1 from multilineedit within tabpage_html
end type
type tabpage_html from userobject within tab_1
mle_1 mle_1
end type
type tab_1 from tab within w_dw_html
tabpage_dw tabpage_dw
tabpage_html tabpage_html
end type
type st_buffer from statictext within w_dw_html
end type
type rb_filter from radiobutton within w_dw_html
end type
type rb_delete from radiobutton within w_dw_html
end type
type rb_primary from radiobutton within w_dw_html
end type
type ddlb_endcol from dropdownlistbox within w_dw_html
end type
type st_endcol from statictext within w_dw_html
end type
type st_startcol from statictext within w_dw_html
end type
type ddlb_startcol from dropdownlistbox within w_dw_html
end type
type st_endrow from statictext within w_dw_html
end type
type sle_endrow from singlelineedit within w_dw_html
end type
type sle_startrow from singlelineedit within w_dw_html
end type
type st_startrow from statictext within w_dw_html
end type
type st_border from statictext within w_dw_html
end type
type sle_border from singlelineedit within w_dw_html
end type
type st_spacing from statictext within w_dw_html
end type
type sle_spacing from singlelineedit within w_dw_html
end type
type sle_padding from singlelineedit within w_dw_html
end type
type st_padding from statictext within w_dw_html
end type
type st_width from statictext within w_dw_html
end type
type sle_width from singlelineedit within w_dw_html
end type
type cbx_wrap from checkbox within w_dw_html
end type
type cbx_css from checkbox within w_dw_html
end type
type cb_html from commandbutton within w_dw_html
end type
type rb_form from radiobutton within w_dw_html
end type
type rb_table from radiobutton within w_dw_html
end type
type st_1 from statictext within w_dw_html
end type
type ddlb_1 from dropdownlistbox within w_dw_html
end type
type cb_browse from commandbutton within w_dw_html
end type
type cb_help from commandbutton within w_dw_html
end type
type cb_close from commandbutton within w_dw_html
end type
type gb_table from groupbox within w_dw_html
end type
type gb_1 from groupbox within w_dw_html
end type
type st_bufferb from statictext within w_dw_html
end type
type gb_form from groupbox within w_dw_html
end type
end forward

global type w_dw_html from w_center
integer y = 4
integer width = 2885
integer height = 1800
string title = "DataWindow HTML Table"
long backcolor = 75530304
toolbaralignment toolbaralignment = alignatleft!
tab_1 tab_1
st_buffer st_buffer
rb_filter rb_filter
rb_delete rb_delete
rb_primary rb_primary
ddlb_endcol ddlb_endcol
st_endcol st_endcol
st_startcol st_startcol
ddlb_startcol ddlb_startcol
st_endrow st_endrow
sle_endrow sle_endrow
sle_startrow sle_startrow
st_startrow st_startrow
st_border st_border
sle_border sle_border
st_spacing st_spacing
sle_spacing sle_spacing
sle_padding sle_padding
st_padding st_padding
st_width st_width
sle_width sle_width
cbx_wrap cbx_wrap
cbx_css cbx_css
cb_html cb_html
rb_form rb_form
rb_table rb_table
st_1 st_1
ddlb_1 ddlb_1
cb_browse cb_browse
cb_help cb_help
cb_close cb_close
gb_table gb_table
gb_1 gb_1
st_bufferb st_bufferb
gb_form gb_form
end type
global w_dw_html w_dw_html

type prototypes

end prototypes

type variables
String	is_Browser, is_Files[]
Boolean	ib_LongFileNames
Inet	iin_Context
end variables

forward prototypes
public subroutine of_add_columns ()
public function string of_write_file (string as_html)
public subroutine of_generate_html ()
end prototypes

public subroutine of_add_columns ();String	ls_Column
Integer	li_Columns, li_Cnt

ddlb_startcol.Reset()
ddlb_endcol.Reset()
ddlb_startcol.AddItem("")
ddlb_endcol.AddItem("")

li_Columns = Integer(tab_1.tabpage_dw.dw_1.Describe("Datawindow.column.count"))
For li_Cnt = 1 To li_Columns
	ls_Column = tab_1.tabpage_dw.dw_1.Describe("#" + String(li_Cnt) + ".name")
	ddlb_startcol.AddItem(ls_Column)
	ddlb_endcol.AddItem(ls_Column)
Next

end subroutine

public function string of_write_file (string as_html);String	ls_FileName
Integer	li_FileNumber, li_Files
Long		ll_BytesWritten

If ib_LongFileNames Then
	ls_FileName = tab_1.tabpage_dw.dw_1.DataObject + ".htm"
Else
	ls_FileName = Left(tab_1.tabpage_dw.dw_1.DataObject, 8) + ".htm"
End If

li_FileNumber = FileOpen(ls_FileName, StreamMode!, Write!, LockReadWrite!, Replace! )

If (li_FileNumber >= 0) Then
	ll_BytesWritten = FileWrite(li_FileNumber, as_HTML)
	FileClose(li_FileNumber)
	
	If ll_BytesWritten = Len(as_HTML) Then
		//  Add file to list to be deleted
		li_Files = UpperBound(is_Files)
		is_Files[li_Files + 1] = gs_ExampleDir + "\" + ls_FileName
	Else
		MessageBox ("Write Error", "Only wrote " + String(ll_BytesWritten) + &
							" of " + String(Len(as_HTML)) + " bytes.", Exclamation!)
		Return ""
	End If

Else // File open error
	MessageBox ("FileOpen Error", "Could not open file: " + ls_FileName + &
						" (" + String( li_FileNumber ) + ")")
	Return ""
End If

Return ls_FileName

end function

public subroutine of_generate_html ();String	ls_HTML, ls_FileName, ls_Style, ls_Action, ls_Modify
Integer	li_StartCol, li_EndCol

// Don't proceed if there is no data object loaded in the DW
If (tab_1.tabpage_dw.dw_1.dataobject = "") Then Return

// Generate the HTML
If rb_table.Checked Then
	
	// HTML Table
	If cbx_css.Checked Then
		ls_Modify = "DataWindow.HTMLTable.GenerateCSS=~"yes~" "
		ls_Style = tab_1.tabpage_dw.dw_1.Object.DataWindow.HTMLTable.StyleSheet
	End If
	
	If cbx_wrap.Checked Then
		ls_Modify += "DataWindow.HTMLTable.NoWrap=~"no~" "
	End If
	
	If Integer(sle_border.Text) > 0 Then
		ls_Modify += "DataWindow.HTMLTable.Border=" + sle_border.Text + "  "
	End If
	
	If Integer(sle_width.Text) > 0 Then
		ls_Modify += "DataWindow.HTMLTable.Width=" + sle_width.Text + " "
	End If
	
	If Integer(sle_padding.Text) > 0 Then
		ls_Modify += "DataWindow.HTMLTable.CellPadding=" + sle_padding.Text + " "
	End If

	If Integer(sle_spacing.Text) > 0 Then
		ls_Modify += "DataWindow.HTMLTable.CellSpacing=" + sle_spacing.Text
	End If
	
	If Trim(ls_Modify) <> "" Then
		tab_1.tabpage_dw.dw_1.Modify(ls_Modify)
	End If
	
	ls_HTML = ls_Style + "~r~n" + tab_1.tabpage_dw.dw_1.Object.DataWindow.Data.HTMLTable
Else
	
	// HTML Form
	li_StartCol = ddlb_startcol.FindItem(ddlb_startcol.Text, 0) - 1
	li_EndCol = ddlb_endcol.FindItem(ddlb_endcol.Text, 0) - 1

	If (Integer(sle_startrow.Text) > 0) And (Integer(sle_endrow.Text) > 0) And &
		(li_StartCol > 0) And (li_EndCol > 0) Then
		
		If rb_primary.Checked Then
			tab_1.tabpage_dw.dw_1.GenerateHTMLForm(ls_HTML, ls_Style, ls_Action, Integer(sle_startrow.Text), Integer(sle_endrow.Text), &
													li_StartCol, li_EndCol)
		ElseIf rb_delete.Checked Then
			tab_1.tabpage_dw.dw_1.GenerateHTMLForm(ls_HTML, ls_Style, ls_Action, Integer(sle_startrow.Text), Integer(sle_endrow.Text), &
													li_StartCol, li_EndCol, Delete!)
		Else
			tab_1.tabpage_dw.dw_1.GenerateHTMLForm(ls_HTML, ls_Style, ls_Action, Integer(sle_startrow.Text), Integer(sle_endrow.Text), &
													li_StartCol, li_EndCol, Filter!)
		End If
	Else
		tab_1.tabpage_dw.dw_1.GenerateHTMLForm(ls_HTML, ls_Style, ls_Action)
	End If

	ls_HTML = ls_Style + "~r~n" + ls_HTML
End If

If IsNull(ls_HTML) Or Len(ls_HTML) <= 1 Then
	MessageBox ("Error", "Error generating HTML table.", Exclamation!)
	Return
Else
	ls_HTML = "<H1>PowerBuilder HTML Table Generated From DataWindow:  "  + &
					tab_1.tabpage_dw.dw_1.DataObject + "</H1><P>" + ls_HTML
End If

// Display the HTML source
tab_1.tabpage_html.mle_1.Text = ls_HTML

end subroutine

event close;Integer	li_Cnt, li_Files

// Delete all file created
li_Files = UpperBound(is_Files)
For li_Cnt = 1 To li_Files
	FileDelete(is_Files[li_Cnt])
Next

w_main.show()
end event

on w_dw_html.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.st_buffer=create st_buffer
this.rb_filter=create rb_filter
this.rb_delete=create rb_delete
this.rb_primary=create rb_primary
this.ddlb_endcol=create ddlb_endcol
this.st_endcol=create st_endcol
this.st_startcol=create st_startcol
this.ddlb_startcol=create ddlb_startcol
this.st_endrow=create st_endrow
this.sle_endrow=create sle_endrow
this.sle_startrow=create sle_startrow
this.st_startrow=create st_startrow
this.st_border=create st_border
this.sle_border=create sle_border
this.st_spacing=create st_spacing
this.sle_spacing=create sle_spacing
this.sle_padding=create sle_padding
this.st_padding=create st_padding
this.st_width=create st_width
this.sle_width=create sle_width
this.cbx_wrap=create cbx_wrap
this.cbx_css=create cbx_css
this.cb_html=create cb_html
this.rb_form=create rb_form
this.rb_table=create rb_table
this.st_1=create st_1
this.ddlb_1=create ddlb_1
this.cb_browse=create cb_browse
this.cb_help=create cb_help
this.cb_close=create cb_close
this.gb_table=create gb_table
this.gb_1=create gb_1
this.st_bufferb=create st_bufferb
this.gb_form=create gb_form
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.st_buffer
this.Control[iCurrent+3]=this.rb_filter
this.Control[iCurrent+4]=this.rb_delete
this.Control[iCurrent+5]=this.rb_primary
this.Control[iCurrent+6]=this.ddlb_endcol
this.Control[iCurrent+7]=this.st_endcol
this.Control[iCurrent+8]=this.st_startcol
this.Control[iCurrent+9]=this.ddlb_startcol
this.Control[iCurrent+10]=this.st_endrow
this.Control[iCurrent+11]=this.sle_endrow
this.Control[iCurrent+12]=this.sle_startrow
this.Control[iCurrent+13]=this.st_startrow
this.Control[iCurrent+14]=this.st_border
this.Control[iCurrent+15]=this.sle_border
this.Control[iCurrent+16]=this.st_spacing
this.Control[iCurrent+17]=this.sle_spacing
this.Control[iCurrent+18]=this.sle_padding
this.Control[iCurrent+19]=this.st_padding
this.Control[iCurrent+20]=this.st_width
this.Control[iCurrent+21]=this.sle_width
this.Control[iCurrent+22]=this.cbx_wrap
this.Control[iCurrent+23]=this.cbx_css
this.Control[iCurrent+24]=this.cb_html
this.Control[iCurrent+25]=this.rb_form
this.Control[iCurrent+26]=this.rb_table
this.Control[iCurrent+27]=this.st_1
this.Control[iCurrent+28]=this.ddlb_1
this.Control[iCurrent+29]=this.cb_browse
this.Control[iCurrent+30]=this.cb_help
this.Control[iCurrent+31]=this.cb_close
this.Control[iCurrent+32]=this.gb_table
this.Control[iCurrent+33]=this.gb_1
this.Control[iCurrent+34]=this.st_bufferb
this.Control[iCurrent+35]=this.gb_form
end on

on w_dw_html.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.st_buffer)
destroy(this.rb_filter)
destroy(this.rb_delete)
destroy(this.rb_primary)
destroy(this.ddlb_endcol)
destroy(this.st_endcol)
destroy(this.st_startcol)
destroy(this.ddlb_startcol)
destroy(this.st_endrow)
destroy(this.sle_endrow)
destroy(this.sle_startrow)
destroy(this.st_startrow)
destroy(this.st_border)
destroy(this.sle_border)
destroy(this.st_spacing)
destroy(this.sle_spacing)
destroy(this.sle_padding)
destroy(this.st_padding)
destroy(this.st_width)
destroy(this.sle_width)
destroy(this.cbx_wrap)
destroy(this.cbx_css)
destroy(this.cb_html)
destroy(this.rb_form)
destroy(this.rb_table)
destroy(this.st_1)
destroy(this.ddlb_1)
destroy(this.cb_browse)
destroy(this.cb_help)
destroy(this.cb_close)
destroy(this.gb_table)
destroy(this.gb_1)
destroy(this.st_bufferb)
destroy(this.gb_form)
end on

event open;call super::open;// Determine if long file names are in use
If ge_Environment.OSType = Sol2! Then
	ib_LongFileNames = True
Elseif (ge_Environment.OSType = WindowsNT!) Or &
	(ge_Environment.OSType = Windows! And &
	(ge_Environment.OSMajorRevision = 4 Or ge_Environment.OSMinorRevision = 95)) Then
	ib_LongFileNames = True
Else
	ib_LongFileNames = False
End If

// Create Internet Context Service - this is used to open the default browser
If (ge_Environment.OSType = windows!) Or (ge_Environment.OSType = windowsNT!) Then
	// This service is only available on Win32
	This.GetContextService("Internet", iin_Context)
End If

end event

type tab_1 from tab within w_dw_html
event create ( )
event destroy ( )
integer x = 5
integer y = 464
integer width = 2866
integer height = 1092
integer taborder = 130
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 80242744
boolean raggedright = true
tabposition tabposition = tabsonbottom!
integer selectedtab = 1
tabpage_dw tabpage_dw
tabpage_html tabpage_html
end type

on tab_1.create
this.tabpage_dw=create tabpage_dw
this.tabpage_html=create tabpage_html
this.Control[]={this.tabpage_dw,&
this.tabpage_html}
end on

on tab_1.destroy
destroy(this.tabpage_dw)
destroy(this.tabpage_html)
end on

type tabpage_dw from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 16
integer width = 2830
integer height = 976
long backcolor = 80242744
string text = "DataWindow Display"
long tabtextcolor = 33554432
long tabbackcolor = 80242744
long picturemaskcolor = 536870912
dw_1 dw_1
end type

on tabpage_dw.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on tabpage_dw.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within tabpage_dw
integer width = 2821
integer height = 972
integer taborder = 21
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_html from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 16
integer width = 2830
integer height = 976
long backcolor = 80242744
string text = "HTML Source"
long tabtextcolor = 33554432
long tabbackcolor = 80242744
long picturemaskcolor = 536870912
mle_1 mle_1
end type

on tabpage_html.create
this.mle_1=create mle_1
this.Control[]={this.mle_1}
end on

on tabpage_html.destroy
destroy(this.mle_1)
end on

type mle_1 from multilineedit within tabpage_html
integer width = 2821
integer height = 972
integer taborder = 22
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_buffer from statictext within w_dw_html
boolean visible = false
integer x = 2103
integer y = 172
integer width = 261
integer height = 48
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Buffer:"
boolean focusrectangle = false
end type

type rb_filter from radiobutton within w_dw_html
boolean visible = false
integer x = 2117
integer y = 352
integer width = 283
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filter"
end type

type rb_delete from radiobutton within w_dw_html
boolean visible = false
integer x = 2117
integer y = 288
integer width = 283
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Delete"
end type

type rb_primary from radiobutton within w_dw_html
boolean visible = false
integer x = 2117
integer y = 228
integer width = 283
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Primary"
boolean checked = true
end type

type ddlb_endcol from dropdownlistbox within w_dw_html
boolean visible = false
integer x = 1179
integer y = 332
integer width = 850
integer height = 308
integer taborder = 120
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_endcol from statictext within w_dw_html
boolean visible = false
integer x = 846
integer y = 340
integer width = 334
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "End Column:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_startcol from statictext within w_dw_html
boolean visible = false
integer x = 846
integer y = 236
integer width = 334
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Start Column:"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_startcol from dropdownlistbox within w_dw_html
boolean visible = false
integer x = 1179
integer y = 224
integer width = 850
integer height = 308
integer taborder = 110
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_endrow from statictext within w_dw_html
boolean visible = false
integer x = 370
integer y = 340
integer width = 265
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "End Row:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_endrow from singlelineedit within w_dw_html
boolean visible = false
integer x = 635
integer y = 332
integer width = 187
integer height = 92
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "0"
boolean autohscroll = false
integer limit = 4
borderstyle borderstyle = stylelowered!
end type

type sle_startrow from singlelineedit within w_dw_html
boolean visible = false
integer x = 635
integer y = 224
integer width = 187
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "0"
boolean autohscroll = false
integer limit = 4
borderstyle borderstyle = stylelowered!
end type

type st_startrow from statictext within w_dw_html
boolean visible = false
integer x = 370
integer y = 236
integer width = 265
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Start Row:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_border from statictext within w_dw_html
integer x = 1193
integer y = 332
integer width = 338
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Border Width:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_border from singlelineedit within w_dw_html
integer x = 1531
integer y = 324
integer width = 187
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "0"
boolean autohscroll = false
integer limit = 4
borderstyle borderstyle = stylelowered!
end type

type st_spacing from statictext within w_dw_html
integer x = 1847
integer y = 332
integer width = 325
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Cell Spacing:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_spacing from singlelineedit within w_dw_html
integer x = 2176
integer y = 324
integer width = 187
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "0"
boolean autohscroll = false
integer limit = 4
borderstyle borderstyle = stylelowered!
end type

type sle_padding from singlelineedit within w_dw_html
integer x = 2176
integer y = 220
integer width = 187
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "0"
boolean autohscroll = false
integer limit = 4
borderstyle borderstyle = stylelowered!
end type

type st_padding from statictext within w_dw_html
integer x = 1847
integer y = 224
integer width = 325
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Cell Padding:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_width from statictext within w_dw_html
integer x = 1207
integer y = 224
integer width = 325
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Table Width:"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_width from singlelineedit within w_dw_html
integer x = 1531
integer y = 220
integer width = 187
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "0"
boolean autohscroll = false
integer limit = 4
borderstyle borderstyle = stylelowered!
end type

type cbx_wrap from checkbox within w_dw_html
integer x = 434
integer y = 332
integer width = 622
integer height = 76
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Wrap Text Within Cells"
end type

type cbx_css from checkbox within w_dw_html
integer x = 434
integer y = 224
integer width = 553
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Create Style Sheet"
end type

type cb_html from commandbutton within w_dw_html
integer x = 896
integer y = 1596
integer width = 539
integer height = 84
integer taborder = 150
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Update HTML Source"
end type

event clicked;of_generate_html()

end event

type rb_form from radiobutton within w_dw_html
integer x = 2578
integer y = 52
integer width = 233
integer height = 64
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 75530304
string text = "Form"
end type

event clicked;Parent.SetRedraw(False)

gb_table.Hide()
cbx_css.Hide()
cbx_wrap.Hide()
st_width.Hide()
sle_width.Hide()
st_border.Hide()
sle_border.Hide()
st_spacing.Hide()
sle_spacing.Hide()
st_padding.Hide()
sle_padding.Hide()

gb_form.Show()
st_startrow.Show()
sle_startrow.Show()
st_endrow.Show()
sle_endrow.Show()
st_startcol.Show()
ddlb_startcol.Show()
st_endcol.Show()
ddlb_endcol.Show()
st_buffer.Show()
st_bufferb.Show()
rb_primary.Show()
rb_delete.Show()
rb_filter.Show()

Parent.SetRedraw(True)

end event

type rb_table from radiobutton within w_dw_html
integer x = 2258
integer y = 52
integer width = 242
integer height = 64
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 75530304
string text = "Table"
boolean checked = true
end type

event clicked;Parent.SetRedraw(False)

gb_form.Hide()
st_startrow.Hide()
sle_startrow.Hide()
st_endrow.Hide()
sle_endrow.Hide()
st_startcol.Hide()
ddlb_startcol.Hide()
st_endcol.Hide()
ddlb_endcol.Hide()
st_buffer.Hide()
st_bufferb.Hide()
rb_primary.Hide()
rb_delete.Hide()
rb_filter.Hide()

gb_table.Show()
cbx_css.Show()
cbx_wrap.Show()
st_width.Show()
sle_width.Show()
st_border.Show()
sle_border.Show()
st_spacing.Show()
sle_spacing.Show()
st_padding.Show()
sle_padding.Show()

Parent.SetRedraw(True)

end event

type st_1 from statictext within w_dw_html
integer x = 41
integer y = 28
integer width = 297
integer height = 64
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 75530304
boolean enabled = false
string text = "DataWindow:"
long bordercolor = 8388608
boolean focusrectangle = false
end type

type ddlb_1 from dropdownlistbox within w_dw_html
integer x = 361
integer y = 28
integer width = 1115
integer height = 576
integer taborder = 10
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"d_dwexample_crosstab  (Crosstab)","d_dwexample_grid  (Grid)","d_dwexample_tabular  (Tabular)","d_dwexample_group  (Tabular with Groups)","d_button_report  (Tabular with Buttons)","d_sales_reps  (Freeform)","d_contact_maintenance  (Freeform with Buttons)"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;Integer	li_Pos
String	ls_DW

li_Pos = Pos(This.Text, "(")
ls_DW = Left(This.Text, (li_Pos - 3))

// Change the DataWindow to the selected one.
tab_1.tabpage_dw.dw_1.DataObject = ls_DW
tab_1.tabpage_dw.dw_1.SetTransObject(sqlca)
tab_1.tabpage_dw.dw_1.Retrieve()

of_add_columns()

end event

type cb_browse from commandbutton within w_dw_html
integer x = 297
integer y = 1596
integer width = 539
integer height = 84
integer taborder = 140
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Browse"
boolean default = true
end type

event clicked;String	ls_FileName, ls_Browser, ls_BrowserName
Integer	li_Result


SetPointer(HourGlass!)

// Update the HTML source
cb_html.Trigger Event Clicked()

// Write the HTML to a file
ls_FileName = of_write_file(tab_1.tabpage_html.mle_1.Text)
If ls_FileName <> "" Then

	// Run browser with the HTML file
	// First, determine the browser to use
	If (ge_Environment.OSType = windows!) Or (ge_Environment.OSType = windowsNT!) Then

		// Use Context Object function to display the file in the default browser.
		If openurl("file://" + gs_ExampleDir + "\" +  ls_FileName) <> 1 Then
			MessageBox("Error", "Error running default browser.", StopSign!)
		End If	
	Else
		// The Context Object Internet service is only available on Win32, so have the user find the browser.
		If is_Browser = "" Then

			// Open dialog to select a browser.
			li_Result = GetFileOpenName("Select Browser", ls_Browser,  ls_BrowserName, &
														"exe", "Executable Files (*.exe),*.exe")
			If li_Result <> -1 Then
				is_Browser = ls_Browser
			Else
				MessageBox("DataWindow to HTML", "You must select the browser to use by selecting its executable.", Information!)
				Return
			End If
		End If
		
		// Run browser with the HTML file
		li_Result = Run(is_Browser + " file:\\" + gs_ExampleDir + "\" + ls_FileName)
		If li_Result = -1 Then
			MessageBox("Error", "Error running browser: " + is_Browser + " " + ls_FileName, Exclamation!)
		End If	

		// Executing this dialog resets the current working directory, set it back.
		w_main.of_set_cwd(gs_ExampleDir)
	End If
End If

end event

type cb_help from commandbutton within w_dw_html
integer x = 2098
integer y = 1596
integer width = 539
integer height = 84
integer taborder = 170
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Help"
end type

event clicked;f_open_help ("w_dw_html")

end event

type cb_close from commandbutton within w_dw_html
integer x = 1495
integer y = 1596
integer width = 539
integer height = 84
integer taborder = 160
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Close"
end type

event clicked;///////////////////////////////////////////////////////////////////////////////////////////////////////
// Clicked script for cb_close
///////////////////////////////////////////////////////////////////////////////////////////////////////

// Close window
close(parent)
end event

type gb_table from groupbox within w_dw_html
integer x = 366
integer y = 156
integer width = 2089
integer height = 288
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Table Options:"
end type

type gb_1 from groupbox within w_dw_html
integer x = 2217
integer width = 603
integer height = 132
integer taborder = 20
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 41943040
long backcolor = 75530304
string text = "HTML Options"
end type

type st_bufferb from statictext within w_dw_html
boolean visible = false
integer x = 2098
integer y = 220
integer width = 311
integer height = 212
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type gb_form from groupbox within w_dw_html
boolean visible = false
integer x = 361
integer y = 140
integer width = 2089
integer height = 308
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Form Options:"
end type

