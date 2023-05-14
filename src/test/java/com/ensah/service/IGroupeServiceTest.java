package com.ensah.service;

import com.ensah.bo.Contact;
import com.ensah.bo.Groupe;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.HashSet;

import static org.junit.jupiter.api.Assertions.*;

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
        g.getContact().add(c);
        System.out.println("2========"+g);
        groupeService.modifierGroupe(g);
        System.out.println("3========"+g);


    }
}