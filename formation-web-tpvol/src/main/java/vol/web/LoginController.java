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
import vol.metier.model.Login;

@Controller
@RequestMapping("/")
public class LoginController {

	@Autowired
	private LoginDao loginDao;

	@Autowired
	private ClientDao clientDao;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String log(Model model) {

		return "login/login2";
	}

	@RequestMapping(value = "/verification", method = RequestMethod.POST)
	public String save(@RequestParam String login, @RequestParam String pass, Model model) {

		List<Login> Lo = loginDao.findAll();
		for (int i = 0; i < Lo.size(); i++) {
			if (Lo.get(i).getLogin().equals(login) && Lo.get(i).getMotDePasse().equals(pass)) {
				return "home";

			}
		}

		return "login/login2";
	}

	@RequestMapping(value = "/login/list", method = RequestMethod.GET)
	public String list(Model model) {
		List<Login> list = loginDao.findAll();

		model.addAttribute("logins", list);
		// model.addAttribute("admin", list);

		return "login/logins";
	}

	@RequestMapping(value = "/login/add", method = RequestMethod.GET)
	public String add(Model model) {

		model.addAttribute("login", new Login());
		model.addAttribute("clients", clientDao.findAll());

		return "login/loginEdit";
	}

	@RequestMapping(value = "/login/edit", method = RequestMethod.GET)
	public String edit(@RequestParam Long id, Model model) {
		model.addAttribute("login", loginDao.find(id));
		model.addAttribute("clients", clientDao.findAll());

		return "login/loginEdit";
	}

	@RequestMapping(value = "/login/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("login") @Valid Login login, BindingResult result) {
		if (result.hasErrors()) {
			return "login/loginEdit";
		}

		if (login.getId() != null) {
			loginDao.update(login);
		} else {
			loginDao.create(login);
		}

		return "redirect:list";
	}

	@RequestMapping(value = "/login/delete", method = RequestMethod.GET)
	public String delete(@RequestParam Long id, Model model) {

		loginDao.delete(loginDao.find(id));

		return "forward:list";
	}

	@RequestMapping(value = "/login/cancel", method = RequestMethod.GET)
	public String cancel() {

		return "forward:list";
	}

}