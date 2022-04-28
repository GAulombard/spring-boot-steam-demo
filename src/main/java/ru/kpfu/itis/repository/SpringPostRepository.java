package ru.kpfu.itis.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.kpfu.itis.model.entity.Post;

import java.util.Set;

@Repository
public interface SpringPostRepository extends JpaRepository<Post, Long> {

    Set<Post> findPostByGroupId(Long id);

}
