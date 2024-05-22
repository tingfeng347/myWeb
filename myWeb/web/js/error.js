// 在页面加载后，设置一个定时器，在一定时间后隐藏弹窗
window.onload = function() {
    setTimeout(function() {
        var errorPopup = document.getElementById('errorPopup');
        errorPopup.style.display = 'none';
    }, 5000); // 5000毫秒后隐藏弹窗，即5秒
}