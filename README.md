# Ktor Project

A simple Ktor server application with basic REST API endpoints.

## Features
- Health check endpoint
- User management API (GET, POST)
- JSON serialization
- Structured routing

## Getting Started

### Prerequisites
- Java 11+
- Gradle 7.0+

### Run the Application
```bash
./gradlew run
```

The server will start on `http://localhost:8080`

### API Endpoints

- `GET /health` - Health check
- `GET /users` - Get all users
- `GET /users/{id}` - Get user by ID
- `POST /users` - Create new user

### Testing
```bash
./gradlew test
```

## Project Structure
- `Application.kt` - Main entry point
- `plugins/` - Configuration modules (Serialization, Routing)
- `routes/` - API route handlers
- `resources/` - Configuration files