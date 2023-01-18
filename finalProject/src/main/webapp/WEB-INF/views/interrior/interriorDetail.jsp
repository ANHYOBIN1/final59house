<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
    <title>Document</title>
    <style>
        /* 로고폰트 */
            @font-face {
            font-family: 'SDSamliphopangche_Outline';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/SDSamliphopangche_Outline.woff') format('woff');
            font-weight: normal;
            font-style: normal;
            } 
        /* 메뉴폰트 */
        @font-face {
            font-family: 'GmarketSansMedium';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-weight: normal;
            font-style: normal;
            }
        /* 본문내용폰트 */
        @font-face {
            font-family: 'Pretendard-Regular';
            src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
            font-weight: 400;
            font-style: normal;
        }
        
        /* --------------------- 본문 --------------------- */
        .container{
            display: flex; 
            flex-flow: row nowrap; 
            width: 1260px; margin: 0 auto;
        }
        .content{
            width: 72%;
            height: fit-content;
            background: #f5f5f5;
            padding: 40px;
        }
        .sidebar{
            width: 100%;
            /* height: 550px;  */
            position: sticky; 
            top: 0; transition: all 0.3s;
            
            padding-top: 60px;
        }
        .sideSection{
            width: 28%;
            padding-top: 40px;
        }
        .sidebarContent{
            border: 1.5px solid rgba(150, 146, 146, 0.459);
            width: 80%;
            padding: 15px; padding-top: 25px;
            display: flex; flex-direction: column;
        }
        .inter_title{
            font-size: 22px; font-weight: 550;margin: 7px auto;
        }
        .inter_introduce{
            color: rgb(104, 104, 104); font-size: 15px;margin: 7px auto;
        }
        .inter_content{
            margin: 15px 0;
            font-size: 15px;
        }
        .inter_button{
            border: 0px solid; outline: 0px solid;
            border-radius: 9px; margin-top: 20px 0; height: 45px;
            color: white; background-color: #21d9cb; font-size: 18px; font-weight: 400;
        }
        .inter_star{
            width: 80%; position: relative; left: 20%; margin: 20px 0;
        }
        .inter_count{
            width: 40%; font-size: 33px; position: relative; left: 60%;
            font-family: 'SDSamliphopangche_Outline';
        }
        .content{
            display: flex;
            flex-direction: column;
            background-color: #f6fdfd;
        }
        .contentHeaderSpan{
            color: #21d9cb;
        }
        .contentHeader{
            font-size: 18px; font-weight: 400; margin-bottom: 110px;
            width: fit-content; height: fit-content; background-color: #ade8ffa4;
            border-radius: 9px; padding: 9px; font-family: 'Pretendard-Regular';
        }
        .contentHeader2{
            font-size: 20px; font-weight: 800; margin-bottom: 30px;
            width: fit-content; height: fit-content;
            font-family: 'Pretendard-Regular';
        }
        .contentBody{
            width: 100%; display: flex; flex-wrap: wrap;

        }
        .contentItem{
            display: flex; flex-direction: column; width: 28%; justify-content: space-around;
            margin: 20px;
        }
        .itemImg{
            border-radius: 9px;
        }
        .itemText{
            text-align: center; font-family: 'Pretendard-Regular';
            padding: 15px 0px; font-weight: bold; 
        }
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <!-- 본문 -->
    <section class="container">
        <div class="sideSection">
            <div class="sidebar">
                <div class="sidebarContent">
                    <span class="inter_title">KH건축디자인</span>
                    <span class="inter_introduce">자재는 최대한 싸게, 시공비는 비싸게!</span>
                    <hr>
                    <span class="inter_content">전체시공횟수</span>
                    <span class="inter_count">총 3회</span>
                    <span class="inter_content">업체 평가 점수</span>
                    <img src="img/star4.png" alt="" class="inter_star">
                    <hr style="margin-bottom: 20px;">
                    <button class="inter_button">업체상담신청</button>
                </div>
            </div>
        </div>
        <div class="content">
            <div class="contentHeader">오구싶은집 모든 시공 리뷰는 <span class="contentHeaderSpan">0% 계약사실이 확인된 리뷰</span>입니다</div>
            <div class="contentHeader2">시공사례 <span class="contentHeaderSpan">64</span></div>
            <div class="contentBody">
                <div class="contentItem">
                    <img src="img/interior.jpg" alt="" class="itemImg">
                    <p class="itemText">나너무무서워~ 이러다 우리 다 죽어~</p>
                </div>
                <div class="contentItem">
                    <img src="img/interior.jpg" alt="" class="itemImg">
                    <p class="itemText">나너무무서워~ 이러다 우리 다 죽어~</p>
                </div>
                <div class="contentItem">
                    <img src="img/interior.jpg" alt="" class="itemImg">
                    <p class="itemText">나너무무서워~ 이러다 우리 다 죽어~</p>
                </div>
                <div class="contentItem">
                    <img src="img/interior.jpg" alt="" class="itemImg">
                    <p class="itemText">나너무무서워~ 이러다 우리 다 죽어~</p>
                </div>
                <div class="contentItem">
                    <img src="img/interior.jpg" alt="" class="itemImg">
                    <p class="itemText">나너무무서워~ 이러다 우리 다 죽어~</p>
                </div>
                <div class="contentItem">
                    <img src="img/interior.jpg" alt="" class="itemImg">
                    <p class="itemText">나너무무서워~ 이러다 우리 다 죽어~</p>
                </div>
                <div class="contentItem">
                    <img src="img/interior.jpg" alt="" class="itemImg">
                    <p class="itemText">나너무무서워~ 이러다 우리 다 죽어~</p>
                </div>
                <div class="contentItem">
                    <img src="img/interior.jpg" alt="" class="itemImg">
                    <p class="itemText">나너무무서워~ 이러다 우리 다 죽어~</p>
                </div>
                <div class="contentItem">
                    <img src="img/interior.jpg" alt="" class="itemImg">
                    <p class="itemText">나너무무서워~ 이러다 우리 다 죽어~</p>
                </div>
            </div>
        </div>
    </section>
    
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>