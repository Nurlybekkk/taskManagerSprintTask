<%@ page import="kz.nurlybek.bitlab.javaEE.servletTasks.database.Tasks" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Task Manager</title>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.css">
</head>
<body>
<div class="mx-5">
    <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #0e0e49;">
        <div class="container-fluid">
            <b><a class="navbar-brand" href="#">Tasks Manager</a></b>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <b><a class="nav-link active" href="/home.jsp">Все задания</a></b>
                </div>
            </div>
        </div>
    </nav>
    <%
        Tasks task = (Tasks) request.getAttribute("task");
        if(task != null){
    %>
    <div class="mt-4 mx-auto" style="width: 75%">
        <form action="/updateTask" method="post">
        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Наименование :</label>
            <input name="task_id" type="hidden" value="<%=task.getId()%>">
            <input type="text" name="name" class="form-control" id="exampleFormControlInput1" value="<%=task.getName()%>">
        </div>
        <div class="mb-3">
            <label for="exampleFormControlTextarea1" class="form-label">Описание :</label>
            <textarea name="description" class="form-control" id="exampleFormControlTextarea1" rows="3"><%=task.getDescription()%></textarea>
        </div>
        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Крайний срок :</label>
            <input type="date" name="deadlineDate" class="form-control" id="exampleFormControlInput2" value="<%=task.getDeadlineDate()%>">
        </div>
        <div class="mb-3">
            <label for="exampleFormControlInput1" class="form-label">Выполнено :</label>
            <select class="form-select" name="check">
                <option selected>No</option>
                <option selected>Yes</option>
            </select>
        </div>
            <button type="submit" class="btn btn-success">Сохранить</button>
        </form>
        <form action="/deleteTask" method="post">
            <input name="task_id" type="hidden" value="<%=task.getId()%>">
            <button class="btn btn-danger" >Удалить</button>
        </form>
    </div>
    <%
        }
        else{
    %>
    <h2 class="text-center">Task is not found</h2>
    <%
        }
    %>
</div>
</body>
</html>
