package ru.kpfu.itis.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.kpfu.itis.model.entity.Chat;
import ru.kpfu.itis.model.entity.Group;
import ru.kpfu.itis.model.entity.User;
import ru.kpfu.itis.repository.SpringUserRepository;

import java.util.List;

@Service
public class UserService {

    private final SpringUserRepository userRepository;

    @Autowired
    public UserService(SpringUserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User saveUser(User user) {
        return userRepository.save(user);
    }

    public User findOne(Long id) {
        return userRepository.findOne(id);
    }

    public List<Chat> findAllChats(Long userId) {
        return findOne(userId).getChatList();
    }

    public User findUserByToken(String token) {
        return userRepository.findByOpenid(token);
    }

    public User findUserByFullName(String fullName) {
        return userRepository.findByFullName(fullName);
    }

    public void addGroup(Group group, User user){
        group.addParticipant(user);
        user.addGroup(group);
        userRepository.save(user);
    }

    public void unsubscribeFromGroup(Group group, User user){
        group.deleteParticipant(user);
        user.deleteGroup(group);
        userRepository.save(user);
    }

}
