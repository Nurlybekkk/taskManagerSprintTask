package kz.nurlybek.bitlab.javaEE.servletTasks.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.nurlybek.bitlab.javaEE.servletTasks.database.DBManager;
import kz.nurlybek.bitlab.javaEE.servletTasks.database.Tasks;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/deleteTask")
public class DeleteTaskServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Long id = Long.parseLong(req.getParameter("task_id"));
        DBManager.deleteTask(id);

        resp.sendRedirect("/home");

    }

}
