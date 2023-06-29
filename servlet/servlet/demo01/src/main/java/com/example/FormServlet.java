package com.example;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FormServlet")
public class FormServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String message = request.getParameter("message");
        String gender = request.getParameter("gender");
        String[] hobbies = request.getParameterValues("hobbies");
        String fruit = request.getParameter("fruit");

        out.println("<html>");
        out.println("<head>");
        out.println("<title>Form Submission Result</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>Form Submission Result</h1>");
        out.println("<p>Name: " + name + "</p>");
        out.println("<p>Password: " + password + "</p>");
        out.println("<p>Message: " + message + "</p>");
        out.println("<p>Gender: " + gender + "</p>");
        out.println("<p>Hobbies:");
        if (hobbies != null) {
            for (String hobby : hobbies) {
                out.println(" " + hobby);
            }
        } else {
            out.println(" None");
        }
        out.println("</p>");
        out.println("<p>Fruit: " + fruit + "</p>");
        out.println("</body>");
        out.println("</html>");
    }
}