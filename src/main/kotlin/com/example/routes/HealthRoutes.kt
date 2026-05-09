package com.example.routes

import io.ktor.server.routing.*
import io.ktor.server.response.*
import kotlinx.serialization.Serializable

@Serializable
data class HealthResponse(val status: String)

fun Route.configureHealthRoutes() {
    get("/health") {
        call.respond(HealthResponse("OK"))
    }
}