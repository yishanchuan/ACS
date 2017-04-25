package ssh;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.web.entity.User;
import com.web.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath*:spring.xml"})
public class PublicOB {

	@Resource
	private UserService userService;
	@Test
	public void testGet(){
		User user=userService.get(1);
		System.out.println(user.getUserName());
	}
}
