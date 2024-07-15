//
//  Repository.swift
//  Login
//
//  Created by Diggo Silva on 15/07/24.
//

import Foundation

class Repository {
    let userDefaults = UserDefaults.standard
    let accessKey = "accessKey"
    var users: [User] = [User]()
    
    private func getUserList() -> [User] {
        guard let data = userDefaults.object(forKey: accessKey) as? Data else { return [] }
        do {
            let userList = try JSONDecoder().decode([User].self, from: data)
            return userList
        } catch {
            print("DEBUG: Erro ao decodificar usuário: \(error.localizedDescription)")
            return []
        }
    }
    
    private func saveUserList(userList: [User]) {
        do {
            let data = try JSONEncoder().encode(userList)
            userDefaults.set(data, forKey: accessKey)
        } catch {
            print("DEBUG: Erro ao codificar usuário: \(error.localizedDescription)")
        }
    }
    
    func save(user: User, onSuccess: () -> Void, onError: () -> Void) {
        var userList = getUserList()
        
        let checkEmail = userList.contains(where: { $0.email == user.email })
        
        if checkEmail {
            print("DEBUG: Este email já está sendo usado.")
            print("DEBUG: Temos \(userList.count) usuários nessa lista")
            onError()
        } else {
            userList.append(user)
            saveUserList(userList: userList)
            print("DEBUG: Temos \(userList.count) usuários nessa lista")
            onSuccess()
        }
    }
    
    func getUser(email: String, password: String) -> User? {
        let userList = getUserList()
        let checkUser = userList.first(where: { $0.email == email && $0.password == password })
        return checkUser
    }
    
    func updateUser(user: User) {
        var userList = getUserList()
        
        if let index = userList.firstIndex(where: { $0.email == user.email }) {
            userList[index] = user
            saveUserList(userList: userList)
        }
    }
}
