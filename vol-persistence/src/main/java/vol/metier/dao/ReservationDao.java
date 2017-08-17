package vol.metier.dao;


import java.util.List;

import vol.metier.model.Reservation;

public interface ReservationDao extends Dao<Reservation, Long> {

	Reservation find(int numero);
	
	List<Reservation> findAll(Long idVol);
}
