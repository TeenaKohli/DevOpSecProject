package com.nci.petkeepers;


import com.nci.petkeepers.model.Users;
import com.nci.petkeepers.repository.UsersRepository;
import org.apache.catalina.User;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.junit.jupiter.api.Test;

import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class PetkeepersApplicationTests {

    @Autowired
    UsersRepository usersRepository;


    @Test
    void contextLoads() {

    }

    @Test
    void checkDB(){
        usersRepository.count();
        Assert.assertEquals(usersRepository.count(),4);
    }

    @Test
    void checkDBname(){
        Users users = usersRepository.findByUsername("pratikkasalkar");
        Assert.assertEquals("pratikkasalkar", users.getUsername());
    }

}
	@Test
	void contextLoads() {
	}

}

