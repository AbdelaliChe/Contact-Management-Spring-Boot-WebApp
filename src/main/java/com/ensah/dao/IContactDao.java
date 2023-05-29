package com.ensah.dao;

import com.ensah.bo.Contact;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface IContactDao extends JpaRepository<Contact, Long> {
    @Query(value = "SELECT * FROM contact WHERE nom LIKE CONCAT('%', :rechercher, '%') OR SOUNDEX(nom) = SOUNDEX(:rechercher)", nativeQuery = true)
    List<Contact> findByNomPhonetique(String rechercher);

    List<Contact> findByOrderByNomAsc();

    //Contact findBytelephonePeronnel(String num);
    //Contact findBytelephoneProfessionel(String num);

    @Query(value = "SELECT * FROM contact WHERE telephone_personnel = :num OR telephone_professionel = :num", nativeQuery = true)
    Contact findByNumTelephone(String num);

    @Modifying
    @Query(value="UPDATE contact SET nom = :#{#contact.nom}, prenom = :#{#contact.prenom}, telephone_personnel = :#{#contact.telephonePersonnel}, telephone_professionel = :#{#contact.telephoneProfessionel}, email_personnel = :#{#contact.emailPersonnel}, email_professionel = :#{#contact.emailProfessionel}, telephone_professionel = :#{#contact.telephoneProfessionel}, adresse = :#{#contact.adresse}, genre = :#{#contact.genre} WHERE id_contact = :#{#contact.idContact}", nativeQuery = true)
    void modifierContactInfos(Contact contact);

}
