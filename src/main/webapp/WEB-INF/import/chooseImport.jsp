<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="request"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8"/>
    <style type="text/css">
    xmp {
        display: none;
    }
    html, body {
        height: 100%;
        margin: 0px;
        padding: 0px;
    }
    body.dashboard {
        background: #bbb url('static/dashboard/media/bg_pm.png') repeat;
        font-size: 13px;
        font-family: "Lucida Sans Unicode", "Lucida Grande", Garuda, sans-serif;
        min-height: 400px;
        min-width: 600px;
        margin: 0;
        padding: 0;
    }
    .bd-columnHeader {
        background-color: #ccc;
        margin: 0px 5px;
        padding: 10px;
        font-weight: bold;
        font-size: 12px;
        height: 14px;
        line-height: 14px;
        overflow: visible;
    }
    .bd-mainTitle {
        padding-bottom: 15px;
        font-weight: bold;
        font-size: 14px;
        text-transform: uppercase;
        height: 16px;
        line-height: 16px;
    }
    .bd-header {
        background: url('static/dashboard/media/bb_ribbon.png') no-repeat 18px;
        height: 40px;
        padding-left: 20px;
    }
    .bd-popupForm {
        background: none repeat scroll 0 0 #ffffff;
        border: 2px solid #FFFFFF;
        box-shadow: 1px 1px 5px #999999;
        margin: 0;
        -webkit-border-radius: 5px;
        -ms-border-radius: 5px;
        border-radius: 5px;
        margin: 5px 20px;
        overflow: hidden;
        padding: 20px 20px;
    }
    .bd-footer {
        text-align: center;
    }
    body {
        background: #BBBBBB;
        font-family: "Lucida Grande","Lucida Sans Unicode",Helvetica,Arial,sans-serif;
        font-size: 13px;
        margin: 0;
    }
    ul, li {
        display:block;
        list-style:none;
        list-style-type:none;
        margin:0;
        padding:0
    }
    ul {
        margin-right:20px;
    }
    .bd-maincontainer {
        padding:0 40px 0 0;
    }
    .error {
        color: #ff0000;
    }
    .errorblock {
        color: #000;
        background-color: #ffEEEE;
        border: 3px solid #ff0000;
        padding: 8px;
        margin: 16px;
    }
    fieldset {
        border:0;
        padding:0;
        margin:0;
        margin-top:20px;
        background:#f9f9f9;
        padding:6px;
    }
    h2 {
        margin:0;
        padding:0;
        font-size:16px;
        padding-bottom:5px;
        line-height:18px;
    }
    .bd-buttons {
        clear: both;
        font-size: 11px;
    }
    .bd-button{
        padding: 2px 8px;
        font-size: 12px;
        cursor: pointer;
        margin-right: 10px;
        text-transform: uppercase;
        text-decoration: none;
    }

    .bd-button {
        padding: 2px 6px;
        font-size: 12px;
        border: 1px solid #CCC;
        display: inline-block;
    }

    .bd-buttonText {
        font-size: 11px;
        text-transform: uppercase;
        color: #333;
        font-weight: bold;
        border-bottom: 1px solid #999;
        padding: 0;
        text-decoration: none;
        margin-left: 4px;
        margin-top: 8px;
        line-height: 1em;
    }

    .bd-button .bd-icon {
        height: 17px;
        line-height: 17px;
        width: 13px;
    }
    .bd-buttonGradientGrey,
    .bd-buttonGradientGreen {
        -webkit-box-shadow: 0px 1px 1px 0px #ffffff;
        -moz-box-shadow: 0px 1px 1px 0px #ffffff;
        box-shadow: 0px 1px 1px 0px #ffffff;
        -moz-border-radius: 3px;
        -webkit-border-radius: 3px;
        -ms-border-radius: 3px;
        border-radius: 3px;
    }
    .bd-buttonGradientGrey {
        background: #ffffff url(../media/ie/bg_button_grey.png) 0 50% repeat-x; /* Old browsers */
        background: -moz-linear-gradient(top, #ffffff 0%, #eaeaea 100%); /* FF3.6+ */
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#ffffff), color-stop(100%,#eaeaea)); /* Chrome,Safari4+ */
        background: -webkit-linear-gradient(top, #ffffff 0%,#eaeaea 100%); /* Chrome10+,Safari5.1+ */
        background: -o-linear-gradient(top, #ffffff 0%,#eaeaea 100%); /* Opera11.10+ */
        background: -ms-linear-gradient(top, #ffffff 0%,#eaeaea 100%); /* IE10+ */
        /*filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#eaeaea',GradientType=0 );  /*IE6-9 */
        background: linear-gradient(top, #ffffff 0%,#eaeaea 100%);
        border: 1px solid #AAA;
        font-weight: bold;
        color: #444;
    }
    *html .bd-buttonGradientGrey {
        /* ie < 7 */
        background: #ffffff url(../media/ie/bg_button_grey.png) 0 50% repeat-x;
    }
    .bd-buttonGradientGrey:hover {
        background: #ffffff;
        color: #480;
    }
    .bd-buttonGradientGreen {
        background: #75b505; /* Old browsers */
        background: -moz-linear-gradient(top,  #75b505 0%, #539000 100%); /* FF3.6+ */
        background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#75b505), color-stop(100%,#539000)); /* Chrome,Safari4+ */
        background: -webkit-linear-gradient(top,  #75b505 0%,#539000 100%); /* Chrome10+,Safari5.1+ */
        background: -o-linear-gradient(top,  #75b505 0%,#539000 100%); /* Opera 11.10+ */
        background: -ms-linear-gradient(top,  #75b505 0%,#539000 100%); /* IE10+ */
        background: linear-gradient(top,  #75b505 0%,#539000 100%); /* W3C */
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#75b505', endColorstr='#539000',GradientType=0 ); /* IE6-8 */
        border: 1px solid #6CA521;
        font-weight: bold;
        color: #fff;
    }
    .bd-buttonGradientGreen:hover {
        background: #75B505;
    }
    .bd-left {
        min-width:600px;
    }
    .bd-top {
        padding:10px 20px;
        background:#f9f9f9;
        margin-top:20px;
        -webkit-border-radius: 5px;
        -ms-border-radius: 5px;
        border-radius: 5px;
        margin-right:10px;
    }
    .bd-importbutton {
        margin-top:8px;
    }
    #formObject{
        position: relative;
    }
    #formObject:after {
        content: "";
        display: block;
        width: 16px;
        height: 16px;
        right: 10px;
        top: 10px;
        opacity: 0;
        position: absolute;
        background-image: url(data:image/gif;base64,R0lGODlhEAAQAPQAAP///3W1Bfr8+JPFO7zahni2Com/Kujy1s/lqYC7GrTWeKzSaO/25Mbgmt/tx5vJS6PNWQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH/C05FVFNDQVBFMi4wAwEAAAAh/hpDcmVhdGVkIHdpdGggYWpheGxvYWQuaW5mbwAh+QQJCgAAACwAAAAAEAAQAAAFUCAgjmRpnqUwFGwhKoRgqq2YFMaRGjWA8AbZiIBbjQQ8AmmFUJEQhQGJhaKOrCksgEla+KIkYvC6SJKQOISoNSYdeIk1ayA8ExTyeR3F749CACH5BAkKAAAALAAAAAAQABAAAAVoICCKR9KMaCoaxeCoqEAkRX3AwMHWxQIIjJSAZWgUEgzBwCBAEQpMwIDwY1FHgwJCtOW2UDWYIDyqNVVkUbYr6CK+o2eUMKgWrqKhj0FrEM8jQQALPFA3MAc8CQSAMA5ZBjgqDQmHIyEAIfkECQoAAAAsAAAAABAAEAAABWAgII4j85Ao2hRIKgrEUBQJLaSHMe8zgQo6Q8sxS7RIhILhBkgumCTZsXkACBC+0cwF2GoLLoFXREDcDlkAojBICRaFLDCOQtQKjmsQSubtDFU/NXcDBHwkaw1cKQ8MiyEAIfkECQoAAAAsAAAAABAAEAAABVIgII5kaZ6AIJQCMRTFQKiDQx4GrBfGa4uCnAEhQuRgPwCBtwK+kCNFgjh6QlFYgGO7baJ2CxIioSDpwqNggWCGDVVGphly3BkOpXDrKfNm/4AhACH5BAkKAAAALAAAAAAQABAAAAVgICCOZGmeqEAMRTEQwskYbV0Yx7kYSIzQhtgoBxCKBDQCIOcoLBimRiFhSABYU5gIgW01pLUBYkRItAYAqrlhYiwKjiWAcDMWY8QjsCf4DewiBzQ2N1AmKlgvgCiMjSQhACH5BAkKAAAALAAAAAAQABAAAAVfICCOZGmeqEgUxUAIpkA0AMKyxkEiSZEIsJqhYAg+boUFSTAkiBiNHks3sg1ILAfBiS10gyqCg0UaFBCkwy3RYKiIYMAC+RAxiQgYsJdAjw5DN2gILzEEZgVcKYuMJiEAOwAAAAAAAAAAAA==);
    }
    .loading #formObject:after {
        opacity: 1
    }
    .loading {
        opacity: .6
    }


    /*new styles*/
    .holder.head {
        font-size: 16px;
        font-weight: bold;
        padding-bottom: 10px
    }
    .holder.checked > label.to-import {
        color: orange;
    }
    .holder.checked  > label.delete-first {
        color: red;
    }
    .no-import {
        opacity: .4;
        -webkit-transition: opacity .3s ease-in-out 0s;
    }

    .instPortals {
        margin: 0;
        padding: 0;
    }
    .instPortals li {
        width: 270px;
        box-sizing: border-box;
        display: inline-block;
        margin: 0 2% 15px 0;
        padding: 5px 0;
        background: rgba(0,0,0,.09);
        border-radius: 2px;
        opacity: 0;
        -webkit-transition: all .2s ease-in-out 0s;
        -moz-transition: all .2s ease-in-out 0s;
        -o-transition: all .2s ease-in-out 0s;
        -ms-transition: all .2s ease-in-out 0s;
        transition: all .2s ease-in-out 0s;
    }
    .instPortals li.vis {
        opacity: 1;
    }
    /*.instPortals li:nth-child(3n+3) {
        margin-right: 0;
    }*/

    .instPortals li:hover {
        background: rgba(0,0,0,.5);
    }
    .instPortals .portalThumb {
        width: 250px;
        height: 60px;
        display: block;
        margin: 0 auto;
        /* padding: 5px 0 5px 0; */
        text-align: center;
        text-decoration: none;
        color: #fff;
        background-color: #555;
        background-position: 0 0;
        background-repeat: no-repeat;
        text-transform: capitalize;
        border-radius: 2px;
        -moz-box-shadow: 2px 2px 4px rgba(0,0,0,.3);
        -webkit-box-shadow: 2px 2px 4px rgba(0,0,0,.3);
        -ms-box-shadow: 2px 2px 4px rgba(0,0,0,.3);
        box-shadow: 2px 2px 4px rgba(0,0,0,.3);
    }
    .instPortals .portalThumb i {
        display: block;
        background-color: rgba(0,0,0,0.2);
        font-style: normal;
    }

    .clearfix:before,
    .clearfix:after {
        content: " ";
        display: table;
    }

    .clearfix:after {
        clear: both;
    }

    .clearfix {
        *zoom: 1;
    }

    .bd-errorDescription {
        background: red;
        color: #fff;
        padding: 1em;
        border-radius: 3px;
        position: relative;
    }

    .bd-errorDescription:before {
        content: "error";
        color: #fff;
        font-size: 3em;
        top: -1em;
        text-align: center;
        display: block;
        text-transform: uppercase;
        border-bottom: 2px solid #fff;
        margin-bottom: .5em;
    }


    </style>

<script type="text/javascript" src="/portalserver/static/ext-lib/jquery-1.8.3.js"></script>
    <script>
    $(function () {

        var $body = $('body'),
        $instPortals = $body.find('.instPortals').addClass('clearfix');

        getPortals($instPortals);

        $body.on('change','.deletefirst', function(e){
            var $this= $(this).parent().toggleClass('checked');

        });

        $body.on('change','.toggleall', function () {
            $(this).parents('fieldset:eq(0)').toggleClass('no-import').find(':checkbox').not('input.deletefirst').attr('checked', this.checked);
        });

        $('form').on('submit',function(e){
            $body.addClass('loading');
            var $form = $(this),
            formSubmit = $.ajax({
                type:$form.attr("method"),
                url:$form.attr("action"),
                data:$form.serialize()
            }).done(function(data) {
                    console.log(data)

                    // if (data.length) {
                    //     console.log($(data));
                    // }



                    getPortals($instPortals);
                    $body.addClass('imported');
                })
                .fail(function(data) {
                    $body.addClass('fail');
                    var $error = $(data.responseText);
                    console.log(data.responseText)
                    $error.find('.bd-errorDescription').insertBefore($instPortals)

                })
                .always(function() {
                    $body.removeClass('loading');
                });

            e.preventDefault();
        });


        $('.checkall').click(function () {
            $(this).parent().find(':checkbox').not('input.deletefirst').attr('checked', 'checked');
        });
        $('.uncheckall').click(function () {
            $(this).parent().find(':checkbox').not('input.deletefirst').removeAttr('checked');
        });


        function getPortals(el) {
        var html = [],li,$i,$it,$tn,img;
        $.get('portals.xml', function(xml) {
                $(xml).find('portal').each(
                    function(index, item) {
                        $i = $(item);
                        $it = $i.find(' > name').text();
                        $tn = $i.find('property[name=thumbnailUrl]').text();
                        li = '<li><a class="portalThumb" style="background-image:url('+ $tn.substr($tn.indexOf('/')+1) +')"href="portals/' + $it +'" target="_blank"><i>'+ $it +'</i></a></li>';
                        html.push(li);
                    }
                );
                el.html(html.join('')).find('li').addClass('vis');
            });
        }
    });

    // function alert_clean() {
    //  $('.deletefirst').toggleClass('notChecked');
    //  if ($('.deletefirst').hasClass('notChecked')) {
    //      alert("If you select clean, an existing portal will be REMOVED before it is imported.\n"+
    //      " Be sure you know what you are doing!");
    //  }
    // };
    </script>
</head>

<body class="dashboard">
<div class="bd-header"></div>
<div class="bd-portalManagement bd-popupForm">
    <table>
        <tr>
            <td valign="top" class="bd-left">
                <div class="bd-maincontainer">
                    <div class="bd-mainTitle"><span>IMPORT BACKBASE PORTAL OBJECTS</span></div>

                    <sec:authorize access="hasRole('role_admin')">

                    <!-- <div><b>Shortlinks:</b> <a href="${contextPath}/static/mosaic-tools/yapi-3.0/index.html" target="_yapi">YAPI</a></div> -->

                    <form:form commandName="formObject" action="import" method="POST">
                    Select the objects you want to import: <input type="button" class="checkall bd-button bd-buttonGradientGrey" value="Check All">
                    <input type="button" class="uncheckall bd-button bd-buttonGradientGrey" value="Uncheck All">
                    <input tabindex="1" type="submit" class="bd-button bd-buttonGradientGreen bd-importbutton" value="Import" accesskey="i"/>

                        <form:errors path="*" cssClass="errorblock" element="div" class="importform"/>
                    <c:forEach var="entry" items="${formObject.portals}">
                    <fieldset>
                        <table>
                            <tr>
                                <td><input type="checkbox" class="toggleall" checked=""></input></td>
                                <td><h2>Portals</h2></td>
                            </tr>
                            <tr>
                                <td>
                                    <spring:bind path="formObject.portals[${entry.key}].importIt">
                                        <form:checkbox path="${status.expression}"/>
                                    </spring:bind>
                                </td>
                                <td>${entry.key}
                                    <spring:bind path="formObject.portals[${entry.key}].deleteIt">
                                        <form:checkbox path="${status.expression}" class="deletefirst" checked="" onclick="javascript:alert_clean();"/>
                                    </spring:bind>
                                    delete before import
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                    </c:forEach>

                    <fieldset>
                        <table>
                            <c:if test="${formObject.showGroupsImport}">
                            <tr>
                                <td><input type="checkbox" class="toggleall" checked=""></input></td>
                                <td><h2>Groups and Users</h2></td>
                            </tr>
                            <tr>
                                <spring:bind path="formObject.importGroupsFlag">
                                    <td><form:checkbox path="${status.expression}"/></td>
                                </spring:bind>
                                <td>Import groups</td>
                            </tr>
                            </c:if>

                            <c:if test="${formObject.showUsersImport}">
                            <tr>
                                <spring:bind path="formObject.importUsersFlag">
                                <td><form:checkbox path="${status.expression}"/></td>
                                </spring:bind>
                                <td>Import users</td>
                            </tr>
                            </c:if>
                        </table>
                    </fieldset>

                    <c:forEach var="items" items="${formObject.serverItems}">
                    <fieldset>
                        <table>
                            <tr>
                                <td><input type="checkbox" class="toggleall" checked=""></input></td>
                                <td><h2>${items.key}</h2></td>
                            </tr>
                            <c:forEach var="item" items="${items.value}">
                                <tr>
                                    <spring:bind path="formObject.serverItems[${items.key}][${item.key}]">
                                        <td><form:checkbox path="${status.expression}"/></td>
                                    </spring:bind>
                                    <td>${item.key}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </fieldset>
                    </c:forEach>

                    <table>
                        <tr>
                            <td><input tabindex="1" type="submit" class="bd-button bd-buttonGradientGreen bd-importbutton" value="Import"/></td>
                        </tr>
                    </table>
                    </form:form>
                    </sec:authorize>
            </td>
            <td valign="top" class="bd-right">
                <div class="bd-top">
                    <ul class='instPortals'></ul>
                    <p>This tool will help you setup the server components for the Backbase portal.

                    <p/>

                    <p>On this page you find a set of server components and portals available for importing. Components
                        are grouped
                        together based on the XML file the components are imported from. If you do not want
                        to import components, you can deselect them. Portal components are always imported as a whole.
                        You cannot select
                        subcomponents of a portal.</p>

                    <p>When you import components that are already available in Backbase portal, they will be ignored.

                    <p/>

                    <p>When you select 'delete before import' on a portal <b>it will delete the existing portal</b> with
                        this name
                        and import the portal again.

                    <p/>
                </div>
            </td>
        </tr>
    </table>
</div>
</div>

<div class="bd-footer">
    <span class="bd-leftInline">support@backbase.com</span>
</div>

</body>
</html>
