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
import vol.metier.dao.LoginDao;
import vol.metier.model.Client;
import vol.metier.model.Login;

@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	private LoginDao loginDao;
	
	@Autowired
	private ClientDao clientDao;

	@RequestMapping(value = {"/", "/list"}, method = RequestMethod.GET)
	public String list(Model model) {
		List<Login> list = loginDao.findAll();
		
		model.addAttribute("logins", list);
		//model.addAttribute("admin", list);
		
		return "login/logins";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(Model model) {
		
		model.addAttribute("login", new Login());
		model.addAttribute("clients", clientDao.findAll());
		
		return "login/loginEdit";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(@RequestParam Long id, Model model) {
		model.addAttribute("login", loginDao.find(id));
		model.addAttribute("clients", clientDao.findAll());
		
		return "login/loginEdit";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("login") @Valid Login login, BindingResult result, @RequestParam String idClient) {
		if(result.hasErrors()) {
			return "login/loginEdit";
		}
		
		String nom = idClient.split("\\|")[0];
		String prenom = idClient.split("\\|")[1];
		
		if(login.getId() != null) {
			loginDao.update(login);
		} else {
			loginDao.create(login);
		}
		
		return "redirect:list";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam Long id, Model model) {
		
		loginDao.delete(loginDao.find(id));
		
		return "forward:list";
	}
	
	@RequestMapping(value = "/cancel", method = RequestMethod.GET)
	public String cancel() {
		
		return "forward:list";
	}

}