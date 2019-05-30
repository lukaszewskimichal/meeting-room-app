package pl.app.meetingroomapp.room;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.awt.print.Book;
import java.util.List;

@Controller
@RequestMapping("/rooms")
public class RoomController {

    @Autowired
    private RoomService roomService;

    @GetMapping("/list")
    public String getList(Model model) {
        List<Room> rooms = roomService.findAll();
        model.addAttribute("rooms", rooms);
        return "roomList";
    }

    @GetMapping("/add")
    public String addRoom(Model model) {
        model.addAttribute("room", new Room());
        return "room";
    }

    @PostMapping("/add")
    public String addRoom(@ModelAttribute @Valid Room room, BindingResult result){
        if (result.hasErrors()) {
            return "room";
        }
        roomService.create(room);
        return "redirect:../rooms/list";
    }

    @GetMapping("/update/{id}")
    public String update(@PathVariable Long id, Model model) {
        Room room = roomService.findById(id);
        model.addAttribute("room", room);
        return "room";
    }

    @PostMapping("/update/{id}")
    public String update(@ModelAttribute @Valid Room room, BindingResult result) {
        if (result.hasErrors()) {
            return "room";
        }
        roomService.update(room);
        return "redirect:../list";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        roomService.delete(id);
        return "redirect:../list";
    }
}
