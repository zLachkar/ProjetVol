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
import vol.metier.dao.EscaleDao;
import vol.metier.dao.VilleDao;
import vol.metier.dao.VolDao;
import vol.metier.model.Aeroport;
import vol.metier.model.AeroportVille;
import vol.metier.model.Escale;
import vol.metier.model.Ville;
import vol.metier.model.Vol;

@Controller
@RequestMapping("/aeroport")
public class AeroportController {

	@Autowired
	private AeroportDao aeroportDao;
	@Autowired
	private VilleDao villeDao;
	@Autowired
	private AeroportVilleDao aeroportvilleDao;
	@Autowired
	private EscaleDao escalDao;
	@Autowired
	private VolDao volDao;

	@RequestMapping(value = { "/", "/list" }, method = RequestMethod.GET)
	public String list(Model model) {
		List<Aeroport> list = aeroportDao.findAll();

		model.addAttribute("aeroports", list);
		model.addAttribute("villes", villeDao.findAll());

		return "aeroport/aeroports";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(Model model) {

		model.addAttribute("aeroport", new Aeroport());
		model.addAttribute("villes", villeDao.findAll());

		return "aeroport/aeroportEdit";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(@RequestParam Long id, Model model) {
		model.addAttribute("aeroport", aeroportDao.find(id));
		model.addAttribute("aeroports", aeroportDao.findAll());

		return "aeroport/aeroportEdit";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("aeroport") @Valid Aeroport aeroport, BindingResult result,
			@RequestParam Long idVille, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("aeroports", aeroportDao.findAll());
			model.addAttribute("villes", villeDao.findAll());
			return "aeroport/aeroportEdit";
		}

		if (aeroport.getId() != null) {
			aeroportDao.update(aeroport);
		} else {
			aeroportDao.create(aeroport);
			Ville vx = villeDao.find(idVille);
			AeroportVille AV = new AeroportVille();
			AV.setVille(vx);
			AV.setAeroport(aeroport);
			aeroportvilleDao.create(AV);

			vx.getAeroports().add(AV);
			villeDao.update(vx);
		}

		return "redirect:list";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam Long id, Model model) {

		/*List<Vol> LV = volDao.findAll();
		for (int i = 0; i < LV.size(); i++) {
			
			if (LV.get(i).getDepart().equals(aeroportDao.find(id)) || LV.get(i).getArrivee().equals(aeroportDao.find(id)))
			{System.out.println("ETAPA EN CONTROLLERAEROPORT");
				volDao.delete(volDao.find(LV.get(i).getId()));
			}
		}*/
		aeroportDao.delete(aeroportDao.find(id));

		return "forward:list";
	}

	@RequestMapping(value = "/cancel", method = RequestMethod.GET)
	public String cancel() {

		return "forward:list";
	}

	@RequestMapping(value = "/listvilles", method = RequestMethod.GET)
	public String listvilles(@RequestParam Long id, Model model) {

		Aeroport a = aeroportDao.find(id);

		List<Ville> listV = new ArrayList<Ville>();
		listV.add(a.getVilles().get(0).getVille());

		model.addAttribute("villes", listV);
		return "ville/villes";

	}

	// existe un arp en VilleController tambien antes
	@RequestMapping(value = "/arp", method = RequestMethod.GET)
	public String listAe(@RequestParam Long id, Model model) {
		List<Aeroport> LA = new ArrayList<Aeroport>();

		for (int i = 0; i < villeDao.find(id).getAeroports().size(); i++) {
			LA.add(villeDao.find(id).getAeroports().get(i).getAeroport());
		}
		for (int i = 0; i < LA.size(); i++) {
			System.out.println("vuelta LA " + LA.get(i).getNom());
		}

		model.addAttribute("aeroports", LA);
		return "aeroport/aeroports";
	}
}
