package com.project.DojosAndNinjas.controllers;


import com.project.DojosAndNinjas.models.Dojo;
import com.project.DojosAndNinjas.models.Ninja;
import com.project.DojosAndNinjas.services.DojoService;
import com.project.DojosAndNinjas.services.NinjaService;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DojoController {
    private final DojoService dojoService;
    private final NinjaService ninjaService;

    public DojoController(DojoService dojoService, NinjaService ninjaService) {
        this.dojoService = dojoService;
        this.ninjaService = ninjaService;
    }


    //MAIN
    @RequestMapping("/")
    public String index(Model model, @ModelAttribute("dojo") Dojo dojo, @ModelAttribute("ninja") Ninja ninja){
        List<Ninja> ninjas = ninjaService.allNinjas();
        model.addAttribute("ninjas", ninjas);
        List<Dojo> dojos = dojoService.allDojos();
        model.addAttribute("dojos", dojos);
        return "index";
    }

    //ADD DOJO
    @PostMapping("/addDojo")
    public String addDojo(@Valid @ModelAttribute("dojo") Dojo dojo, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "redirect:/";
        } else {
            dojoService.addDojo(dojo);
            return "redirect:/";
        }
    }

    //ADD NINJA
    @PostMapping("/addNinja")
    public String addNinja(@Valid @ModelAttribute("ninja") Ninja ninja, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "redirect:/";
        } else {
            ninjaService.addNinja(ninja);
            return "redirect:/";
        }
    }

    // @PostMapping("/{name}/${id}")
    // public String findLocation(Model model, @PathVariable(value="id") Long id, @PathVariable(value="name") String name, HttpSession session) {
    //     session.setAttribute("name", name);
    //     List<Dojo> dojos = dojoService.allDojos();
    //     model.addAttribute("dojos", dojos);

    //     // model.addAttribute("song", ninjaService.findNinjaById(id));
    //     return "/" + name + "/" + id;
    //}
    


}