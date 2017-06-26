<%-- 
    Document   : newjsp
    Created on : 26-06-2017, 1:47:58
    Author     : Willywes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table class="uk-table uk-table-striped uk-table-small uk-table-hover">
            <thead>
                <tr>
                    <th>RUT</th>
                    <th>Nombre</th>
                    <th>F. de Nacimiento</th>
                    <th>Teléfono</th>
                    <th>EMail</th>
                    <th>Solicitudes</th>
                </tr>
            </thead>
            <tbody>

                <tr>
                    <td>12345678-9</td>
                    <td>ALEJANDRO CLIENTE1 MATERNO</td>
                    <td>01 de junio del 1990</td>
                    <td>321654987</td>
                    <td>alejandro@gmail.com</td>
                    <td>
                        <button  type='submit'  uk-toggle="target: #mod1" class='uk-button uk-button-primary uk-button-small' data-uk-tooltip title='Ver (2) Solicitudes'><span uk-icon='icon: search'></span></i> (2)</button>
                    </td>
                    <td>
                        <a target='_blank' href='tel:+321654987' class='uk-button uk-button-primary uk-button-small' data-uk-tooltip title='Llamar a Cliente'style='background-color : orange;'><span uk-icon='icon: phone'></span></i>
                        </a>&nbsp;
                        <a target='_blank' href='mailto:alejandro@gmail.com'class='uk-button uk-button-primary uk-button-small' data-uk-tooltip title='Enviar E-Mail a Cliente'style='background-color : green;'><span uk-icon='icon: mail'></span></i>
                        </a>
                    </td>
                </tr>
                
            <div id="mod1" uk-modal>
                <div class="uk-modal-dialog uk-modal-body">
                    <h2 class="uk-modal-title"></h2>
                    <button class="uk-modal-close-default uk-close uk-icon" type="button"><span uk-icon="icon: close"></span></button>
                    <h2>Solicitudes del Cliente ALEJANDRO CLIENTE1 MATERNO</h2>
                    <table class='uk-table uk-table-striped uk-table-small uk-table-hover'>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>FECHA SOLi.</th>
                                <th>ESTADO</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>01 de junio del 2017</td>
                                <td>PENDIENTE</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>01 de junio del 2017</td>
                                <td>RECHAZADA</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>


        </tbody>


    </table>
</body>
</html>
