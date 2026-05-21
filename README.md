#**Bus Pass Application And Renewal Using Cloud Computing**
**📌 Project Overview**
A web-based cloud application that digitalizes the entire bus pass application and renewal process — eliminating manual paperwork, long queues, and counter visits. Built as part of MCA final year project at Aurora's PG College, Hyderabad.

**🎯 Problem Solved**: Traditional bus pass systems require physical visits, manual data entry, and long processing times. This system moves everything online with cloud storage for scalability and security.


**✨ Features
👤 User Features**

✅ User Registration & Login Authentication
✅ Apply for New Bus Pass online
✅ Renew Existing Bus Pass
✅ View Application Status in real-time
✅ Download/View Bus Pass with unique Booking ID
✅ Profile Management

**🔐 Admin Features**

✅ Admin Dashboard to manage all requests
✅ Approve / Reject bus pass applications
✅ View all users and their pass details
✅ Role-based Access Control

**☁️ Cloud Features**

✅ Cloud-based data storage (Scalable & Secure)
✅ No data loss — all records stored securely
✅ Accessible from any device, anywhere


**🛠️ Tech Stack**
LayerTechnologyFrontendHTML5, CSS3, JavaScriptBackendJava, JSP (JavaServer Pages), JDBCDatabaseMySQLServerApache TomcatCloud ConceptVirtualization, Scaling, Load BalancingIDEEclipse / NetBeansVersion ControlGit & GitHub

**📁 Project Structure**
BusPassApplication/
│
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   ├── servlet/          # Java Servlets (backend logic)
│   │   │   ├── dao/              # Database Access Objects
│   │   │   └── model/            # User, BusPass model classes
│   │   └── webapp/
│   │       ├── WEB-INF/
│   │       ├── css/              # Stylesheets
│   │       ├── js/               # JavaScript files
│   │       ├── images/
│   │       ├── index.jsp         # Home page
│   │       ├── login.jsp         # Login page
│   │       ├── register.jsp      # Registration page
│   │       ├── apply.jsp         # Apply for bus pass
│   │       ├── renew.jsp         # Renewal page
│   │       └── admin/            # Admin panel pages
│
├── sql/
│   └── buspass_db.sql            # Database schema & sample data
│
└── README.md

**🗄️ Database Schema**
sql-- Users Table
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    dob DATE,
    address TEXT,
    phone VARCHAR(15),
    role ENUM('user', 'admin') DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Bus Pass Table
CREATE TABLE bus_pass (
    pass_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    booking_id VARCHAR(50) UNIQUE,
    pass_type VARCHAR(50),
    from_location VARCHAR(100),
    to_location VARCHAR(100),
    valid_from DATE,
    valid_to DATE,
    status ENUM('pending', 'approved', 'rejected') DEFAULT 'pending',
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

**🚀 How to Run Locally**
Prerequisites

Java JDK 8 or above
Apache Tomcat 9
MySQL (Port 3306 / 3307)
Eclipse IDE or NetBeans

**Steps**
bash# 1. Clone the repository
git clone https://github.com/KishorePandavula/BusPassApplication.git

# 2. Import project into Eclipse
File → Import → Existing Projects into Workspace

# 3. Set up the database
- Open MySQL Workbench
- Run sql/buspass_db.sql to create tables

# 4. Configure DB connection in DBConnection.java
String url = "jdbc:mysql://localhost:3307/buspass_db";
String user = "root";
String password = "your_password";

# 5. Deploy on Tomcat
- Right click project → Run As → Run on Server
- Select Apache Tomcat

# 6. Open browser
http://localhost:8080/BusPassApplication/


**📊 System Architecture**
User (Browser)
      ↓
   JSP Pages (Frontend)
      ↓
   Java Servlets (Business Logic)
      ↓
   JDBC (Database Layer)
      ↓
   MySQL Database (Cloud Storage)

**🔮 Future Enhancements**

 QR Code generation for digital bus pass scanning
 Real-time GPS tracking integration
 Online payment gateway (Razorpay / PayPal)
 Mobile app (Android)
 Email/SMS notifications for pass approval


**👨‍💻 Developer**
**Pandavula Kishore**

🎓 MCA Graduate — Aurora's PG College, Hyderabad (CGPA: 9.03)
💼 Java Full Stack Developer
📧 pandavulakishore@gmail.com
🔗 LinkedIn
🐙 GitHub


**📄 License**
This project is developed for academic purposes as part of MCA curriculum.

**⭐ If you found this project useful, please give it a star!**
