<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
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

            <sec:authorize access="!isAuthenticated()">
                <div class="container mt-3"><a href="${pageContext.request.contextPath}/items"><button type="button" class="btn btn-outline-secondary">Назад</button></a></div>
            </sec:authorize>
            <sec:authorize access="isAuthenticated()">
            <div class="container mt-3"><a href="${pageContext.request.contextPath}/admin/admin_catalog"><button type="button" class="btn btn-outline-secondary">Назад</button></a></div>
            </sec:authorize>

            <div class="container pt-3 pb-2 ml-0 mr-0">
                <div class="h1">
                    ${item.name}
                    <span class="h3">
                        <c:choose>
                            <c:when test="${item.new_label==true}">
                                <span class="badge badge-success shadow-sm rounded-0">Новинка</span>
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${item.hit_label==true}">
                                <span class="badge badge-info shadow-sm rounded-0">Хит продаж</span>
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${item.sale_label==true}">
                                <span class="badge badge-danger shadow-sm rounded-0 ">Скидка</span>
                            </c:when>
                        </c:choose>
                    </span>
                </div>
            </div>

            <div class="row container p-0 m-0">
                <div class="col-md-5">
                    <img class="img-fluid img-thumbnail rounded-0 w-100 p-0" src="${pageContext.request.contextPath}/static/items/${item.id}.jpg" alt="${item.name}">
                </div>
                <div class="col-md-7">
                    <h4 style="opacity: 0.85;">Характеристики:</h4>
                    <ul type="none" style="opacity: 0.7;">
                        <li>
                            <strong>Возраст: </strong>${item.age}
                        </li>
                        <li>
                            <strong>Материал: </strong>${item.material}
                        </li>
                        <li>
                            <strong>Количество деталей: </strong>${item.details}
                        </li>
                    </ul>
                    <h4 style="opacity: 0.85;">Параметры:</h4>
                    <ul type="none" style="opacity: 0.7;">
                        <li>
                            <strong>Размер собранной игрушки (д × ш × в): </strong>${item.toy_size}
                        </li>
                        <li>
                            <strong>Размер упаковки (д × ш × в): </strong>${item.box_size}
                        </li>
                        <li>
                            <strong>Вес: </strong>${item.weight} кг
                        </li>
                    </ul>
                    <span style="opacity: 0.5;"><strong>Артикул: </strong>${item.art}</span>

                    <h2 class="mt-4">
                        <c:choose>
                            <c:when test="${item.sale_label==true}">
                                <del>${item.cost} руб.</del> ${item.sale_cost} руб.
                            </c:when>
                            <c:otherwise>
                                ${item.cost} руб.
                            </c:otherwise>
                        </c:choose>
                    </h2>
                </div>
            </div>

            <div class="container mr-0 mt-4 mb-5 p-0">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs item-tabs h4 border-0" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active border-top-0 border-left-0" id="description-tab" data-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">Описание</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link  border-top-0 border-right-0" id="galleria-tab" data-toggle="tab" href="#galleria" role="tab" aria-controls="galleria" aria-selected="false">Галерея</a>
                    </li>

                </ul>

                <!-- Tab panes -->
                <div class="tab-content pl-3 pr-3 mb-5">
                    <div class="tab-pane active" id="description" role="tabpanel" aria-labelledby="description-tab">
                        <p>${item.description}</p>
                    </div>
                    <div class="tab-pane " id="galleria" role="tabpanel" aria-labelledby="galleria-tab">
                        <div class="container">
                            <div class="row mt-3">

                                <c:forEach var="picturePath" items="${item.picturePaths}">

                                <div class="col-lg-3 col-md-4 col-6 thumb h-100 mb-3">
                                    <a data-fancybox="gallery" href="${pageContext.request.contextPath}/static/pictures/${picturePath.picName}">
                                        <img class="img-fluid img-thumbnail shadow-sm" src="${pageContext.request.contextPath}/static/pictures/${picturePath.picName}" alt="...">
                                    </a>
                                </div>

                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>




<sec:authorize access="isAuthenticated()">

                <div class="container pt-3 pb-2 ml-0 mr-0">
                    <div class="h1">Редактировать товар</div>
                </div>
                <div class="container ml-0 mr-0">
                    <form action="/admin/items/update/${item.id}" method="post" enctype="multipart/form-data">
                        <div class="row form-group mb-1 mb-md-2 mt-5 mt-md-4">
                            <div class="col-12 col-md-5">
                                <label for="title" class="h5">Введите название товара: </label>
                            </div>
                            <div class="col-12 col-md-7">
                                <input type="text" name="name" class="form-control" id="title" placeholder="Название товара" value="${item.name}">
                            </div>
                        </div>
                        <div class="row form-group mb-1 mb-md-2 mt-5 mt-md-4">
                            <div class="col-12 col-md-5">
                                <label for="picture" class="h5">Изменить основное изображение: </label>
                            </div>
                            <div class="col-12 col-md-7">
                                <input type="file" name="file" class="form-control-file" id="picture">
                            </div>
                        </div>
                        <!-- Characteristics -->
                        <div class="row form-group mb-1 mb-md-2 mt-5 mt-md-4">
                            <div class="col-12 col-md-5">
                                <label for="picture" class="h5">Введите характеристики</label>
                            </div>
                        </div>
                        <div class="row form-group mb-1 mb-md-2">
                            <div class="col-12 col-md-5 text-left text-md-right align-items-center">
                                <label for="age" class="h6 mt-2">Возраст: </label>
                            </div>
                            <div class="col-12 col-md-7">
                                <input type="text" name="age" class="form-control" id="age" placeholder="от X лет" value="${item.age}">
                            </div>
                        </div>
                        <div class="row form-group mb-1 mb-md-2">
                            <div class="col-12 col-md-5 text-left text-md-right">
                                <label for="materials" class="h6 mt-2">Материал: </label>
                            </div>
                            <div class="col-12 col-md-7">
                                <input type="text" name="material" class="form-control" id="materials" placeholder="Материал1, материал2, материал3, ..." value="${item.material}">
                            </div>
                        </div>
                        <div class="row form-group mb-1 mb-md-2">
                            <div class="col-12 col-md-5 text-left text-md-right">
                                <label for="count" class="h6 mt-2">Количество деталей: </label>
                            </div>
                            <div class="col-12 col-md-7">
                                <input type="text" name="details" class="form-control w-50" id="count" placeholder="X" value="${item.details}">
                            </div>
                        </div>
                        <!-- Parameters -->
                        <div class="row form-group mb-1 mb-md-2 mt-5 mt-md-4">
                            <div class="col-12 col-md-5">
                                <label for="picture" class="h5">Введите параметры</label>
                            </div>
                        </div>
                        <div class="row form-group mb-1 mb-md-2">
                            <div class="col-12 col-md-5 text-left text-md-right align-items-center">
                                <label for="toy_size" class="h6 mt-2">Размер собранной игрушки (д × ш × в): </label>
                            </div>
                            <div class="col-12 col-md-7">
                                <input type="text" name="toy_size" class="form-control w-50" id="toy_size" placeholder="XX.X × XX.X × XX.X см" value="${item.toy_size}">
                            </div>
                        </div>
                        <div class="row form-group mb-1 mb-md-2">
                            <div class="col-12 col-md-5 text-left text-md-right">
                                <label for="package_size" class="h6 mt-2">Размер упаковки (д × ш × в): </label>
                            </div>
                            <div class="col-12 col-md-7">
                                <input type="text" name="box_size" class="form-control w-50" id="package_size" placeholder="XX.X × XX.X × XX.X см" value="${item.box_size}">
                            </div>
                        </div>
                        <div class="row form-group mb-1 mb-md-2">
                            <div class="col-12 col-md-5 text-left text-md-right">
                                <label for="weight" class="h6 mt-2">Вес: </label>
                            </div>
                            <div class="col-12 col-md-7">
                                <input type="text" name="weight" class="form-control w-50" id="weight" placeholder="XX.XX кг" value="${item.weight}">
                            </div>
                        </div>
                        <!-- Article -->
                        <div class="row form-group mb-1 mb-md-2 mt-5 mt-md-4">
                            <div class="col-12 col-md-5">
                                <label for="article" class="h5">Введите артикул товара: </label>
                            </div>
                            <div class="col-12 col-md-7">
                                <input type="text" name="art" class="form-control w-50" id="article" placeholder="XXXXXX" value="${item.art}">
                            </div>
                        </div>
                        <!-- Cost -->
                        <div class="row form-group mb-1 mb-md-2 mt-5 mt-md-4">
                            <div class="col-12 col-md-5">
                                <label for="cost" class="h5">Введите цену товара: </label>
                            </div>
                            <div class="col-12 col-md-7">
                                <input type="text" name="cost" class="form-control w-50" id="cost" placeholder="XX.XX руб." value="${item.cost}">
                            </div>
                        </div>
                        <!-- Labels -->
                        <div class="row form-group mt-4">
                            <div class="col-12 col-md-5">
                                <label for="cost" class="h5">Выберите ярлык(-и): </label>
                            </div>
                            <div class="col">
                                <div class="form-check form-check-inline">
                                    <c:choose>
                                        <c:when test="${item.new_label==true}">
                                            <input name="new_label" class="form-check-input" type="checkbox" id="new" value="true" checked>
                                        </c:when>
                                        <c:otherwise>
                                            <input name="new_label" class="form-check-input" type="checkbox" id="new" value="true">
                                        </c:otherwise>
                                    </c:choose>
                                    <label class="form-check-label badge badge-success" for="new"><h5>Новинка</h5></label>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-check form-check-inline">
                                    <c:choose>
                                        <c:when test="${item.hit_label==true}">
                                            <input name="hit_label" class="form-check-input" type="checkbox" id="hit" value="true" checked>
                                        </c:when>
                                        <c:otherwise>
                                            <input name="hit_label" class="form-check-input" type="checkbox" id="hit" value="true">
                                        </c:otherwise>
                                    </c:choose>
                                    <label class="form-check-label badge badge-info" for="hit"><h5>Хит продаж</h5></label>
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-check form-check-inline">
                                    <c:choose>
                                        <c:when test="${item.sale_label==true}">
                                            <input name="sale_label" class="form-check-input" type="checkbox" id="discount" value="true" checked>
                                        </c:when>
                                        <c:otherwise>
                                            <input name="sale_label" class="form-check-input" type="checkbox" id="discount" value="true">
                                        </c:otherwise>
                                    </c:choose>
                                    <label class="form-check-label badge badge-danger" for="discount"><h5>Скидка</h5></label>
                                </div>
                            </div>
                        </div>
                        <div class="row form-group mb-2">
                            <div class="col-12 col-md-5 text-left text-md-right">
                                <label for="discount_cost" class="h6 mt-2">Введите цену со скидкой: </label>
                            </div>
                            <div class="col-12 col-md-7">
                                <input type="text" name="sale_cost" class="form-control w-50" id="discount_cost" placeholder="XX.XX руб." value="${item.sale_cost}">
                            </div>
                        </div>
                        <!-- Description -->
                        <div class="row form-group mb-1 mb-md-2 mt-5 mt-md-4">
                            <div class="col-12 col-md-5">
                                <label for="description" class="h5">Введите описание:</label>
                            </div>
                            <div class="col-12">
                                <textarea type="text" name="description" class="form-control w-100" rows="7" id="description" placeholder="Описание товара">${item.description}</textarea>
                            </div>
                        </div>
                        <!-- ADD BUTTON -->
                        <div class="row form-group mb-5 mt-4 text-left">
                            <div class="col-12">
                                <button type="submit" class="btn btn-info btn-lg text-uppercase h1 font-weight-bold rounded-0 show-more border-0 shadow-sm">Редактировать</button>
                            </div>
                        </div>
                    </form>


                    <div class="h1">Редактировать галерею</div>
    <form  action="${pageContext.request.contextPath}/admin/items/add/${item.id}" method="post" enctype="multipart/form-data">
            <div class="row form-group mt-3">
                <div class="col-12 col-md-5">
                    <label for="gallery_images" class="h5">Добавить картинки в галерею: </label>
                </div>
                <div class="col-12 col-md-7">
                    <input type="file" name="pictures" class="form-control-file" id="gallery_images" multiple>
                </div>
            </div>
        <div class="row form-group mb-5 mt-4 text-left">
            <div class="col">
                <button type="submit" class="btn btn-success btn-lg text-uppercase h1 font-weight-bold rounded-0 show-more border-0 shadow-sm">Добавить картинки в галерею</button>
            </div>
        </div>
    </form>


                    <div class="tab-pane " id="galleria" role="tabpanel" aria-labelledby="galleria-tab">
                        <div class="container">

            <div class="row mt-3">

                <c:forEach var="picturePath" items="${item.picturePaths}">

                    <div class="col-lg-3 col-md-4 col-6 thumb h-100 mb-3">
                        <img class="img-fluid img-thumbnail shadow-sm" src="${pageContext.request.contextPath}/static/pictures/${picturePath.picName}">

                        <a class="m-0 p-0" href="/admin/picture/remove/${picturePath.id}">
                            <button type="button" class="btn btn-danger rounded-0 btn-block">
                                <img class="delete-img" src="${pageContext.request.contextPath}/static/images/delete.png" alt="Add">
                            </button>
                        </a>

                    </div>

                </c:forEach>
            </div>
                </div>
            </div>

</sec:authorize>
                </div>



    <jsp:include page="footer.jsp"/>
</div>
</div>
</body>
</html>