package com.nci.petkeepers.repository;

import com.nci.petkeepers.model.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UsersRepository extends JpaRepository<Users,Long> {

    Users findByUsername(String username);

    List<Users> findByUsertype(String usertype);
}
