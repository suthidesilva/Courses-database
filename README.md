# College Course Management System

This repository contains the code for a College Course Management System database schema. It's designed to manage information related to students, instructors, courses, and course meetings in a college setting.

## Overview

The database schema consists of the following tables:

- **Yotes**: Stores information about students.
- **Instructors**: Stores information about instructors.
- **CourseDetails**: Contains details about each course, such as subject, number, title, description, and credits.
- **Courses**: Stores information about courses offered, including the subject, number, section, year, term, and instructor.
- **CourseMeetings**: Stores details about the meetings for each course, including days, start time, end time, and location.
- **CourseStudent**: Manages the enrollment of students in courses.

## Schema

The schema is designed to ensure data integrity and minimize redundancy. It includes primary keys, foreign keys, and constraints to maintain referential integrity and enforce business rules.

## Usage

To use this schema, you can:

1. Create a new database and execute the SQL code to create the tables.
2. Populate the tables with your data.
3. Query the database to retrieve information about students, instructors, courses, and course meetings.

## Example Queries

Here are some example queries you can run on this schema:

- Retrieve information about courses enrolled by a specific student.
- Get details about the instructor teaching a particular course.
- Find out the meeting schedule for a specific course.

## Contributing

Contributions are welcome! If you have any suggestions, improvements, or bug fixes, feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
