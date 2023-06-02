package com.ensah.bo;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Entity
public class Contact {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idContact;

    @NotBlank(message = "champs important!")
    private String nom;

    @NotBlank(message = "champs important!")
    private String prenom;

    @NotBlank(message = "champs important!")
    @Column(unique=true)
    @Pattern(regexp = "^(06|07)\\d{8}$", message = "numero de telphone: 06/07 + 8 chiffres")
    private String telephonePersonnel;

    @Pattern(regexp = "^(06|07)\\d{8}$", message = "numero de telphone: 06/07 + 8 chiffres")
    private String telephoneProfessionel;

    private String adresse;

    @Email(message = "Entrer un email personnel valide")
    private String emailPersonnel;

    @Email(message = "Entrer un email professionel valide")
    private String emailProfessionel;

    private String genre;

    @ManyToOne(cascade = {CascadeType.PERSIST,CascadeType.MERGE})
    @JoinColumn(name = "contactGroupId")
    private Groupe grpC;


    public Contact() {
    }

    public Contact(Long idContact, String nom, String prenom, String telephonePersonnel, String telephoneProfessionel, String adresse, String emailPersonnel, String emailProfessionel, String genre,Groupe grpC) {
        this.idContact = idContact;
        this.nom = nom;
        this.prenom = prenom;
        this.telephonePersonnel = telephonePersonnel;
        this.telephoneProfessionel = telephoneProfessionel;
        this.adresse = adresse;
        this.emailPersonnel = emailPersonnel;
        this.emailProfessionel = emailProfessionel;
        this.genre = genre;
        this.grpC = grpC;
    }

    @Override
    public String toString() {
        return "Contact{" +
                "idContact=" + idContact +
                ", nom='" + nom + '\'' +
                ", prenom='" + prenom + '\'' +
                ", telephonePersonnel='" + telephonePersonnel + '\'' +
                ", telephoneProfessionel='" + telephoneProfessionel + '\'' +
                ", adresse='" + adresse + '\'' +
                ", emailPersonnel='" + emailPersonnel + '\'' +
                ", emailProfessionel='" + emailProfessionel + '\'' +
                ", genre='" + genre + '\''+
                ", groupe='" + grpC.getNom() + '\'';
    }

    public Long getIdContact() {
        return idContact;
    }

    public void setIdContact(Long idContact) {
        this.idContact = idContact;
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

    public String getTelephonePersonnel() {
        return telephonePersonnel;
    }

    public void setTelephonePersonnel(String telephonePersonnel) {
        this.telephonePersonnel = telephonePersonnel;
    }

    public String getTelephoneProfessionel() {
        return telephoneProfessionel;
    }

    public void setTelephoneProfessionel(String telephoneProfessionel) {
        this.telephoneProfessionel = telephoneProfessionel;
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

    public String getEmailProfessionel() {
        return emailProfessionel;
    }

    public void setEmailProfessionel(String emailProfessionel) {
        this.emailProfessionel = emailProfessionel;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public Groupe getGrpC() {
        return grpC;
    }

    public void setGrpC(Groupe grpC) {
        this.grpC = grpC;
    }
}
