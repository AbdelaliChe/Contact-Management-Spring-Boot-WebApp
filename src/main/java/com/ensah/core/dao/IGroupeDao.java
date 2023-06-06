package com.ensah.core.dao;

import com.ensah.core.bo.Groupe;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface IGroupeDao extends JpaRepository<Groupe, Long> {
    List<Groupe> findByNomContaining(String nom);
    Groupe findByNom(String nom);

    long count();
}
