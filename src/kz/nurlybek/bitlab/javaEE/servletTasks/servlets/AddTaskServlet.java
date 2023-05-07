package kz.nurlybek.bitlab.javaEE.servletTasks.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.nurlybek.bitlab.javaEE.servletTasks.database.DBManager;
import kz.nurlybek.bitlab.javaEE.servletTasks.database.Tasks;


import java.io.IOException;

@WebServlet("/addTask")
public class AddTaskServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String deadlineDate = req.getParameter("deadlineDate");
        String check = "No";

        Tasks t = new Tasks();
        t.setName(name);
        t.setDescription(description);
        t.setDeadlineDate(deadlineDate);
        t.setCheck(check);
        DBManager.addTask(t);

        resp.sendRedirect("/home");
    }
}
