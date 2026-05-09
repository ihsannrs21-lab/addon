package com.example.plugins

import io.ktor.server.application.*
import io.ktor.server.routing.*
import com.example.routes.configureHealthRoutes
import com.example.routes.configureUserRoutes

fun Application.configureRouting() {
    routing {
        configureHealthRoutes()
        configureUserRoutes()
    }
}