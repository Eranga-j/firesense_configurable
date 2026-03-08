# test_postgresql_database.py
import pytest
from datetime import datetime, timedelta

class TestPostgreSQLConnection:
    """Test PostgreSQL database connection"""
    
    def test_database_connected(self, client):
        """Test we're connected to PostgreSQL database"""
        from app import db
        with client.application.app_context():
            # Check database engine is PostgreSQL
            assert 'postgresql' in str(db.engine.url)
            # Database is connected (either test or production)
            assert db.engine.url.database in ['firesense_hotel', 'firesense_hotel_test']
    
    def test_tables_created(self, client):
        """Test all tables were created"""
        from app import db
        with client.application.app_context():
            # Get all table names
            inspector = db.inspect(db.engine)
            tables = inspector.get_table_names()
            
            # Check critical tables exist
            assert 'users' in tables
            assert 'equipment' in tables
            assert 'hotel_settings' in tables
            assert 'maintenance_record' in tables
            print(f"✓ Found {len(tables)} tables in test database")

class TestUserManagement:
    """Test user CRUD operations"""
    
    def test_admin_user_exists(self, client):
        """Test admin user was created"""
        from app import User
        with client.application.app_context():
            admin = User.query.filter_by(username='admin').first()
            assert admin is not None
            assert admin.role == 'Admin'
            assert admin.email == 'admin@test.com'
    
    def test_all_test_users_exist(self, client):
        """Test all test users were created"""
        from app import User
        with client.application.app_context():
            users = User.query.all()
            assert len(users) >= 3  # admin, manager, technician
            
            usernames = [u.username for u in users]
            assert 'admin' in usernames
            assert 'manager' in usernames
            assert 'technician' in usernames
    
    def test_create_new_user(self, client):
        """Test creating a new user"""
        from app import User, db
        import bcrypt
        
        with client.application.app_context():
            password = bcrypt.hashpw('newuser123'.encode('utf-8'), bcrypt.gensalt())
            new_user = User(
                username='testuser',
                password=password.decode('utf-8'),
                email='testuser@test.com',
                role='Technician',
                status='ACTIVE'
            )
            db.session.add(new_user)
            db.session.commit()
            
            # Verify
            saved_user = User.query.filter_by(username='testuser').first()
            assert saved_user is not None
            assert saved_user.email == 'testuser@test.com'

class TestEquipmentOperations:
    """Test equipment CRUD with PostgreSQL"""
    
    def test_create_equipment(self, client):
        """Test creating equipment record"""
        from app import Equipment, db
        
        with client.application.app_context():
            equipment = Equipment(
                equipment_id='FE000001',
                equipment_type='Fire Extinguisher',
                serial_number='TEST-001',
                manufacturer='Test Manufacturer',
                model='Model X',
                install_year=2024,
                install_date=datetime(2024, 1, 15).date(),
                last_service_date=datetime(2024, 3, 1).date(),
                next_service_date=datetime(2024, 9, 1).date(),
                service_interval_months=6,
                location='Test Kitchen',
                floor='Ground Floor',
                zone='Zone A',
                condition='Good',
                status='ACTIVE',
                created_by=1
            )
            
            db.session.add(equipment)
            db.session.commit()
            
            # Verify
            saved = Equipment.query.filter_by(equipment_id='FE000001').first()
            assert saved is not None
            assert saved.equipment_type == 'Fire Extinguisher'
            assert saved.location == 'Test Kitchen'
    
    def test_update_equipment(self, client):
        """Test updating equipment"""
        from app import Equipment, db
        
        with client.application.app_context():
            # Create equipment
            equipment = Equipment(
                equipment_id='FE000002',
                equipment_type='Smoke Detector',
                install_year=2024,
                install_date=datetime(2024, 1, 1).date(),
                last_service_date=datetime(2024, 1, 1).date(),
                location='Hallway',
                status='ACTIVE'
            )
            db.session.add(equipment)
            db.session.commit()
            
            # Update it
            equipment.condition = 'Fair'
            equipment.notes = 'Needs attention'
            db.session.commit()
            
            # Verify update
            updated = Equipment.query.filter_by(equipment_id='FE000002').first()
            assert updated.condition == 'Fair'
            assert updated.notes == 'Needs attention'
    
    def test_delete_equipment(self, client):
        """Test deleting equipment (soft delete)"""
        from app import Equipment, db
        
        with client.application.app_context():
            # Create equipment
            equipment = Equipment(
                equipment_id='FE000003',
                equipment_type='Fire Alarm',
                install_year=2024,
                install_date=datetime(2024, 1, 1).date(),
                last_service_date=datetime(2024, 1, 1).date(),
                location='Lobby',
                status='ACTIVE'
            )
            db.session.add(equipment)
            db.session.commit()
            
            # Soft delete (mark as inactive)
            equipment.status = 'INACTIVE'
            db.session.commit()
            
            # Verify
            deleted = Equipment.query.filter_by(equipment_id='FE000003').first()
            assert deleted.status == 'INACTIVE'
    
    def test_query_equipment_by_type(self, client):
        """Test querying equipment by type"""
        from app import Equipment, db
        
        with client.application.app_context():
            # Create multiple equipment
            equipment_types = ['Fire Extinguisher', 'Fire Extinguisher', 'Smoke Detector']
            
            for i, eq_type in enumerate(equipment_types):
                equipment = Equipment(
                    equipment_id=f'FE00000{i+10}',
                    equipment_type=eq_type,
                    install_year=2024,
                    install_date=datetime(2024, 1, 1).date(),
                    last_service_date=datetime(2024, 1, 1).date(),
                    location=f'Location {i}',
                    status='ACTIVE'
                )
                db.session.add(equipment)
            db.session.commit()
            
            # Query by type
            extinguishers = Equipment.query.filter_by(
                equipment_type='Fire Extinguisher',
                status='ACTIVE'
            ).all()
            
            assert len(extinguishers) >= 2

class TestMaintenanceRecords:
    """Test maintenance record operations"""
    
    def test_create_maintenance_record(self, client):
        """Test creating maintenance record"""
        from app import Equipment, MaintenanceRecord, db
        
        with client.application.app_context():
            # Create equipment first
            equipment = Equipment(
                equipment_id='FE000020',
                equipment_type='Fire Hose',
                install_year=2024,
                install_date=datetime(2024, 1, 1).date(),
                last_service_date=datetime(2024, 1, 1).date(),
                location='Stairwell',
                status='ACTIVE'
            )
            db.session.add(equipment)
            db.session.commit()
            
            # Create maintenance record
            record = MaintenanceRecord(
                record_id='M000001',
                equipment_id=equipment.id,
                user_id=1,
                maintenance_date=datetime(2024, 3, 1).date(),
                maintenance_type='Routine',
                technician_name='John Doe',
                technician_company='Test Company',
                issues_found='None',
                actions_taken='Inspection completed',
                status='Completed'
            )
            db.session.add(record)
            db.session.commit()
            
            # Verify
            saved = MaintenanceRecord.query.filter_by(record_id='M000001').first()
            assert saved is not None
            assert saved.maintenance_type == 'Routine'
            assert saved.technician_name == 'John Doe'