function toggleNav() {
    var nav = document.getElementsByTagName("nav")[0];
    if (nav.style.width === "200px") {
        nav.style.width = "50px";
    } else {
        nav.style.width = "200px";
    }
}

function confirmLogout() {
    // 提示用户是否确认退出
    var confirmLogout = confirm('确定要退出吗？');

    // 如果用户确认退出，执行退出操作
    if (confirmLogout) {
        // 重定向到退出页面
        window.location.href = "../jsp/index.jsp";
    }
}


