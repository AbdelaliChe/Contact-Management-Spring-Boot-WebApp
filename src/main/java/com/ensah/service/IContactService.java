package com.ensah.service;

import com.ensah.bo.Contact;
import com.ensah.bo.Groupe;

import java.util.List;

public interface IContactService {
    public void creeContact(Contact cContact);

    public void modifierContact(Contact cContact);
    public void  modifierContactInfo(Contact cContact);

    public List<Contact> afficherContactsParOrdreNom();

    public void supprimerContact(Long id);

    public List<Contact> RechercheParNom(String nom);

    public Contact getContactById(Long id);

    public Contact RechercheParNum(String num);

    public void supprimerAffectationCnt(Groupe grp);

    public void ajouterContactsToGroupe(Groupe grp,Long id);

    public void supprimerContactOfGroupe(Groupe grp,Long id);

}
