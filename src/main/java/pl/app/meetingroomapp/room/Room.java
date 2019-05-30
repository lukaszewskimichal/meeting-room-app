package pl.app.meetingroomapp.room;

import pl.app.meetingroomapp.reservation.Reservation;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

@Entity
@Table(name = "rooms")
public class Room {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "room_id")
    private Long id;

    @NotBlank(message = "Pole 'nazwa' nie może być puste")
    @Size(min = 1)
    private String name;

    @NotNull(message = "Pole 'liczba osób' nie może być puste")
    @Min(value = 1, message = "Liczba osób min. 1")
    private Long capacity;

    private boolean projector;

    private boolean teleconferenceSystem;

    private boolean flipchart;

    private boolean tv;

    private boolean airConditioning;

    @OneToMany
    @JoinColumn(name = "reservation_id")
    private List<Reservation> reservations;

    public Room() {
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Long getCapacity() {
        return capacity;
    }

    public boolean isProjector() {
        return projector;
    }

    public boolean isTeleconferenceSystem() {
        return teleconferenceSystem;
    }

    public boolean isFlipchart() {
        return flipchart;
    }

    public boolean isTv() {
        return tv;
    }

    public boolean isAirConditioning() {
        return airConditioning;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCapacity(Long capacity) {
        this.capacity = capacity;
    }

    public void setProjector(boolean projector) {
        this.projector = projector;
    }

    public String setProjectorLabel(boolean projector) {
        if (projector == true) {
            return "TAK";
        } else {
            return "NIE";
        }
    }

    public void setTeleconferenceSystem(boolean teleconferenceSystem) {
        this.teleconferenceSystem = teleconferenceSystem;
    }

    public String setTeleconferenceSystemLabel(boolean teleconferenceSystem) {
        if (teleconferenceSystem == true) {
            return "TAK";
        } else {
            return "NIE";
        }
    }

    public void setFlipchart(boolean flipchart) {
        this.flipchart = flipchart;
    }

    public String setFlipchartLabel(boolean flipchart) {
        if (flipchart == true) {
            return "TAK";
        } else {
            return "NIE";
        }
    }

    public void setTv(boolean tv) {
        this.tv = tv;
    }

    public String setTvLabel(boolean tv) {
        if (tv == true) {
            return "TAK";
        } else {
            return "NIE";
        }
    }

    public void setAirConditioning(boolean airConditioning) {
        this.airConditioning = airConditioning;
    }

    public String setAirConditioningLabel(boolean airConditioning) {
        if (airConditioning == true) {
            return "TAK";
        } else {
            return "NIE";
        }
    }
}



