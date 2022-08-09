<%@ page import="java.util.Collection" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.lang.reflect.Array" %>
<%@ page import="java.util.Arrays" %>
<%@ include file="common/header.jspf" %>
<%@ include file="common/navigation.jspf" %>
<body>
    <div class="container mt-4">

        <h3>Empresa Simon S.A</h3>
        <form action="empresaSimon.jsp" method="post">
            <div class="row">
                <div class="form-group col-6">
                    <input type="number" class="form-control" name="numero" placeholder="Ingrese numero de trabajadores a introducir...">
                </div>
                <div class="col-2">
                    <button type="submit" name="enviar" class="btn btn-primary">Enviar</button>
                </div>
            </div>
        </form>

        <c:set var="cantTrabajadores" scope="session" value="${param.numero}"/>
        <c:if test="${param.enviar != null}">
            <form action="empresaSimon.jsp" method="post">
                <c:forEach var="i" begin="1" end="${cantTrabajadores}">
                    <h4>Trabajador ${i}</h4>
                    <div class="form-group row">
                        <input type="text" name="trabajador${i}" class="form-control col-1 ml-2" placeholder="Lunes ${i}">
                        <input type="text" name="trabajador${i}" class="form-control col-1 ml-2" placeholder="Martes ${i}">
                        <input type="text" name="trabajador${i}" class="form-control col-1 ml-2" placeholder="Miercoles ${i}">
                        <input type="text" name="trabajador${i}" class="form-control col-1 ml-2" placeholder="Jueves ${i}">
                        <input type="text" name="trabajador${i}" class="form-control col-1 ml-2" placeholder="Viernes ${i}">
                        <input type="text" name="trabajador${i}" class="form-control col-1 ml-2" placeholder="Sabado ${i}">
                    </div>
                </c:forEach>
                <button type="submit" name="calcular" class="btn btn-primary my-3">Calcular</button>
            </form>
        </c:if>

        <c:if test="${param.calcular != null}">
            <%
                int counter = 1;
                ArrayList<Double> trabajadores = new ArrayList<Double>();
            %>
            <c:forEach var="i" begin="1" end="${cantTrabajadores}">
                <%
                    String[] datos = request.getParameterValues("trabajador"+counter);
                    //Se convierte a double y suma
                    Double total = Arrays.stream(datos)
                            .mapToDouble(Double::parseDouble).sum();
                    counter++;
                %>
                <h2><%=total%></h2>
            </c:forEach>
        </c:if>

    </div>
</body>