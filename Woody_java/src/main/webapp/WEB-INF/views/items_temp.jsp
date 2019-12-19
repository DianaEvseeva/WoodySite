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
        <div class="catalog-list container mb-4 ml-0">
            <div class="catalog-items">
                <div class="row">

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
                            <img class="card-img img-fluid rounded-0 mh-50" src="/static/items/${item.id}.jpg" alt="Card image cap">
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
                            <a href="${pageContext.request.contextPath}/items/${item.id}"><button type="button" class="btn btn-warning btn-block rounded-0">Посмотреть</button></a>
                        </div>
                    </div>

                    </c:forEach>

                </div>
            </div>
        </div>
        <div class="container text-center mb-5 navigation">
            <%--<button type="button" class="btn btn-warning btn-lg text-uppercase h1 font-weight-bold rounded-0 show-more border-0 shadow-sm">
                <a href="${pageContext.request.contextPath}/items">Показать еще</a></button>--%>
                <c:if test="${items.number > 0 }">
                    <button type="button" class="btn btn-warning btn-lg text-uppercase h1 font-weight-bold  rounded-0 show-more border-0 shadow-sm">
                        <a href="/items?page=${items.number-1}">Предыдущая страница</a>
                    </button>
                </c:if>
                <%--    <p>current: ${items.number}</p>--%>
                <c:if test="${items.number < items.totalPages - 1 }">
                    <button type="button" class="btn btn-warning btn-lg text-uppercase h1 font-weight-bold  rounded-0 show-more border-0 shadow-sm">
                        <a href="/items?page=${items.number+1}">Следующая страница</a>
                    </button>
                </c:if>
        </div>
        </div>









    <jsp:include page="footer.jsp"/>
</div>
</div>
</body>
</html>