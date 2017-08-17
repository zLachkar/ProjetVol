package vol.web;


import java.util.ArrayList;
import java.util.Date;
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
import vol.metier.dao.CompagnieAerienneDao;
import vol.metier.dao.CompagnieAerienneVolDao;
import vol.metier.dao.EscaleDao;
import vol.metier.dao.ReservationDao;
import vol.metier.dao.VolDao;
import vol.metier.model.CompagnieAerienne;
import vol.metier.model.CompagnieAerienneVol;
import vol.metier.model.CompagnieAerienneVolId;
import vol.metier.model.Escale;
import vol.metier.model.Reservation;
import vol.metier.model.Vol;



@Controller
@RequestMapping("/vol")
public class VolController {

	@Autowired
	private VolDao volDao;
	@Autowired
	private CompagnieAerienneVolDao compagnieAerienneVolDao ;
	@Autowired
	private ReservationDao reservationDao ;
	@Autowired
	private AeroportDao aeroportDao ;
	@Autowired
	private CompagnieAerienneDao compagnieAerienneDao ;
	@Autowired
	private EscaleDao escalDao ;

	@RequestMapping(value = {"/", "/list"}, method = RequestMethod.GET)
	public String list(Model model) {
		
		List<CompagnieAerienneVol> LCAV=compagnieAerienneVolDao.findAll();
		List<CompagnieAerienne> companiesOFvol= new ArrayList<CompagnieAerienne>();
		List<Vol> list = volDao.findAll();
		
		model.addAttribute("voles", list);	
		return "vol/vols";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(Model model) {
		System.out.println("entrando");
		
		model.addAttribute("vol", new Vol());
		model.addAttribute("aeroports",aeroportDao.findAll() );
		model.addAttribute("CA", compagnieAerienneDao.findAll());
		model.addAttribute("mode", "add");
		
		return "vol/volEdit2";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(@RequestParam Long id, Model model) {
		
		model.addAttribute("vol", volDao.find(id));
		model.addAttribute("aeroports",aeroportDao.findAll() );
		model.addAttribute("CA", compagnieAerienneDao.findAll());
		model.addAttribute("escale", new Escale());
		model.addAttribute("mode", "edit");
		
		return "vol/volEdit2";
	}
	@RequestMapping(value = "/escales", method = RequestMethod.GET)
	public String escales(@RequestParam Long id, Model model) {
		model.addAttribute("escales", volDao.find(id).getEscales());
		
		return "escale/escales";
	}
	/*@RequestMapping(value = "/COMPA", method = RequestMethod.GET)
	public String COMPA(@RequestParam Long id, Model model) {
		List<CompagnieAerienneVol> LCAV=compagnieAerienneVolDao.findAll();
		List<CompagnieAerienne> companiesOFvol= new ArrayList<CompagnieAerienne>();
	
		for(int i=0;i<LCAV.size();i++){
			if(LCAV.get(i).getId().getVol().equals(volDao.find(id))){
				companiesOFvol.add(LCAV.get(i).getId().getCompagnieAerienne());//hna kml
			}
			
		}	
		model.addAttribute("companiesOFvoles", companiesOFvol);
		model.addAttribute("vol", volDao.find(id));
		
		return "companieaerienne/CompanieAeriennes";
	}*/
	@RequestMapping(value = "/COMPA", method = RequestMethod.GET)
	public String COMPA(@RequestParam(required=false) Long id, Model model) {
		List<CompagnieAerienneVol> LCAV=compagnieAerienneVolDao.findAll();
		List<CompagnieAerienne> companiesOFvol= new ArrayList<CompagnieAerienne>();
	if(id!=null){
		
		for(int i=0;i<LCAV.size();i++){
			if(LCAV.get(i).getId().getVol().equals(volDao.find(id))){
				companiesOFvol.add(LCAV.get(i).getId().getCompagnieAerienne());//hna kml
			}
			
		}	
		model.addAttribute("vol", volDao.find(id));
	}else{
		companiesOFvol=compagnieAerienneDao.findAll();
	}
		model.addAttribute("companiesOFvoles", companiesOFvol);
		
		
		return "companieaerienne/CompanieAeriennes";
	}

	@RequestMapping(value = "/RESA", method = RequestMethod.GET)
	public String RESA(@RequestParam Long id, Model model) {
		List<Reservation> LRALL=reservationDao.findAll();
		List<Reservation> LR=new ArrayList<Reservation>();
		System.out.println("reservationDao.findAll().size"+reservationDao.findAll().size());
		
		for(int i=0;i<LRALL.size();i++){
			if(LRALL.get(i).getVol().equals((volDao.find(id)))){
				LR.add(LRALL.get(i));
			}
			
		}
		
		model.addAttribute("reservations", LR);
		model.addAttribute("vol", volDao.find(id));
		
		
		return "reservation/reservations";
	}
	@RequestMapping(value = "/PASSAG", method = RequestMethod.GET)
	public String PASSAG(@RequestParam Long id, Model model) {
		
		model.addAttribute("passager", reservationDao.find(id).getPassager());
		model.addAttribute("reservation", reservationDao.find(id));
		
		return "passager/passagers";
	}
	
	@RequestMapping(value = "/cancel", method = RequestMethod.GET)
	public String cancel() {
		
		return "forward:list";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("vol") @Valid Vol vol, BindingResult result,@RequestParam Long idARPD,@RequestParam Long idARPA,@RequestParam Long idCA,@RequestParam Long idAEscale,@RequestParam String idHD,@RequestParam String idHA) {
		
		if(result.hasErrors()) {
			return "vol/volEdit";
		}
		else{
			vol.setDepart(aeroportDao.find(idARPD));
			vol.setArrivee(aeroportDao.find(idARPA));
			/*new escale*/
			Escale esc=new Escale();
			esc.setAeroport(aeroportDao.find(idAEscale));
			esc.setHeureDepart(java.sql.Time.valueOf(idHD));
			esc.setHeureArrivee(java.sql.Time.valueOf(idHA));
			esc.setVol(vol);
			
			/*new escale*/
			if(vol.getId() != null) {
				
				volDao.update(vol);
				CompagnieAerienneVol cavex = compagnieAerienneVolDao.find(new CompagnieAerienneVolId(compagnieAerienneDao.find(idCA),vol));
				compagnieAerienneVolDao.update(cavex);
				//escalDao.create(esc);
			} else {
				
				CompagnieAerienneVol cav = new CompagnieAerienneVol();
				CompagnieAerienneVolId cavId = new CompagnieAerienneVolId();
				cavId.setCompagnieAerienne(compagnieAerienneDao.find(idCA));
				cavId.setVol(vol);
				cav.setId(cavId);
				cav.setNumero(Integer.toString(compagnieAerienneVolDao.findAll().size()+1));
					
				volDao.create(vol);
				compagnieAerienneVolDao.create(cav);
				escalDao.create(esc);
			}
			
			return "redirect:list";
		}
		
		
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(@RequestParam Long id, Model model) {

	
		volDao.delete(volDao.find(id));

		return "forward:list";
	}
	
	
	

}
