$PBExportHeader$w_getenvironment.srw
$PBExportComments$Demonstrates the use of the getenvironment function
forward
global type w_getenvironment from w_center
end type
type st_4 from statictext within w_getenvironment
end type
type st_exe from statictext within w_getenvironment
end type
type cb_ok from commandbutton within w_getenvironment
end type
type st_width from statictext within w_getenvironment
end type
type st_height from statictext within w_getenvironment
end type
type st_colors from statictext within w_getenvironment
end type
type st_7 from statictext within w_getenvironment
end type
type st_6 from statictext within w_getenvironment
end type
type st_5 from statictext within w_getenvironment
end type
type st_pbver from statictext within w_getenvironment
end type
type st_3 from statictext within w_getenvironment
end type
type st_2 from statictext within w_getenvironment
end type
type st_1 from statictext within w_getenvironment
end type
type st_ostype from statictext within w_getenvironment
end type
type st_cpu_type from statictext within w_getenvironment
end type
end forward

global type w_getenvironment from w_center
integer x = 809
integer y = 544
integer width = 2016
integer height = 1412
string title = "GetEnvironment"
long backcolor = 74481808
toolbaralignment toolbaralignment = alignatleft!
st_4 st_4
st_exe st_exe
cb_ok cb_ok
st_width st_width
st_height st_height
st_colors st_colors
st_7 st_7
st_6 st_6
st_5 st_5
st_pbver st_pbver
st_3 st_3
st_2 st_2
st_1 st_1
st_ostype st_ostype
st_cpu_type st_cpu_type
end type
global w_getenvironment w_getenvironment

event open;call super::open;environment env
integer resp
string temp
resp = getenvironment(env)

choose case env.cputype
	case alpha!
		st_cpu_type.text = 'Alpha'
	case hppa!
		st_cpu_type.text = 'HPPA'
	case i286!
		st_cpu_type.text = '286'
	case i386!
		st_cpu_type.text = '386'
	case i486!
		st_cpu_type.text = '486'
	case m68000!
		st_cpu_type.text = '68000'
	case m68020!
		st_cpu_type.text = '68020'
	case m68030!
		st_cpu_type.text = '68030'
	case m68040!
		st_cpu_type.text = '68040'
	case mips!
		st_cpu_type.text = 'MIPS'
	case pentium!
		st_cpu_type.text = 'Pentium'
	case powerpc!
		st_cpu_type.text = 'PowerPC'
	case sparc!
		st_cpu_type.text = 'Sparc'
end choose

choose case env.ostype
	case aix!
		temp = 'AIX'
	case hpux!
		temp = 'HPUX'
	case osf1!
		temp = 'OSF1'
	case sol2!
		temp = 'Solaris 2'
	case Windows!
		temp = 'Windows'
	case Windowsnt!
		temp = 'Windows NT'
end choose
st_ostype.text = temp + ' '+string(env.osmajorrevision)+'.'+string(env.osminorrevision)+'.'+string(env.osfixesrevision)

choose case env.pbtype
	case enterprise!
		temp = 'Enterprise'
	case desktop!
		temp = 'Desktop'
end choose
If env.win16 Then
	temp = temp + "/16"
Else
	temp = temp + "/32"
End If

st_pbver.text = temp + ' '+string(env.pbmajorrevision)+'.'+string(env.pbminorrevision)+'.'+string(env.pbfixesrevision)

If env.machinecode Then
	st_exe.text = "Machine Code"
Else
	st_exe.text = "P-Code"
End If

st_colors.text =string(env.numberofcolors)
st_height.text = string(env.screenheight)
st_width.text = string(env.screenwidth)

end event

on w_getenvironment.create
int iCurrent
call super::create
this.st_4=create st_4
this.st_exe=create st_exe
this.cb_ok=create cb_ok
this.st_width=create st_width
this.st_height=create st_height
this.st_colors=create st_colors
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_pbver=create st_pbver
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.st_ostype=create st_ostype
this.st_cpu_type=create st_cpu_type
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_4
this.Control[iCurrent+2]=this.st_exe
this.Control[iCurrent+3]=this.cb_ok
this.Control[iCurrent+4]=this.st_width
this.Control[iCurrent+5]=this.st_height
this.Control[iCurrent+6]=this.st_colors
this.Control[iCurrent+7]=this.st_7
this.Control[iCurrent+8]=this.st_6
this.Control[iCurrent+9]=this.st_5
this.Control[iCurrent+10]=this.st_pbver
this.Control[iCurrent+11]=this.st_3
this.Control[iCurrent+12]=this.st_2
this.Control[iCurrent+13]=this.st_1
this.Control[iCurrent+14]=this.st_ostype
this.Control[iCurrent+15]=this.st_cpu_type
end on

on w_getenvironment.destroy
call super::destroy
destroy(this.st_4)
destroy(this.st_exe)
destroy(this.cb_ok)
destroy(this.st_width)
destroy(this.st_height)
destroy(this.st_colors)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_pbver)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_ostype)
destroy(this.st_cpu_type)
end on

event close;call super::close;//w_main.Show()
end event

type st_4 from statictext within w_getenvironment
integer x = 110
integer y = 412
integer width = 727
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
string text = "Executable Type :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_exe from statictext within w_getenvironment
integer x = 841
integer y = 412
integer width = 1001
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
string text = "unknown"
boolean focusrectangle = false
end type

type cb_ok from commandbutton within w_getenvironment
integer x = 581
integer y = 1032
integer width = 535
integer height = 120
integer taborder = 1
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "OK"
boolean default = true
end type

on clicked;close(parent)
end on

type st_width from statictext within w_getenvironment
integer x = 841
integer y = 772
integer width = 507
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
string text = "?"
boolean focusrectangle = false
end type

type st_height from statictext within w_getenvironment
integer x = 841
integer y = 652
integer width = 507
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
string text = "?"
boolean focusrectangle = false
end type

type st_colors from statictext within w_getenvironment
integer x = 841
integer y = 532
integer width = 507
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
string text = "?"
boolean focusrectangle = false
end type

type st_7 from statictext within w_getenvironment
integer x = 110
integer y = 772
integer width = 727
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
string text = "Screen Width : "
alignment alignment = right!
boolean focusrectangle = false
end type

type st_6 from statictext within w_getenvironment
integer x = 110
integer y = 652
integer width = 727
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
string text = "Screen Height : "
alignment alignment = right!
boolean focusrectangle = false
end type

type st_5 from statictext within w_getenvironment
integer x = 110
integer y = 532
integer width = 727
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
string text = "Number of colors : "
alignment alignment = right!
boolean focusrectangle = false
end type

type st_pbver from statictext within w_getenvironment
integer x = 841
integer y = 292
integer width = 1001
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
string text = "version unkown"
boolean focusrectangle = false
end type

type st_3 from statictext within w_getenvironment
integer x = 110
integer y = 292
integer width = 727
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
string text = "PowerBuilder Version : "
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_getenvironment
integer x = 110
integer y = 172
integer width = 727
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
string text = "OS Type : "
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_getenvironment
integer x = 110
integer y = 52
integer width = 727
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
string text = "CPU Type : "
alignment alignment = right!
boolean focusrectangle = false
end type

type st_ostype from statictext within w_getenvironment
integer x = 841
integer y = 172
integer width = 1001
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
string text = "os type unknown"
boolean focusrectangle = false
end type

type st_cpu_type from statictext within w_getenvironment
integer x = 841
integer y = 52
integer width = 1001
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
string text = "cpu unkown"
boolean focusrectangle = false
end type

