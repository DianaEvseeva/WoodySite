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

    <div class="container p-0">
        <div class="container mt-3"><a href="${pageContext.request.contextPath}/admin/admin_catalog"><button type="button" class="btn btn-outline-secondary">Назад</button></a></div>
        <div class="container pt-3 pb-2 ml-0 mr-0">
            <div class="h1">Добавить товар</div>
        </div>
        <sec:authorize access="isAuthenticated()">
        <div class="container ml-0 mr-0">
            <form action="${pageContext.request.contextPath}/admin/items/add" method="post" enctype="multipart/form-data">
                <div class="row form-group mb-1 mb-md-2 mt-5 mt-md-4">
            <div class="col-12 col-md-5">
                <label for="title" class="h5">Введите название товара: </label>
            </div>
            <div class="col-12 col-md-7">
                <input type="text" name="name" class="form-control" id="title" placeholder="Название товара">
            </div>
        </div>
        <div class="row form-group mb-1 mb-md-2 mt-5 mt-md-4">
            <div class="col-12 col-md-5">
                <label for="picture" class="h5">Добавить основное изображение: </label>
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
                <input type="text" name="age" class="form-control" id="age" placeholder="от X лет">
            </div>
        </div>
        <div class="row form-group mb-1 mb-md-2">
            <div class="col-12 col-md-5 text-left text-md-right">
                <label for="materials" class="h6 mt-2">Материал: </label>
            </div>
            <div class="col-12 col-md-7">
                <input type="text" name="material" class="form-control" id="materials" placeholder="Материал1, материал2, материал3, ...">
            </div>
        </div>
        <div class="row form-group mb-1 mb-md-2">
            <div class="col-12 col-md-5 text-left text-md-right">
                <label for="count" class="h6 mt-2">Количество деталей: </label>
            </div>
            <div class="col-12 col-md-7">
                <input type="text" name="details" class="form-control w-50" id="count" placeholder="X">
            </div>
        </div>
        <!-- Parameters -->
        <div class="row form-group mb-1 mb-md-2 mt-5 mt-md-4">
            <div class="col-12 col-md-5">
                <label for="toy_size" class="h5">Введите параметры</label>
            </div>
        </div>
        <div class="row form-group mb-1 mb-md-2">
            <div class="col-12 col-md-5 text-left text-md-right align-items-center">
                <label for="toy_size" class="h6 mt-2">Размер собранной игрушки (д × ш × в): </label>
            </div>
            <div class="col-12 col-md-7">
                <input type="text" name="toy_size" class="form-control w-50" id="toy_size" placeholder="XX.X × XX.X × XX.X см">
            </div>
        </div>
        <div class="row form-group mb-1 mb-md-2">
            <div class="col-12 col-md-5 text-left text-md-right">
                <label for="package_size" class="h6 mt-2">Размер упаковки (д × ш × в): </label>
            </div>
            <div class="col-12 col-md-7">
                <input type="text" name="box_size" class="form-control w-50" id="package_size" placeholder="XX.X × XX.X × XX.X см">
            </div>
        </div>
        <div class="row form-group mb-1 mb-md-2">
            <div class="col-12 col-md-5 text-left text-md-right">
                <label for="weight" class="h6 mt-2">Вес: </label>
            </div>
            <div class="col-12 col-md-7">
                <input type="text" name="weight" class="form-control w-50" id="weight" placeholder="XX.XX кг">
            </div>
        </div>
        <!-- Article -->
        <div class="row form-group mb-1 mb-md-2 mt-5 mt-md-4">
            <div class="col-12 col-md-5">
                <label for="article" class="h5">Введите артикул товара: </label>
            </div>
            <div class="col-12 col-md-7">
                <input type="text" name="art" class="form-control w-50" id="article" placeholder="XXXXXX">
            </div>
        </div>
        <!-- Cost -->
        <div class="row form-group mb-1 mb-md-2 mt-5 mt-md-4">
            <div class="col-12 col-md-5">
                <label for="cost" class="h5">Введите цену товара: </label>
            </div>
            <div class="col-12 col-md-7">
                <input type="text" name="cost" class="form-control w-50" id="cost" placeholder="XX.XX руб.">
            </div>
        </div>
        <!-- Labels -->
        <div class="row form-group mt-4">
            <div class="col-12 col-md-5">
                <label for="cost" class="h5">Выберите ярлык(-и): </label>
            </div>
            <div class="col">
                <div class="form-check form-check-inline">
                    <input name="new_label" class="form-check-input" type="checkbox" id="new" value="true">
                    <label class="form-check-label badge badge-success" for="new"><h5>Новинка</h5></label>
                </div>
            </div>
            <div class="col">
                <div class="form-check form-check-inline">
                    <input name="hit_label" class="form-check-input" type="checkbox" id="hit" value="true">
                    <label class="form-check-label badge badge-info" for="hit"><h5>Хит продаж</h5></label>
                </div>
            </div>
            <div class="col">
                <div class="form-check form-check-inline">
                    <input name="sale_label" class="form-check-input" type="checkbox" id="discount" value="true">
                    <label class="form-check-label badge badge-danger" for="discount"><h5>Скидка</h5></label>
                </div>
            </div>
        </div>
        <div class="row form-group mb-2">
            <div class="col-12 col-md-5 text-left text-md-right">
                <label for="discount_cost" class="h6 mt-2">Введите цену со скидкой: </label>
            </div>
            <div class="col-12 col-md-7">
                <input type="text" name="sale_cost" class="form-control w-50" id="discount_cost" placeholder="XX.XX руб.">
            </div>
        </div>
        <!-- Description -->
        <div class="row form-group mb-2 mb-1 mb-md-2 mt-5 mt-md-4">
            <div class="col-12 col-md-5">
                <label for="description" class="h5">Введите описание:</label>
            </div>
            <div class="col-12">
                <textarea type="text" name="description" class="form-control w-100" rows="7" id="description" placeholder="Описание товара"></textarea>
            </div>
        </div>
        <!-- ADD BUTTON -->
        <div class="row form-group mb-5 mt-4 text-left">
            <div class="col">
                <button type="submit" class="btn btn-success btn-lg text-uppercase h1 font-weight-bold rounded-0 show-more border-0 shadow-sm">Добавить</button>
            </div>
        </div>
        </form>
    </div>
    </sec:authorize>


    <jsp:include page="footer.jsp"/>
</div>
</div>
</body>
</html>




