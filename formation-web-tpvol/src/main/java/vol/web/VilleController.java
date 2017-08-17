package vol.web;



import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import vol.metier.dao.AeroportDao;
import vol.metier.dao.AeroportVilleDao;
import vol.metier.dao.VilleDao;
import vol.metier.model.Aeroport;
import vol.metier.model.AeroportVille;
import vol.metier.model.Ville;



@Controller
@RequestMapping("/ville")
public class VilleController {

	@Autowired
	private VilleDao villeDao;
	@Autowired
	private AeroportVilleDao aeroportvilleDao;
	
	@Autowired
	private AeroportDao aeroportDao;
	@Autowired
	private AeroportVilleDao aeroportVilleDao;
	
	@RequestMapping(value = {"/", "/list"}, method = RequestMethod.GET)
	public String list(Model model) {
	
		model.addAttribute("villes", villeDao.findAll());
		
		return "ville/villes";
	}
	@RequestMapping(value = "/arp", method = RequestMethod.GET)
	public String listAe(@RequestParam Long id, Model model) {
		
		
		List<Aeroport> LA=new ArrayList<Aeroport>();
		for(int i=0;i<villeDao.find(id).getAeroports().size();i++){
			LA.add(villeDao.find(id).getAeroports().get(i).getAeroport());
		}
		for(int i=0;i<LA.size();i++){
			System.out.println("vuelta LA "+LA.get(i).getNom());
		}
		model.addAttribute("aeroports", LA);
		return "aeroport/aeroports";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(Model model) {
		
		//model.addAttribute("civilites", Civilite.values());
		model.addAttribute("ville", new Ville());
		model.addAttribute("aeroports",aeroportDao.findAll());
		
		return "ville/villeEdit";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(@RequestParam Long id, Model model) {
		model.addAttribute("mode", "edit");
		model.addAttribute("ville", villeDao.find(id));
		model.addAttribute("aeroports", aeroportDao.findAll());
		
		//model.addAttribute("villes", villeDao.findAll());
		
		return "ville/villeEdit";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("ville") @Valid Ville ville, BindingResult result,@RequestParam Long idARP, Model model) {
		if(result.hasErrors()) {
			//model.addAttribute("ville", villeDao.find(id));
			model.addAttribute("aeroports", aeroportDao.findAll());
			return "ville/villeEdit";
		}
		if(idARP!=null){
			
				Aeroport a = aeroportDao.find(idARP);
				AeroportVille AV=new AeroportVille();
				AV.setAeroport(a);
				//AV.setVille(ville);
				List<AeroportVille> LAP=new ArrayList<AeroportVille>();
				aeroportvilleDao.create(AV);
				LAP.add(AV);
				ville.setAeroports(LAP);
				
				if(ville.getId() != null) {System.out.println(" != null");
				villeDao.update(ville);
				} else {System.out.println(" == null");
					villeDao.create(ville);
				}
		}
		else{
			villeDao.create(ville);
		}

		return "redirect:list";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam Long id, Model model) {
		//delete une ville --->delete les aeroports en relation aussi , ansi que les vol ...
		villeDao.delete(villeDao.find(id));
		
		return "forward:list";
	}
	
	@RequestMapping(value = "/cancel", method = RequestMethod.GET)
	public String cancel() {
		
		return "forward:list";
	}

}
