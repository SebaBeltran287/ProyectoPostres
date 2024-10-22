package com.sebastianbeltran.repositorios;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.sebastianbeltran.modelos.Postre;
import com.sebastianbeltran.modelos.Usuario;

@Repository
public interface RepositorioPostres extends CrudRepository<Postre, Long>{
	List<Postre> findAll();
	List<Postre> findByUsuario(Usuario usuario);
}
