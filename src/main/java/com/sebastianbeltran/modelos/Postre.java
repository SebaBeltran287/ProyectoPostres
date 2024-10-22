package com.sebastianbeltran.modelos;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="postres")
public class Postre {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@NotBlank(message = "Por favor proporciona el nombre")
    @Size(min = 5, message = "El nombre debe de tener al menos 5 caracteres")
    @Column(unique = true)
    private String nombre;

    @NotBlank(message = "Por favor proporciona los ingredientes")
    @Size(min = 10, message = "El campo de ingredientes debe de tener al menos 10 caracteres")
    private String ingredientes;

    @NotBlank(message = "Por favor proporciona las instrucciones")
    @Size(min = 10, message = "El campo de instrucciones debe de tener al menos 10 caracteres")
    private String instrucciones;

    @NotBlank(message = "Por favor proporciona una URL válida con la imagen")
    @Pattern(regexp = ".*\\.(jpg|jpeg|png|gif)$", message = "La URL de la imagen debe de terminar con un formato de imagen válido (jpg, jpeg, png, gif)")
    private String urlImagen;
    
    @NotNull(message = "Por favor proporciona el tiempo de preparación")
    private Integer tiempoPreparacion;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "usuario_id")
    private Usuario usuario;
    
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="fecha_creacion")
	private Date fechaCreacion;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="fecha_actualizacion")
	private Date fechaActualizacion;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getIngredientes() {
		return ingredientes;
	}

	public void setIngredientes(String ingredientes) {
		this.ingredientes = ingredientes;
	}

	public String getInstrucciones() {
		return instrucciones;
	}

	public void setInstrucciones(String instrucciones) {
		this.instrucciones = instrucciones;
	}

	public String getUrlImagen() {
		return urlImagen;
	}

	public void setUrlImagen(String urlImagen) {
		this.urlImagen = urlImagen;
	}

	public Integer getTiempoPreparacion() {
		return tiempoPreparacion;
	}

	public void setTiempoPreparacion(Integer tiempoPreparacion) {
		this.tiempoPreparacion = tiempoPreparacion;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Date getFechaCreacion() {
		return fechaCreacion;
	}

	public void setFechaCreacion(Date fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}

	public Date getFechaActualizacion() {
		return fechaActualizacion;
	}

	public void setFechaActualizacion(Date fechaActualizacion) {
		this.fechaActualizacion = fechaActualizacion;
	}
	
	@PrePersist
	protected void onCreate() {
		this.fechaCreacion = new Date();
		this.fechaActualizacion = this.fechaCreacion;
	}
	
	@PreUpdate
	protected void onUpdate() {
		this.fechaActualizacion = new Date();
	}
}
