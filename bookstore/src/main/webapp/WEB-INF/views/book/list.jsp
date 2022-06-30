<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
    
    
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" style="background-color: #F09F00;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>도서 목록</h2>
                        <div class="breadcrumb__option">
                            <a href="${root}/">Home</a>
                            <span>북스토어</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
               <div class="col-lg-12 col-md-12">
                    <div class="filter__item">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="filter__sort">
                                    <span>Sort By</span>
                                    <select>
                                        <option value="0">Default</option>
                                        <option value="0">Default</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                                <div class="filter__found">
                                    <h6><span>16</span> Products found</h6>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-3">
                                <div class="filter__option">
                                    <span class="icon_grid-2x2"></span>
                                    <span class="icon_ul"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/image/product/product-1.jpg">
                                    <ul class="product__item__pic__hover">
                                        <!--  li><a href="${root}/"><i class="fa fa-heart"></i></a></li>-->
                                        <li><a href="${root}/book/detail"><i class="fa fa-retweet"></i></a></li>
                                        <!--  li><a href="${root}/"><i class="fa fa-shopping-cart"></i></a></li>-->
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="${root}/book/detail">니체의 말</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/image/product/product-2.jpg">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="${root}/"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="${root}/"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="${root}/"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="${root}/">Crab Pool Security</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/image/product/product-3.jpg">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="${root}/"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="${root}/"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="${root}/"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="${root}/">Crab Pool Security</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/image/product/product-4.jpg">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="${root}/"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="${root}/"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="${root}/"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="${root}/">Crab Pool Security</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/image/product/product-5.jpg">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="${root}/"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="${root}/"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="${root}/"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="${root}/">Crab Pool Security</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/image/product/product-6.jpg">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="${root}/"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="${root}/"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="${root}/"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="${root}/">Crab Pool Security</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/image/product/product-7.jpg">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="${root}/"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="${root}/"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="${root}/"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="${root}/">Crab Pool Security</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/image/product/product-8.jpg">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="${root}/"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="${root}/"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="${root}/"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="${root}/">Crab Pool Security</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/image/product/product-9.jpg">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="${root}/"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="${root}/"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="${root}/"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="${root}/">Crab Pool Security</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/image/product/product-10.jpg">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="${root}/"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="${root}/"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="${root}/"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="${root}/">Crab Pool Security</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/image/product/product-11.jpg">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="${root}/"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="${root}/"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="${root}/"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="${root}/">Crab Pool Security</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="${pageContext.request.contextPath}/image/product/product-12.jpg">
                                    <ul class="product__item__pic__hover">
                                        <li><a href="${root}/"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="${root}/"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="${root}/"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="${root}/">Crab Pool Security</a></h6>
                                    <h5>$30.00</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="product__pagination">
                        <a href="${root}/">1</a>
                        <a href="${root}/">2</a>
                        <a href="${root}/">3</a>
                        <a href="${root}/"><i class="fa fa-long-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->
    
    <jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
    

   