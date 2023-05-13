package com.ensah.dao;

import com.ensah.bo.Contact;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface IContactDao extends JpaRepository<Contact, Long> {
    List<Contact> findByNomContaining(String name);

    List<Contact> findByOrderByNomAsc();

    Contact findBytelephonePeronnel(String num);

    Contact findBytelephoneProfessionel(String num);
}
