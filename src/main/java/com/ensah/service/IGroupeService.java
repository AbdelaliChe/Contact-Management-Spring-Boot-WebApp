package com.ensah.service;

import com.ensah.bo.Contact;
import com.ensah.bo.Groupe;

import java.util.List;

public interface IGroupeService {
    public void creeGroupe(Groupe gGroupe);

    public void modifierGroupe(Groupe gGroupe);

    public List<Groupe> afficherGroupe();

    public void supprimerGroupe(Long id);

    public List<Groupe> RechercheParNom(String nom);

    public Groupe getGroupeById(Long id);

    public Groupe getGroupeByNom(String nom);

    public void creeGroupebyContactNom(Contact contact);


}
