package com.ensah.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;


@Configuration
@EnableWebSecurity
public class AppSecurityConfig extends WebSecurityConfigurerAdapter {


	@Bean
	public UserDetailsService getUserDetailsService() {
		return new MyUserDetailsService();
	}

	@Bean
	public PasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	@Bean
	public AuthenticationProvider authProvider(){
		DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
		provider.setUserDetailsService(getUserDetailsService());
		provider.setPasswordEncoder(getPasswordEncoder());
		return provider;
	}


	@Override
	protected void configure(HttpSecurity http) throws Exception {
		String[] staticResources = {
				"/images/**",
				"/scripts/**",
		};

		http.csrf().disable()//not recommended
				.authorizeRequests()
				.antMatchers("/login").permitAll()
				.antMatchers("/inscrirption", "/inscrirptionForm").permitAll()
				.antMatchers(staticResources).permitAll()
				.anyRequest().authenticated()
				.and()
				.formLogin()
				.loginPage("/login")
				.permitAll()
				.and()
				.logout()
				.invalidateHttpSession(true)
				.clearAuthentication(true)
				.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
				.logoutSuccessUrl("/login")
				.permitAll();
	}
}
