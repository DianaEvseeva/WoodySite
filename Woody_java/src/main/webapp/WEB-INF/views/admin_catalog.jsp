<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>WOODY - игрушки из дерева</title>
    <jsp:include page="inport_header.jsp"/>
</head>
<body>
<div class="container shadow-sm p-0 bg-white">
    <jsp:include page="menu.jsp"/>




    <div class="container p-0 ">
        <div class="container pt-4 pb-2 ml-0 mr-0">
            <div class="h1">Каталог товаров</div>
        </div>
        <sec:authorize access="isAuthenticated()">

        <div class="container p-0 ml-0 mr-0 mt-3">
            <!-- Nav tabs -->
            <ul class="nav nav-tabs item-tabs h4 border-0" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active border-top-0 border-left-0" id="tile-tab" data-toggle="tab" href="#tile" role="tab" aria-controls="tile" aria-selected="true">Плитка</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link  border-top-0 border-right-0" id="profile-tab" data-toggle="tab" href="#table" role="tab" aria-controls="table" aria-selected="false">Таблица</a>
                </li>

            </ul>

            <!-- TILE panes -->
            <div class="tab-content  pl-3 pr-3 mb-5">
                <div class="tab-pane active" id="tile" role="tabpanel" aria-labelledby="tile-tab">

            <div class="catalog-items">
                <div class="row">

                        <div class="col-12 col-md-6 col-lg-4 mb-4">
                            <div class="card rounded-0 border-0 h-100 justify-content-center">
                                <button type="button" class="btn btn-warning shadow rounded-circle p-0 w-25 m-auto">
                                    <a class="m-0 p-0" href="${pageContext.request.contextPath}/admin/add_item">
                                        <img class="card-img img-fluid p-0 img-fluid" src="${pageContext.request.contextPath}/static/images/plus.png" alt="Добавить товар">
                                    </a>
                                </button>
                            </div>
                        </div>



                    <c:forEach var="item" items="${items.content}">

                        <div class="col-12 col-md-6 col-lg-4 mb-3">
                            <div class="card shadow rounded-0 border-0 h-100">

                                <div class="card-header p-0 border-bottom-0 h-auto">
                                    <c:choose>
                                        <c:when test="${item.new_label==true}">
                                            <h4 class="m-2"><span class="badge badge-success shadow-sm rounded-0">Новинка</span></h4>
                                        </c:when>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${item.hit_label==true}">
                                            <h4 class="m-2"><span class="badge badge-info shadow-sm rounded-0">Хит продаж</span></h4>
                                        </c:when>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${item.sale_label==true}">
                                            <h4 class="m-2"><span class="badge badge-danger shadow-sm rounded-0 ">Скидка</span></h4>
                                        </c:when>
                                    </c:choose>
                                </div>
                                <img class="card-img img-fluid rounded-0 mh-50" src="${pageContext.request.contextPath}/static/items/${item.id}.jpg" alt="Card image cap">
                                <div class="card-body p-2">
                                    <h5 class="card-text">${item.name}</h5>
                                    <p class="card-title">Цена:
                                        <c:choose>
                                            <c:when test="${item.sale_label==true}">
                                                <del>${item.cost} руб.</del> ${item.sale_cost} руб.
                                            </c:when>
                                            <c:otherwise>
                                                ${item.cost} руб.
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                </div>

                                        <div class="row container-fluid p-0 m-0">
                                            <button type="button" class="col-9 btn btn-primary rounded-0">
                                                <a href="${pageContext.request.contextPath}/items/${item.id}">Редактировать</a>
                                            </button>
                                            <button type="button" class="col-3 btn btn-danger rounded-0">
                                                <a class="m-0 p-0" href="${pageContext.request.contextPath}/admin/items/remove/${item.id}">
                                                    <img class="delete-img" src="${pageContext.request.contextPath}/static/images/delete.png" alt="Add">
                                                </a>
                                            </button>
                                        </div>
                            </div>
                        </div>

                    </c:forEach>

                </div>
            </div>

                </div>
                <!-- TABLE panes -->
                <div class="tab-pane " id="table" role="tabpanel" aria-labelledby="table-tab">

                    <div class="card rounded-0 border-0 w-25 justify-content-center m-auto">
                        <button type="button" class="btn btn-warning shadow rounded-circle w-25 p-0 m-auto">
                            <a class="m-0 p-0" href="${pageContext.request.contextPath}/admin/add_item">
                                <img class="card-img img-fluid p-0 img-fluid" src="${pageContext.request.contextPath}/static/images/plus.png" alt="Добавить товар">
                            </a>
                        </button>
                    </div>
                    <table class="table table-hover mt-3 border table-responsive-sm">
                        <thead>
                        <tr class="table-active">
                            <th scope="col">Арт.</th>
                            <th scope="col">Ярлыки</th>
                            <th scope="col">Название</th>
                            <th scope="col">Цена</th>
                            <th scope="col">Редактировать / Удалить</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${items.content}">
                        <tr>
                            <th scope="row">${item.art}</th>
                            <td>
                                    <c:choose>
                                        <c:when test="${item.new_label==true}">
                                            <span class="badge badge-success shadow-sm rounded-0">Новинка</span>
                                            <br />
                                        </c:when>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${item.hit_label==true}">
                                            <span class="badge badge-info shadow-sm rounded-0">Хит продаж</span>
                                            <br />
                                        </c:when>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${item.sale_label==true}">
                                            <span class="badge badge-danger shadow-sm rounded-0 ">Скидка</span>
                                        </c:when>
                                    </c:choose>

                            </td>
                            <td class="font-weight-bold">${item.name}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${item.sale_label==true}">
                                        <del>${item.cost} руб.</del> ${item.sale_cost} руб.
                                    </c:when>
                                    <c:otherwise>
                                        ${item.cost} руб.
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td class="d-flex justify-content-between">
                                <a href="${pageContext.request.contextPath}/items/${item.id}">
                                    <button type="button" class="btn btn-primary rounded-0 font-weight-normal">Редактировать</button>
                                </a>
                                <a class="m-0 p-0" href="${pageContext.request.contextPath}/admin/items/remove/${item.id}">
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
            </div>


        </div>
        </sec:authorize>




<%--        <div class="container text-center mb-5">--%>
<%--            <button type="button" class="btn btn-warning btn-lg text-uppercase h1 font-weight-bold rounded-0 show-more border-0 shadow-sm">--%>
<%--                <a href="${pageContext.request.contextPath}/items">Показать еще</a></button>--%>
<%--        </div>--%>

        <div class="container text-center mb-5 navigation">
            <c:if test="${items.number > 0 }">
                <button type="button" class="btn btn-warning btn-lg text-uppercase h1 font-weight-bold  rounded-0 show-more border-0 shadow-sm">
                    <a href="/admin/admin_catalog?page=${items.number-1}">Предыдущая страница</a>
                </button>
            </c:if>
            <%--    <p>current: ${items.number}</p>--%>
            <c:if test="${items.number < items.totalPages - 1 }">
                <button type="button" class="btn btn-warning btn-lg text-uppercase h1 font-weight-bold  rounded-0 show-more border-0 shadow-sm">
                    <a href="/admin/admin_catalog?page=${items.number+1}">Следующая страница</a>
                </button>
            </c:if>
        </div>


        <jsp:include page="footer.jsp"/>
    </div>
</div>
</body>
</html>