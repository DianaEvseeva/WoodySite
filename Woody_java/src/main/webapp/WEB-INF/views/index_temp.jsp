
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>WOODY - игрушки из дерева</title>
    <jsp:include page="inport_header.jsp"/>
</head>
<body>
<div class="container shadow-sm p-0 bg-white">
<jsp:include page="menu.jsp"/>



    <div class="container  p-0 ">

        <section class="slider container">
            <div id="carousel" class="carousel slide mt-4 mb-5" data-ride="carousel">
                <!-- slider-body -->
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="${pageContext.request.contextPath}/static/images/slider/oruzhie-banner1.png" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="${pageContext.request.contextPath}/static/images/slider/4.png" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="${pageContext.request.contextPath}/static/images/slider/banner_1_new.png" alt="Third slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="${pageContext.request.contextPath}/static/images/slider/benner_2_new.png" alt="Third slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="${pageContext.request.contextPath}/static/images/slider/benner_3_new.png" alt="Third slide">
                    </div>
                </div>
                <!-- arrows -->
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
                <!-- drops -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel" data-slide-to="0" class="active bg-secondary"></li>
                    <li data-target="#carousel" data-slide-to="1" class="bg-secondary"></li>
                    <li data-target="#carousel" data-slide-to="2" class="bg-secondary"></li>
                    <li data-target="#carousel" data-slide-to="3" class="bg-secondary"></li>
                    <li data-target="#carousel" data-slide-to="4" class="bg-secondary"></li>
                </ol>
            </div>
        </section>
        <section class="catalog-list-main container mb-5">
            <div class="row text-center">
                <div class="col mt-1 mb-5">
                    <button type="button" class="btn btn-warning btn-lg text-uppercase h1 font-weight-bold rounded-0 border-0 go-to-catalog shadow-sm">
                        <a href="${pageContext.request.contextPath}/items">Перейти к каталогу</a></button>
                </div>
            </div>
            <div class="row mb-5">
                <div class="col-12">
                    <div class="card bg-danger text-white text-center rounded-0 shadow-sm">
                        <img class="card-img-top img-fluid rounded-0" src="${pageContext.request.contextPath}/static/images/novinki.png" alt="Новинки">
                        <div class="card-body">
                            <a class="card-title text-uppercase font-weight-bold h2" href="${pageContext.request.contextPath}/items">Новинки</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center justify-content-xl-between  text-center">
                <div class="col-xl-6 w-100 mb-3 mb-xl-0">
                    <div class="card bg-info text-white text-center d-flex  rounded-0 shadow-sm">
                        <img class="card-img-top img-fluid rounded-0" src="${pageContext.request.contextPath}/static/images/hits.png" alt="Хиты продаж">
                        <div class="card-body">
                            <a class="card-title text-uppercase font-weight-bold h2" href="${pageContext.request.contextPath}/items">Хиты продаж</a>
                        </div>
                    </div>
                </div>
                <div class="col-xl-6 w-100">
                    <div class="card bg-success text-white text-center d-flex rounded-0 shadow-sm">
                        <img class="card-img-top img-fluid rounded-0" src="${pageContext.request.contextPath}/static/images/akcii.png" alt="Акции">
                        <div class="card-body">
                            <a class="card-title text-uppercase font-weight-bold h2" href="${pageContext.request.contextPath}/items">Акции</a>
                        </div>
                    </div>
                </div>
            </div>
            <%--<div class="row text-center">
                <div class="col mt-4 mb-5">
                    <button type="button" class="btn btn-warning btn-lg text-uppercase h1 font-weight-bold rounded-0 border-0 go-to-catalog shadow-sm">
                        <a href="${pageContext.request.contextPath}/items">Перейти к каталогу</a></button>
                </div>
            </div>--%>
        </section>

        <jsp:include page="footer.jsp"/>
    </div>
</div>
</body>
</html>
