<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WOODY - игрушки из дерева</title>
    <jsp:include page="inport_header.jsp"/>
</head>
<body>
<div class="container shadow-sm p-0 bg-white">
    <jsp:include page="menu.jsp"/>

    <div class="container p-0">

        <div class="container pt-3 pb-2 ml-0 mr-0">
            <div class="h1">Добавить ADMIN</div>
        </div>
        <div class="container ml-0 mr-0">
            <form method="post" action="/admin/add">
                <div class="row form-group">
                    <div class="col-12 col-md-2">
                        <label for="username" class="h5">Введите логин: </label>
                    </div>
                    <div class="col-12 col-md-10">
                        <input type="text" name="username" class="form-control w-50" id="username" value="">
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-12 col-md-2">
                        <label for="password" class="h5">Введите пароль: </label>
                    </div>
                    <div class="col-12 col-md-10">
                        <input type="password" name="password" class="form-control w-50" id="password" value="">
                    </div>
                </div>
                <div class="row form-group mt-4">
                    <div class="col-12 col-md-2"></div>
                    <div class="col">
                        <div class="form-check form-check-inline">
                            <input name="remember_me" class="form-check-input" type="checkbox" id="remember_me">
                            <label class="form-check-label" for="remember_me"><h5>Запомнить меня</h5></label>
                        </div>
                    </div>
                </div>
                <%--<input name="submit" type="submit" value="submit" />--%>
                <div class="row form-group mb-5 mt-4 text-left">
                    <div class="col">
                        <button type="submit" name="add" class="btn btn-secondary btn-lg text-uppercase h1 font-weight-bold rounded-0 show-more border-0 shadow-sm">Добавить</button>
                    </div>
                </div>
            </form>
        </div>


        <div class="tab-content  pl-3 pr-3 mb-5">

        <table class="table table-hover mt-3 border table-responsive-sm ">
            <thead>
            <tr class="table-active w-100">
                <th scope="col">Логин</th>
                <th scope="col">Удалить</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="admin" items="${admins}">
                <tr>
                    <td class="font-weight-bold">${admin.login}</td>
                    <td>
                        <a class="m-0 p-0" href="${pageContext.request.contextPath}/admin/remove/${admin.id}">
                            <button type="button" class="btn btn-danger rounded-0">
                                <img class="delete-img" src="${pageContext.request.contextPath}/static/images/delete.png" alt="Add">
                            </button>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        </div>


        <jsp:include page="footer.jsp"/>
    </div>
</div>
</body>
</html>


<%--<div>
        <h1>
            add admin
        </h1>

        <form method="post" action="/admin/add">
            <input type="text" name="login" placeholder="login">
            <br><br>
            <input type="text" name="password" placeholder="password">
            <br><br>
            <button>add</button>
        </form>

        <div>
            <c:forEach var="admin" items="${admins}">
                <p> login ${admin.login}</p>
                <a href="/admin/remove/${admin.id}"> remove</a>
            </c:forEach>
        </div>
    </div>--%>

