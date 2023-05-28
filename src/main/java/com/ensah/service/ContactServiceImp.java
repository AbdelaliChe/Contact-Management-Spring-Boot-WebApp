package com.ensah.service;

import com.ensah.bo.Contact;
import com.ensah.bo.Groupe;
import com.ensah.dao.IContactDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.apache.log4j.Logger;


import java.util.List;

@Service
@Transactional
public class ContactServiceImp implements IContactService{

    @Autowired
    IContactDao contactDao;
    protected final Logger LOGGER = Logger.getLogger(getClass());

    @Override
    public void creeContact(Contact cContact) {
        try {
        contactDao.save(cContact);
        }catch (DataIntegrityViolationException ex) {
            LOGGER.error("Integrity constraint violation occurred: " + ex.getMessage());
            throw ex;
        }
    }

    @Override
    public void modifierContact(Contact cContact) {
        try {
        contactDao.save(cContact);
        }catch (DataIntegrityViolationException ex) {
                LOGGER.error("Integrity constraint violation occurred: " + ex.getMessage());
                throw ex;
        }
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
        return contactDao.findByNomPhonetique(nom);
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
