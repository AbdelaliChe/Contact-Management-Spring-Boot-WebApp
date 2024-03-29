package com.ensah.core.dao;

import com.ensah.core.bo.Contact;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.List;

public interface IContactDao extends JpaRepository<Contact, Long> {
    @Query(value = "SELECT * FROM contact WHERE nom LIKE CONCAT('%', :rechercher, '%') OR SOUNDEX(nom) = SOUNDEX(:rechercher)", nativeQuery = true)
    List<Contact> findByNomPhonetique(String rechercher);

    List<Contact> findByOrderByNomAsc();

    //Contact findBytelephonePeronnel(String num);
    //Contact findBytelephoneProfessionel(String num);

    @Query(value = "SELECT * FROM contact WHERE telephone_personnel = :num OR telephone_professionel = :num", nativeQuery = true)
    Contact findByNumTelephone(String num);

    long count();

}
