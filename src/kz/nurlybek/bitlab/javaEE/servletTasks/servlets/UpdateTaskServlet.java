package kz.nurlybek.bitlab.javaEE.servletTasks.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.nurlybek.bitlab.javaEE.servletTasks.database.DBManager;
import kz.nurlybek.bitlab.javaEE.servletTasks.database.Tasks;


import java.io.IOException;

@WebServlet("/updateTask")
public class UpdateTaskServlet extends HttpServlet{
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Long id = Long.parseLong(req.getParameter("task_id"));
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String deadlineDate = req.getParameter("deadlineDate");
        String check = req.getParameter("check");

        Tasks ta = DBManager.getTask(id);
        if (ta != null){
            ta.setName(name);
            ta.setDescription(description);
            ta.setDeadlineDate(deadlineDate);
                ta.setCheck(check);
            DBManager.updateTask(ta);

            resp.sendRedirect("/home");
        }
        else {
            resp.sendRedirect("/");
        }

    }
}
