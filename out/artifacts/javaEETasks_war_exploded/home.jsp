<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.nurlybek.bitlab.javaEE.servletTasks.database.Tasks" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Task Manager</title>
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</head>
<body>
<div class="mx-5">
    <nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #0e0e49;">
        <div class="container-fluid">
            <b><a class="navbar-brand" href="/home">Tasks Manager</a></b>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <b><a class="nav-link active" href="/home">Все задания</a></b>
                </div>
            </div>
        </div>
    </nav>

    <div class="row mt-4">
        <div class="col-10">
            <button type="button" class="btn btn-dark" style="background-color: #0e0e49;" data-bs-toggle="modal" data-bs-target="#addZadachu">
                + Добавить задание
            </button>

            <div class="modal fade" id="addZadachu" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="staticBackdropLabel">Новое задание</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="/addTask" method="post">
                                <div class="mb-3">
                                    <label for="exampleFormControlInput1" class="form-label">Наименование :</label>
                                    <input type="text" name="name" class="form-control" id="exampleFormControlInput1">
                                </div>
                                <div class="mb-3">
                                    <label for="exampleFormControlTextarea1" class="form-label">Описание :</label>
                                    <textarea name="description" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                                </div>
                                <div class="mb-3">
                                    <label for="exampleFormControlInput1" class="form-label">Крайний срок :</label>
                                    <input type="date" name="deadlineDate" class="form-control" id="exampleFormControlInput2">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                                    <button type="submit" class="btn btn-primary">Добавить</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="mt-4">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Наименование</th>
                <th scope="col">Крайний срок</th>
                <th scope="col">Выполнено</th>
                <th scope="col">Детали</th>
            </tr>
            </thead>
            <tbody>
                <%
                    ArrayList<Tasks> tasksDo = (ArrayList<Tasks>) request.getAttribute("tasksToDo");
                    if (tasksDo!=null){
                        for(Tasks t : tasksDo){
                %>
                <tr>
                    <td><%=t.getId()%></td>
                    <td><%=t.getName()%></td>
                    <td><%=t.getDeadlineDate()%></td>
                    <td><%=t.getCheck()%></td>
                    <td><a class="btn btn-dark btn-sm" style="background-color: #0e0e49;" href="/details?taskID=<%=t.getId()%>">Детали</a></td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
