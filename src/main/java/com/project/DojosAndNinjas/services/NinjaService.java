package com.project.DojosAndNinjas.services;

import com.project.DojosAndNinjas.models.Ninja;
import com.project.DojosAndNinjas.repositories.NinjaRepository;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class NinjaService {
    private NinjaRepository ninjaRepo;

    public NinjaService(NinjaRepository ninjaRepo) {
        this.ninjaRepo = ninjaRepo;
    }
    
    public List<Ninja> allNinjas() {
        return ninjaRepo.findAll();
    }

    public void addNinja(Ninja ninja) {
        ninjaRepo.save(ninja);
    }

    // public List<Ninja> findNinjaById(Long id) {
    //     return ninjaRepo.findByDojoContaining(id);
    // }

    

}