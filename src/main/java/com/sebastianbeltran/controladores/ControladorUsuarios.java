package com.sebastianbeltran.controladores;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.sebastianbeltran.modelos.LoginUsuario;
import com.sebastianbeltran.modelos.Usuario;
import com.sebastianbeltran.servicios.ServicioUsuarios;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorUsuarios {
    @Autowired
    private ServicioUsuarios servicioUsuarios;
    
    @GetMapping("/")
    public String desplegaLogin(@ModelAttribute LoginUsuario loginUsuario) {
        return "login.jsp";
    }
    
    @GetMapping("/cerrar_sesion")
    public String procesaCerrarSesion(HttpSession sesion) {
        sesion.invalidate();
        return "redirect:/";
    }
    
    @GetMapping("/registro")
    public String desplegarRegistro(@ModelAttribute Usuario usuario) {
        return "registro.jsp";
    }
    
    @PostMapping("/procesa/registro")
    public String agregarUsuario(@Valid @ModelAttribute Usuario usuario,
                                 BindingResult validaciones,
                                 HttpSession sesion) {
        if (!usuario.getContrasenia().equals(usuario.getConfirmarContrasenia())) {
            validaciones.rejectValue("confirmarContrasenia", "error.confirmarContrasenia", "Las contraseñas no coinciden");
        }
        if (validaciones.hasErrors()) {
            return "registro.jsp";
        }
        usuario = this.servicioUsuarios.agregarUno(usuario);
        sesion.setAttribute("id_usuario", usuario.getId());
        sesion.setAttribute("nombre_usuario", usuario.getNombre() + " " + usuario.getApellido());
        return "redirect:/inicio";
    }
    
    @PostMapping("/procesa/login")
    public String procesaLogin(@Valid @ModelAttribute LoginUsuario loginUsuario,
                               BindingResult validaciones, HttpSession sesion) {
        Usuario usuarioActual = this.servicioUsuarios.obtenerUnoParaLogin(loginUsuario.getCorreo(), loginUsuario.getContrasenia());
        if (usuarioActual == null) {
            validaciones.rejectValue("contrasenia", "contraseniaNoCoincide", "Credenciales incorrectas");
        }
        if (validaciones.hasErrors()) {
            return "login.jsp";
        }
        sesion.setAttribute("id_usuario", usuarioActual.getId());
        sesion.setAttribute("nombre_usuario", usuarioActual.getNombre() + " " + usuarioActual.getApellido());
        return "redirect:/inicio";
    }
}
