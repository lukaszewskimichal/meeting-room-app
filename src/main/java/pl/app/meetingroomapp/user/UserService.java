package pl.app.meetingroomapp.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserDao userDao;

    public void create(User user) {
        userRepository.save(user);
    }

    public User findById(Long id) {
        return userRepository.getOne(id);
    }

    public User read(Long id) {
        return userDao.read(id);
    }

    public List<User> findAll() {
        return userRepository.findAll();
    }

    public void update(User user) {
        userRepository.save(user);
    }

    public void delete(Long id) {
        User userToDelete = userRepository.getOne(id);
        userRepository.delete(userToDelete);
    }
}
