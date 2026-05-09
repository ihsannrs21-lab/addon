package com.example.routes

import io.ktor.server.routing.*
import io.ktor.server.response.*
import io.ktor.server.request.*
import kotlinx.serialization.Serializable

@Serializable
data class User(val id: Int, val name: String, val email: String)

val users = mutableListOf(
    User(1, "John Doe", "john@example.com"),
    User(2, "Jane Smith", "jane@example.com")
)

fun Route.configureUserRoutes() {
    get("/users") {
        call.respond(users)
    }
    
    get("/users/{id}") {
        val id = call.parameters["id"]?.toIntOrNull()
        if (id != null) {
            val user = users.find { it.id == id }
            if (user != null) {
                call.respond(user)
            } else {
                call.respond(mapOf("error" to "User not found"))
            }
        }
    }
    
    post("/users") {
        val user = call.receive<User>()
        users.add(user)
        call.respond(user)
    }
}