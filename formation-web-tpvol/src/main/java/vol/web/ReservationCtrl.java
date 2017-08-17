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
@RequestMapping("/reservation")
public class ReservationCtrl {

	@Autowired
	private ReservationDao reservationDao;
	@Autowired
	private PassagerDao passagerDao;
	@Autowired
	private ClientDao clientDao;

	@Autowired
	private VolDao volDao;

	@RequestMapping(value = { "/", "/list" }, method = RequestMethod.GET)
	public String list(@RequestParam(required = false) Long idVol, Model model) {
		List<Reservation> list = null;
		if (idVol != null) {
			list = reservationDao.findAll(idVol);
		} else {
			list = reservationDao.findAll();
		}

		model.addAttribute("reservations", list);
		return "reservation/reservations";
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(Model model) {

		model.addAttribute("reservation", new Reservation());
		return "reservation/reservationEdit";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(@RequestParam Long id, Model model) {

		model.addAttribute("reservation", reservationDao.find(id));

		return "reservation/reservationEdit";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("reservation") @Valid Reservation reservation, BindingResult result,
			Model model) {
		if (result.hasErrors()) {
			return "reservation/reservationEdit";
		}

		if (reservation.getId() != null) {
			reservationDao.update(reservation);
		} else {
			reservationDao.create(reservation);
		}

		return "redirect:list";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam Long id, Model model) {

		reservationDao.delete(reservationDao.find(id));

		return "forward:list";
	}

	@RequestMapping(value = "/cancel", method = RequestMethod.GET)
	public String cancel() {

		return "forward:list";
	}
	
	@RequestMapping(value = "/loadPassager", method = RequestMethod.GET)
	public String loadPassager(@RequestParam Long id, Model model) {
		
		model.addAttribute("passager", reservationDao.find(id).getPassager());
		model.addAttribute("reservation", reservationDao.find(id));
		
		return "passager/passagers";
	}
	
}