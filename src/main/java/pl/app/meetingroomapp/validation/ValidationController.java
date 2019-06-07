package pl.app.meetingroomapp.validation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import pl.app.meetingroomapp.reservation.Reservation;
import pl.app.meetingroomapp.user.User;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.ConstraintViolation;
import javax.validation.Validator;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Controller
public class ValidationController {

    @Autowired
    private Validator validator;

    @GetMapping("/validate")
    public String validate(Model model) {
        Reservation reservation = new Reservation();
        Set<ConstraintViolation<Reservation>> set = validator.validate(reservation);

        List<Error> errors = new ArrayList<>();

        if (!set.isEmpty()) {
            for (ConstraintViolation<Reservation> constraint : set) {
                String path = constraint.getPropertyPath().toString();
                String message = constraint.getMessage();
                Error error = new Error(path, message);
                errors.add(error);
            }
        }

        model.addAttribute("errors", errors);
        return "error";
    }

    @ModelAttribute("currentUser")
    public User getCurrentUserFirstName(ServletRequest request) {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();
        return (User) session.getAttribute("userSession");
    }
}
