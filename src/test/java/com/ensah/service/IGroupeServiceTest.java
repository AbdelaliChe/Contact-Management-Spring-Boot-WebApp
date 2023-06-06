package com.ensah.service;

import com.ensah.core.bo.Contact;
import com.ensah.core.bo.Groupe;
import com.ensah.core.service.IContactService;
import com.ensah.core.service.IGroupeService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class IGroupeServiceTest {
    @Autowired
    IGroupeService groupeService;
    @Autowired
    IContactService contactService;

    @Test
    void modifierGroupe() {


        Groupe g = groupeService.getGroupeById(1L);
        System.out.println("1========"+g);
        Contact c= contactService.getContactById(1L);
        g.getContacts().add(c);
        System.out.println("2========"+g);
        groupeService.modifierGroupe(g);
        System.out.println("3========"+g);


    }
}