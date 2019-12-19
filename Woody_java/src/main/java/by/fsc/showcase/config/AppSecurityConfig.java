package by.fsc.showcase.config;


import by.fsc.showcase.security.UserDetailServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class AppSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailServiceImpl userDetailsService;

    @Autowired
    public void configure(AuthenticationManagerBuilder auth)
            throws Exception {
        auth
                .userDetailsService(userDetailsService)
                .passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {


        http
                .csrf().disable()
                .authorizeRequests()
                .antMatchers("/admin/**").hasAuthority("ADMIN")
                .antMatchers("/items/**").permitAll()
                .antMatchers("/profile").authenticated()
                .antMatchers("/logout").authenticated()
                .antMatchers("/registration").anonymous()
                .anyRequest().permitAll()
                .and()
                .formLogin()
                .loginPage("/login")
                .usernameParameter("username")
                .passwordParameter("password")
                .defaultSuccessUrl("/admin/admin_catalog")
                .and()
                .rememberMe().rememberMeParameter("remember_me");
    }


    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

}
