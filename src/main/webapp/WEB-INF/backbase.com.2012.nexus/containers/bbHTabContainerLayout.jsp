<!DOCTYPE html>
<%@page import="com.backbase.portal.foundation.business.utils.context.ThreadLocalRequestContext"%>
<%@page import="com.backbase.portal.foundation.presentation.util.BuildConfigUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="b" uri="http://www.backbase.com/taglib" %>
<%@ page import="com.backbase.portal.foundation.presentation.tags.LinkedItemInitTag" %>
<%@ page session="false"%>
<%String buildVersion = BuildConfigUtils.getBuildVersion();%>
<%LinkedItemInitTag.init();%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <title>Tab Layout Container Contents</title>
    <c:choose>
        <c:when test="${devmode}">
            <link type="text/css" rel="stylesheet" href="${linkedItem.contextPath}/static/backbase.com.2012.aurora/containers/containers.shared.css" />
            <script src="${linkedItem.contextPath}/static/backbase.com.2012.aurora/containers/containers.shared.js"></script>
            <link type="text/css" rel="stylesheet" href="${linkedItem.contextPath}/static/backbase.com.2012.nexus/css/tabContainer.shared.css" />
            <link type="text/css" rel="stylesheet" href="${linkedItem.contextPath}/static/backbase.com.2012.nexus/containers/tabTemplate/css/bbHorizontalTab.css" />
            <link type="text/css" rel="stylesheet" href="${linkedItem.contextPath}/static/backbase.com.2012.nexus/css/tabContainer.IE7.css" />
            <link type="text/css" rel="stylesheet" href="${linkedItem.contextPath}/static/backbase.com.2012.nexus/css/tabContainer.IE8.css" />

            <script src="${linkedItem.contextPath}/static/backbase.com.2012.nexus/containers/tabContainer/linkedItemAPI.js"></script>
            <script src="${linkedItem.contextPath}/static/backbase.com.2012.nexus/containers/tabContainer/linkedItemPortalClientIntegration.js"></script>
            <script src="${linkedItem.contextPath}/static/backbase.com.2012.nexus/containers/tabContainer/tabContainerPortalClientIntegration.js"></script>
            <script src="${linkedItem.contextPath}/static/backbase.com.2012.nexus/containers/tabContainer/tabContainerDnd.js"></script>
            <script src="${linkedItem.contextPath}/static/backbase.com.2012.nexus/containers/tabContainer/tabContainerDesignMode.js"></script>
            <script src="${linkedItem.contextPath}/static/backbase.com.2012.nexus/containers/tabContainer/tabContainerLiveMode.js"></script>
            <script src="${linkedItem.contextPath}/static/backbase.com.2012.nexus/containers/tabContainer/tabContainerPageMgmtIntegration.js"></script>
            <script src="${linkedItem.contextPath}/static/backbase.com.2012.nexus/containers/tabContainer/tabContainerUrlManager.js"></script>
        </c:when>
        <c:otherwise>
            <link type="text/css" rel="stylesheet" href="${linkedItem.contextPath}/static/backbase.com.2012.aurora/build/aurora.containers.css?v=${buildVersion}" />
            <script src="${linkedItem.contextPath}/static/backbase.com.2012.aurora/build/aurora.containers.js?v=${buildVersion}"></script>        </c:otherwise>
    </c:choose>

</head>
<body>
    <div class="bp-container bp-TabCont bp-ui-dragRoot bp-tabContFn-main" data-pid="${linkedItem.name}" data-pUuid="${linkedItem.uuid}">
        <ul data-enhance="false" class="nav nav-tabs bp-TabCont-head bp-tabContFn-header bp-TabCont-head-horizontal">
            <c:if test='${linkedItem.canEdit}'>
                <a class="bp-TabCont-editBar-btn bp-TabCont-gradient-grey bd-roundcorner-5 bp-tabContFn-addTab bp-TabCont-addTab"  title='Add New Tab'>
                    <span>+ ADD</span>
                </a>
            </c:if>
            <c:forEach items="${linkedItem.childList}" var="child">
                <li data-enhance="false" class="bp-TabCont-tab bp-ui-dragRoot bp-tabContFn-tab bp-ui-dragGrip ${child.isSelectedChild}" data-index="${child.name}"
                    data-uuid="${child.uuid}" data-url = "${child.linkUrl}" data-linkuuid = "${child.linkUuid}"
                    style="${linkedItem.canShowTabBar}">
                    <a href='<c:out value='${child.urlString}'/>' class="bp-TabCont-link bp-tabContFn-link" data-linkType='state'>
                        <c:out value='${child.title}'/>
                    </a>
                       <c:if test='${child.canEdit}'>
                       <div class="bp-TabCont-tabEditBar">
                            <div class="bp-TabCont-editBar-btn bp-TabCont-gradient-grey bd-roundcorner-5 bp-TabCont-tabEdit bp-tabContFn-editTab"  title='Edit'>
                                <span class="bd-plus bp-TabCont-pen"></span>
                            </div>
                            <div class="bp-TabCont-editBar-btn bp-TabCont-gradient-grey bd-roundcorner-5 bp-TabCont-tabClose bp-tabContFn-delTab"  title='Delete'>
                                <span class="bd-plus bp-TabCont-trash"></span>
                            </div>
                       </div>
                       </c:if>
                </li>
            </c:forEach>
        </ul>
        <div class="bp-TabCont-body bp-area bp-tabContFn-body">
        <c:choose>
        <%--if fetchAllChildren is true display all the children for the linkedItem --%>
            <c:when test='${linkedItem.fetchAllChildren}'>
                <c:forEach items="${linkedItem.children}" var="child">
                     <b:include src="${child}"/>
                </c:forEach>
            </c:when>
            <c:otherwise>
            <%--if fetchAllChildren is false display only the selected child --%>
             <c:if test='${not empty linkedItem.selectedChild}'>
                <b:include src="${linkedItem.selectedChild}"/>
            </c:if>
            </c:otherwise>
        </c:choose>
        </div>
        <div class="bp-tabCont-loadingCover"></div>
    </div>
</body>
</html>