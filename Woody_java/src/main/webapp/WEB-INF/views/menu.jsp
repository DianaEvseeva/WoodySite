<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: User-PC
  Date: 07.12.2019
  Time: 23:33
  To change this template use File | Settings | File Templates.
--%>
<%-- <%@ page contentType="text/html;charset=UTF-8" language="java" %> --%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<div class="container h5 header">
    <header>
        <!-- brand -->
        <!-- flex-nowrap -->
        <nav class="navbar navbar-expand-lg navbar-light flex-wrap pl-0 pr-0 pt-1 pb-1 p-md-2">
            <a class="navbar-brand mr-auto" href="${pageContext.request.contextPath}/">
                <div class="flex-column text-right pr-2">
                    <img src="${pageContext.request.contextPath}/static/images/logo.png" class="img-fluid">
                    <!-- font-weight-bold	 -->
                    <div class="navbar-brand-text text-uppercase small">Игрушки из дерева для детей</div>
                </div>
            </a>
            <!-- toggler -->
            <button class="navbar-toggler justify-content-end ml-auto p-1 p-md-2 " type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!-- menu -->
            <div class="collapse navbar-collapse justify-content-end " id="navbarSupportedContent">
                <ul class="navbar-nav text-uppercase d-flex justify-content-between flex-column flex-lg-row">
                    <sec:authorize access="!isAuthenticated()">
                    <li class="nav-item dropdown btn-group">
                        <a class="nav-link" href="${pageContext.request.contextPath}/items">
                            Каталог товаров
                        </a>

                    </li>
                    <li class="nav-item dropdown flex-column btn-group">
                        <div class="nav-link dropdown-toggle dropdown-toggle dropdown-toggle-split" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Контакты</div>

                        <div class="dropdown-menu rounded-0" aria-labelledby="navbarDropdown">
                            <p class="dropdown-item navbar-text">shop@woody.by</p>
                            <div class="dropdown-divider"></div>
                            <p class="dropdown-item navbar-text">+375 29 113 19 31</p>
                            <p class="dropdown-item navbar-text">+375 29 535 19 31</p>
                        </div>
                    </li>
                    </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                        <li class="nav-item">
                            <a class="nav-link pr-0" href="${pageContext.request.contextPath}/admin/admin_catalog">Каталог ADMIN</a> <!-- disabled -->
                        </li>
                        <%--<li class="nav-item">
                            <a class="nav-link pr-0" href="${pageContext.request.contextPath}/admin/admins">Консоль ADMIN</a> <!-- disabled -->
                        </li>--%>
                        <li class="nav-item">
                            <a class="nav-link pr-0" href="${pageContext.request.contextPath}/logout">Выйти</a> <!-- disabled -->
                        </li>
                    </sec:authorize>
                </ul>
            </div>
        </nav>
    </header>
</div>


