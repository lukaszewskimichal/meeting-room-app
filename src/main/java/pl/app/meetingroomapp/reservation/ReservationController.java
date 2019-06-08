package pl.app.meetingroomapp.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.app.meetingroomapp.room.Room;
import pl.app.meetingroomapp.room.RoomConverter;
import pl.app.meetingroomapp.room.RoomService;
import pl.app.meetingroomapp.user.User;
import pl.app.meetingroomapp.user.UserService;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Controller
@RequestMapping("/reservations")
public class ReservationController {

    @Autowired
    private ReservationService reservationService;

    @Autowired
    private ReservationRepository reservationRepository;

    @Autowired
    private RoomService roomService;

    @Autowired
    private UserService userService;

    @Autowired
    private RoomConverter roomConverter;


    @GetMapping("/list")
    public String getList(Model model) {
        List<Reservation> reservations = reservationService.findAll();
        model.addAttribute("reservations", reservations);
        model.addAttribute("format", DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
        return "reservationList";
    }

    @GetMapping("/add")
    public String addReservation(Model model) {
        model.addAttribute("reservation", new Reservation());
        return "reservation";
    }

    @PostMapping("/add")
    public String addReservation(@ModelAttribute @Valid Reservation reservation, BindingResult result, ServletRequest request) {
        if (result.hasErrors()) {
            return "reservation";
        }
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("userSession");
        reservation.setUser(user);
        reservationService.create(reservation);
        return "redirect:../reservations/list";
    }

    @GetMapping("/update/{id}")
    public String update(@PathVariable Long id, Model model) {
        Reservation reservation = reservationService.findById(id);
        model.addAttribute("reservation", reservation);
        return "reservation";
    }

    @PostMapping("/update/{id}")
    public String update(@ModelAttribute @Valid Reservation reservation, BindingResult result, ServletRequest request) {
        if (result.hasErrors()) {
            return "reservation";
        }
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("userSession");
        reservation.setUser(user);
        reservationService.update(reservation);
        return "redirect:../list";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        reservationService.delete(id);
        return "redirect:../list";
    }


    @ModelAttribute("rooms")
    public List<Room> getRooms() {
        return roomService.findAll();
    }

    @ModelAttribute("users")
    public List<User> getAllUsers() {
        return userService.findAll();
    }

    @ModelAttribute("currentUser")
    public User getCurrentUserFirstName(ServletRequest request) {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();
        return (User) session.getAttribute("userSession");
    }
}
