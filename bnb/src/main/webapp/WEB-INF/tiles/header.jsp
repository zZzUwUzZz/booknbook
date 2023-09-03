<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
    <script src="/js/noti.js"></script>
    <link rel="stylesheet" href="/css/noti.css">
    <script src="/js/search.js"></script>
 
</head>


   <!-- modal -->

   <div class="noti_md">
    <div class="noti_tt">
        <p>알림</p>
    </div>
    <div class="notilistbox">
    </div>
</div>

<div class="sc_md">
    <div class="sc_cls">
        <span class="material-symbols-outlined">
            close
        </span>
    </div>

    <form id="searchForm">
        <div class="scmd_input_box">
            <div class="scip_box">
                <span class="material-symbols-outlined">
                    search
                </span>
                <input class="scbook" type="text" id="searchInput" name="keyword" placeholder="Search...">
            </div>

        </div>
    </form>
</div>


<header>

    <div class="hd">

        <div class="hd_01">
            <div class="logo">
                <a href="/">BOOK N BOOK</a>
            </div>
            <div class="login_bell">
                <a>LOGIN</a>

                <div class="noti_btn">
                    <span class="material-symbols-rounded">
                        notifications
                    </span>
                </div>

            </div>
        </div>

        <div class="hd_02">
            <div class="menu_01">
                <a href="<%=request.getContextPath()%>/bookstore">BOOKSTORE</a>
                <a href="<%=request.getContextPath()%>/books">BOOKS</a>
                <a>NEW</a>
                <a>RENT</a>
            </div>

            <div class="menu_02">
                <div class="bk_sc">SEARCH</div>
                <a>CART</a>
                <a>WISH</a>
            </div>

        </div>

    </div>
</header>
