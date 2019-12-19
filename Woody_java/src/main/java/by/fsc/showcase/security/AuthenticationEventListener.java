package by.fsc.showcase.security;

import org.springframework.context.ApplicationListener;
import org.springframework.security.authentication.event.AbstractAuthenticationEvent;
import org.springframework.security.authentication.event.InteractiveAuthenticationSuccessEvent;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

@Deprecated
@Component
public class AuthenticationEventListener implements ApplicationListener<AbstractAuthenticationEvent> {

    @Override
    public void onApplicationEvent(AbstractAuthenticationEvent authenticationEvent) {
        if (authenticationEvent instanceof InteractiveAuthenticationSuccessEvent) {
            return;
        }
        Authentication authentication = authenticationEvent.getAuthentication();
        String auditMessage = "Login attempt with username: " +
                authentication.getName() + " " +
                authentication.getAuthorities() + " " +
                authentication.getCredentials() + " " +
                authentication.getPrincipal() + " " +
                "\t\tSuccess: " + authentication.isAuthenticated();
        System.out.println(auditMessage);
        System.out.println(new BCryptPasswordEncoder().encode("admin"));
        System.out.println("$2a$10$stOKyhSl87owIKIdD4UJbOTVPLkwNkY9RD.CLMMkLWb16A4uTfcge");
    }

}
