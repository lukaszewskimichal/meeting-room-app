package pl.app.meetingroomapp.search;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.app.meetingroomapp.reservation.Reservation;

import java.time.LocalDateTime;
import java.util.List;

public interface SearchRepository extends JpaRepository<Reservation, Long> {

    @Query("select a from Reservation a where a.subject = :subject or a.user.id = :userId or a.room.id = :roomId or a.startTime >= :startTime or a.endTime <= :endTime")
    List<Reservation> findAllReservationQuery(@Param("subject") String subject, @Param("userId") Long userId, @Param("roomId") Long roomId, @Param("startTime") LocalDateTime startTime, @Param("endTime") LocalDateTime endTime);


}
