package pl.app.meetingroomapp.validation;



import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.time.LocalDateTime;

public class EndTimeBeforeStartTimeValidator implements ConstraintValidator<EndTimeBeforeStartTime, LocalDateTime> {
    private LocalDateTime endTime;

    @Override
    public void initialize(EndTimeBeforeStartTime constraintAnnotation) {

    }

    @Override
    public boolean isValid(LocalDateTime value, ConstraintValidatorContext context) {

        return endTime.isAfter(value);
    }
}
