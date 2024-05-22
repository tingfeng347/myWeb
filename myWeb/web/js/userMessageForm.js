$(document).ready(function(){
    $("#addBtn").click(function(){
        $("#addForm").toggle();  // 切换显示状态
        $("#deleteForm").hide(); // 确保其他表单被隐藏
        $("#updateForm").hide();
    });

    $("#deleteBtn").click(function(){
        $("#deleteForm").toggle(); // 切换显示状态
        $("#addForm").hide();      // 确保其他表单被隐藏
        $("#updateForm").hide();
    });

    $("#updateBtn").click(function(){
        $("#updateForm").toggle(); // 切换显示状态
        $("#addForm").hide();      // 确保其他表单被隐藏
        $("#deleteForm").hide();
    });
});
