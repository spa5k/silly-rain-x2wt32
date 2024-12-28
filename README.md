# Project Management API

A RESTful API for managing projects, tasks, and team collaboration built with Django and Django REST Framework.

## Features

- User Authentication with JWT
- Project Management
- Task Management
- Team Collaboration
- Comments System

## API Endpoints

### Authentication
- `POST /api/token/`: Obtain JWT token
- `POST /api/token/refresh/`: Refresh JWT token

### Users
- `POST /api/users/`: Register new user
- `GET /api/users/{id}/`: Get user details
- `PUT/PATCH /api/users/{id}/`: Update user details
- `DELETE /api/users/{id}/`: Delete user

### Projects
- `GET /api/projects/`: List all projects
- `POST /api/projects/`: Create new project
- `GET /api/projects/{id}/`: Get project details
- `PUT/PATCH /api/projects/{id}/`: Update project
- `DELETE /api/projects/{id}/`: Delete project

### Project Members
- `GET /api/projects/{project_id}/members/`: List project members
- `POST /api/projects/{project_id}/members/`: Add project member
- `GET /api/projects/{project_id}/members/{id}/`: Get member details
- `PUT/PATCH /api/projects/{project_id}/members/{id}/`: Update member role
- `DELETE /api/projects/{project_id}/members/{id}/`: Remove member

### Tasks
- `GET /api/projects/{project_id}/tasks/`: List project tasks
- `POST /api/projects/{project_id}/tasks/`: Create new task
- `GET /api/tasks/{id}/`: Get task details
- `PUT/PATCH /api/tasks/{id}/`: Update task
- `DELETE /api/tasks/{id}/`: Delete task

### Comments
- `GET /api/tasks/{task_id}/comments/`: List task comments
- `POST /api/tasks/{task_id}/comments/`: Create new comment
- `GET /api/comments/{id}/`: Get comment details
- `PUT/PATCH /api/comments/{id}/`: Update comment
- `DELETE /api/comments/{id}/`: Delete comment

## Setup Instructions

1. Clone the repository:
```bash
git clone <repository-url>
cd <project-directory>
```

2. Create and activate a virtual environment:
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

3. Install dependencies:
```bash
pip install -r requirements.txt
```

4. Apply database migrations:
```bash
python manage.py migrate
```

5. Create a superuser (optional):
```bash
python manage.py createsuperuser
```

6. Run the development server:
```bash
python manage.py runserver
```

The API will be available at `http://localhost:8000/api/`

## Authentication

The API uses JWT (JSON Web Token) authentication. To authenticate:

1. Obtain a token by sending a POST request to `/api/token/` with your credentials:
```json
{
    "username": "your_username",
    "password": "your_password"
}
```

2. Include the token in the Authorization header of your requests:
```
Authorization: Bearer <your_token>
```

## Development

- The project uses SQLite by default. For production, configure PostgreSQL in `settings.py`
- CORS is enabled for all origins in development. Configure `CORS_ALLOWED_ORIGINS` for production
- JWT tokens expire after 60 minutes. Configure `SIMPLE_JWT` settings as needed

## License

This project is licensed under the MIT License - see the LICENSE file for details.
