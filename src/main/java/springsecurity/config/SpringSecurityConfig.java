package springsecurity.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		auth.inMemoryAuthentication().withUser("john").password("{noop}john123").roles("EMPLOYEE");
		auth.inMemoryAuthentication().withUser("susan").password("{noop}susan123").roles("EMPLOYEE");
		auth.inMemoryAuthentication().withUser("jason").password("{noop}jason123").roles("EMPLOYEE");
		auth.inMemoryAuthentication().withUser("mary").password("{noop}mary123").roles("EMPLOYEE", "ADMIN");
		auth.inMemoryAuthentication().withUser("mark").password("{noop}mark123").roles("EMPLOYEE", "ADMIN");
		auth.inMemoryAuthentication().withUser("tom").password("{noop}tom123").roles("MANAGER");
		auth.inMemoryAuthentication().withUser("mrbigboss").password("{noop}boss123").roles("BOSS");
		
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.authorizeRequests()
		.antMatchers("/").hasAnyRole("EMPLOYEE","ADMIN","MANAGER","BOSS")
		.antMatchers("/employee/**").hasRole("EMPLOYEE")
		.antMatchers("/admin/**").hasRole("ADMIN")
		.antMatchers("/manager/**").hasRole("MANAGER")
		.antMatchers("/boss/**").hasRole("BOSS")
		.and()
		.formLogin()
		.loginPage("/loginPage")
		.loginProcessingUrl("/authenticateUser")
		.permitAll()
		.and()
		.logout().permitAll()
		.and()
		.exceptionHandling().accessDeniedPage("/access-denied");
		
		
	}
	
	

}
