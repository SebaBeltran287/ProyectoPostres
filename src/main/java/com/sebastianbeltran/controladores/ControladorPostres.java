package com.sebastianbeltran.controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import com.sebastianbeltran.modelos.Postre;
import com.sebastianbeltran.modelos.Usuario;
import com.sebastianbeltran.servicios.ServicioPostres;
import com.sebastianbeltran.servicios.ServicioUsuarios;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class ControladorPostres {
	@Autowired
    private ServicioPostres servicioPostres;
	
	@Autowired
	private ServicioUsuarios servicioUsuarios;
	
    @GetMapping("/inicio")
    public String desplegarInicio(Model modelo, HttpSession sesion) {
        if (sesion.getAttribute("id_usuario") == null) {
            return "redirect:/";
        }
        modelo.addAttribute("postres", this.servicioPostres.obtenerTodosLosPostres());
        modelo.addAttribute("nombre_usuario", sesion.getAttribute("nombre_usuario"));
        return "inicio.jsp";
    }
    
    @GetMapping("/formulario/agregarPostre")
    public String formularioAgregarPostre(Model modelo, HttpSession sesion) {
        if (sesion.getAttribute("id_usuario") == null) {
            return "redirect:/";
        }
        modelo.addAttribute("postre", new Postre());
        return "agregarPostre.jsp";
    }
    
    @PostMapping("/procesa/postre")
    public String procesarAgregarPostre(@Valid @ModelAttribute Postre postre,
                                        BindingResult validaciones,
                                        HttpSession sesion) {
        if (sesion.getAttribute("id_usuario") == null) {
            return "redirect:/";
        }
        if (validaciones.hasErrors()) {
            return "agregarPostre.jsp";
        }
        Long idUsuario = (Long) sesion.getAttribute("id_usuario");
        Usuario usuario = servicioUsuarios.obtenerPorId(idUsuario);
        postre.setUsuario(usuario);
        this.servicioPostres.agregarPostre(postre);
        return "redirect:/inicio";
    }
    
    @GetMapping("/formulario/editar/postre/{id}")
    public String desplegarFormularioEditar(@PathVariable Long id, Model modelo, 
    										HttpSession sesion) {
        if (sesion.getAttribute("id_usuario") == null) {
            return "redirect:/";
        }
    	Postre postre = this.servicioPostres.obtenerPostrePorId(id);
        modelo.addAttribute("postre", postre);
        return "editarPostre.jsp";
    }
    
    @PutMapping("/actualizar/postre/{id}")
    public String procesarEdicionPostre(@PathVariable Long id, 
                                        @Valid @ModelAttribute("postre") Postre postreActualizado, 
                                        BindingResult validaciones, Model modelo, 
                                        HttpSession sesion) {
        if (sesion.getAttribute("id_usuario") == null) {
            return "redirect:/";
        }
        if (validaciones.hasErrors()) {
            modelo.addAttribute("postre", postreActualizado);
            return "editarPostre.jsp";
        }
        servicioPostres.actualizarPostre(id, postreActualizado);
        return "redirect:/inicio";
    }
    
    @GetMapping("/misPostres")
    public String mostrarMisPostres(Model modelo, HttpSession sesion) {
        Long idUsuario = (Long) sesion.getAttribute("id_usuario");
        if (idUsuario == null) {
            return "redirect:/";
        }
        Usuario usuario = servicioUsuarios.obtenerPorId(idUsuario);
        List<Postre> misPostres = servicioPostres.obtenerPostresPorUsuario(usuario);
        modelo.addAttribute("postres", misPostres);
        modelo.addAttribute("nombre_usuario", usuario.getNombre());

        return "misPostres.jsp";
    }
    
    @GetMapping("misPostres/detalle/{id}")
    public String mostrarDetallesPostre(@PathVariable Long id, Model modelo, HttpSession sesion) {
        Long idUsuario = (Long) sesion.getAttribute("id_usuario");
        if (idUsuario == null) {
            return "redirect:/";
        }
        Postre postre = servicioPostres.obtenerPostrePorId(id);
        modelo.addAttribute("postre", postre);
        return "detallePostre.jsp";
    }
    
    @DeleteMapping("/eliminarPostre/{id}")
    public String eliminarPostre(@PathVariable Long id) {
        this.servicioPostres.eliminarPostre(id);
        return "redirect:/misPostres";
    }
}
