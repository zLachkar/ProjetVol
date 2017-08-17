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
import vol.metier.model.ClientMoral;
import vol.metier.model.ClientPhysique;
import vol.metier.model.Login;
import vol.metier.model.TitreMoral;
import vol.metier.model.TitrePhysique;

@Controller
@RequestMapping("/client")
public class ClientController {

	@Autowired
	private ClientDao clientDao;
	@Autowired
	private LoginDao loginDao;

	@RequestMapping(value = { "/", "/listClients" })
	public String list(Model model) {
		List<Client> listClients = clientDao.findAll();
		List<Login> listLogins = loginDao.findAll();
		model.addAttribute("clients", listClients);
		model.addAttribute("logins", listLogins);
		return "client/clients";
	}

	@RequestMapping(value = "/listClientsMoral")
	public String clientMorallist(Model model) {

		List<Client> listClients = clientDao.findAllClientMoral();
		List<Login> listLogins = loginDao.findAll();
		model.addAttribute("clients", listClients);
		model.addAttribute("logins", listLogins);

		return "client/clients";
	}

	@RequestMapping(value = "/listClientsPhysique")
	public String clientPhysiquelist(Model model) {

		List<Client> listClients = clientDao.findAllClientPhysique();
		List<Login> listLogins = loginDao.findAll();
		model.addAttribute("clients", listClients);
		model.addAttribute("logins", listLogins);

		return "client/clients";
	}

	@RequestMapping(value = "/clientMoralAdd", method = RequestMethod.GET)
	public String clientMoralAdd(Model model) {

		model.addAttribute("client", new ClientMoral());
		model.addAttribute("clients", clientDao.findAllClientMoral());
		return "client/clientMoralEdit";
	}

	@RequestMapping(value = "/clientPhysiqueAdd", method = RequestMethod.GET)
	public String clientPhysiqueAdd(Model model) {

		model.addAttribute("client", new ClientPhysique());
		model.addAttribute("clients", clientDao.findAllClientPhysique());
		return "client/clientPhysiqueEdit";
	}
	@RequestMapping(value = "/clientPhysiqueEdit", method = RequestMethod.GET)
	public String clientPhysiqueEdit(@RequestParam Long id, Model model) {
		List<Client> listClients = clientDao.findAllClientPhysique();
		model.addAttribute("clients", listClients);
		//model.addAttribute("logins", loginDao.findAll());
		return "client/clientPhysiqueEdit";
	}

	@RequestMapping(value = "/clientMoralEdit", method = RequestMethod.GET)
	public String clientMoralEdit(@RequestParam Long id, Model model) {
		
		List<Client> listClients = clientDao.findAllClientMoral();
//		if test="${client.getClass().simpleName eq 'ClientPhysique'}
		model.addAttribute("clients", listClients);
		//model.addAttribute("logins", loginDao.findAll());
		return "client/clientMoralEdit";
	}

	@RequestMapping(value = "/clientEdit", method = RequestMethod.GET)
	public String clientEdit(@RequestParam Long id, Model model) {

		Client client = clientDao.find(id);

		model.addAttribute("client", client);
		//model.addAttribute("logins", loginDao.findAll());

		if (client instanceof ClientMoral) {
			System.out.println("clientMoral");
//			return "client/clientMoralEdit";
			return null;
		} else if (client instanceof ClientPhysique) {
			System.out.println("clientphysique");
			return "client/clientPhysiqueEdit";
			
		}
		return "client/";
	}


	

	@RequestMapping(value = "/clientPhysiqueSave", method = RequestMethod.POST)
	public String savePhysique(@ModelAttribute("clientPhysique") @Valid ClientPhysique clientPhysique, 
			 Model model , BindingResult errors) {
	if (errors.hasErrors()) {

			//model.addAttribute("logins", loginDao.findAll());
		return "client/clientEdit";
		}

	if (clientPhysique.getId() != null) {
			clientDao.update(clientPhysique);
		} else {
			clientDao.create(clientPhysique);
	}
		return "forward:listClients";
	}
	@RequestMapping(value = "/clientMoralSave", method = RequestMethod.POST)
	public String saveMoral(@ModelAttribute("clientMoral") @Valid ClientMoral clientMoral, 
			 Model model , BindingResult errors) {
	if (errors.hasErrors()) {

			//model.addAttribute("logins", loginDao.findAll());
			return "client/clientEdit";
		}

		if (clientMoral.getId() != null) {
			clientDao.update(clientMoral);
		} else {
			clientDao.create(clientMoral);
	}
		return "forward:listClients";
	}
	@RequestMapping(value = "/clientDelete", method = RequestMethod.GET)
	public String delete(@RequestParam Long id, Model model) {
		Client obj = clientDao.find(id);
		clientDao.delete(obj);

		return "forward:listClients";
	}

	@RequestMapping(value = "/clientCancel", method = RequestMethod.GET)
	public String cancel() {

		return "forward:listClients";
	}
}