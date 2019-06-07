package pl.app.meetingroomapp.search;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.app.meetingroomapp.reservation.Reservation;
import pl.app.meetingroomapp.room.Room;
import pl.app.meetingroomapp.room.RoomConverter;
import pl.app.meetingroomapp.room.RoomService;
import pl.app.meetingroomapp.user.User;
import pl.app.meetingroomapp.user.UserService;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;


@Controller
@RequestMapping("/search")
public class SearchController {

    @Autowired
    private SearchRepository searchRepository;

    @Autowired
    private RoomService roomService;

    @Autowired
    private UserService userService;

    @Autowired
    private RoomConverter roomConverter;

    @GetMapping("/")
    public String getFindForm(Model model) {
        model.addAttribute("search", new Search());
        return "search";
    }

    @PostMapping("/")
    public String showSearchResult(@ModelAttribute @Valid Search search, BindingResult result, ServletRequest request, Model model) {
        if (result.hasErrors()) {
            return "search";
        }
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");

        String subject = request.getParameter("subject");
        Long userId = Long.parseLong((request.getParameter("userId")));
        Long roomId = Long.parseLong((request.getParameter("roomId")));

        String startTimeString = request.getParameter("startTime");
        LocalDateTime startTime = LocalDateTime.parse(startTimeString, formatter);

        String endTimeString = request.getParameter("endTime");
        LocalDateTime endTime = LocalDateTime.parse(endTimeString, formatter);

        List<Reservation> searchResult = searchRepository.findAllReservationQuery(subject, userId, roomId, startTime, endTime);
        model.addAttribute("searchResult", searchResult);
        return "searchResult";

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


