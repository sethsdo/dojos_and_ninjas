package com.project.DojosAndNinjas.repositories;

import com.project.DojosAndNinjas.models.Ninja;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NinjaRepository extends CrudRepository<Ninja, Long> {
    List<Ninja> findAll();
    
    List<Ninja> findByDojoContaining(Long id);

}