package pl.app.meetingroomapp.user;

import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Repository
public class UserDao {

    @PersistenceContext
    private EntityManager entityManager;


    public void create(User user) {
        entityManager.persist(user);
    }

    public User read(Long id) {
        return entityManager.find(User.class, id);
    }

    public void update(User user) {
        entityManager.merge(user);
    }

    public void delete(Long id) {
        User user = read(id);
        if (user != null) {
            entityManager.remove(user);
        }
    }
}
