package com.ensah.dao;

import com.ensah.bo.Contact;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface IContactDao extends JpaRepository<Contact, Long> {
    @Query(value = "SELECT * FROM contact WHERE nom LIKE CONCAT('%', :rechercher, '%') OR SOUNDEX(nom) = SOUNDEX(:rechercher)", nativeQuery = true)
    List<Contact> findByNomPhonetique(String rechercher);

    List<Contact> findByOrderByNomAsc();

    Contact findBytelephonePeronnel(String num);

    Contact findBytelephoneProfessionel(String num);

}
