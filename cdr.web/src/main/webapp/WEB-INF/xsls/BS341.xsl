<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:sc="urn:hl7-org:v3"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:Constants="xalan://com.founder.cdr.core.Constants">
    <xsl:template match="/sc:ClinicalDocument">
        <html>
			<head>
				<meta http-equiv="Pragma" content="no-cache" />
				<meta http-equiv="Cache-Control" content="no-cache" />
				<meta http-equiv="Expires" content="0" />
				<link type="text/css" rel="Stylesheet" href="../../styles/jquery-ui-1.8.18.custom.modify.css" charset="UTF8" />
				<link type="text/css" rel="Stylesheet" href="../../styles/layout-default-1.3.0rc29.15.css" charset="UTF8" />
				<link type="text/css" rel="Stylesheet" href="../../styles/layout-cdr-dialog.css" charset="UTF8" />
				<link type="text/css" rel="Stylesheet" href="../../styles/tablelist.css" charset="UTF8" />
			   	<script type="text/javascript">
				     function getOrderSn()
				     {
						return '<xsl:value-of select="sc:id/@extension"/>';
				     }
			    </script>
			    <script type="text/javascript" src="../scripts/doc/docDetail.js"></script>
			</head>
			<body>
				<div id="mainContent">
					<div name="selectTabs">
						<div class="responsability"><xsl:value-of select="Constants:getResponsabilityClaimingContent()"/></div>
						<table border="0" align="center" width="100%" cellspacing="1" cellpadding="2" style="border-collapse:collapse;table-layout:fixed;bgcolor:white;">
							<tr>
								<td colspan="6" height="30" align="center" style="background-color:#fcffe2;border-bottom: solid 1px #B3C4D4;"><h3><xsl:value-of select="sc:title"/></h3></td>
							</tr>
							<tr>
								<td class="doclabel">病人姓名：</td>
								<td class="docdataitem"><xsl:value-of select="sc:recordTarget/sc:patientRole/sc:patient/sc:name"/></td>
								
								<td class="doclabel">性别：</td>
								<td class="docdataitem"><xsl:value-of select="sc:recordTarget/sc:patientRole/sc:patient/sc:administrativeGenderCode/@displayName"/></td>
								
								<td class="doclabel">出生日期：</td>
								<td class="docdataitem"><xsl:choose>
									<xsl:when test="string-length(sc:recordTarget/sc:patientRole/sc:patient/sc:birthTime/@value)>8">
										<xsl:value-of select="substring(sc:recordTarget/sc:patientRole/sc:patient/sc:birthTime/@value,1,4)"/>年<xsl:value-of select="substring(sc:recordTarget/sc:patientRole/sc:patient/sc:birthTime/@value,5,2)"/>月<xsl:value-of select="substring(sc:recordTarget/sc:patientRole/sc:patient/sc:birthTime/@value,7,2)"/>日<xsl:value-of select="substring(sc:recordTarget/sc:patientRole/sc:patient/sc:birthTime/@value,9,2)"/>时<xsl:value-of select="substring(sc:recordTarget/sc:patientRole/sc:patient/sc:birthTime/@value,11,2)"/>分
									</xsl:when>
									<xsl:when test="string-length(sc:recordTarget/sc:patientRole/sc:patient/sc:birthTime/@value)>0">
										<xsl:value-of select="substring(sc:recordTarget/sc:patientRole/sc:patient/sc:birthTime/@value,1,4)"/>年<xsl:value-of select="substring(sc:recordTarget/sc:patientRole/sc:patient/sc:birthTime/@value,5,2)"/>月<xsl:value-of select="substring(sc:recordTarget/sc:patientRole/sc:patient/sc:birthTime/@value,7,2)"/>日
									</xsl:when>
								</xsl:choose></td>
							</tr>
							<tr>
								<td class="doclabel">病区：</td>
								<td class="docdataitem"><xsl:value-of select="sc:recordTarget/sc:patientRole/sc:addr/sc:houseNumber"/></td>
								
								<td class="doclabel">床位号：</td>
								<td class="docdataitem"><xsl:value-of select="sc:recordTarget/sc:patientRole/sc:addr/sc:careOf"/></td>
								
								<td class="doclabel">病人科室：</td>
								<td class="docdataitem"><xsl:value-of select="sc:recordTarget/sc:patientRole/sc:providerOrganization/sc:name"/></td>
							</tr>
							<tr>
								<td class="doclabel">记录医生：</td>
								<td class="docdataitem"><xsl:value-of select="sc:author/sc:assignedAuthor/sc:assignedPerson/sc:name"/></td>
								
								<td class="doclabel">记录日期：</td>
								<td class="docdataitem"><xsl:choose>
									<xsl:when test="string-length(sc:author/sc:time/@value)>8">
										<xsl:value-of select="substring(sc:author/sc:time/@value,1,4)"/>年<xsl:value-of select="substring(sc:author/sc:time/@value,5,2)"/>月<xsl:value-of select="substring(sc:author/sc:time/@value,7,2)"/>日<xsl:value-of select="substring(sc:author/sc:time/@value,9,2)"/>时<xsl:value-of select="substring(sc:author/sc:time/@value,11,2)"/>分
									</xsl:when>
									<xsl:when test="string-length(sc:author/sc:time/@value)>0">
										<xsl:value-of select="substring(sc:author/sc:time/@value,1,4)"/>年<xsl:value-of select="substring(sc:author/sc:time/@value,5,2)"/>月<xsl:value-of select="substring(sc:author/sc:time/@value,7,2)"/>日
									</xsl:when>
								</xsl:choose></td>
								
								<xsl:choose>
									<xsl:when test="Constants:getTrueOrgCode() = Constants:getDisabledOrgCode()">
										<td class="doclabel">管理机构名称：</td>
										<td class="docdataitem"><xsl:value-of select="sc:custodian/sc:assignedCustodian/sc:representedCustodianOrganization/sc:name"/></td>
									</xsl:when>
									<xsl:otherwise>
										<td class="doclabel"></td>
										<td class="docdataitem"></td>
									</xsl:otherwise>
								</xsl:choose>
							</tr>
							<!-- <tr>
								<td class="doclabel">审核医生名称：</td>
								<td class="docdataitem"><xsl:for-each select="sc:authenticator">
								<xsl:if test="position()>1">、</xsl:if>
								<xsl:value-of select="sc:assignedEntity/sc:assignedPerson/sc:name"/></xsl:for-each></td>
								
								<td class="doclabel">审核日期：</td>
								<td class="docdataitem" colspan="3"><xsl:for-each select="sc:authenticator">
								<xsl:choose>
									<xsl:when test="string-length(sc:time/@value)>8">
										<xsl:value-of select="substring(sc:time/@value,1,4)"/>年<xsl:value-of select="substring(sc:time/@value,5,2)"/>月<xsl:value-of select="substring(sc:time/@value,7,2)"/>日<xsl:value-of select="substring(sc:time/@value,9,2)"/>时<xsl:value-of select="substring(sc:time/@value,11,2)"/>分
									</xsl:when>
									<xsl:when test="string-length(sc:time/@value)>0">
										<xsl:value-of select="substring(sc:time/@value,1,4)"/>年<xsl:value-of select="substring(sc:time/@value,5,2)"/>月<xsl:value-of select="substring(sc:time/@value,7,2)"/>日
									</xsl:when>
								</xsl:choose>
								<xsl:if test="(position()!=last())and(string-length(sc:time/@value)>0)">、</xsl:if>
								</xsl:for-each></td>
							</tr> -->
							<tr>
								<td class="doclabel">修改医生名称：</td>
								<td class="docdataitem"><xsl:value-of select="sc:participant/sc:associatedEntity/sc:associatedPerson/sc:name"/></td>
								
								<td class="doclabel">修改日期：</td>
								<td class="docdataitem" colspan="3"><xsl:choose>
									<xsl:when test="string-length(sc:participant/sc:time/@value)>8">
										<xsl:value-of select="substring(sc:participant/sc:time/@value,1,4)"/>年<xsl:value-of select="substring(sc:participant/sc:time/@value,5,2)"/>月<xsl:value-of select="substring(sc:participant/sc:time/@value,7,2)"/>日<xsl:value-of select="substring(sc:participant/sc:time/@value,9,2)"/>时<xsl:value-of select="substring(sc:participant/sc:time/@value,11,2)"/>分
									</xsl:when>
									<xsl:when test="string-length(sc:participant/sc:time/@value)>0">
										<xsl:value-of select="substring(sc:participant/sc:time/@value,1,4)"/>年<xsl:value-of select="substring(sc:participant/sc:time/@value,5,2)"/>月<xsl:value-of select="substring(sc:participant/sc:time/@value,7,2)"/>日
									</xsl:when>
								</xsl:choose></td>
							</tr>
							<tr>
								<td colspan="6" class="blockHeader" height="27" align="left" style="padding-left: 3px; border-top: solid 1px #B3C4D4; border-bottom: solid 1px #B3C4D4; font-weight: bold;"><xsl:value-of select="sc:component/sc:structuredBody/sc:component/sc:section[sc:code/@code='56818-8']/sc:title"/></td>
							</tr>
							<tr>
								<td class="doclabel">出院时间：</td>
								<td class="docdataitem"><xsl:choose>
									<xsl:when test="string-length(sc:component/sc:structuredBody/sc:component/sc:section/sc:entry/sc:observation/sc:effectiveTime/@value)>8">
										<xsl:value-of select="substring(sc:component/sc:structuredBody/sc:component/sc:section/sc:entry/sc:observation/sc:effectiveTime/@value,1,4)"/>年<xsl:value-of select="substring(sc:component/sc:structuredBody/sc:component/sc:section/sc:entry/sc:observation/sc:effectiveTime/@value,5,2)"/>月<xsl:value-of select="substring(sc:component/sc:structuredBody/sc:component/sc:section/sc:entry/sc:observation/sc:effectiveTime/@value,7,2)"/>日<xsl:value-of select="substring(sc:component/sc:structuredBody/sc:component/sc:section/sc:entry/sc:observation/sc:effectiveTime/@value,9,2)"/>时<xsl:value-of select="substring(sc:component/sc:structuredBody/sc:component/sc:section/sc:entry/sc:observation/sc:effectiveTime/@value,11,2)"/>分
									</xsl:when>
									<xsl:when test="string-length(sc:component/sc:structuredBody/sc:component/sc:section/sc:entry/sc:observation/sc:effectiveTime/@value)>0">
										<xsl:value-of select="substring(sc:component/sc:structuredBody/sc:component/sc:section/sc:entry/sc:observation/sc:effectiveTime/@value,1,4)"/>年<xsl:value-of select="substring(sc:component/sc:structuredBody/sc:component/sc:section/sc:entry/sc:observation/sc:effectiveTime/@value,5,2)"/>月<xsl:value-of select="substring(sc:component/sc:structuredBody/sc:component/sc:section/sc:entry/sc:observation/sc:effectiveTime/@value,7,2)"/>日
									</xsl:when>
								</xsl:choose></td>
								
								<td class="doclabel">住院天数：</td>
								<td class="docdataitem"><xsl:if test="string-length(sc:component/sc:structuredBody/sc:component/sc:section/sc:entry/sc:observation/sc:repeatNumber/@value)>0"><xsl:value-of select="sc:component/sc:structuredBody/sc:component/sc:section/sc:entry/sc:observation/sc:repeatNumber/@value"/>天</xsl:if></td>
								
								<td class="doclabel">几周后门诊复诊：</td>
								<td class="docdataitem"><xsl:if test="string-length(sc:component/sc:structuredBody/sc:component/sc:section/sc:entry/sc:observation/sc:entryRelationship/sc:observation[sc:code/@code='223446004']/sc:value)>0"><xsl:value-of select="sc:component/sc:structuredBody/sc:component/sc:section/sc:entry/sc:observation/sc:entryRelationship/sc:observation[sc:code/@code='223446004']/sc:value"/>周</xsl:if></td>
							</tr>
							<tr>
								<td class="doclabel">出院诊断证明书：</td>
								<td class="docdataitem" colspan="5"><xsl:value-of select="sc:component/sc:structuredBody/sc:component/sc:section/sc:entry/sc:observation/sc:entryRelationship/sc:observation[sc:code/@code='89100005']/sc:value"/></td>
							</tr>
							<tr>
								<td class="doclabel">病历及诊治摘要：</td>
								<td class="docdataitem" colspan="5"><xsl:value-of select="sc:component/sc:structuredBody/sc:component/sc:section/sc:entry/sc:observation/sc:value"/></td>
							</tr>
							<tr>
								<td colspan="6" class="blockHeader" height="27" align="left" style="padding-left: 3px; border-top: solid 1px #B3C4D4; border-bottom: solid 1px #B3C4D4; font-weight: bold;"><xsl:value-of select="sc:component/sc:structuredBody/sc:component/sc:section[sc:code/@code='8653-8']/sc:title"/></td>
							</tr>
							<tr>
								<td colspan="6" class="odd" style="word-break:break-all;word-wrap:break-word;"><pre><xsl:value-of select="sc:component/sc:structuredBody/sc:component/sc:section[sc:code/@code='8653-8']/sc:text"/></pre></td>
							</tr> 
						</table>
						<table border="1" align="center" width="100%" cellspacing="1" cellpadding="2" style="border-collapse:collapse;table-layout:fixed;border-bottom: solid 1px #B3C4D4;">
							<tr>
								<td colspan="20" class="blockHeader" height="27" align="left" style="padding-left: 3px; border-top: solid 1px #B3C4D4; border-bottom: solid 1px #B3C4D4; font-weight: bold;">诊断</td>
							</tr>
							<tr class="tabletitle">
								<td align="center" style="border-color:#BFD9F0;" colspan="2">诊断类别</td>
								<td align="center" style="border-color:#BFD9F0;" colspan="3">疾病名称</td>
								<td align="center" style="border-color:#BFD9F0;" colspan="3">诊断日期</td>
								<td align="center" style="border-color:#BFD9F0;" colspan="5">治疗结果</td>
								<td align="center" style="border-color:#BFD9F0;" colspan="7">诊断描述</td>
							</tr>
							<xsl:for-each select="sc:component/sc:structuredBody/sc:component/sc:section/sc:entry/sc:act/sc:entryRelationship">
								<tr class="odd" onmouseout="this.className='odd'">
									<xsl:if test="position() mod 2 = 1">
										<xsl:attribute name="class">even</xsl:attribute>
										<xsl:attribute name="onmouseout">this.className='even'</xsl:attribute>
									</xsl:if>
									<xsl:if test="position() mod 2 = 0">
										<xsl:attribute name="class">odd</xsl:attribute>
										<xsl:attribute name="onmouseout">this.className='odd'</xsl:attribute>
									</xsl:if>
									
									<td colspan="2"><xsl:value-of select="sc:observation/sc:code/@displayName"/></td>
									<td colspan="3"><xsl:value-of select="sc:observation/sc:value/@displayName"/></td>
									<td colspan="3" align="center">
										<xsl:choose>
											<xsl:when test="string-length(sc:observation/sc:effectiveTime/@value)>8">
												<xsl:value-of select="substring(sc:observation/sc:effectiveTime/@value,1,4)"/>年<xsl:value-of select="substring(sc:observation/sc:effectiveTime/@value,5,2)"/>月<xsl:value-of select="substring(sc:observation/sc:effectiveTime/@value,7,2)"/>日<xsl:value-of select="substring(sc:observation/sc:effectiveTime/@value,9,2)"/>时<xsl:value-of select="substring(sc:observation/sc:effectiveTime/@value,11,2)"/>分
											</xsl:when>
											<xsl:when test="string-length(sc:observation/sc:effectiveTime/@value)>0">
												<xsl:value-of select="substring(sc:observation/sc:effectiveTime/@value,1,4)"/>年<xsl:value-of select="substring(sc:observation/sc:effectiveTime/@value,5,2)"/>月<xsl:value-of select="substring(sc:observation/sc:effectiveTime/@value,7,2)"/>日
											</xsl:when>
										</xsl:choose>
									</td>
									<td colspan="5"><xsl:value-of select="sc:observation/sc:interpretationCode/@displayName"/></td>
									<td colspan="7" style="word-break:break-all;word-wrap:break-word;"><pre><xsl:value-of select="sc:observation/sc:text"/></pre></td>
								</tr>
							</xsl:for-each>
						</table>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>





