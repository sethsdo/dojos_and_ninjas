package com.project.DojosAndNinjas.services;
import com.project.DojosAndNinjas.models.Dojo;
import com.project.DojosAndNinjas.repositories.DojoRepository;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class DojoService {
    private DojoRepository dojoRepo;

    public DojoService(DojoRepository dojoRepo){
        this.dojoRepo = dojoRepo;
    }

    public List<Dojo> allDojos() {
        return dojoRepo.findAll();
    }

    public void addDojo(Dojo dojo) {
        dojoRepo.save(dojo);
    }
}