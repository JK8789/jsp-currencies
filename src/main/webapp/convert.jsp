<%@page import="java.math.BigDecimal"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.text.*, com.epam.rd.jsp.currencies.CurrenciesOfCurrentTestCase" %>

<jsp:useBean id="currencies" class="com.epam.rd.jsp.currencies.CurrenciesOfCurrentTestCase" scope="request"/>
<html>
    <style>
        body {
            font-family: "Courier New", serif;
            font-size: 16pt;
        }
    </style>
    <body>
        <%! BigDecimal amount; %>
        <% amount = new BigDecimal(request.getParameter("amount")); %>
        <%! String sourceCurrency; %>
        <% sourceCurrency = request.getParameter("from"); %>
        <%! String targetCurrency; %>
        <% targetCurrency = request.getParameter("to"); %>
        <%! BigDecimal targetAmount; %>
        <% targetAmount = currencies.convert(amount, sourceCurrency, targetCurrency); %>
        <h1>Converting <%= sourceCurrency %> to <%= targetCurrency %></h1>
        <p><%= amount %> <%= sourceCurrency %> = <%= targetAmount %> <%= targetCurrency %></p>
    </body>
</html>