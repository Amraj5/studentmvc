/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.students.studentsmvc.controller;

/**
 *
 * @author ADAMS
 */


import com.students.studentsmvc.model.StudentsModel;
import com.students.studentsmvc.repository.StudentsRepository;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class StudentsController {
    private final StudentsRepository studentsRepository;

    public StudentsController(StudentsRepository studentsRepository) {
        this.studentsRepository = studentsRepository;
    }

    // Display home page
    @GetMapping("/")
    public String home(Model model) {

        model.addAttribute("student", new StudentsModel());

        return "home";
    }

    // Save student
    @PostMapping("/save")
    public String saveStudent(@ModelAttribute StudentsModel student) {

        studentsRepository.save(student);

        return "redirect:/";
    }
}
