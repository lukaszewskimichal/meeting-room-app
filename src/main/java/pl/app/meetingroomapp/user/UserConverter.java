package pl.app.meetingroomapp.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

public class UserConverter implements Converter<String, User> {

    @Autowired
    private UserService userService;

    @Override
    public User convert(String s) {
        if (s == null || s.isEmpty()) {
            return null;
        }
        Long id = Long.valueOf(s);
        return userService.read(id);
    }
}

