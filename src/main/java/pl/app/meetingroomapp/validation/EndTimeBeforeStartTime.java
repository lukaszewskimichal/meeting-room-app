package pl.app.meetingroomapp.validation;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.time.LocalDateTime;
@Constraint(validatedBy = EndTimeBeforeStartTimeValidator.class)
@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface EndTimeBeforeStartTime {
    String value();
    String message() default "{pl.app.meetingroomapp.validation.EndTimeBeforeStartTime.message}";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
