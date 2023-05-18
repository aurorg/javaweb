<%--
  Created by IntelliJ IDEA.
  User: shizhanli
  Date: 2023/5/18
  Time: 下午7:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Form Example</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        form {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        label {
            display: block;
            margin-bottom: 10px;
        }
        input[type="text"],
        input[type="password"],
        textarea,
        select {
            display: block;
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
            font-size: 16px;
            margin-bottom: 20px;
            resize: none;
        }
        input[type="radio"],
        input[type="checkbox"] {
            margin-right: 10px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="file"] {
            margin-top: 10px;
        }
    </style>
</head>
<body>
<form action="FormServlet" method="post">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name">

    <label for="password">Password:</label>
    <input type="password" id="password" name="password">

    <label for="message">Message:</label>
    <textarea id="message" name="message"></textarea>

    <label>Gender:</label>
    <input type="radio" id="gender-male" name="gender" value="male">
    <label for="gender-male">Male</label>
    <input type="radio" id="gender-female" name="gender" value="female">
    <label for="gender-female">Female</label>

    <label>Hobbies:</label>
    <input type="checkbox" id="hobby-reading" name="hobbies" value="reading">
    <label for="hobby-reading">Reading</label>
    <input type="checkbox" id="hobby-sports" name="hobbies" value="sports">
    <label for="hobby-sports">Sports</label>
    <input type="checkbox" id="hobby-music" name="hobbies" value="music">
    <label for="hobby-music">Music</label>

    <label for="fruit">Fruit:</label>
    <select id="fruit" name="fruit">
        <option value="apple">Apple</option>
        <option value="banana">Banana</option>
        <option value="orange">Orange</option>
    </select>

    <label for="file">File:</label>
    <input type="file" id="file" name="file">

    <input type="submit" value="Submit">
</form>
</body>
</html>