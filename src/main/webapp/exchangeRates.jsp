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
        <%! String sourceCurrency; %>
        <% sourceCurrency = request.getParameter("from"); %>
        <h1>Exchange Rates for <%=sourceCurrency%></h1>
        <ul>
            <%! Map<String, BigDecimal> exchangeRates; %>
            <% exchangeRates = currencies.getExchangeRates(sourceCurrency); 
            for(Map.Entry<String,BigDecimal> entry : exchangeRates.entrySet()){
                if (!entry.getKey().equals(sourceCurrency)){%>
                    <p>1 <%= sourceCurrency %> = <%= entry.getValue() %> <%= entry.getKey()%></p>
                <% } %>   
            <%}%>
        </ul>
    </body>
</html>