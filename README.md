# Flutter ToDo App

A simple task management application built with **Flutter**.  
The app allows users to add, edit, complete, and delete tasks with a clean and modern UI.

---

## Features

- Add new tasks with title and details  
- Edit existing tasks to update their information  
- Mark tasks as completed and view them in a separate "Completed" section  
- Delete tasks permanently  
- Simple navigation between "ToDo" and "Completed" lists  
- Custom UI with styled buttons, floating action button, and task cards  

---

## Project Structure

lib/
│
├── main.dart # Entry point of the app
├── home_page.dart # Main page with navigation between ToDo and Completed
├── add_task_page.dart # Page for adding a new task
├── edit_task_page.dart # Page for editing a task
├── models/
│ └── task.dart # Task model (title, detail, completed status)

---

## How It Works

1. On the **ToDo page**, tasks are displayed in a list with options to edit or delete.  
2. The **floating action button (+)** opens a form to create a new task.  
3. Tapping the **edit icon** opens the Edit page where the task can be updated.  
4. Tasks marked as completed move to the **Completed page**.  
5. Both lists persist until the app is restarted (in-memory storage by default).  

---
