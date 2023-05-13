package com.ensah.service;

import com.ensah.bo.Contact;
import com.ensah.bo.Groupe;
import com.ensah.dao.IContactDao;
import com.ensah.dao.IGroupeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class GroupeServiceImp implements IGroupeService{

    @Autowired
    IGroupeDao grouprDao;


    @Override
    public void creeGroupe(Groupe gGroupe) {
        grouprDao.save(gGroupe);
    }

    @Override
    public void modifierGroupe(Groupe gGroupe) {
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
}
