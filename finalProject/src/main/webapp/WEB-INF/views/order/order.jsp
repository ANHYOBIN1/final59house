<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오구싶은집 > 주문/결제</title>
<!-- 파비콘 로고 -->
<link rel="icon" href="${path}/resources/img/pavilogo.png">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<script>
    $(function(){
        $("#header_store").mouseover(function(){
            $(".header_store_dropdown").stop().fadeIn(300);
        })
        $(".header_store_dropdown").mouseleave(function(){
            $(".header_store_dropdown").stop().fadeOut(300);
        })

        $("#allchk").click(function() {
            if($("#allchk").is(":checked")) $(".chkbox").prop("checked", true);
            else $(".chkbox").prop("checked", false);
        });

        $(".chkbox").click(function() {
            var total = $(".chkbox").length;
            var checked = $(".chkbox:checked").length;

            if(total != checked) $("#allchk").prop("checked", false);
            else $("#allchk").prop("checked", true); 
        });

        // 보유 포인트가 0보다 크면 색상 변함
        if($("#point_level").val(point) > 0) {
            $("#point_level").css({"background-color" : "#fff", "color":"red"})
        }
    })

    function charge() {
        let chargegogo  = window.open('charge.or', "_blank", 'top=100, left=200, width=1250, height=650')
    }
</script>
<style type="text/css">
/* 주문결제페이지 */
    .main_wrap{display: flex; -webkit-box-pack: center; justify-content: center; position: relative; width: 100%; max-width: 1256px; padding: 0px 60px; margin: 0px auto; box-sizing: border-box;}
    /* 왼쪽 주문창 */
    .left_container{flex: 1 0 0px; box-sizing: border-box;}
    .left_container h1{font-size: 24px; line-height: 36px; color: rgb(0, 0, 0); font-weight: bold; margin: 40px 0px 20px;}
    /* 오른쪽 sticky주문창 */
    .sticky_wrap{position: relative; flex: 0 1 0px; min-width: 366px; margin-left: 40px; box-sizing: border-box;} 
    .sticky_container{position: sticky; top: 81px; transition: top 0.1s ease 0s; border: 1px solid rgb(234, 235, 239); padding: 20px;}
    .necessary{display: flex; -webkit-box-align: center; align-items: center; text-align: left; border: 0px; background-color: transparent; width: 100%; padding: 0px; font-weight: normal; font-size: 14px; line-height: 17px; color: rgb(101, 110, 117); letter-spacing: -0.4px; padding: 10px;}
    .submitbut{width: 100%; margin-top: 20px; padding: 15px 10px; line-height: 20px; font-size: 17px; min-height: 50px; background-color: #21d9cb; color: #fff; border-radius: 5px; border: none;
                cursor: pointer;}
    .order_input{display: inline-block; width: 100%; margin: 0; padding: 8px 15px 9px; border: 1px solid #dbdbdb; background-color: #fff; 
        color: #000; border-radius: 4px; box-sizing: border-box; font-size: 15px; font-weight: bold; line-height: 21px; 
        transition: border-color .1s,background-color .1s;}
    #point_level{background-color: rgb(250, 250, 250); border-color: rgb(219, 219, 219); color: #bdbdbd; flex: 1 0 0px;}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="../common/header.jsp" />
	    <!-- 주문결제 -->
    <form action="orderSheet.or" method="post" name="buyInfo">
    <div class="main_wrap">
        <!-- 왼쪽 상품 주문창 -->
        <div class="left_wrap" style="flex: 1 0 0px; box-sizing: border-box;">
            <div class="left_container">
                <h1>주문/결제</h1>
                <!-- 배송지 -->
                <div style="margin-bottom: 50px;">
                    <div style="margin: 0px auto; box-sizing: border-box; width: auto; max-width: 100%; min-height: 1px; display: flex; -webkit-box-align: center; align-items: center; height: 56px;
                    border-bottom: 1px solid rgb(234, 235, 239);">
                        <div style="font-size: 20px; font-weight: bold;">배송지</div>
                        <div style="flex: 0px; text-align: right; font-weight: bold; color: #21d9cb;">변경</div>
                    </div>
                    <div style="overflow: hidden; margin: -3px; padding: 23px 3px 3px; box-sizing: border-box;">
                        <div style="margin: 0px auto; box-sizing: border-box; width: auto; max-width: 100%; min-height: 1px;">
                            <div style="display: flex; -webkit-box-align: center; align-items: center; font-weight: bold; font-size: 18px; line-height: 20px; color: rgb(41, 41, 41);">배송지명</div>
                            <div style="margin-top: 10px;">${ m.memAddr }, ${ m.memDetailAddr }</div>
                            <div style="display: flex;; line-height: 2rem; font-size: 15px;">
                                <div style="max-width: calc(100% - 130px); text-overflow: ellipsis; white-space: nowrap; overflow-wrap: normal; overflow: hidden;">${ m.memName }</div>
                                <div style="width: 120px; margin-left: 8px;">${ m.memPhone }</div>
                            </div>
                            <div style="padding: 20px 10px 0px 0px; max-width: 642px;">
                                <div style="position: relative; display: inline-block; width: 100%;">
                                    <select class="order_input" name="ordRequest">
                                        <option value="부재시 문앞에 놓아주세요" selected>부재시 문앞에 놓아주세요</option>
                                        <option value="배송전에 미리 연락주세요">배송전에 미리 연락주세요</option>
                                        <option value="부재시 경비실에 맡겨 주세요">부재시 경비실에 맡겨 주세요</option>
                                        <option value="부재시 전화주시거나 문자 남겨 주세요">부재시 전화주시거나 문자 남겨 주세요</option>
                                        <option value="배송시 요청사항을 선택해주세요">배송시 요청사항을 선택해주세요</option>
                                    </select>
                                </div>
                                <input type="hidden" value="${ p.proNo }" name="proNo">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 주문자 -->
                <div style="margin-bottom: 50px;">
                    <div style="margin: 0px auto; box-sizing: border-box; width: auto; max-width: 100%; min-height: 1px; display: flex; 
                    -webkit-box-align: center; align-items: center; height: 56px; border-bottom: 1px solid rgb(234, 235, 239);">
                        <div style="font-size: 20px; font-weight: bold;">주문자</div>
                    </div>
                    <div style="overflow: hidden; margin: -3px; padding: 23px 3px 3px; box-sizing: border-box;"> 
                        <div style="margin: 0px auto; box-sizing: border-box; width: auto; max-width: 100%; min-height: 1px;">
                            <!-- 이름 -->
                            <label for="">
                                <div style="display: flex; padding: 0px 0px 8px;">
                                    <div style="display: flex; align-items: center; width: 72px; font-size: 15px;">이름</div>
                                    <div style="flex: 1 0 0px; max-width: 270px;">
                                        <input class="order_input" type="text" value="${ m.memName }" name="cusName">
                                    </div>
                                </div>
                            </label>
                            <!-- 이메일 -->
                            <label for="">
                                <div style="display: flex; padding: 8px 0px;">
                                    <div style="display: flex; align-items: center; width: 72px; font-size: 15px;">이메일</div>
                                    <div style="display: flex; flex: 1 0 0px; max-width: 580px;">
                                        <div style="position: relative; display: inline-block; width: 50%;">
                                            <input class="order_input" type="text" value="${ m.memEmail }" name="ordEmail" readonly>
                                        </div>
                                    </div>
                                </div>
                            </label>
                            <!-- 폰 -->
                            <label for="">
                                <div style="display: flex; padding: 8px 0px;">
                                    <div style="display: flex; align-items: center; width: 72px; font-size: 15px;">휴대전화</div>
                                    <div>
                                        <input type="text" class="order_input" placeholder="010-1234-1234" value="${ m.memPhone }" name="cusPhone">
                                    </div>
                                </div>
                            </label>
                        </div>
                    </div>
                </div>
                <!-- 주문 상품 -->
                <div style="margin-bottom: 50px;">
                    <div style="margin: 0px auto; box-sizing: border-box; width: auto; max-width: 100%; min-height: 1px; display: flex; 
                    -webkit-box-align: center; align-items: center; height: 56px; border-bottom: 1px solid rgb(234, 235, 239);">
                        <div style="font-size: 20px; font-weight: bold;">주문상품</div>
                    </div>
                    <div style="overflow: hidden; margin: -3px; padding: 23px 3px 3px; box-sizing: border-box;"> 
                        <div style="margin: 0px auto; box-sizing: border-box; width: auto; max-width: 100%; min-height: 1px;">
                            <!-- 상품정보 -->
                            <div style="overflow: hidden; border-radius: 4px; border: 1px solid rgb(234, 235, 239);">
                                <div style="padding: 11px 16px 10px; background-color: rgb(247, 248, 250);">
                                    <div style="display: flex; align-items: center;">
                                        <div style="flex: 1 0 0px; font-size: 14px; line-height: 19px; color: rgb(66, 66, 66); font-weight: bold;">
                                            	${ p.selBusName }
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <div style="display: flex; padding: 16px; box-sizing: border-box;">
                                        <picture>
                                            <img src="${path}/${ p.proChangeImg }" alt="" style="width: 64px; height: 64px;">
                                        </picture>
                                        <div style="flex: 1 0 0px; align-items: center; margin-left: 10px;">
                                            <div style="font-size: 15px; line-height: 18px; color: rgb(41, 41, 41); margin: 8px 0;">
                                                	${ p.proName }
                                            </div>
                                            <div style="display: flex; -webkit-box-align: center; align-items: center; margin-top: 11px;">
                                                <span style="font-size: 14px; line-height: 17px; color: rgb(41, 41, 41); font-weight: bold;">가격 ${ p.proPrice * countSelect } 원</span>
                                                <span style="margin: 0px 12px; font-size: 10px;">|</span>
                                                <span style="font-size: 13px; line-height: 16px; color: rgb(117, 117, 117);">${ colorSelect } ${ countSelect }개</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 포인트 -->
                <div style="margin-bottom: 50px;">
                    <div style="margin: 0px auto; box-sizing: border-box; width: auto; max-width: 100%; min-height: 1px; display: flex; 
                    -webkit-box-align: center; align-items: center; height: 56px; border-bottom: 1px solid rgb(234, 235, 239);">
                        <div style="font-size: 20px; font-weight: bold;">보유 포인트</div>
                        <script type="text/javascript">
                        /* 보유포인트 조회 ajax */
                        $(function() {
                        	// setInterval(showUserPoint, 500)
                        	showUserPoint();
                        })
                        var chkUserPoint = 0;
                        function showUserPoint() {
                        	console.log("asdasd");
                			$.ajax({
                				url: "showPoint.or",
                				data:{userEmail:"${id}"},
                				success:function(point){
               						$("#point_level").val(point);
               						chkUserPoint = point;
                				},
                				error:function() {
                					console.log("보유포인트 조회 ajax 통신 오류");
                				}
                			})
                		}
                        
                       	function buyIt(){
                       		showUserPoint();
                       		if(chkUserPoint < ${ (p.proPrice * countSelect) + 50000 }){
                       			alert('보유한 포인트가 부족합니다.')
                       			return;
                       		}else{
                       			alert('정상적으로 결제되었습니다.');
                       			buyInfo.submit();
                       		}
                       	}
                        </script>
                    </div>
                    <div style="overflow: hidden; margin: -3px; padding: 23px 3px 3px; box-sizing: border-box;"> 
                        <div style="margin: 0px auto; box-sizing: border-box; width: auto; max-width: 100%; min-height: 1px;">
                            <div style="display: flex; margin-bottom: 12px; max-width: 322px;">
                                <input id="point_level" class="order_input" type="number" value="0" disabled>
                                <button class="wid360 bora4" type="button" onclick="charge()" style="background-color: #fff; border: 1px solid transparent; border-radius: 3px;
                                            border-color: #21d9cb; color: #21d9cb; margin-left: 8px; padding: 11px 10px; min-height: 40px; cursor: pointer;">
                                        	충전하기
                                </button>
                                
                                <!-- 새로고침 버튼 -->
                               	<img style="display:flex; width: 30px; height: 30px; margin-left: 12px; margin-top: 5px; cursor: pointer;" alt="새로고침" src="${path}/resources/img/refresh.png" onclick="showUserPoint();">            
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 오른쪽 최종 결제창 -->
        <div class="sticky_wrap" style="top: 50px;">
            <div class="sticky_container">
                <div class="">
                    <!-- 결제금액 상단 -->
                    <div>
                        <h2 style="margin-bottom: 20px; font-size: 20px;">결제금액</h2>
                        <div style="display: flex; align-items: center; line-height: 2rem; font-size: 15px;">
                            <div>총 상품 금액</div>
                            <div style="flex: 0px; text-align: right; font-weight: bold;">${ p.proPrice * countSelect } 포인트</div>
                        </div>
                        <div style="display: flex; align-items: center; line-height: 2rem; font-size: 15px;">
                            <div>배송비</div>
                            <div style="flex: 0px; text-align: right;">50000 포인트</div>
                        </div>
                        <div style="display: flex; align-items: center; line-height: 2rem; font-size: 15px;">
                            <div>쿠폰 사용</div>
                            <div style="flex: 0px; text-align: right;">0원</div>
                        </div>
                        <div style="display: flex; align-items: center; line-height: 2rem; font-size: 15px;">
                            <div>포인트 사용</div>
                            <div style="flex: 0px; text-align: right;">0원</div>
                        </div>
                        <div style="display: flex; align-items: center; line-height: 2rem; border-top: 1px solid rgb(234, 235, 239); padding-top: 19px; padding-bottom: 19px; margin-top: 20px;">
                            <div style="font-size: 18px; font-weight: bold;">최종 결제 금액</div>
                            <div style="flex: 0px; text-align: right; font-size: 22px; font-weight: bold; color: #21d9cb;">${ (p.proPrice * countSelect) + 50000 } 포인트</div>
                        </div>
                    </div>
                    <!-- 필수 동의란 -->
                    <div class="bd1 wid360 terms" style="border-top: 1px solid rgb(234, 235, 239);">
                        <label for="" style="display: flex; -webkit-box-align: center; align-items: center; padding: 12px 0px 12px 24px; font-size: 15px; line-height: 18px; color: rgb(0, 0, 0);"><input type="checkbox" id="allchk" style="display: flex; margin: -9px 3px -9px -9px;">전체동의</label>
                        <label for=""><hr></label>
                        <label for="" class="necessary"><input type="checkbox" class="chkbox">개인정보수집 및 이용동의(필수)</label>
                        <label for="" class="necessary"><input type="checkbox" class="chkbox">결제 서비스 이용약관 동의(필수)</label>
                    </div>
                    <button type="button" onclick="buyIt()" class="submitbut wid360 bora4" value="">${ (p.proPrice * countSelect) + 50000 } 포인트 결제하기</button>
                </div>
                	<input type="hidden" value="${ m.memZipcode }" name="ordZipcode">
                	<input type="hidden" value="${ m.memAddr }" name="ordAddr">
                	<input type="hidden" value="${ m.memDetailAddr }" name="ordDetailAddr">
                	<input type="hidden" value="${ countSelect }" name="ordCount">
                	<input type="hidden" value="${ colorSelect }" name="ordOption">
                	<input type="hidden" value="${ p.proPrice }" name="ordPrice">
            </div>
        </div>
    </div>
    </form>
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp" />
</body>
</html>