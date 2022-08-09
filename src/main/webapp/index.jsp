<%@ page import="java.util.ArrayList" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>

<body>
<div class="container mt-4">
    <h3>Nombres de aves</h3>
    <form action="index.jsp" method="post">
        <div class="row">
            <div class="form-group col-6">
                <input type="number" class="form-control" name="numero" placeholder="Ingrese numero de las aves a introducir...">
            </div>
            <div class="col-2">
                <button type="submit" name="enviar" class="btn btn-primary">Enviar</button>
            </div>
        </div>
    </form>
    <!-- Part 1 -->
    <c:if test="${param.enviar != null}">
        <h4>Ingrese el nombre de las aves</h4>
            <form action="index.jsp" method="post">
                <div class="row">
                    <c:forEach var = "i" begin = "1" end = "${param.numero}">
                        <div class="col-3 py-1">
                            <input type="text" name="ave" class="form-control" placeholder="Ave ${i}">
                        </div>
                    </c:forEach>
                </div>
                <button type="submit" name="ordenar" class="btn btn-primary my-3">Ordenar</button>
            </form>
    </c:if>
    <!-- Part 2 -->
    <c:if test="${param.ordenar != null}">
        <%
            String [] arrayAve = request.getParameterValues("ave");
            //Ojo que hay que usar java utils
            if(arrayAve != null){
                java.util.Arrays.sort(arrayAve);
                // Le pasamos la variable a JSTL con esta baina
                request.setAttribute("arrayAve",arrayAve);
            }
        %>
        <div class="container">
            <ul class="list-group row">
                <c:forEach var = "item"  items="${arrayAve}">
                    <li class="list-group-item col-5">${item}</li>
                </c:forEach>
            </ul>
        </div>
    </c:if>
</div>
</body>