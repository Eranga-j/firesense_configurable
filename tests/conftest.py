# conftest.py - PostgreSQL Test Database Version
import pytest
import sys
sys.path.insert(0, r"C:\Users\User\Desktop\firesense_configurable")

from app import app, db

# Test database configuration
TEST_DATABASE_URI = 'postgresql://postgres:postgres123@localhost/firesense_hotel_test'

@pytest.fixture(scope='session')
def test_app():
    """Create application with test database"""
    # Save original config
    original_db_uri = app.config['SQLALCHEMY_DATABASE_URI']
    
    # Configure for testing
    app.config['TESTING'] = True
    app.config['SQLALCHEMY_DATABASE_URI'] = TEST_DATABASE_URI
    app.config['WTF_CSRF_ENABLED'] = False
    app.config['SECRET_KEY'] = 'test-secret-key'
    
    with app.app_context():
        # Create all tables in test database
        db.create_all()
        
        # Seed test database with initial data
        seed_test_database()
        
        yield app
        
        # Cleanup: Drop all tables after tests
        db.session.remove()
        db.drop_all()
    
    # Restore original config
    app.config['SQLALCHEMY_DATABASE_URI'] = original_db_uri

@pytest.fixture
def client(test_app):
    """Create test client"""
    return test_app.test_client()

@pytest.fixture
def db_session(test_app):
    """Create database session for tests"""
    with test_app.app_context():
        yield db.session
        db.session.rollback()

def seed_test_database():
    """Seed test database with initial test data"""
    from app import User, HotelSettings
    import bcrypt
    
    # Create test users
    users_data = [
        {
            'username': 'admin',
            'password': 'admin123',
            'email': 'admin@test.com',
            'role': 'Admin',
            'phone': '0771234567',
            'status': 'ACTIVE'
        },
        {
            'username': 'manager',
            'password': 'manager123',
            'email': 'manager@test.com',
            'role': 'Manager',
            'phone': '0771234568',
            'status': 'ACTIVE'
        },
        {
            'username': 'technician',
            'password': 'tech123',
            'email': 'tech@test.com',
            'role': 'Technician',
            'phone': '0771234569',
            'status': 'ACTIVE'
        }
    ]
    
    for user_data in users_data:
        # Check if user already exists
        existing = User.query.filter_by(username=user_data['username']).first()
        if not existing:
            password_hash = bcrypt.hashpw(user_data['password'].encode('utf-8'), bcrypt.gensalt())
            user = User(
                username=user_data['username'],
                password=password_hash.decode('utf-8'),
                email=user_data['email'],
                role=user_data['role'],
                phone=user_data['phone'],
                status=user_data['status']
            )
            db.session.add(user)
    
    # Create hotel settings
    existing_hotel = HotelSettings.query.first()
    if not existing_hotel:
        hotel = HotelSettings(
            hotel_name='Test Hotel',
            city='Colombo',
            province='Western',
            star_rating=5,
            total_rooms=50,
            hotel_type='City Hotel'
        )
        db.session.add(hotel)
    
    db.session.commit()
    print("Test database seeded successfully")