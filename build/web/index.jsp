<%-- 
    Document   : index
    Created on : 29/09/2021, 20:56:53
    Author     : Lenovo FX
--%>

<%@page import="modelo.Cliente"%>
<%@page import="java.util.HashMap"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <title>Empleados DB</title>
    </head>
    <body>
        <h1 align="center">Formulario Clientes</h1>
        
        <div class="container">
            
             <form action="sr_cliente" method="post" class="form-group">
                <label for="lbl_id"><b>ID</b></label>
                <input type="text" name="txt_id" id="txt_id" class="form-control" value="0" readonly>
                <label for="lbl_nit"><b>Nit</b></label>
                <input type="text" name="txt_nit" id="txt_nit" class="form-control" placeholder="Ej: 15478-3 ó C/F">
                <label for="lbl_nombres"><b>Nombres</b></label>
                <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Nombre1 Nombre2">
                <label for="lbl_apellidos"><b>Apellido</b></label>
                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Apellido1 Apellido2">
                <label for="lbl_direccion"><b>Dirección</b></label>
                <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Av. 123, Adress Anywhere, Street Wherever">
                <label for="lbl_telefono"><b>Telefono</b></label>
                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ej: 30518836">
                <label for="lbl_fn"><b>F. Nacimiento</b></label>
                <input type="date" name="txt_fn" id="txt_fn" class="form-control" placeholder="YYYY-MM-DD">
                <br>
                <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary">Agregar</button>
                <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success">Modificar</button>
                <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false">Eliminar</button>                   
             </form>
                <br>
      
            <table class="table table-hover table-dark">
                <thead>
                  <tr>
                      <th scope="col">#</th>
                    <th scope="col">Nit</th>
                    <th scope="col">Nombres</th>
                    <th scope="col">Apellidos</th>
                    <th scope="col">Dirección</th>
                    <th scope="col">Teléfono</th>
                    <th scope="col">Nacimiento</th>
                  </tr>
                </thead>
                <tbody id="tbl_clientes">
                    <%
                      Cliente cliente = new Cliente();
                      DefaultTableModel tabla = new DefaultTableModel();
                      tabla = cliente.leer();
                      for (int t = 0; t < tabla.getRowCount(); t++) {
                        out.println("<tr data-id=" + tabla.getValueAt(t, 0) +">");
                            out.println("<td>" + t + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                        out.println("</tr>");
                      }
                    %>
                  
                </tbody>
            </table>
        </div>
    <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
    <script type="text/javascript">
    
        $('#tbl_clientes').on('click','tr td',function(evt){
            var target,id,nit,nombres,apellidos,direccion,telefono,nacimiento;
            target = $(event.target);
            id = target.parent().data('id');
            nit = target.parent("tr").find("td").eq(1).html();
            nombres = target.parent("tr").find("td").eq(2).html();
            apellidos = target.parent("tr").find("td").eq(3).html();
            direccion = target.parent("tr").find("td").eq(4).html();
            telefono = target.parent("tr").find("td").eq(5).html();
            nacimiento = target.parent("tr").find("td").eq(6).html();
            
            $("#txt_id").val(id);
            $("#txt_nit").val(nit);
            $("#txt_nombres").val(nombres);
            $("#txt_apellidos").val(apellidos);
            $("#txt_direccion").val(direccion);
            $("#txt_telefono").val(telefono);
            $("#txt_fn").val(nacimiento);

        });
    </script>
    
    </body>
</html>
