package com.example

import io.ktor.client.request.*
import io.ktor.client.statement.*
import io.ktor.server.testing.*
import kotlin.test.Test
import kotlin.test.assertEquals
import com.example.plugins.configureRouting
import com.example.plugins.configureSerialization

class ApplicationTest {
    @Test
    fun testHealthEndpoint() = testApplication {
        application {
            configureSerialization()
            configureRouting()
        }
        
        val response = client.get("/health")
        assertEquals(200, response.status.value)
        assertEquals("""{"status":"OK"}""", response.bodyAsText())
    }

    @Test
    fun testGetUsers() = testApplication {
        application {
            configureSerialization()
            configureRouting()
        }
        
        val response = client.get("/users")
        assertEquals(200, response.status.value)
    }
}