package pl.app.meetingroomapp.room;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class RoomService {

    @Autowired
    private RoomRepository roomRepository;

    @Autowired
    private RoomDao roomDao;

    public void create(Room room) {
        roomRepository.save(room);
    }

    public Room findById(Long id) {
        return roomRepository.getOne(id);
    }

    public Room read(Long id) {
        return roomDao.read(id);
    }

    public List<Room> findAll() {
        return roomRepository.findAll();
    }

    public void update(Room room) {
        roomRepository.save(room);
    }

    public void delete(Long id) {
        Room roomToDelete = roomRepository.getOne(id);
        roomRepository.delete(roomToDelete);
    }
}
