package com.ensah.bo;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Groupe {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idGroupe;
    @NotBlank(message = "champs important!")
    @Column(unique=true)
    private String nom;

    @OneToMany(mappedBy = "grpC", cascade = {CascadeType.PERSIST,CascadeType.MERGE}, fetch = FetchType.EAGER)
    private List<Contact> contacts = new ArrayList<Contact>();


    public Groupe() {
    }

    public Groupe(Long idGroupe, String nom, List<Contact> contacts) {
        this.idGroupe = idGroupe;
        this.nom = nom;
        this.contacts = contacts;
    }

    public Long getIdGroupe() {
        return idGroupe;
    }

    public void setIdGroupe(Long idGroupe) {
        this.idGroupe = idGroupe;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public List<Contact> getContacts() {
        return contacts;
    }

    public void setContacts(List<Contact> contacts) {
        this.contacts = contacts;
    }

    @Override
    public String toString() {
        String Strings="Groupe{" +
                "idGroupe=" + idGroupe +
                ", nom='" + nom + '\'' +
                ", contact= '}";
        for(Contact c:contacts){
            Strings+=c.toString();
        }
        return Strings;
    }
}
