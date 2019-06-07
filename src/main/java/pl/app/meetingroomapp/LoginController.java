package pl.app.meetingroomapp;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.app.meetingroomapp.user.User;
import pl.app.meetingroomapp.user.UserRepository;

@Controller
@SessionAttributes("userSession")
public class LoginController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/")
    public String login() {
        return "login";
    }

    @PostMapping("/")
    public String login(@RequestParam String email, @RequestParam String password, Model model) {
        User user = userRepository.findUserByEmail(email);
        model.addAttribute("isLogged", false);
        if (user == null) {
            return "login";
        }
        if (BCrypt.checkpw(password, user.getPassword())) {
            model.addAttribute("userSession", user);
            model.addAttribute("isLogged", true);
            return "redirect:reservations/add";
        }
        return "login";
    }
}
