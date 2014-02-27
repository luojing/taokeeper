<%@ page language="java" pageEncoding="GBK"%><%@ include
	file="/WEB-INF/common/taglibs.jsp"%>
<div id="navcolumn" style="height: 100px;">
	<ul>

		<li>Monitor
			<ul>
				<li><a
					href="<c:url value="/zooKeeper.do?method=zooKeeperSettingsPAGE" />">Cluster Config</a></li>
				<li><a
					href="<c:url value="/zooKeeperStatus.do?method=showZooKeeperStatusPAGE" />">Cluster Status</a></li>
				<li><a
					href="<c:url value="/hostPerformance.do?method=showHostPerformancePAGE" />">Server Status</a></li>
				<li><a
					href="<c:url value="/alarmSettings.do?method=alarmSettingsPAGE" />">Alarm Setting</a></li>
			</ul>
		</li>

		<br>
		<li>Admin
			<ul>
				<li><a
					href="<c:url value="admin.do?method=switchOfNeedAlarmPAGE" />">Alarm Switch</a></li>
				<li><a
					href="<c:url value="admin.do?method=setSystemConfigPAGE" />">System Config</a></li>
			</ul>
		</li>

		<br>
		<!-- 
	<li>Reports
		<ul>
			<li><a href="">Daily</a></li>
			<li><a href="">Weekly</a></li>
			<li><a href="">Tendency</a></li>
		</ul>
	</li>
-->




	</ul>
</div>
