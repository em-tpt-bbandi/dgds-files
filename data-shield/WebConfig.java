package em.datashield;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("https://2079-49-205-67-191.ngrok-free.app") // Add your frontend origin here
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                .allowedHeaders("Content-Type", "X-Auth-Token", "Origin", "Authentication") // List your allowed headers
                .exposedHeaders("Content-Type", "X-Auth-Token", "Origin", "Authentication") // Expose the Authorization header
                .allowCredentials(true);
    }
}
