package com.ensah.dao;

import com.ensah.bo.Groupe;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface IGroupeDao extends JpaRepository<Groupe, Long> {
    List<Groupe> findByNomContaining(String nom);
}
