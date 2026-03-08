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
