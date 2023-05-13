package com.ensah.service;

import com.ensah.bo.Contact;
import com.ensah.dao.IContactDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ContactServiceImp implements IContactService{

    @Autowired
    IContactDao contactDao;

    @Override
    public void creeContact(Contact cContact) {
        contactDao.save(cContact);
    }

    @Override
    public void modifierContact(Contact cContact) {
        contactDao.save(cContact);
    }

    @Override
    public List<Contact> afficherContactsParOrdre() {
        return contactDao.findByOrderByNomAsc();
    }

    @Override
    public void supprimerContact(Long id) {
        contactDao.delete(getContactById(id));
    }

    @Override
    public List<Contact> RechercheParNom(String nom) {
        return contactDao.findByNomContaining(nom);
    }

    @Override
    public Contact getContactById(Long id) {
        return contactDao.findById(id).get();
    }

    @Override
    public Contact RechercheParNum(String num) {
        if(contactDao.findBytelephonePeronnel(num)!=null) return contactDao.findBytelephonePeronnel(num);
        else return contactDao.findBytelephoneProfessionel(num);
    }
}
