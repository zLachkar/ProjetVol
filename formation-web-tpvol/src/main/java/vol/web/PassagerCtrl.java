package vol.web;
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

import vol.metier.dao.ClientDao;
import vol.metier.dao.PassagerDao;
import vol.metier.dao.ReservationDao;
import vol.metier.dao.VolDao;
import vol.metier.model.Passager;
import vol.metier.model.Reservation;

@Controller
@RequestMapping("/passager")
public class PassagerCtrl {
	

		@Autowired
		private PassagerDao passagerDao;
		

		@RequestMapping(value = {"/", "/list"}, method = RequestMethod.GET)
		public String list(@RequestParam(required = false) Long idVol, Model model) {
			List<Passager> list = null;
			if (idVol != null) {
				//list = PassagerDao.findAll(idVol);
			} else {
				//list = PassagerDao.findAll();
			}
			 //= passagerDao.findAll();
			
			model.addAttribute("passagers", list);
			return "passager/passagers";
		}
		
		@RequestMapping(value = "/add", method = RequestMethod.GET)
		public String add(Model model) {
			
			model.addAttribute("passager", new Passager());
			return "passager/passagerEdit";
		}
		
		@RequestMapping(value = "/edit", method = RequestMethod.GET)
		public String edit(@RequestParam Long id, Model model) {
			
			model.addAttribute("passager", passagerDao.find(id));
			
			return "passager/passagerEdit";
		}
		
		@RequestMapping(value = "/save", method = RequestMethod.POST)
		public String save(@ModelAttribute("reservation") @Valid Passager passager, BindingResult result,  Model model) {
			if(result.hasErrors()) {		
				return "passager/passagerEdit";	
			}
			
			if(passager.getId() != null) {
				passagerDao.update(passager);
			} else {
				passagerDao.create(passager);
			}
			
			return "redirect:list";
		}
		
		@RequestMapping(value = "/delete", method = RequestMethod.GET)
		public String delete(@RequestParam Long id, Model model) {
			
			passagerDao.delete(passagerDao.find(id));
			
			return "forward:list";
		}
		
		@RequestMapping(value = "/cancel", method = RequestMethod.GET)
		public String cancel() {
			
			return "forward:list";
		}
		
		
	}


