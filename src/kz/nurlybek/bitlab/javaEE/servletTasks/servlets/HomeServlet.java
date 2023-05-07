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

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ArrayList<Tasks> tasks = DBManager.getAllTasks();
        req.setAttribute("tasksToDo",tasks);

        req.getRequestDispatcher("/home.jsp").forward(req, resp);

    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

}
