<html>

<head>
<style>

[type = "submit"] {
    background-color: #800080; 
    border: none;
    color: white;
    padding: 10px;
	border-radius: 12px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    cursor: pointer;
}
[type=text] , [type=number]{
    padding: 5px 8px;
	width: 80px ;
    margin: 5px;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
}

body{
	background-image: url("https://www.xmple.com/wallpaper/gradient-white-blue-linear-2736x1824-c2-ffffff-87cefa-a-285-f-14.svg");
	background-repeat: no-repeat;
	background-position: center;
	background-size: 100% 500%;
	font-family: Comic Sans MS;
}

[placeholder]{
	font-weight: bold;
	font-family: Comic Sans MS;
	font-size: 15px;
}

th{
	background-color: #FFA500;
    color: white;
}

tr#z:nth-child(even){
	background-color: #f2f2f2;
}

#show{
	border-collapse: collapse;
    width: 30%;
}

#z{
	text-align: left;
    padding: 8px;
}

</style>
</head>

<body>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.lang.*"%>
<%@ page import="static java.lang.System.out" %>

<table>
	<tr>
		<td><img src="shape.png" width="100%"></td>

		<td>
		<table>
			<form method="post">
				<input name="fn" type="hidden" value="1">
				<tr>
					<td>Lines</td>
					<td>
					<input name="lineAB" type="number" step="any" placeholder="AB">
					<input name="lineBC" type="number" step="any" placeholder="BC">
					<input name="lineCD" type="number" step="any" placeholder="CD">
					<input name="lineDA" type="number" step="any" placeholder="DA">
					<input name="lineBE" type="number" step="any" placeholder="BE">
					<input name="lineB'E" type="number" step="any" placeholder="B'E">
					<input name="lineEF" type="number" step="any" placeholder="EF">
					<input name="lineB'F" type="number" step="any" placeholder="B'F">
					<input name="lineBF" type="number" step="any" placeholder="BF">
					<input name="lineFA" type="number" step="any" placeholder="FA">
					<input name="lineAC" type="number" step="any" placeholder="AC">
					<input name="lineBD" type="number" step="any" placeholder="BD">
					<input name="lineEC" type="number" step="any" placeholder="EC">
					</td>
				</tr>
				<tr>
					<td>Area</td>
					<td>
					<input name="areaABCD" type="number" step="any" placeholder="ABCD">
					<input name="areaBEF" type="number" step="any" placeholder="BEF">
					<input name="areaB'EF" type="number" step="any" placeholder="B'EF">
<!--				<input name="areAFECD" type="number" step="any" placeholder="AFECD">
-->	 				</td>
				</tr>
<!--	 			<tr>
					<td>Perimeter</td>
					<td>
					<input name="perABCD" type="number" step="any" placeholder="ABCD">
					<input name="perBEF" type="number" step="any" placeholder="BEF">
					<input name="perB'EF" type="number" step="any" placeholder="B'EF">
					<input name="perAFECD" type="number" step="any" placeholder="AFECD">
					</td>
				</tr>
-->				<tr>
					<td>Angles in degree</td>
					<td>
					<input name="<BEF" type="number" step="any" placeholder="BEF">
					<input name="<BFE" type="number" step="any" placeholder="BFE">
					<input name="<B'EF" type="number" step="any" placeholder="B'EF">
					<input name="<B'FE" type="number" step="any" placeholder="B'FE">
					<input name="<B'EB" type="number" step="any" placeholder="B'EB">
					<input name="<B'FB" type="number" step="any" placeholder="B'FB">
					
					<input name="<CAD" type="number" step="any" placeholder="CAD">
					<input name="<ACB" type="number" step="any" placeholder="ACB">
					<input name="<ADB" type="number" step="any" placeholder="ADB">
					<input name="<DBC" type="number" step="any" placeholder="DBC">
					<input name="<DCA" type="number" step="any" placeholder="DCA">
					<input name="<CAB" type="number" step="any" placeholder="CAB">
					<input name="<CDB" type="number" step="any" placeholder="CDB">
					<input name="<DBA" type="number" step="any" placeholder="DBA">

					</td>
				</tr>
				<tr>
					<input type="submit" value="Submit">
				</tr>
			</form>
		</table>
		</td>
	</tr>
	
</table>
	

<table>

<%  
	String fId = request.getParameter("fn");
	
	if(fId != null && fId != "" && fId.equals("1")){
		
		
	double[] triangle = new double[13];  
	for(int i = 0; i < 13 ;i++){
		triangle[i] = -1.0;
	}
	/* BE | B'E | B'F | BF | EF | Area BEF | Area B'EF | <FEB | <B'EF | <B'EB | < B'FE | < EFB | < B'FB */ 
	String lineBE = request.getParameter("lineBE");
	String lineXE = request.getParameter("lineB'E");
	String lineXF = request.getParameter("lineB'F");
	String lineBF = request.getParameter("lineBF");
	String lineEF = request.getParameter("lineEF");
	String areaBEF = request.getParameter("areaBEF");
	String areaXEF = request.getParameter("areaB'EF");
	String aBEF = request.getParameter("<BEF");
	String aXEF = request.getParameter("<B'EF");
	String aXEB = request.getParameter("<B'EB");
	String aBFE = request.getParameter("<BFE");
	String aXFB = request.getParameter("<B'FB");
	String aXFE = request.getParameter("<B'FE");
	
	
	double[] rect = new double[15];
	for(int i = 0; i < 15 ;i++){
		rect[i] = -1.0;
	}
	/* 	AD | BC | DC | AB | ABCD | CAD | ACB | ADB | DBC | DCA | CAB | CDB | DBA | AC | BD */
	String lineAD = request.getParameter("lineDA");
	String lineBC = request.getParameter("lineBC");
	String lineAB = request.getParameter("lineAB");
	String lineDC = request.getParameter("lineCD");
	String lineAC = request.getParameter("lineAC");
	String lineBD = request.getParameter("lineBD");
	String areaABCD = request.getParameter("areaABCD");
	String aCAD = request.getParameter("<CAD");
	String aACB = request.getParameter("<ACB");
	String aADB = request.getParameter("<ADB");
	String aDBC = request.getParameter("<DBC");
	String aDCA = request.getParameter("<DCA");
	String aCAB = request.getParameter("<CAB");
	String aCDB = request.getParameter("<CDB");
	String aDBA = request.getParameter("<DBA");
	
		
	String EC = request.getParameter("lineEC");
	String FA = request.getParameter("lineFA");
	double ec = -1.0,fa = -1.0;
	
	int count2 = 0;
	int count = 0;
	boolean flagT = false;
	boolean flagR = false;
	boolean invalid = false;
	
	
	if(lineBE != "" || lineXE != ""){
		if(lineBE != "" && lineXE != "" && !lineBE.equals(lineXE)){
			invalid = true;
		}
		else if(lineBE != "" && lineBE.contains("-")){
			invalid = true;
		}
		else if(lineXE != "" && lineXE.contains("-")){
			invalid = true;
		}
		else{
		count++;
			if(lineBE != ""){
				triangle[0] = triangle[1] = Double.parseDouble(lineBE);
 			}
			else{
				triangle[0] = triangle[1] = Double.parseDouble(lineXE);
			}
		}
	}
	if(lineBF != "" || lineXF != ""){
		if(lineBF != "" && lineXF != "" && !lineBF.equals(lineXF)){
			invalid = true;
		}
		else if(lineBF != "" && lineBF.contains("-")){
			invalid = true;
		}
		else if(lineXF != "" && lineXF.contains("-")){
			invalid = true;
		}
		else{
		count++;
			if(lineBF != ""){
				triangle[2] = triangle[3] = Double.parseDouble(lineBF);
 			}
			else{
				triangle[2] = triangle[3] = Double.parseDouble(lineXF);
			}
		}
	}
	if(lineEF != ""){
		if(lineEF.contains("-")){
			invalid = true;
		}
		count++;
		triangle[4] = Double.parseDouble(lineEF);
	}
	if(areaBEF != "" || areaXEF != ""){
		if(areaBEF != "" && areaXEF != "" && !areaBEF.equals(areaXEF)){
			invalid = true;
		}
		else if(areaBEF != "" && areaBEF.contains("-")){
			invalid = true;
		}
		else if(areaXEF != "" && areaXEF.contains("-")){
			invalid = true;
		}
		else{
		count++;
			if(areaBEF != ""){
				triangle[5] = triangle[6] = Double.parseDouble(areaBEF);
 			}
			else{
				triangle[5] = triangle[6] = Double.parseDouble(areaXEF);
			}
		}
	}
	if(aBEF != "" || aXEF != "" || aXEB != ""){
		double x,y,z;
		if(aBEF != ""){
			x = Double.parseDouble(aBEF);
			if(x < 0){
				invalid = true;
			}
		}
		else{
			x = -1.0;
		}
		if(aXEF != ""){
			y = Double.parseDouble(aXEF);
			if(y < 0){
				invalid = true;
			}
		}
		else{
			y = -1.0;
		}
		
		if(aXEB != ""){
			z = Double.parseDouble(aXEB);
			if(z < 0){
				invalid = true;
			}
		}
		else{
			z = -1.0;
		}
		
		if((aBEF != "" && aXEF != "" && !aBEF.equals(aXEF)) ||  (aXEB != "" && aXEF != "" && (2*y != z)) 
			|| (aXEB != "" && aBEF != "" && (2*x != z))){
			invalid = true;
		}
		else{
		count++;
			if(aBEF != ""){
				triangle[7] = triangle[8] = x;
				triangle[9] = 2*triangle[8];
 			}
			else if(aXEF != ""){
				triangle[7] = triangle[8] = y;
				triangle[9] = 2*triangle[8];
			}
			else{
				triangle[9] = z;
				triangle[7] = triangle[8] = z/2;
			}
		}
	}
	
	if(aBFE != "" || aXFE != "" || aXFB != ""){
		double x,y,z;
		if(aBFE != ""){
			x = Double.parseDouble(aBFE);
			if(x < 0){
				invalid = true;
			}
		}
		else{
			x = -1.0;
		}
		if(aXFE != ""){
			y = Double.parseDouble(aXFE);
			if(y < 0){
				invalid = true;
			}
		}
		else{
			y = -1.0;
		}
		if(aXFB != ""){
			z = Double.parseDouble(aXFB);
			if(z < 0){
				invalid = true;
			}
		}
		else{
			z = -1.0;
		}
		if((aBFE != "" && aXFE != "" && !aBFE.equals(aXFE)) ||  (aXFB != "" && aXFE != "" && (2*y != z)) 
			|| (aXFB != "" && aBFE != "" && (2*x != z))){
			invalid = true;
		}
		else{
		count++;
			if(aBFE != ""){
				triangle[10] = triangle[11] = x;
				triangle[12] = 2*triangle[11];
 			}
			else if(aXFE != ""){
				triangle[10] = triangle[11] = y;
				triangle[12] = 2*triangle[11];
			}
			else{
				triangle[12] = z;
				triangle[10] = triangle[11] = z/2;
			}
		}
	}
	
	if(triangle[7] != -1.0 && triangle[10] != -1.0 ){
		double x = triangle[7] + triangle[10];
		if(x < 88 || x > 92){
			count = 0;
			invalid = true;
		}
		else if(count == 2){
			count = 0;
		}
	}
	else if(triangle[7] != -1.0){
		triangle[10] = triangle[11] = 90 - triangle[7];
		triangle[12] = 2 * triangle[10];
	}
	else if(triangle[10] != -1.0){
		triangle[7] = triangle[8] = 90 - triangle[10];
		triangle[9] = 2 * triangle[7];
	}
	
	
	if(lineAD != "" || lineBC != ""){
		if(lineAD != "" && lineBC != "" && !lineAD.equals(lineBC)){
			invalid = true;
		}
		else if(lineAD != "" && lineAD.contains("-")){
			invalid = true;
		}
		else if(lineBC != "" && lineBC.contains("-")){
			invalid = true;
		}
		else if(lineAD != ""){
			count2++;
			rect[0] = rect[1] = Double.parseDouble(lineAD);
		}
		else{
			count2++;
			rect[0] = rect[1] = Double.parseDouble(lineBC);
		}
	}
	if(lineDC != "" || lineAB != ""){
		if(lineDC != "" && lineAB != "" && !lineDC.equals(lineAB)){
			invalid = true;
		}
		else if(lineAB != "" && lineAB.contains("-")){
			invalid = true;
		}
		else if(lineDC != "" && lineDC.contains("-")){
			invalid = true;
		}
		else if(lineDC != ""){
			count2++;
			rect[2] = rect[3] = Double.parseDouble(lineDC);
		}
		else{
			count2++;
			rect[2] = rect[3] = Double.parseDouble(lineAB);
		}
	}
	if(lineAC != "" || lineBD != ""){
		if(lineAC != "" && lineBD != "" && !lineAC.equals(lineBD)){
			invalid = true;
		}
		else if(lineAC != "" && lineAC.contains("-")){
			invalid = true;
		}
		else if(lineBD != "" && lineBD.contains("-")){
			invalid = true;
		}
		else if(lineAC != ""){
			count2++;
			rect[13] = rect[14] = Double.parseDouble(lineAC);
		}
		else{
			count2++;
			rect[13] = rect[14] = Double.parseDouble(lineBD);
		}
	}
	if(areaABCD != ""){
		if(areaABCD.contains("-")){
			invalid = true;
		}
		count2++;
		rect[4] = Double.parseDouble(areaABCD);
	}
	if(aCAD != "" || aACB != "" || aADB != "" || aDBC != ""){
		if((aCAD != "" && aACB != "" && !aCAD.equals(aACB)) || (aCAD != "" && aADB != "" && !aCAD.equals(aADB)) 
			|| (aCAD != "" && aDBC != "" && !aCAD.equals(aDBC)) || (aACB != "" && aADB != "" && !aACB.equals(aADB)) 
			|| (aACB != "" && aDBC != "" && !aACB.equals(aDBC)) || (aDBC != "" && aADB != "" && !aDBC.equals(aADB)) ){
				invalid = true;
		}
		else if(aCAD.contains("-") || aACB.contains("-") || aADB.contains("-") || aDBC.contains("-")){
			invalid = true;
		}
		else{
			count2++;
			if(aCAD != ""){
				rect[5] = rect[6] = rect[7] = rect[8] = Double.parseDouble(aCAD);
			}
			else if(aACB != ""){
				rect[5] = rect[6] = rect[7] = rect[8] = Double.parseDouble(aACB);
			}
			else if(aADB != ""){
				rect[5] = rect[6] = rect[7] = rect[8] = Double.parseDouble(aADB);
			}
			else{
				rect[5] = rect[6] = rect[7] = rect[8] = Double.parseDouble(aDBC);
			}
		}
	}
	
	if(aDCA != "" || aCAB != "" || aCDB != "" || aDBA != ""){
		if((aDCA != "" && aCAB != "" && !aDCA.equals(aCAB)) || (aDCA != "" && aCDB != "" && !aDCA.equals(aCDB)) 
			|| (aDCA != "" && aDBA != "" && !aDCA.equals(aDBA)) || (aCAB != "" && aCDB != "" && !aCAB.equals(aCDB)) 
			|| (aCAB != "" && aDBA != "" && !aCAB.equals(aDBA)) || (aDBA != "" && aCDB != "" && !aDBA.equals(aCDB)) ){
				invalid = true;
		}
		else if(aDCA.contains("-") || aCAB.contains("-") || aCDB.contains("-") || aDBA.contains("-")){
			invalid = true;
		}
		else{
			count2++;
			if(aDCA != ""){
				rect[9] = rect[10] = rect[11] = rect[12] = Double.parseDouble(aDCA);
			}
			else if(aCAB != ""){
				rect[9] = rect[10] = rect[11] = rect[12] = Double.parseDouble(aCAB);
			}
			else if(aCDB != ""){
				rect[9] = rect[10] = rect[11] = rect[12] = Double.parseDouble(aCDB);
			}
			else{
				rect[9] = rect[10] = rect[11] = rect[12] = Double.parseDouble(aDBA);
			}
		}
	}
	
	if(rect[9] != -1.0 && rect[5] != -1.0 ){
		double x = rect[9] + rect[5];
		if(x < 88 || x > 92){
			count2 = 0;
			invalid = true;
		}
		else if(count2 == 2){
			count2 = 0; 
		}
	}
	else if(rect[9] != -1.0){
		rect[5] = rect[6] = rect[7] = rect[8] = 90 - rect[9];
	}
	else if(rect[5] != -1.0){
		rect[9] = rect[10] = rect[11] = rect[12] = 90 -rect[5];
	}
	
	if(FA != ""){
		fa = Double.parseDouble(FA);
		if(fa < 0){
			invalid = true;
		}
	}
	else{
		fa = -1.0;
	}
	if(EC != ""){
		ec = Double.parseDouble(EC);
		if(ec < 0){
			invalid = true;
		}
	}
	else{
		ec = -1.0;
	}
	
	int aaa = 0;
	while((!flagR || !flagT) && aaa < 3 && !invalid){
		aaa++;
	if(count >= 2){
		flagT = true;
	if(triangle[0] != -1.0 && triangle[2] != -1.0){
		double area = (triangle[0] * triangle[2])/2;
		double a1 = Math.atan(triangle[2] / triangle[0]);
		double EF = Math.sqrt(triangle[0]*triangle[0] + triangle[2]*triangle[2]); 
		if(triangle[5] != -1.0 && triangle[5] != area){
			invalid = true;
		}
		else{
			triangle[5] = triangle[6] = area;
			if(triangle[4] != -1.0 && triangle[4] != EF){
				out.println("Wrong triangle.");
			}
			else{
				triangle[4]=EF;
				triangle[7] = triangle[8] = Math.toDegrees(a1);
				triangle[9] = 2 * triangle[7];
				triangle[10] = triangle[11] = 90 - triangle[7];
				triangle[12] = 2* triangle[10];
			}
		}
	}
	else if(triangle[0] != -1.0 && triangle[4] != -1.0){
		double BF = Math.sqrt(triangle[4]*triangle[4] - triangle[0] * triangle[0]);
		if(triangle[2] != -1.0 && triangle[2] != BF){
			invalid = true;
		}
		else{
			triangle[2] = triangle[3] = BF;
			double area = (triangle[0] * triangle[2])/2;
			double a1 = Math.atan(triangle[2] / triangle[0]);
			if(triangle[5] != -1.0 && triangle[5] != area){
				invalid = true;
			}
			else{
				triangle[5] = triangle[6] = area;
				triangle[7] = triangle[8] = Math.toDegrees(a1);
				triangle[9] = 2 * triangle[7];
				triangle[10] = triangle[11] = 90 - triangle[7];
				triangle[12] = 2* triangle[10];
			}
		}
	}
	
	else if(triangle[0] != -1.0 && triangle[5] != -1.0){
		double BF = (2 * triangle[5]) / triangle[0];
		if(triangle[2] != -1.0 && triangle[2] != BF){
			invalid = true;
		}
		else{
			triangle[2] = triangle[3] = BF;
			double a1 = Math.atan(triangle[2] / triangle[0]);
			double EF = Math.sqrt(triangle[0]*triangle[0] + triangle[2]*triangle[2]); 
			if(triangle[4] != -1.0 && triangle[4] != EF){
				invalid = true;
			}
			else{
				triangle[4] = EF;
				triangle[7] = triangle[8] = Math.toDegrees(a1);
				triangle[9] = 2 * triangle[7];
				triangle[10] = triangle[11] = 90 - triangle[7];
				triangle[12] = 2* triangle[10];
			}
		}
	}
	else if(triangle[0] != -1.0 && triangle[7] != -1.0){
		double BF = Math.tan(Math.toRadians(triangle[7])) * triangle[0];
		if(triangle[2] != -1.0 && triangle[2] != BF){
			invalid = true;
		}
		else{
			triangle[2] = triangle[3] = BF;
			double area = (triangle[0] * triangle[2])/2;
			double EF = Math.sqrt(triangle[0]*triangle[0] + triangle[2]*triangle[2]); 
			if(triangle[4] != -1.0 && triangle[4] != EF){
				invalid = true;
			}
			else{
				triangle[4] = EF;
				if(triangle[5] != -1.0 && triangle[5] != area){
					invalid = true;
				}
				else{
					triangle[5] = triangle[6] = area;
					triangle[10] = triangle[11] = 90 - triangle[7];
					triangle[12] = 2* triangle[10];
				}
			}
		}
	}
	else if(triangle[0] != -1.0 && triangle[10] != -1.0){
		double BF = triangle[0] / Math.tan(Math.toRadians(triangle[10]));
		if(triangle[2] != -1.0 && triangle[2] != BF){
			invalid = true;
		}
		else{
			triangle[2] = triangle[3] = BF;
			double area = (triangle[0] * triangle[2])/2;
			double EF = Math.sqrt(triangle[0]*triangle[0] + triangle[2]*triangle[2]); 
			if(triangle[4] != -1.0 && triangle[4] != EF){
				invalid = true;
			}
			else{
				triangle[4] = EF;
				if(triangle[5] != -1.0 && triangle[5] != area){
					invalid = true;
				}
				else{
					triangle[5] = triangle[6] = area;
					triangle[7] = triangle[8] = 90 - triangle[10];
					triangle[9] = 2* triangle[7];
				}
			}
		}
	}
	else if(triangle[2] != -1.0 && triangle[5] != -1.0){
		double BE = (triangle[5] * 2) / triangle[2];
		if(triangle[0] != -1.0 && triangle[0] != BE){
			invalid = true;
		}
		else{
			triangle[0] = triangle[1] = BE;
			double a1 = Math.atan(triangle[2] / triangle[0]);
			double EF = Math.sqrt(triangle[0]*triangle[0] + triangle[2]*triangle[2]); 
			if(triangle[4] != -1.0 && triangle[4] != EF){
				invalid = true;
			}
			else{
				triangle[4] = EF;
				triangle[7] = triangle[8] = Math.toDegrees(a1);
				triangle[9] = 2 * triangle[7];
				triangle[10] = triangle[11] = 90 - triangle[7];
				triangle[12] = 2* triangle[10];
			}
		}
		
	}
	
	else if(triangle[2] != -1.0 && triangle[4] != -1.0){
		double BE = Math.sqrt(triangle[4]*triangle[4] - triangle[2]*triangle[2]);
		if(triangle[0] != -1.0 && triangle[0] != BE){
			invalid = true;
		}
		else{
			triangle[0] = triangle[1] = BE;
			double a1 = Math.atan(triangle[2] / triangle[0]);
			double area = (triangle[0]*triangle[2])/2; 
			if(triangle[5] != -1.0 && triangle[5] != area){
				invalid = true;
			}
			else{
				triangle[5] = triangle[6] = area;
				triangle[7] = triangle[8] = Math.toDegrees(a1);
				triangle[9] = 2 * triangle[7];
				triangle[10] = triangle[11] = 90 - triangle[7];
				triangle[12] = 2* triangle[10];
			}
		}
		
	}
	
	else if(triangle[2] != -1.0 && triangle[7] != -1.0){
		double BE = triangle[2] / Math.tan(Math.toRadians(triangle[7]));
		if(triangle[0] != -1.0 && triangle[0] != BE){
			invalid = true;
		}
		else{
			triangle[0] = triangle[1] = BE;
			double EF = Math.sqrt(triangle[0]*triangle[0] + triangle[2]*triangle[2]); 
			double area = (triangle[0]*triangle[2])/2; 
			if(triangle[5] != -1.0 && triangle[5] != area){
				invalid = true;
			}
			else{
				triangle[5] = triangle[6] = area;
				if(triangle[4] != -1.0 && triangle[4] != EF){
					invalid = true;
				}
				else{
				triangle[4] = EF;
				triangle[10] = triangle[11] = 90 - triangle[7];
				triangle[12] = 2* triangle[10];
				}
				
			}
		}
		
	}
	
	else if(triangle[2] != -1.0 && triangle[10] != -1.0){
		double BE = triangle[2] * Math.tan(Math.toRadians(triangle[10]));
		if(triangle[0] != -1.0 && triangle[0] != BE){
			invalid = true;
		}
		else{
			triangle[0] = triangle[1] = BE;
			double EF = Math.sqrt(triangle[0]*triangle[0] + triangle[2]*triangle[2]); 
			double area = (triangle[0]*triangle[2])/2; 
			if(triangle[5] != -1.0 && triangle[5] != area){
				invalid = true;
			}
			else{
				triangle[5] = triangle[6] = area;
				if(triangle[4] != -1.0 && triangle[4] != EF){
					invalid = true;
				}
				else{
				triangle[4] = EF;
				triangle[7] = triangle[8] = 90 - triangle[10];
				triangle[9] = 2* triangle[7];
				}
				
			}
		}
		
	}
	else if(triangle[5] != -1.0 && triangle[7] != -1.0){
		double BF = Math.sqrt(triangle[5] * 2 * Math.tan(Math.toRadians(triangle[7])));
		double BE = (2 * triangle[5] ) / BF;
		if(triangle[2] !=0 && triangle[2] != BF){
			invalid = true;
		}
		else{
			triangle[2] = triangle[3] = BF;
			if(triangle[0] != -1.0 && triangle[0] != BE){
				invalid = true;
			}
			else{
				triangle[0] = triangle[1] = BE;
				double EF = Math.sqrt(triangle[0]*triangle[0] + triangle[2]*triangle[2]); 
				if(triangle[4] != -1.0 && triangle[4] != EF){
					invalid = true;
				}
				else{
					triangle[4] = EF;
					triangle[10] = triangle[11] = 90 - triangle[7];
					triangle[12] = 2 * triangle[10];
				}
			}
		}
	}
	
	else if(triangle[5] != -1.0 && triangle[10] != -1.0){
		double BE = Math.sqrt(triangle[5] * 2 * Math.tan(Math.toRadians(triangle[10])));
		double BF = (2 * triangle[5] ) / BE;
		if(triangle[0] !=0 && triangle[0] != BE){
			invalid = true;
		}
		else{
			triangle[0] = triangle[1] = BE;
			if(triangle[2] != -1.0 && triangle[2] != BF){
				invalid = true;
			}
			else{
				triangle[2] = triangle[3] = BF;
				double EF = Math.sqrt(triangle[0]*triangle[0] + triangle[2]*triangle[2]); 
				if(triangle[4] != -1.0 && triangle[4] != EF){
					invalid = true;
				}
				else{
					triangle[4] = EF;
					triangle[7] = triangle[8] = 90 - triangle[10];
					triangle[9] = 2 * triangle[7];
				}
			}
		}
	}
	
	else if(triangle[5] != -1.0 && triangle[4] != -1.0){
		double b = (triangle[4] * triangle[4] );
		double c = 4 * triangle[5] * triangle[5];
		double x = (b + Math.sqrt(b*b - 4 * c)) / 2 ;
		double BE = Math.sqrt(x);
		triangle[0] = triangle[1] = BE;
		triangle[2] = triangle[3] = Math.sqrt(triangle[4]*triangle[4] - x);
		triangle[7] = triangle[8] = Math.atan(triangle[2] / triangle[0]);
		triangle[9] = 2 * triangle[7];
		triangle[10] = triangle[11] = 90 -triangle[7];
		triangle[12] = 2 * triangle[10];
	}
	
	else if(triangle[5] != -1.0 && triangle[4] != -1.0){
		double b = (triangle[4] * triangle[4] );
		double c = 4 * triangle[5] * triangle[5];
		double x = (b + Math.sqrt(b*b - 4 * c)) / 2 ;
		double BE = Math.sqrt(x);
		triangle[0] = triangle[1] = BE;
		triangle[2] = triangle[3] = Math.sqrt(triangle[4]*triangle[4] - x);
		triangle[7] = triangle[8] = Math.atan(triangle[2] / triangle[0]);
		triangle[9] = 2 * triangle[7];
		triangle[10] = triangle[11] = 90 -triangle[7];
		triangle[12] = 2 * triangle[10];
	}
	
	else if(triangle[7] != -1.0 && triangle[4] != -1.0){
		double BE = Math.cos(Math.toRadians(triangle[7])) * triangle[4];
		double BF = Math.sin(Math.toRadians(triangle[7])) * triangle[4];
		triangle[0] = triangle[1] = BE;
		triangle[2] = triangle[3] = BF;
		triangle[10] = triangle[11] = 90 -triangle[7];
		triangle[12] = 2 * triangle[10];
		triangle[5] = triangle[6] = (BE * BF)/2;
	}
	
	else if(triangle[10] != -1.0 && triangle[4] != -1.0){
		double BF = Math.cos(Math.toRadians(triangle[10])) * triangle[4];
		double BE = Math.sin(Math.toRadians(triangle[10])) * triangle[4];
		triangle[0] = triangle[1] = BE;
		triangle[2] = triangle[3] = BF;
		triangle[7] = triangle[8] = 90 -triangle[10];
		triangle[9] = 2 * triangle[7];
		triangle[5] = triangle[6] = (BE * BF)/2;
	}
	
	}
		
	
	if(count2 >= 2){
		flagR = true;
	if(rect[0] != -1.0 && rect[2] != -1.0){
		double area = rect[0] * rect[2];
		if(rect[4] != -1.0 && rect[4] != area){
			invalid = true;
		}
		else{
			rect[4] = area;
			double AC = Math.sqrt(rect[0]*rect[0] + rect[2]*rect[2]);
			if(rect[13] != -1.0 && rect[13] != AC){
				invalid = true;
			}
			else{
				rect[14] = rect[13] = AC;
				rect[5] = rect[6] = rect[7] = rect[8] = Math.toDegrees(Math.atan(rect[2] / rect[0]));
				rect[9] = rect[10] = rect[11] = rect[12] = 90 - rect[5];
			}
		}
	}
	
	else if(rect[0] != -1.0 && rect[4] != -1.0){
		double AB = rect[4] / rect[0];
		if(rect[2] != -1.0 && rect[2] != AB){
			invalid = true;
		}
		else{
			rect[2] = rect[3] = AB;
			double AC = Math.sqrt(rect[0]*rect[0] + rect[2]*rect[2]);
			if(rect[13] != -1.0 && rect[13] != AC){
				invalid = true;
			}
			else{
				rect[14] = rect[13] = AC;
				rect[5] = rect[6] = rect[7] = rect[8] = Math.toDegrees(Math.atan(rect[2] / rect[0]));
				rect[9] = rect[10] = rect[11] = rect[12] = 90 - rect[5];
			}
		}
	}
	else if(rect[0] != -1.0 && rect[5] != -1.0){
		double AB = Math.tan(Math.toRadians(rect[5])) * rect[0];
		if(rect[2] != -1.0 && rect[2] != AB){
			invalid = true;
		}
		else{
			rect[2] = rect[3] = AB;
			double AC = Math.sqrt(rect[0]*rect[0] + rect[2]*rect[2]);
			if(rect[13] != -1.0 && rect[13] != AC){
				invalid = true;
			}
			else{
				rect[14] = rect[13] = AC;
				double area = rect[0] * rect[2];
				if(rect[4] != -1.0 && rect[4] != area){
					invalid = true;
				}
				else{
					rect[4] = area;
					rect[9] = rect[10] = rect[11] = rect[12] = 90 - rect[5];
				}
				
			}
		}
	}
	
	else if(rect[0] != -1.0 && rect[9] != -1.0){
		double AB = rect[0] / Math.tan(Math.toRadians(rect[9]));
		if(rect[2] != -1.0 && rect[2] != AB){
			invalid = true;
		}
		else{
			rect[2] = rect[3] = AB;
			double AC = Math.sqrt(rect[0]*rect[0] + rect[2]*rect[2]);
			if(rect[13] != -1.0 && rect[13] != AC){
				invalid = true;
			}
			else{
				rect[14] = rect[13] = AC;
				double area = rect[0] * rect[2];
				if(rect[4] != -1.0 && rect[4] != area){
					invalid = true;
				}
				else{
					rect[4] = area;
					rect[5] = rect[6] = rect[7] = rect[8] = 90 - rect[9];
				}
				
			}
		}
	}
	
	else if(rect[0] != -1.0 && rect[13] != -1.0){
		double AB = Math.sqrt(rect[13]*rect[13] - rect[0]*rect[0]);
		if(rect[2] != -1.0 && rect[2] != AB){
			invalid = true;
		}
		else{
			rect[2] = rect[3] = AB;
			double area = rect[0] * rect[2];
			if(rect[4] != -1.0 && rect[4] != area){
				invalid = true;
			}
			else{
				rect[4] = area;
				rect[5] = rect[6] = rect[7] = rect[8] = Math.toDegrees(Math.atan(rect[2] / rect[0]));
				rect[9] = rect[10] = rect[11] = rect[12] = 90 - rect[5];
			}				
		}
	}
	
	else if(rect[2] != -1.0 && rect[4] != -1.0){
		rect[0] = rect[1] = rect[4] / rect[2];
		rect[5] = rect[6] = rect[7] = rect[8] = Math.toDegrees(Math.atan(rect[2] / rect[0]));
		rect[9] = rect[10] = rect[11] = rect[12] = 90 - rect[5];
		double AC = Math.sqrt(rect[0]*rect[0] + rect[2] * rect[2]);
		if(rect[13] != -1.0 && rect[13] != AC){
				invalid = true;
		}
		else{
			rect[13] = rect[14] = AC;
		}
	}	
	else if(rect[2] != -1.0 && rect[5] != -1.0){
		rect[0] = rect[1] = rect[2] / Math.tan(Math.toRadians(rect[5]));
		double area = rect[0] * rect[2];
		if(rect[4] != -1.0 && rect[4] != area){
			invalid = true;
		}
		else{
			rect[4] = area;
			rect[9] = rect[10] = rect[11] = rect[12] = 90 - rect[5];
			double AC = Math.sqrt(rect[0]*rect[0] + rect[2] * rect[2]);
			if(rect[13] != -1.0 && rect[13] != AC){
					invalid = true;
			}
			else{
				rect[13] = rect[14] = AC;
			}
		}
		
	}	
	else if(rect[2] != -1.0 && rect[9] != -1.0){
		rect[0] = rect[1] = rect[2] * Math.tan(Math.toRadians(rect[9]));
		double area = rect[0] * rect[2];
		if(rect[4] != -1.0 && rect[4] != area){
			invalid = true;
		}
		else{
			rect[4] = area;
			rect[5] = rect[6] = rect[7] = rect[8] = 90 - rect[9];
			double AC = Math.sqrt(rect[0]*rect[0] + rect[2] * rect[2]);
			if(rect[13] != -1.0 && rect[13] != AC){
					invalid = true;
			}
			else{
				rect[13] = rect[14] = AC;
			}
		}
		
	}

	else if(rect[2] != -1.0 && rect[13] != -1.0){
		rect[0] = rect[1] = Math.sqrt(rect[13]*rect[13] - rect[2]*rect[2]);
		double area = rect[0] * rect[2];
		if(rect[4] != -1.0 && rect[4] != area){
			invalid = true;
		}
		else{
			rect[4] = area;
			rect[5] = rect[6] = rect[7] = rect[8] = Math.toDegrees(Math.atan(rect[2]/rect[0]));
			rect[9] = rect[10] = rect[11] = rect[12] = 90 - rect[5];
		}
		
	}	
	
	else if(rect[4] != -1.0 && rect[5] != -1.0){
		rect[0] = rect[1] = Math.sqrt(rect[4] / Math.tan(Math.toRadians(rect[5])));
		rect[2] = rect[3] = rect[4] / rect[0];
		rect[9] = rect[10] = rect[11] = rect[12] = 90 - rect[5];
		rect[13] = rect[14] = Math.sqrt(rect[0]*rect[0] + rect[2]*rect[2]);
		
	}	
	else if(rect[4] != -1.0 && rect[9] != -1.0){
		rect[0] = rect[1] = Math.sqrt(rect[4] * Math.tan(Math.toRadians(rect[9])));
		rect[2] = rect[3] = rect[4] / rect[0];
		rect[5] = rect[6] = rect[7] = rect[8] = 90 - rect[9];
		rect[13] = rect[14] = Math.sqrt(rect[0]*rect[0] + rect[2]*rect[2]);
		
	}	
	else if(rect[4] != -1.0 && rect[13] != -1.0){
		double b = rect[13]*rect[13];
		double c = rect[4]*rect[4];
		rect[0] = rect[1] = Math.sqrt((b+Math.sqrt(b*b - 4*c))/2);
		rect[2] = rect[3] = rect[4] / rect[0];
		rect[5] = rect[6] = rect[7] = rect[8] = Math.toDegrees(Math.atan(rect[2]/rect[0]));
		rect[9] = rect[10] = rect[11] = rect[12] = 90 - rect[5];
	}	
	
	else if(rect[5] != -1.0 && rect[13] != -1.0){
		rect[0] = rect[1] = rect[13] * Math.cos(Math.toRadians(rect[5]));
		rect[2] = rect[3] = rect[13] * Math.sin(Math.toRadians(rect[5]));
		rect[4] = rect[0] * rect[2];
		rect[9] = rect[10] = rect[11] = rect[12] = 90 - rect[5];
	}	
	
	else if(rect[9] != -1.0 && rect[13] != -1.0){
		rect[5] = rect[6] = rect[7] = rect[8] = 90 - rect[9];
		rect[0] = rect[1] = rect[13] * Math.cos(Math.toRadians(rect[5]));
		rect[2] = rect[3] = rect[13] * Math.sin(Math.toRadians(rect[5]));
		rect[4] = rect[0] * rect[2];
	}	
	
	

	}
	
	if(triangle[2] != -1.0 && rect[2] != -1.0 && fa == -1.0){
		fa = rect[2] - triangle[2];
	}
	if(triangle[0] != -1.0 && rect[0] != -1.0 && ec == -1.0){
		ec = rect[0] - triangle[0];
	}
	if(triangle[0] != -1.0 && ec != -1.0 && rect[0] == -1.0){
		rect[0] = rect[1] = triangle[0] + ec;
		count2 ++;
	}
	if(rect[0] != -1.0 && ec != -1.0 && triangle[0] == -1.0){
		triangle[0] = triangle[1] = rect[0] - ec;
		count++;
	}
	if(triangle[2] != -1.0 && fa != -1.0 && rect[2] == -1.0){
		rect[2] = rect[3] = triangle[2] + fa;
		count2++;
	}
	
	if(rect[2] != -1.0 && fa != -1.0 && triangle[2] == -1.0){
		triangle[2] = triangle[3] = rect[2] - fa;
		count++;
	}
	
	}
	
	
	
	if(!invalid){
	out.println("<table id=\"show\">");
	out.println("<tr id=\"z\">");
	out.println("<td valign=\"top\" >");

	/* Print Lines */
	out.println("<table id=\"show\" style=\"width:200px\">");
	out.println("<tr id=\"z\">");
	out.println("<th>Line</th>");
	out.println("<th>Value</th>");
	out.println("</tr>");
	
	out.println("<tr id=\"z\"><td>AB</td>");
	if(rect[3] != -1.0)
		out.println("<td>"+String.format("%.2f", rect[3])+"</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>BC</td>");
	if(rect[1] != -1.0)
		out.println("<td>"+String.format("%.2f", rect[1])+"</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>CD</td>");
	if(rect[2] != -1.0)
		out.println("<td>"+String.format("%.2f", rect[2])+"</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>DA</td>");
	if(rect[0] != -1.0)
		out.println("<td>"+String.format("%.2f", rect[0])+"</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>AC</td>");
	if(rect[13] != -1.0)
		out.println("<td>"+String.format("%.2f", rect[13])+"</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>BD</td>");
	if(rect[14] != -1.0)
		out.println("<td>"+String.format("%.2f", rect[14])+"</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>BE</td>");
	if(triangle[0] != -1.0)
		out.println("<td>"+String.format("%.2f", triangle[0])+"</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>B'E</td>");
	if(triangle[1] != -1.0)
		out.println("<td>"+String.format("%.2f", triangle[1])+"</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>BF</td>");
	if(triangle[2] != -1.0)
		out.println("<td>"+String.format("%.2f", triangle[2])+"</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>B'F</td>");
	if(triangle[3] != -1.0)
		out.println("<td>"+String.format("%.2f", triangle[3])+"</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>EF</td>");
	if(triangle[4] != -1.0)
		out.println("<td>"+String.format("%.2f", triangle[4])+"</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>FA</td>");
	if(fa != -1.0)
		out.println("<td>"+String.format("%.2f", fa)+"</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>EC</td>");
	if(ec != -1.0)
		out.println("<td>"+String.format("%.2f", ec)+"</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("</table>");
	out.println("</td>");
	out.println("<td valign=\"top\">");


	/* Print angles */
	out.println("<table id=\"show\" style=\"width:200px\">");
	out.println("<tr id=\"z\">");
	out.println("<th>Angle</th>");
	out.println("<th>Value</th>");
	out.println("</tr>");
	
	out.println("<tr id=\"z\"><td>∠CAD</td>");
	if(rect[5] != -1.0)
		out.println("<td>"+String.format("%.2f", rect[5])+"°</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>∠ACB</td>");
	if(rect[6] != -1.0)
		out.println("<td>"+String.format("%.2f", rect[6])+"°</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>∠ADB</td>");
	if(rect[7] != -1.0)
		out.println("<td>"+String.format("%.2f", rect[7])+"°</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>∠DBC</td>");
	if(rect[8] != -1.0)
		out.println("<td>"+String.format("%.2f", rect[8])+"°</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>∠DCA</td>");
	if(rect[9] != -1.0)
		out.println("<td>"+String.format("%.2f", rect[9])+"°</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>∠CAB</td>");
	if(rect[10] != -1.0)
		out.println("<td>"+String.format("%.2f", rect[10])+"°</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>∠CDB</td>");
	if(rect[11] != -1.0)
		out.println("<td>"+String.format("%.2f", rect[11])+"°</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>∠DBA</td>");
	if(rect[12] != -1.0)
		out.println("<td>"+String.format("%.2f", rect[12])+"°</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>∠CMD</td>");
	if(rect[9] != -1.0)
		out.println("<td>"+String.format("%.2f", (180 - 2 * rect[9]))+"°</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>∠BMA</td>");
	if(rect[9] != -1.0)
		out.println("<td>"+String.format("%.2f", (180 - 2 * rect[9]))+"°</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>∠CMB</td>");
	if(rect[5] != -1.0)
		out.println("<td>"+String.format("%.2f", (180 - 2 * rect[5]))+"°</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>∠AMD</td>");
	if(rect[9] != -1.0)
		out.println("<td>"+String.format("%.2f", (180 - 2 * rect[5]))+"°</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>∠FEB</td>");
	if(triangle[7] != -1.0)
		out.println("<td>"+String.format("%.2f", triangle[7])+"°</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("</table>");
	out.println("</td>");
	out.println("<td valign=\"top\">");
		out.println("<table id=\"show\" style=\"width:200px\">");
	out.println("<tr id=\"z\">");
	out.println("<th>Angle</th>");
	out.println("<th>Value</th>");
	out.println("</tr>");
	
	out.println("<tr id=\"z\"><td>∠B'EF</td>");
	if(triangle[8] != -1.0)
		out.println("<td>"+String.format("%.2f", triangle[8])+"°</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>∠B'EB</td>");
	if(triangle[9] != -1.0)
		out.println("<td>"+String.format("%.2f", triangle[9])+"°</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>∠B'FE</td>");
	if(triangle[10] != -1.0)
		out.println("<td>"+String.format("%.2f", triangle[10])+"°</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>∠EFB</td>");
	if(triangle[11] != -1.0)
		out.println("<td>"+String.format("%.2f", triangle[11])+"°</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>∠B'FB</td>");
	if(triangle[12] != -1.0)
		out.println("<td>"+String.format("%.2f", triangle[12])+"°</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("</table>");
	out.println("</td>");
	out.println("<td valign=\"top\">");

	
	/* Print areas */
	out.println("<table id=\"show\" style=\"width:200px\">");
	out.println("<tr id=\"z\">");
	out.println("<th>Area</th>");
	out.println("<th>Value</th>");
	out.println("</tr>");
	
	out.println("<tr id=\"z\"><td>ABCD</td>");
	if(rect[4] != -1.0)
		out.println("<td>"+String.format("%.2f", rect[4])+"</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>BEF</td>");
	if(triangle[5] != -1.0)
		out.println("<td>"+String.format("%.2f", triangle[5])+"</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>B'EF</td>");
	if(triangle[6] != -1.0)
		out.println("<td>"+String.format("%.2f", triangle[6])+"</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>AFECD</td>");
	if(triangle[6] != -1.0 && rect[4] != -1.0)
		out.println("<td>"+String.format("%.2f", (rect[4] - triangle[6]))+"</td></tr>");
	else
		out.println("<td>-</td></tr>");
		
	out.println("</table>");
	out.println("</td>");
	out.println("<td valign=\"top\">");
	
	
	/* Print perimeters */
	out.println("<table id=\"show\" style=\"width:200px\">");
	out.println("<tr id=\"z\">");
	out.println("<th>Perimeter</th>");
	out.println("<th>Value</th>");
	out.println("</tr>");
	
	out.println("<tr id=\"z\"><td>ABCD</td>");
	if(rect[0] != -1.0 && rect[2] != -1.0)
		out.println("<td>"+String.format("%.2f", (2*rect[0] + 2*rect[2])) +"</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>BEF</td>"); 
	if(triangle[0] != -1.0 && triangle[2] != -1.0 && triangle[4] != -1.0)
		out.println("<td>"+String.format("%.2f", (triangle[0] + triangle[2] + triangle[4] ))+"</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>B'EF</td>");
	if(triangle[0] != -1.0 && triangle[2] != -1.0 && triangle[4] != -1.0)
		out.println("<td>"+String.format("%.2f", (triangle[0] + triangle[2] + triangle[4] ))+"</td></tr>");
	else
		out.println("<td>-</td></tr>");
	
	out.println("<tr id=\"z\"><td>AFECD</td>");
	if(rect[0] != -1.0 && rect[2] != -1.0 && triangle[4] != -1.0 && ec != -1.0 && fa != -1.0)
		out.println("<td>"+String.format("%.2f", (rect[0] + rect[2] + triangle[4] + ec + fa))+"</td></tr>");
	else
		out.println("<td>-</td></tr>");
		
	out.println("</table>");
	out.println("</td>");
	out.println("</tr>");
	out.println("</table>");
	}
	else{
		out.println("<div style=\"color: red; font-size:30px\">Invalid input</div>");
	}
	
	}/*EOIF*/
	
	

	

	
%>
</table>


</body>
</html>