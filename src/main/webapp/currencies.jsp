<%@page import="java.math.BigDecimal"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page
    import="java.util.*, java.text.*, com.epam.rd.jsp.currencies.CurrenciesOfCurrentTestCase"%>

<jsp:useBean id="currencies"
    class="com.epam.rd.jsp.currencies.CurrenciesOfCurrentTestCase"
    scope="request" />
<html>
    <style>
        body {
            font-family: "Courier New", serif;
            font-size: 16pt;
        }
    </style>
    <body>
        <h1>Currencies</h1>
        <% Collection<String> curs = currencies.getCurrencies(); %>
        <ul>
            <% for (String entry : curs){ %>
                <p><%= entry %></p>
            <% } %>
        </ul>
    </body>
</html>