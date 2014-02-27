<%@ page language="java" pageEncoding="UTF-8"%><%@ include
	file="/WEB-INF/common/taglibs.jsp"%>


<style>
.mytable {align:center;border-collapse:collapse;border:solid #6AA70B;border-width:0px 0 0 0px;width:600;} 
.mytable table tr {list-style:none; border-bottom:#6AA70B 1px dotted ;font-size: 12px;;height:20px;} 
.mytable table tr.t1 {background-color:#EEEEEE;}/* 第一行的背景色 */ 
.mytable table tr.t2{background-color:#;}/* 第二行的背景色 */ 
.mytable table tr.t3 {background-color:#CCCCCC;}/* 鼠标经过时的背景色 */ 
</style> 

<style type="text/css">
a:link { text-decoration: none}
a:active { text-decoration:none}
a:hover { text-decoration:none} 
a:visited { text-decoration:none}
</style>
<h1>ZooKeeper Alarm Setting</h1>

<select id="clusterSelector" onchange="javascript:location.href=this.value;" >
	<c:forEach var="zooKeeperCluster" items="${zooKeeperClusterMap}">
		<c:choose>
     			<c:when test="${ zooKeeperCluster.key eq clusterId }"><option value="alarmSettings.do?method=alarmSettingsPAGE&clusterId=${zooKeeperCluster.key}"  selected>${zooKeeperCluster.value.clusterName}</option></c:when>
				<c:otherwise><option value="alarmSettings.do?method=alarmSettingsPAGE&clusterId=${zooKeeperCluster.key}">${zooKeeperCluster.value.clusterName}</option></c:otherwise>
		</c:choose>
	</c:forEach>
</select>
<span>${description}</span><br/><br/>
<div align="center" class="mytable" id="tab">


<form name="updateAlarmSettings"  id="updateAlarmSettings" action="alarmSettings.do?method=updateAlarmSettingsHandle"  method="post" >
	<table>
	
	
		<tr style="background-color:#D3D1D1; text-align:center;">
		 	<td><b>Alarm Item</b></td>
		 	<td><b>Parameter(Please use English half Angle between multiple parameters)</b></td>
		 </tr>
		 <tr>
		 	<td valign="middle">ZooKeeper node maxDelayOfCheck</td>
		 	<td valign="middle" ><input type="text" name="maxDelayOfCheck" id="maxDelayOfCheck"  value="${alarmSettings.maxDelayOfCheck}"/>s</td>
		 </tr>
		 <tr >
		 	<td valign="middle">maxCpuUsage</td>
		 	<td valign="middle" ><input type="text" name="maxCpuUsage"  id="maxCpuUsage"  value="${alarmSettings.maxCpuUsage}"/>%</td>
		 </tr>
		 <tr >
		 	<td valign="middle">maxMemoryUsage</td>
		 	<td valign="middle" ><input type="text" name="maxMemoryUsage" id="maxMemoryUsage" value="${alarmSettings.maxMemoryUsage}"/>%</td>
		 </tr>
		 <tr >
		 	<td valign="middle">maxLoad</td>
		 	<td valign="middle" ><input type="text" name="maxLoad" id="maxLoad" value="${alarmSettings.maxLoad}"/></td>
		 </tr>
		 <tr >
		 	<td valign="middle">Data dir</td>
		 	<td valign="middle" ><input type="text" name="dataDir" id="maxLoad" value="${alarmSettings.dataDir}"/></td>
		 </tr>
		 <tr >
		 	<td valign="middle">Log dir</td>
		 	<td valign="middle" ><input type="text" name="dataLogDir" id="maxLoad" value="${alarmSettings.dataLogDir}"/></td>
		 </tr>
		 <tr >
		 	<td valign="middle">maxDiskUsage</td>
		 	<td valign="middle" ><input type="text" name="maxDiskUsage" id="maxLoad" value="${alarmSettings.maxDiskUsage}"/>%</td>
		 </tr>
		 <tr >
		 	<td valign="middle">maxConnectionPerIp</td>
		 	<td valign="middle" ><input type="text" name="maxConnectionPerIp" id="maxConnectionPerIp" value="${alarmSettings.maxConnectionPerIp}"/></td>
		 </tr>
		 <tr >
		 	<td valign="middle">maxWatchPerIp</td>
		 	<td valign="middle" ><input type="text" name="maxWatchPerIp" id="maxWatchPerIp" value="${alarmSettings.maxWatchPerIp}"/></td>
		 </tr>
		 <tr >
		 	<td valign="middle">Node Check Rule</td>
		 	<td valign="middle" ><input type="text" name="nodePathCheckRule" id="nodePathCheckRule" value="${alarmSettings.nodePathCheckRule}" size="50"/>
		 	<br>
		 	<font color="blue">Format</font>：<b>|display|^|no-display| </b>
		 	<br>
		 	<font color="blue">Example</font>：
		 	 <b>|/</b>:nileader,yinshi;<b>/nileader</b>:test<b>|</b>^<b>|/</b>:test<b>|</b><br>
	 		 <font color="blue">Explain</font>：<br>
	  		in "<b>/</b>" path，only can have nileader and yinshi two nodes，in "<b>/nileader</b>" paht，only have test node, in "<b>/</b>" path，can't have test node<br>
		 	</td>
		 </tr>

		<tr style="background-color:#D3D1D1; text-align:center;">
		 	<td colspan="2"   ><b>Alarm To</b></td>
		 </tr>
		 <tr>
		 	<td>Email</td>
		 	<td><input type="text" name="emailList" id="emailList"  value="${alarmSettings.emailList}" size="50"/></td>
		 </tr>

		 <tr >
		 	<td valign="middle"></td>
		 	<td align="right" ><input type="submit"  value="Update"  size="90"/> <font color="red">${handleMessage}</font> </td>
		 </tr>
	</table>
	<input type="hidden"  value="${clusterId}"  name="clusterId" id="clusterId" />
</form>


</div>


<script type="text/javascript"> 

var Ptr=document.getElementById("tab").getElementsByTagName("tr"); 
function $() { 
for (i=1;i<Ptr.length+1;i++) { 
Ptr[i-1].className = (i%2>0)?"t1":"t2"; 
} 
} 
window.onload=$; 
for(var i=0;i<Ptr.length;i++) { 
Ptr[i].onmouseover=function(){ 
this.tmpClass=this.className; 
this.className = "t3"; 
}; 
Ptr[i].onmouseout=function(){ 
this.className=this.tmpClass; 
}; 
} 

</script>
