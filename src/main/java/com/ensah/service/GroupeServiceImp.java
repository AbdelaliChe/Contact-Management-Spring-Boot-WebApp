package com.ensah.service;

import com.ensah.bo.Contact;
import com.ensah.bo.Groupe;
import org.apache.log4j.Logger;
import com.ensah.dao.IGroupeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class GroupeServiceImp implements IGroupeService{

    protected final Logger LOGGER = Logger.getLogger(getClass());
    @Autowired
    IGroupeDao grouprDao;


    @Override
    public void creeGroupe(Groupe gGroupe) {
        try {
            grouprDao.save(gGroupe);
        } catch (DataIntegrityViolationException ex) {
            LOGGER.error("Integrity constraint violation occurred: " + ex.getMessage());
            throw ex;
        }
    }

    @Override
    public void modifierGroupe(Groupe gGroupe) {

        for (Contact contact : gGroupe.getContact()) {
            contact.setGrpC(gGroupe);
        }
        grouprDao.save(gGroupe);

    }

    @Override
    public List<Groupe> afficherGroupe() {
        return grouprDao.findAll();
    }

    @Override
    public void supprimerGroupe(Long id) {
        grouprDao.delete(getGroupeById(id));
    }

    @Override
    public List<Groupe> RechercheParNom(String nom) {
        return grouprDao.findByNomContaining(nom);
    }

    @Override
    public Groupe getGroupeById(Long id) {
        return grouprDao.findById(id).get();
    }

    @Override
    public Groupe getGroupeByNom(String nom) {
        return grouprDao.findByNom(nom);
    }
}
