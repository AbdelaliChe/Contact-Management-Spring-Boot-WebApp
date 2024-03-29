package com.ensah.core.service;

import com.ensah.core.bo.Contact;
import com.ensah.core.bo.Groupe;

import java.util.List;

public interface IGroupeService {
    public void creeGroupe(Groupe gGroupe);

    public void modifierGroupe(Groupe gGroupe);

    public List<Groupe> afficherGroupe();

    public void supprimerGroupe(Long id);

    public List<Groupe> RechercheParNom(String nom);

    public Groupe getGroupeById(Long id);

    public Groupe getGroupeByNom(String nom);

    public void creeGroupeByContactNom(Contact contact);

    public void supprimerAffectation(Contact contact);

    public void ajouterAffectation(Contact contact,Long id);

    public List<Contact> getContactsOfGroupe(Groupe groupe);

    public Long getRowCount();
}
