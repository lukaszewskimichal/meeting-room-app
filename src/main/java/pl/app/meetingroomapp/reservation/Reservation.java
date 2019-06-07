package pl.app.meetingroomapp.reservation;

import org.springframework.format.annotation.DateTimeFormat;

import pl.app.meetingroomapp.room.Room;
import pl.app.meetingroomapp.user.User;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "reservations")
public class Reservation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "reservation_id")
    private Long id;

    @NotBlank(message = "Pole 'Temat spotkania' nie może być puste")
    @Size(min = 1)
    private String subject;

    @NotNull(message = "Pole 'Liczba uczestników' nie może być puste")
    @Min(1)
    private Long numberOfPeople;

    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    @FutureOrPresent(message = "Planowany czas rozpoczęcia spotkania nie może być wcześniejszy niż teraz")
    @NotNull(message = "Pole 'Czas rozpoczęcia' nie może być puste")
    private LocalDateTime startTime;

    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    @Future(message = "Planowany czas zakończenia spotkania nie może być wcześniejszy niż teraz")
    @NotNull(message = "Pole 'Czas zakończenia' nie może być puste")
    private LocalDateTime endTime;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    //    @JoinColumn(name = "room_id")
    @ManyToOne
    private Room room;

    public Reservation() {
    }

    public Long getId() {
        return id;
    }

    public String getSubject() {
        return subject;
    }

    public Long getNumberOfPeople() {
        return numberOfPeople;
    }

    public LocalDateTime getStartTime() {
        return startTime;
    }

    public LocalDateTime getEndTime() {
        return endTime;
    }

    public User getUser() {
        return user;
    }

    public Room getRoom() {
        return room;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public void setNumberOfPeople(Long numberOfPeople) {
        this.numberOfPeople = numberOfPeople;
    }

    public void setStartTime(LocalDateTime startTime) {
        this.startTime = startTime;
    }

    public void setEndTime(LocalDateTime endTime) {
        this.endTime = endTime;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setRoom(Room room) {
        this.room = room;
    }
}
