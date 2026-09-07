/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.students.studentsmvc.repository;

/**
 *
 * @author ADAMS
 */
import com.students.studentsmvc.model.StudentsModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StudentsRepository extends JpaRepository<StudentsModel, Long> {

}
