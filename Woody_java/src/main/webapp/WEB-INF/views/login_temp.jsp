<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>WOODY - игрушки из дерева</title>
    <jsp:include page="inport_header.jsp"/>
</head>
<body>
<div class="container shadow-sm p-0 bg-white">
    <jsp:include page="menu.jsp"/>

    <div class="container  p-0 ">

        <c:if test="${error != null}">
            <p class="form-check-label badge badge-danger"><h5>Неправильный логин или пароль</h5></p>
        </c:if>
<div class="text-center mr-auto ml-auto w-75">
        <div class=" container pt-3 pb-2 ml-0 mr-0">
            <div class="h1">ADMIN. Вход</div>
        </div>
        <div class="container ml-0 mr-0 text-left">
            <form method="post" action="/login">
                <div class="row form-group">
                    <div class="col-12 col-md-4">
                        <label for="username" class="h5">Введите логин: </label>
                    </div>
                    <div class="col-12 col-md-8">
                        <input type="text" name="username" class="form-control" id="username" value="">
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-12 col-md-4">
                        <label for="password" class="h5">Введите пароль: </label>
                    </div>
                    <div class="col-12 col-md-8">
                        <input type="password" name="password" class="form-control" id="password" value="">
                    </div>
                </div>
                <div class="row form-group mt-4">
                    <div class="col-12 col-md-4"></div>
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
                        <input type="submit" name="submit" value="Вход" class="btn btn-secondary btn-lg text-uppercase h1 font-weight-bold rounded-0 show-more border-0 shadow-sm"></input>
                    </div>
                </div>
            </form>
        </div>
</div>

        <jsp:include page="footer.jsp"/>
    </div>
</div>
</body>
</html>
