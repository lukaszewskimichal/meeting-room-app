package pl.app.meetingroomapp.room;

import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
public class RoomDao {

    @PersistenceContext
    private EntityManager entityManager;


    public void create(Room room) {
        entityManager.persist(room);
    }

    public Room read(Long id) {
        return entityManager.find(Room.class, id);
    }

    public void update(Room room) {
        entityManager.merge(room);
    }

    public void delete(Long id) {
        Room room = read(id);
        if (room != null) {
            entityManager.remove(room);
        }
    }
}
