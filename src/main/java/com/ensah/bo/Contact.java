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
    @Pattern(regexp = "^06\\d{8}$", message = "numero de telphone commence par 06 + 8 chiffres")
    private String telephonePeronnel;

    @Pattern(regexp = "^06\\d{8}$", message = "numero de telphone commence par 06 + 8 chiffres")
    private String telephoneProfessionel;

    @NotBlank(message = "champs important!")
    private String adresse;

    @Email(message = "Entrer un email personnel")
    @Pattern(regexp = "^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$", message = "email : exemple@gmail.com")
    @NotBlank(message = "champs important!")
    private String emailPeronnel;

    @Email(message = "Entrer un email professionel")
    @Pattern(regexp = "^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$", message = "email : exemple@gmail.com")
    private String emailProfessionel;

    @NotBlank(message = "This field is required")
    private String genre;

    @ManyToOne(cascade = {CascadeType.PERSIST,CascadeType.MERGE})
    @JoinColumn(name = "GroupContactId")
    private Groupe grpC;

    public Contact() {
    }

    public Contact(Long idContact, String nom, String prenom, String telephonePeronnel, String telephoneProfessionel, String adresse, String emailPeronnel, String emailProfessionel, String genre, Groupe contactGroupId) {
        this.idContact = idContact;
        this.nom = nom;
        this.prenom = prenom;
        this.telephonePeronnel = telephonePeronnel;
        this.telephoneProfessionel = telephoneProfessionel;
        this.adresse = adresse;
        this.emailPeronnel = emailPeronnel;
        this.emailProfessionel = emailProfessionel;
        this.genre = genre;
    }

    @Override
    public String toString() {
        return "Contact{" +
                "idContact=" + idContact +
                ", nom='" + nom + '\'' +
                ", prenom='" + prenom + '\'' +
                ", telephonePeronnel='" + telephonePeronnel + '\'' +
                ", telephoneProfessionel='" + telephoneProfessionel + '\'' +
                ", adresse='" + adresse + '\'' +
                ", emailPeronnel='" + emailPeronnel + '\'' +
                ", emailProfessionel='" + emailProfessionel + '\'' +
                ", genre='" + genre + '\'' ;
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

    public String getTelephonePeronnel() {
        return telephonePeronnel;
    }

    public void setTelephonePeronnel(String telephonePeronnel) {
        this.telephonePeronnel = telephonePeronnel;
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

    public String getEmailPeronnel() {
        return emailPeronnel;
    }

    public void setEmailPeronnel(String emailPeronnel) {
        this.emailPeronnel = emailPeronnel;
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
