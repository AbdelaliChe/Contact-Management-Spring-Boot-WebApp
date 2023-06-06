package com.ensah.core.bo;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idUser;

	@NotBlank(message = "champs important!")
	private String nom;

	@NotBlank(message = "champs important!")
	private String prenom;

	@NotBlank(message = "champs important!")
	@Column(unique = true)
	@Pattern(regexp = "^(06|07)\\d{8}$", message = "numero de telphone: 06/07 + 8 chiffres")
	private String telephone;


	private String adresse;

	@NotBlank(message = "champs important!")
	@Email(message = "Entrer un email personnel valide")
	private String emailPersonnel;

	private String genre;

	@NotBlank(message = "champs important!")
	private String motDePasse;

	public User() {
	}

	public User(Long idUser, String nom, String prenom, String telephone, String adresse, String emailPersonnel, String genre, String motDePasse) {
		this.idUser = idUser;
		this.nom = nom;
		this.prenom = prenom;
		this.telephone = telephone;
		this.adresse = adresse;
		this.emailPersonnel = emailPersonnel;
		this.genre = genre;
		this.motDePasse = motDePasse;
	}

	public Long getIdUser() {
		return idUser;
	}

	public void setIdUser(Long idUser) {
		this.idUser = idUser;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getEmailPersonnel() {
		return emailPersonnel;
	}

	public void setEmailPersonnel(String emailPersonnel) {
		this.emailPersonnel = emailPersonnel;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getMotDePasse() {
		return motDePasse;
	}

	public void setMotDePasse(String motDePasse) {
		this.motDePasse = motDePasse;
	}

	@Override
	public String toString() {
		return "User{" +
				"idUser=" + idUser +
				", nom='" + nom + '\'' +
				", prenom='" + prenom + '\'' +
				", telephone='" + telephone + '\'' +
				", adresse='" + adresse + '\'' +
				", emailPersonnel='" + emailPersonnel + '\'' +
				", genre='" + genre + '\'' +
				", motDePasse='" + motDePasse + '\'' +
				'}';
	}
}
