
import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.dao.ClienteDAO;
import model.dao.PersonalDAO;
import model.dao.TipoUsuarioDAO;
import model.dto.ClienteDTO;
import model.dto.PersonalDTO;
import model.dto.SolicitudDTO;
import model.dto.TipoUsuarioDTO;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Willywes
 */
public class Main {

    public static void main(String[] args) {

//        List<TipoPersonalDTO> lista = new TipoUsuarioDAO().listarTodos();
//
//        for (TipoUsuarioDTO item : lista) {
//            System.out.println("id " + item.getId() + " - Nombre " + item.getNombre());
//        }
        // prubas personal
//        PersonalDTO personal = new PersonalDTO(1, 16483941, "9","1234", "IRON", "MAN", "SUPER", 322959896, "alejandro@gmail.com", true, new TipoUsuarioDAO().buscarPorId(2));
//
//        if (new PersonalDAO().modificar(personal)) {
//            System.out.println("Se modifico Correctamente");
//        } else {
//            System.out.println("No se modifico");
//        }
        PersonalDTO per = new PersonalDAO().buscarPorId(1);
        System.out.println(per.toString());
         List<PersonalDTO> lista3 = new PersonalDAO().leerTodos();
         
         for (PersonalDTO personalDTO : lista3) {
             System.out.println(personalDTO.toString());
        }
// PRUEBAS PERSONAL OK =)
// pruebas cliente
//        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
//        java.util.Date date = null;
//        try {
//            date = dateFormat.parse("11/12/1990");
//        } catch (ParseException ex) {
//            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        long time = date.getTime();
//
//        ClienteDTO cli = new ClienteDTO(1, 12345678, "K", "1234", new Timestamp(time), "super", "girl", "materno", " femenino", "MI CASA", 322959897, "cliente@gmail.com");
//
//        if (new ClienteDAO().modificar(cli)) {
//            System.out.println("Si agrego");
//        } else {
//            System.out.println("no agregó");
//        }

//           ClienteDTO clie = new ClienteDAO().buscarPorId(1);
//           System.out.println(clie.toString());
           
//          List<ClienteDTO> lis = new ClienteDAO().leerTodos();
//          
//          for (ClienteDTO li : lis) {
//              System.out.println(li.toString());
//        }

// CCLASEE CLIENTE OK P

   
      

    }
}
