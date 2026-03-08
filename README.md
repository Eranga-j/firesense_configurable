# 🔥 FireSense - Hotel Fire Safety Equipment Management System

[![Python](https://img.shields.io/badge/Python-3.13-blue.svg)](https://www.python.org/)
[![Flask](https://img.shields.io/badge/Flask-3.0-green.svg)](https://flask.palletsprojects.com/)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-18-blue.svg)](https://www.postgresql.org/)
[![Tests](https://img.shields.io/badge/Tests-41%20Passing-brightgreen.svg)](https://github.com/yourusername/firesense)

A comprehensive web-based fire safety equipment management system with AI-powered risk prediction for hotels. Built as a development project thesis for Cardiff Metropolitan University.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Installation](#installation)
- [Running the Application](#running-the-application)
- [Testing](#testing)
- [Project Structure](#project-structure)
- [Screenshots](#screenshots)
- [License](#license)

## 🎯 Overview

FireSense is an intelligent fire safety equipment management system designed specifically for hotels. It streamlines the tracking, maintenance scheduling, and risk assessment of fire safety equipment including fire extinguishers, smoke detectors, fire alarms, sprinkler systems, and emergency lighting.

### Key Highlights

- ✅ **Automated Risk Prediction** using Machine Learning
- ✅ **Role-Based Access Control** (Admin, Manager, Technician)
- ✅ **Real-time Dashboard** with interactive Chart.js visualizations
- ✅ **Maintenance Scheduling** with automated alerts
- ✅ **Equipment Lifecycle Management** (CRUD operations)
- ✅ **Comprehensive Test Coverage** (41 automated tests, 100% pass rate)
- ✅ **Responsive Design** with Bootstrap 5

## ✨ Features

### 🔐 Authentication & Authorization
- Secure user authentication with bcrypt password hashing
- Role-based access control (Admin, Manager, Technician)
- Session management with Flask-Login
- SQL injection protection

### 📊 Dashboard
- Real-time equipment statistics
- Risk level distribution (High/Medium/Low)
- Interactive Chart.js visualizations
- Overdue maintenance alerts
- Quick action buttons

### 🛠️ Equipment Management
- Complete CRUD operations
- Equipment categorization (Fire Extinguisher, Smoke Detector, Fire Alarm, etc.)
- Installation and service date tracking with validation
- Condition monitoring
- Serial number management
- Location tracking (floor, zone, specific location)

### 🔧 Maintenance Records
- Maintenance history tracking
- Technician information recording
- Issues and actions documentation
- Status tracking (Scheduled, Completed, Pending)
- Service interval management (3, 6, 12 months)

### 🤖 AI Risk Prediction
- Machine Learning-based risk assessment
- Equipment age analysis
- Service overdue detection
- Condition-based risk scoring
- Automated risk level classification (High/Medium/Low)

### 👥 User Management
- Multi-user support with role assignment
- User CRUD operations (Admin only)
- Activity tracking
- Status management (Active/Inactive)

### 📈 Reports & Analytics
- Equipment inventory reports
- Maintenance history reports
- Risk assessment reports
- Compliance tracking

### 🔔 Alerts & Notifications
- Overdue maintenance alerts
- High-risk equipment warnings
- Service due reminders

## 🛠️ Technology Stack

### Backend
- **Framework:** Flask 3.0
- **Database:** PostgreSQL 18
- **ORM:** SQLAlchemy 2.0
- **Authentication:** Flask-Login, bcrypt
- **ML Framework:** scikit-learn, pandas, numpy

### Frontend
- **UI Framework:** Bootstrap 5.3
- **Charts:** Chart.js 4.4
- **Icons:** Font Awesome 6.5
- **JavaScript:** Vanilla JS (ES6+)

### Testing
- **Framework:** pytest 8.3.4
- **Coverage:** pytest-cov 7.0
- **Database Testing:** PostgreSQL test database
- **Test Count:** 41 automated tests (100% pass rate)

## 📥 Installation

### Prerequisites

- Python 3.13+
- PostgreSQL 18+
- Git

### Step 1: Clone Repository
```bash
git clone https://github.com/yourusername/firesense.git
cd firesense
```

### Step 2: Create Virtual Environment
```bash
# Using Anaconda (Recommended)
conda create -n firesense python=3.13
conda activate firesense

# Or using venv
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

### Step 3: Install Dependencies
```bash
pip install -r requirements.txt --break-system-packages
```

### Step 4: Database Setup
```sql
-- In pgAdmin or psql, create databases:
CREATE DATABASE firesense_hotel;
CREATE DATABASE firesense_hotel_test;
```

### Step 5: Initialize Database
```bash
python
>>> from app import app, db
>>> with app.app_context():
...     db.create_all()
>>> exit()
```

## 🚀 Running the Application

### Development Mode
```bash
python app.py
```

Access at: `http://localhost:5000`

### Default Login Credentials

| Role | Username | Password |
|------|----------|----------|
| Admin | `admin` | `admin123` |
| Manager | `manager` | `manager123` |
| Technician | `tech1` | `tech123` |

⚠️ **Change default passwords in production!**

## 🧪 Testing

### Run All Tests
```bash
pytest tests/ -v
```

### Run Specific Test Suites
```bash
# Authentication & Authorization
pytest tests/test_api/test_TC01_authentication.py -v
pytest tests/test_api/test_TC02_role_based_access.py -v

# Equipment & Maintenance
pytest tests/test_api/test_TC03_equipment_crud.py -v
pytest tests/test_api/test_TC04_maintenance_record.py -v

# ML Model Tests
pytest tests/test_ml/test_TC05_model_load.py -v
pytest tests/test_ml/test_TC06_prediction_pipeline.py -v
pytest tests/test_ml/test_TC07_prediction_validation.py -v
```

### Generate Coverage Report
```bash
pytest --cov=. --cov-report=html
# Open htmlcov/index.html in browser
```

### Test Summary

| Test Suite | Tests | Description | Status |
|------------|-------|-------------|--------|
| TC-01: Authentication | 9 | Login, session, security | ✅ PASS |
| TC-02: Authorization | 8 | Role-based access control | ✅ PASS |
| TC-03: Equipment CRUD | 7 | Create, read, update, delete | ✅ PASS |
| TC-04: Maintenance | 4 | Maintenance records | ✅ PASS |
| TC-05: ML Model Load | 4 | Model initialization | ✅ PASS |
| TC-06: Prediction Pipeline | 4 | Feature extraction, prediction | ✅ PASS |
| TC-07: Validation | 5 | Risk detection accuracy | ✅ PASS |
| **Total** | **41** | **All test suites** | **✅ 100% PASS** |

## 📁 Project Structure
```
firesense_configurable/
├── app.py                      # Main Flask application
├── requirements.txt            # Python dependencies
├── README.md                   # Project documentation
├── .gitignore                  # Git ignore rules
│
├── static/                     # Static assets
│   ├── css/
│   │   └── styles.css         # Custom styles
│   ├── js/
│   │   ├── validation_script.js   # Form validation
│   │   └── chat.js                # Chat functionality
│   └── images/
│
├── templates/                  # Jinja2 templates
│   ├── base.html              # Base template
│   ├── login.html             # Login page
│   ├── dashboard.html         # Main dashboard
│   ├── equipment-list.html    # Equipment list
│   ├── equipment-add.html     # Add equipment
│   ├── maintenance-list.html  # Maintenance records
│   └── user-management.html   # User management
│
├── models/                     # ML models
│   └── model.pkl              # Trained risk prediction model
│
├── tests/                      # Test suite (41 tests)
│   ├── conftest.py            # Pytest configuration
│   ├── test_api/
│   │   ├── test_TC01_authentication.py       (9 tests)
│   │   ├── test_TC02_role_based_access.py    (8 tests)
│   │   ├── test_TC03_equipment_crud.py       (7 tests)
│   │   ├── test_TC04_maintenance_record.py   (4 tests)
│   │   └── test_postgresql_database.py       (16 tests)
│   └── test_ml/
│       ├── test_TC05_model_load.py           (4 tests)
│       ├── test_TC06_prediction_pipeline.py  (4 tests)
│       └── test_TC07_prediction_validation.py (5 tests)
│
└── instance/                   # Instance-specific files
    └── firesense_hotel.db     # SQLite database (if used)
```

## 📸 Screenshots

### Dashboard
![Dashboard](https://via.placeholder.com/800x400?text=Dashboard+Screenshot)

*Real-time equipment statistics with Chart.js visualizations*

### Equipment Management
![Equipment List](https://via.placeholder.com/800x400?text=Equipment+Management)

*Complete equipment lifecycle management*

### Risk Analysis
![Risk Analysis](https://via.placeholder.com/800x400?text=Risk+Analysis)

*AI-powered risk prediction and analysis*

## 📚 Key Features Documentation

### Date Validation
- Service date cannot be before installation date
- Future dates are not allowed
- Install year is automatically extracted from install date
- Next service date is calculated based on service interval

### Risk Assessment Algorithm
```python
Risk Level = f(equipment_age, days_since_service, condition, service_interval)

High Risk: days_overdue > 365 OR condition == 'Poor' OR age > 10 years
Medium Risk: days_overdue > 180 OR condition == 'Fair'
Low Risk: recently serviced AND good condition
```

### Role Permissions

| Feature | Admin | Manager | Technician |
|---------|-------|---------|------------|
| View Dashboard | ✅ | ✅ | ✅ |
| View Equipment | ✅ | ✅ | ✅ |
| Add Equipment | ✅ | ✅ | ❌ |
| Edit Equipment | ✅ | ✅ | ❌ |
| Delete Equipment | ✅ | ❌ | ❌ |
| User Management | ✅ | ❌ | ❌ |
| System Settings | ✅ | ❌ | ❌ |
| View Maintenance | ✅ | ✅ | ✅ |
| Add Maintenance | ✅ | ✅ | ✅ |

## 🔒 Security Features

- ✅ Password hashing with bcrypt
- ✅ SQL injection protection via SQLAlchemy ORM
- ✅ CSRF protection with Flask-WTF
- ✅ Session-based authentication
- ✅ Role-based authorization
- ✅ Input validation and sanitization
- ✅ Secure password requirements

## 🚀 Deployment

### Using Gunicorn (Production)
```bash
gunicorn -w 4 -b 0.0.0.0:5000 app:app
```

### Environment Variables

Create `.env` file:
```env
FLASK_APP=app.py
FLASK_ENV=production
SECRET_KEY=your-super-secret-key-change-this
DATABASE_URL=postgresql://user:password@localhost/firesense_hotel
```

## 🤝 Contributing

This is an academic project. For educational purposes only.

## 📄 License

This project is created for academic purposes as part of the Cardiff Metropolitan University Development Project (CSE6035).

**Academic Use Only** - Not licensed for commercial use.

## 👨‍💻 Author

**Gayan Eranga**
- Institution: Cardiff Metropolitan University (via ICBT Campus)
- Programme: BSc (Hons) Software Engineering
- Module: CSE6035 - Development Project

## 🙏 Acknowledgments

- Cardiff Metropolitan University
- ICBT Campus
- Flask & SQLAlchemy Communities
- Bootstrap & Chart.js Teams

## 📚 References

1. Flask Documentation - https://flask.palletsprojects.com/
2. SQLAlchemy Documentation - https://www.sqlalchemy.org/
3. PostgreSQL Documentation - https://www.postgresql.org/docs/
4. Chart.js Documentation - https://www.chartjs.org/
5. Bootstrap 5 Documentation - https://getbootstrap.com/
6. pytest Documentation - https://pytest.org/
7. scikit-learn - https://scikit-learn.org/

---

**Development Timeline:** September 2024 - March 2026

**Project Status:** ✅ Complete (Thesis Submission Ready)

**Last Updated:** March 5, 2026

---

⭐ **Academic Project - Cardiff Metropolitan University - Development Project (CSE6035)**
