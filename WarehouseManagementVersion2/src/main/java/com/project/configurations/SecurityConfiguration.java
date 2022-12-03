package com.project.configurations;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.project.services.AccountService;

@EnableWebSecurity
@Configuration
public class SecurityConfiguration {

	@Autowired
	private AccountService accountService;

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http.cors().and().csrf().disable();
		http.authorizeRequests()
				.antMatchers("/login/**").permitAll()
				.antMatchers("/register/**").permitAll()
				.antMatchers("/employee/**").access("hasRole('ROLE_ADMIN')")
				.antMatchers("/supplier/add/**").access("hasRole('ROLE_ADMIN')")
				.antMatchers("/supplier/edit/**").access("hasRole('ROLE_ADMIN')")
				
				.antMatchers("/category/**").access("hasRole('ROLE_ADMIN') or hasRole('ROLE_EMPLOYEE')")
				.antMatchers("/product/**").access("hasRole('ROLE_ADMIN') or hasRole('ROLE_EMPLOYEE')")
				.antMatchers("/customer/**").access("hasRole('ROLE_ADMIN') or hasRole('ROLE_EMPLOYEE')")
				.antMatchers("/invoice/**").access("hasRole('ROLE_ADMIN') or hasRole('ROLE_EMPLOYEE')")
				.and().formLogin().loginPage("/account/login") // khai báo đường dẫn tới form login
				.loginProcessingUrl("/account/process-login")
				.defaultSuccessUrl("/invoice/listimport")
				.failureUrl("/account/login?error") // dùng query String để phân biệt login lúc vào và login ko thành
													// công
				.usernameParameter("username") // name cua textbox username
				.passwordParameter("password") // name cua textbox password
				.and().logout().logoutUrl("/account/logout").logoutSuccessUrl("/account/login?logout") // đến đây thì user login
																								// bằng 3 url
				.and().exceptionHandling().accessDeniedPage("/account/accessdenied");

		return http.build();
	}

	// đối tượng tham gia mã hóa password
	@Bean
	public BCryptPasswordEncoder encoder() {
		return new BCryptPasswordEncoder();
	}

	// để nói cho Spring phải đi vào accountService để vào class
	// AccountServiceImplement, lấy hàm loadUserByUsername để check user
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder builder) throws Exception {
		builder.userDetailsService(accountService);
	}

}
