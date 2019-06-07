package pl.app.meetingroomapp.user;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;


@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Long id;

    @NotBlank(message = "Pole 'imię' nie może być puste")
    @Size(min = 3, message = "Minimalna ilość znaków: 3")
    private String firstName;

    @NotBlank(message = "Pole 'nazwisko' nie może być puste")
    @Size(min = 3, message = "Minimalna ilość znaków: 3")
    private String lastName;

    @NotBlank(message = "Pole 'adres e-mail' nie może być puste")
    @Email(message = "Wpisz poprawny adres e-mail")
    @Column(unique = true)
    private String email;

    @NotBlank(message = "Wpisz hasło")
    @Size(min = 6, message = "Hasło musi mieć minimum 6 znaków!")
    private String password;

    private boolean enabled = true;

    public User() {
    }

    public Long getId() {
        return id;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

}
