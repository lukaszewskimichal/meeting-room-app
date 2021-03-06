package pl.app.meetingroomapp.reservation;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class ReservationService {

    @Autowired
    private ReservationRepository reservationRepository;

    public void create(Reservation reservation) {

        reservationRepository.save(reservation);
    }

    public Reservation readWithRoomsAndUsers(Long id) {
        Reservation reservation = reservationRepository.getOne(id);
        Hibernate.initialize(reservation.getRoom());
        Hibernate.initialize(reservation.getUser());
        return reservation;
    }

    public Reservation findById(Long id) {
        return reservationRepository.getOne(id);
    }

    public List<Reservation> findAll() {
        return reservationRepository.findAll();
    }

    public void update(Reservation reservation) {
        Hibernate.initialize(reservation.getRoom());
        Hibernate.initialize(reservation.getUser());
        reservationRepository.save(reservation);
    }

    public void delete(Long id) {
        Reservation reservationToDelete = reservationRepository.getOne(id);
        reservationRepository.delete(reservationToDelete);
    }
}
