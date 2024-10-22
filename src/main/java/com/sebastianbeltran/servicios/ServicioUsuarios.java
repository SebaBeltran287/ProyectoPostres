package com.sebastianbeltran.servicios;

import org.mindrot.jbcrypt.BCrypt;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sebastianbeltran.modelos.Usuario;
import com.sebastianbeltran.repositorios.RepositorioUsuarios;

@Service
public class ServicioUsuarios {
	@Autowired
	private RepositorioUsuarios repositorioUsuarios;
	
	public Usuario obtenerUnoParaLogin(String correo, String contrasenia) {
		Usuario usuario = this.repositorioUsuarios.findOneByCorreo(correo);
		if (usuario == null || !BCrypt.checkpw(contrasenia, usuario.getContrasenia())) {
            return null;
        }
        return usuario;
    }
	
	public Usuario agregarUno(Usuario nuevoUsuario) {
        String contraseniaEncriptada = BCrypt.hashpw(nuevoUsuario.getContrasenia(), BCrypt.gensalt());
        nuevoUsuario.setContrasenia(contraseniaEncriptada);
        return this.repositorioUsuarios.save(nuevoUsuario);
    }
	
	public Usuario obtenerPorId(Long id) {
	    return this.repositorioUsuarios.findById(id).orElse(null);
	}

}
