package com.ensah.service;

import com.ensah.bo.Contact;

import java.util.List;

public interface IContactService {
    public void creeContact(Contact cContact);

    public void modifierContact(Contact cContact);

    public List<Contact> afficherContactsParOrdre();

    public void supprimerContact(Long id);

    public List<Contact> RechercheParNom(String nom);

    public Contact getContactById(Long id);

    public Contact RechercheParNum(String num);

}
