package com.pluralsight.security.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;

import com.pluralsight.security.service.CryptoOidcUserService;
import com.pluralsight.security.service.KeycloakLogoutHandler;
import com.pluralsight.security.userdetails.Oauth2AuthenticationSuccessHandler;

@Configuration
@EnableGlobalMethodSecurity(prePostEnabled=true)
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private Oauth2AuthenticationSuccessHandler oauthSuccessHandler;
	@Autowired
	private KeycloakLogoutHandler logoutHandler;
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// @formatter:off
		http
			.logout().addLogoutHandler(logoutHandler)
			.and()
			.oauth2Login()
				.loginPage("/oauth2/authorization/crypto-portfolio")
				.successHandler(oauthSuccessHandler)
				.userInfoEndpoint()
					.oidcUserService(new CryptoOidcUserService())
				.and()
			.and()
			.authorizeRequests()
				.mvcMatchers("/register","/login","/login-error",
						"/login-verified").permitAll()
				.mvcMatchers("/portfolio/**").hasRole("USER")
				.mvcMatchers("/support/**").hasAnyRole("USER","ADMIN")
				.mvcMatchers("/support/admin/**").access("isFullyAuthenticated() and hasRole('ADMIN')")
				.mvcMatchers("/api/users").hasRole("ADMIN")
				.mvcMatchers("/api/users/{username}/portfolio")
					.access("@isPortfolioOwnerOrAdmin.check(#username)")
				.anyRequest().denyAll();

		// @formatter:on
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/css/**", "/webjars/**");
	}
	
	@Bean
	public RedirectStrategy getRedirectStrategy() {
		return new DefaultRedirectStrategy();
	}	
	
}