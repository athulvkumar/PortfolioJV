# Portfolio Web Application

A full-stack Java web application for managing and showcasing a personal portfolio, including projects, skills, and a contact form. Features an admin panel for easy management.

## Features

- **Personal Portfolio Website**: Modern, responsive design to showcase skills and projects.
- **Admin Panel**: Secure login for administrators to add projects and skills.
- **Project Management**: Add, view, and display projects with tech stack, description, image, and GitHub link.
- **Skill Management**: Add, view, and display skills with icons and proficiency percentage.
- **Contact Form**: Visitors can send messages, which are stored in the database and viewable by the admin.
- **MySQL Database Integration**: All data is stored and managed in a MySQL database.

## Tech Stack

- Java (Servlets, JSP)
- Jakarta Servlet API
- JSTL
- MySQL
- Maven (WAR packaging)
- HTML, CSS, JavaScript (frontend)

## Project Structure

```
Portfolio/
  ├── pom.xml
  ├── src/
  │   └── main/
  │       ├── java/com/portfolio/
  │       │   ├── dao/         # Data Access Objects
  │       │   ├── model/       # JavaBeans/Models
  │       │   ├── servlet/     # Servlets
  │       │   ├── util/        # Utility classes (DB connection)
  │       │   └── test/        # Test classes
  │       ├── resources/
  │       └── webapp/
  │           ├── admin/       # Admin JSPs
  │           ├── assets/      # Images/icons
  │           ├── css/         # Stylesheets
  │           ├── js/          # JavaScript
  │           ├── index.jsp    # Main portfolio page
  │           ├── submitContact.jsp # Contact form handler
  │           └── WEB-INF/
  │               └── web.xml  # Deployment descriptor
  └── target/                  # Build output
```

## Setup & Installation

1. **Clone the repository**
   ```
   git clone <repo-url>
   cd Portfolio
   ```

2. **Configure the Database**
   - Install MySQL and create a database named `portfolio`.
   - Update the credentials in `src/main/java/com/portfolio/util/DBConnection.java` if needed (default: user `root`, password `root`).
   - Create the required tables (see below for schema).

3. **Build the Project**
   ```
   mvn clean package
   ```
   This will generate a `Portfolio.war` file in the `target/` directory.

4. **Deploy**
   - Deploy the WAR file to a servlet container (e.g., Apache Tomcat 10+).
   - Access the application at `http://localhost:8080/Portfolio/` (URL may vary based on your server config).

## Database Schema

> **Note:** You must create the following tables in your MySQL database:

```sql
CREATE TABLE `admin` (
  `username` VARCHAR(50) PRIMARY KEY,
  `password` VARCHAR(100) NOT NULL
);

CREATE TABLE `projects` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `tech` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `image` VARCHAR(255),
  `github` VARCHAR(255)
);

CREATE TABLE `skills` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100) NOT NULL,
  `icon_path` VARCHAR(255),
  `percentage` INT NOT NULL
);

CREATE TABLE `messages` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `message` TEXT NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## Admin Panel

- **Login**: `/admin/adm-login.jsp` (default credentials must be set in the `admin` table)
- **Dashboard**: View contact messages, add projects and skills
- **Add Project**: `/admin/project-add.jsp`
- **Add Skill**: `/admin/add-skill.jsp`

## Testing Database Connection

Run the following Java class to test your DB connection:

```
public class TestDB {
    public static void main(String[] args) throws SQLException {
        try (Connection con = DBConnection.getConnection()) {
            if(con != null) {
                System.out.println("Database Connection success");
            } else {
                System.out.println("Database Connection Failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
```
