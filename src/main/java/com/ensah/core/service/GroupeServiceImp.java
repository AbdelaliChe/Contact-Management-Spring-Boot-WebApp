package com.ensah.core.service;

import com.ensah.core.bo.Contact;
import com.ensah.core.bo.Groupe;
import com.ensah.core.dao.IGroupeDao;
import org.apache.log4j.Logger;
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
    IGroupeDao groupeDao;


    @Override
    public void creeGroupe(Groupe gGroupe) {
        try {
            groupeDao.save(gGroupe);
        } catch (DataIntegrityViolationException ex) {
            LOGGER.error("Integrity constraint violation occurred: " + ex.getMessage());
            throw ex;
        }
    }

    @Override
    public void modifierGroupe(Groupe gGroupe) {
        try {
            for (Contact contact : gGroupe.getContacts()) {
                contact.setGrpC(gGroupe);
            }
            groupeDao.save(gGroupe);
        }catch (DataIntegrityViolationException ex) {
            LOGGER.error("Integrity constraint violation occurred: " + ex.getMessage());
            throw ex;
        }

    }

    @Override
    public List<Groupe> afficherGroupe() {
        return groupeDao.findAll();
    }

    @Override
    public void supprimerGroupe(Long id) {
        groupeDao.delete(getGroupeById(id));
    }

    @Override
    public List<Groupe> RechercheParNom(String nom) {

        return groupeDao.findByNomContaining(nom);
    }

    @Override
    public Groupe getGroupeById(Long id) {
        return groupeDao.findById(id).get();
    }

    @Override
    public Groupe getGroupeByNom(String nom) {
        return groupeDao.findByNom(nom);
    }

    @Override
    public void creeGroupeByContactNom(Contact contact) {
        Groupe grp = getGroupeByNom(contact.getNom());
        if(afficherGroupe().contains(grp)){
            contact.setGrpC(grp);
        }else {
            Groupe grpNom = new Groupe();
            grpNom.setNom(contact.getNom());
            contact.setGrpC(grpNom);
            creeGroupe(grpNom);
        }
    }

    @Override
    public void supprimerAffectation(Contact contact) {
        Groupe grp = contact.getGrpC();
        if(grp!= null){
            grp.getContacts().remove(contact);
            modifierGroupe(grp);
            contact.setGrpC(null);
        }
    }

    @Override
    public void ajouterAffectation(Contact contact,Long id) {
        if(id == null){
            contact.setGrpC(null);
        }
        else{
            Groupe grp = getGroupeById(id);
            contact.setGrpC(grp);
        }
    }

    @Override
    public List<Contact> getContactsOfGroupe(Groupe groupe) {
        return groupe.getContacts();
    }

    @Override
    public Long getRowCount() {
        return groupeDao.count();
    }

}
