package pl.app.meetingroomapp.room;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

public class RoomConverter implements Converter<String, Room> {

    @Autowired
    private RoomService roomService;

    @Override
    public Room convert(String s) {
        if (s == null || s.isEmpty()) {
            return null;
        }
        Long id = Long.valueOf(s);
        return roomService.read(id);
    }
}
