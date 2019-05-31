package pl.app.meetingroomapp.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.app.meetingroomapp.DateTimeConfig;
import pl.app.meetingroomapp.room.Room;
import pl.app.meetingroomapp.room.RoomService;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/reservations")
public class ReservationController {

    @Autowired
    private ReservationService reservationService;

    @Autowired
    private RoomService roomService;

    @Autowired
    private DateTimeConfig dateTimeConfig;

    @GetMapping("/list")
    public String getList(Model model) {
        List<Reservation> rooms = reservationService.findAll();
        model.addAttribute("reservations", rooms);
        return "reservationList";
    }

    @GetMapping("/add")
    public String addReservation(Model model) {
        model.addAttribute("reservation", new Reservation());
        return "reservation";
    }

    @PostMapping("/add")
    public String addRoom(@ModelAttribute @Valid Reservation reservation, BindingResult result ) {
        if (result.hasErrors()) {
            return "reservation";
        }

        reservationService.create(reservation);
        return "redirect:../reservations/list";
    }

    @GetMapping("/update/{id}")
    public String update(@PathVariable Long id, Model model) {
        Reservation reservation = reservationService.findById(id);
        model.addAttribute("reservation", reservation);
        return "reservation_old";
    }

    @PostMapping("/update/{id}")
    public String update(@ModelAttribute @Valid Reservation reservation, BindingResult result) {
        if (result.hasErrors()) {
            return "reservation_old";
        }
        reservationService.update(reservation);
        return "redirect:../list";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        reservationService.delete(id);
        return "redirect:../list";
    }

    @ModelAttribute("rooms")
//    public List<String> getRoomsNames() {
//        List<Room> rooms = roomService.findAll();
//        List<String> roomNamesList = new ArrayList<>();
//        for(Room room : rooms){
//           String roomName = room.getName();
//           roomNamesList.add(roomName);
//        }
//        return roomNamesList;
//    }
    public List<Room> findAllRooms(){
        return roomService.findAll();
    }
}
