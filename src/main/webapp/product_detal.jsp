<%@page import="com.fpltn.entities.Sanpham"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib uri="/WEB-INF/laydulieu" prefix="f"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<%@include file="include/head.jsp"%>
</head>
<body>
	<c:if test="${param.idsp == null}">
		<c:redirect url="index1.jsp"></c:redirect>
	</c:if>
	<c:set var="sanpham" value="${f:findByIdsp(param.idsp)}"></c:set>

	<!-- String image = sanpham.getHinhanh(); -->
	<%@include file="include/header.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-3">
				<img class="img-fluid mb-4" src="${sanpham.getHinhanh() }" alt="">
			</div>
			<div class="col-9">
				<h2>${sanpham.getTensp() }</h2>
				<h4 class="text-danger">${sanpham.getGiaban() }</h4>
				<p>${sanpham.getMotangan() }</p>
				<br>
				<div class="buttons_added">
					<input class="minus is-form" type="button" value="-"> <input
						aria-label="quantity" class="input-qty align-middle" max="100"
						min="1" name="" type="number" value="1"> <input
						class="plus is-form" type="button" value="+"> <br> <br>
					<c:choose>
						<c:when test="${userrole=='User' }">
							<a href="cart.jsp" class="btn btn-primary"> <i
								class="bi bi-cart"></i> MUA NGAY
							</a>
						</c:when>
						<c:when test="${userrole=='Admin' }"></c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>

					<button class="btn btn-primary">
						<i class="bi bi-cart"></i> MUA NGAY</a>
					</button>


					<b:tag name='style'>
						<![CDATA[
						input[type="number"] {
  -webkit-appearance: textfield;
     -moz-appearance: textfield;
          appearance: textfield;
}
input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
  -webkit-appearance: none;
}
input[type=number]{
text-align:center;
}




.buttons_added {
    opacity:1;
    display:inline-block;
    display:-ms-inline-flexbox;
    display:inline-flex;
    white-space:nowrap;
    vertical-align:top;
}
.is-form {
    overflow:hidden;
    position:relative;
    background-color:#f9f9f9;
    height:2.2rem;
    width:1.9rem;
    padding:0;
    text-shadow:1px 1px 1px #fff;
    border:1px solid #ddd;
}
.is-form:focus,.input-text:focus {
    outline:none;
}
.is-form.minus {
    border-radius:4px 0 0 4px;
}
.is-form.plus {
    border-radius:0 4px 4px 0;
}
.input-qty {
    background-color:#fff;
    height:2.2rem;
    text-align:center;
    font-size:1rem;
    display:inline-block;
    vertical-align:top;
    margin:0;
    border-top:1px solid #ddd;
    border-bottom:1px solid #ddd;
    border-left:0;
    border-right:0;
    padding:0;
}
.input-qty::-webkit-outer-spin-button,.input-qty::-webkit-inner-spin-button {
    -webkit-appearance:none;
    margin:0;
}
]]>
					</b:tag>
					<script>
						//<![CDATA[
						$('input.input-qty')
								.each(
										function() {
											var $this = $(this), qty = $this
													.parent().find('.is-form'), min = Number($this
													.attr('min')), max = Number($this
													.attr('max'))
											if (min == 0) {
												var d = 0
											} else
												d = min
											$(qty)
													.on(
															'click',
															function() {
																if ($(this)
																		.hasClass(
																				'minus')) {
																	if (d > min)
																		d += -1
																} else if ($(
																		this)
																		.hasClass(
																				'plus')) {
																	var x = Number($this
																			.val()) + 1
																	if (x <= max)
																		d += 1
																}
																$this
																		.attr(
																				'value',
																				d)
																		.val(d)
															})
										})
						//]]>
					</script>
				</div>
			</div>
		</div>
	</div>

	<%@include file="include/footer.jsp"%>
</body>
</html>