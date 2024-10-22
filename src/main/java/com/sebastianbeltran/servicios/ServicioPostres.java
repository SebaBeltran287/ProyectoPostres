package com.sebastianbeltran.servicios;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sebastianbeltran.modelos.Postre;
import com.sebastianbeltran.modelos.Usuario;
import com.sebastianbeltran.repositorios.RepositorioPostres;

@Service
public class ServicioPostres {
	
    @Autowired
    private RepositorioPostres repositorioPostres;

    public List<Postre> obtenerTodosLosPostres() {
        return repositorioPostres.findAll();
    }
    
    public void agregarPostre(Postre postre) {
        repositorioPostres.save(postre);
    }
    
    public Postre obtenerPostrePorId(Long id) {
    	return this.repositorioPostres.findById(id).orElse(null);
    }

    public void actualizarPostre(Long id, Postre postreActualizado) {
        Postre postre = obtenerPostrePorId(id);
        if (postre != null) {
            postre.setNombre(postreActualizado.getNombre());
            postre.setIngredientes(postreActualizado.getIngredientes());
            postre.setInstrucciones(postreActualizado.getInstrucciones());
            postre.setUrlImagen(postreActualizado.getUrlImagen());
            postre.setTiempoPreparacion(postreActualizado.getTiempoPreparacion());
            repositorioPostres.save(postre);
        }
    }
    
    public List<Postre> obtenerPostresPorUsuario(Usuario usuario) {
        return repositorioPostres.findByUsuario(usuario);
    }
    
    public void eliminarPostre(Long id) {
        repositorioPostres.deleteById(id);
    }
}
