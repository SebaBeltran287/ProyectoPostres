package com.sebastianbeltran.repositorios;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.sebastianbeltran.modelos.Usuario;

@Repository
public interface RepositorioUsuarios extends CrudRepository<Usuario, Long>{
	Usuario findOneByCorreo(String correo);
}
