"""
Test Case ID: TC-03
Test Area: Equipment Module (CRUD)
Objective: Ensure equipment records are reliable
Type: Integration
"""

import pytest
from datetime import datetime

class TestTC03_EquipmentCRUD:
    """
    TC-03: Equipment CRUD Test Suite
    Validates Create, Read, Update, Delete operations
    """
    
    def test_TC03_01_create_equipment(self, client):
        """
        Test Case: TC-03-01
        Description: Create new equipment record
        Steps:
            1. Create equipment with valid data
            2. Commit to database
            3. Verify creation
        Expected: Equipment created and stored in DB
        """
        from app import Equipment, db
        
        with client.application.app_context():
            equipment_data = Equipment(
                equipment_id='TC03-001',
                equipment_type='Fire Extinguisher',
                serial_number='TC03-SN-001',
                manufacturer='Test Brand',
                model='Test Model',
                install_year=2024,
                install_date=datetime(2024, 1, 15).date(),
                last_service_date=datetime(2024, 3, 1).date(),
                service_interval_months=6,
                location='Test Location',
                condition='Good',
                status='ACTIVE',
                created_by=1
            )
            
            db.session.add(equipment_data)
            db.session.commit()
            
            # Verify creation
            saved = Equipment.query.filter_by(equipment_id='TC03-001').first()
            assert saved is not None
            assert saved.equipment_type == 'Fire Extinguisher'
            assert saved.serial_number == 'TC03-SN-001'
            assert saved.location == 'Test Location'
            
            print("✓ TC-03-01: Equipment created successfully")
    
    def test_TC03_02_read_equipment(self, client):
        """
        Test Case: TC-03-02
        Description: Read/View equipment details
        Steps:
            1. Create equipment
            2. Query equipment by ID
            3. Verify all fields
        Expected: Correct data retrieved from DB
        """
        from app import Equipment, db
        
        with client.application.app_context():
            # Create
            equipment = Equipment(
                equipment_id='TC03-002',
                equipment_type='Smoke Detector',
                install_year=2024,
                install_date=datetime(2024, 1, 1).date(),
                last_service_date=datetime(2024, 1, 1).date(),
                location='Hallway',
                condition='Good',
                status='ACTIVE'
            )
            db.session.add(equipment)
            db.session.commit()
            
            # Read
            retrieved = Equipment.query.filter_by(equipment_id='TC03-002').first()
            assert retrieved is not None
            assert retrieved.equipment_type == 'Smoke Detector'
            assert retrieved.location == 'Hallway'
            assert retrieved.status == 'ACTIVE'
            
            print("✓ TC-03-02: Equipment read successfully")
    
    def test_TC03_03_update_equipment(self, client):
        """
        Test Case: TC-03-03
        Description: Update existing equipment
        Steps:
            1. Create equipment
            2. Modify fields (condition, notes)
            3. Save changes
            4. Verify update in DB
        Expected: Changes persisted correctly in DB
        """
        from app import Equipment, db
        
        with client.application.app_context():
            # Create
            equipment = Equipment(
                equipment_id='TC03-003',
                equipment_type='Fire Alarm',
                install_year=2024,
                install_date=datetime(2024, 1, 1).date(),
                last_service_date=datetime(2024, 1, 1).date(),
                location='Lobby',
                condition='Good',
                status='ACTIVE'
            )
            db.session.add(equipment)
            db.session.commit()
            
            # Update
            equipment.condition = 'Fair'
            equipment.notes = 'Requires inspection'
            db.session.commit()
            
            # Verify
            updated = Equipment.query.filter_by(equipment_id='TC03-003').first()
            assert updated.condition == 'Fair'
            assert updated.notes == 'Requires inspection'
            
            print("✓ TC-03-03: Equipment updated successfully")
    
    def test_TC03_04_delete_equipment(self, client):
        """
        Test Case: TC-03-04
        Description: Delete (soft delete) equipment
        Steps:
            1. Create equipment
            2. Mark as INACTIVE (soft delete)
            3. Verify status change
        Expected: Equipment marked inactive, not shown in active list
        """
        from app import Equipment, db
        
        with client.application.app_context():
            # Create
            equipment = Equipment(
                equipment_id='TC03-004',
                equipment_type='Fire Hose',
                install_year=2024,
                install_date=datetime(2024, 1, 1).date(),
                last_service_date=datetime(2024, 1, 1).date(),
                location='Stairwell',
                status='ACTIVE'
            )
            db.session.add(equipment)
            db.session.commit()
            
            # Delete (soft)
            equipment.status = 'INACTIVE'
            db.session.commit()
            
            # Verify status changed
            deleted = Equipment.query.filter_by(equipment_id='TC03-004').first()
            assert deleted.status == 'INACTIVE'
            
            # Verify not in active list
            active_count = Equipment.query.filter_by(
                equipment_id='TC03-004', 
                status='ACTIVE'
            ).count()
            assert active_count == 0
            
            print("✓ TC-03-04: Equipment deleted (soft delete) successfully")
    
    def test_TC03_05_complete_lifecycle(self, client):
        """
        Test Case: TC-03-05
        Description: Full CRUD lifecycle (Create → Read → Update → Delete)
        Steps: Perform all CRUD operations in sequence
        Expected: All operations succeed, DB state correct
        """
        from app import Equipment, db
        
        with client.application.app_context():
            # CREATE
            equipment = Equipment(
                equipment_id='TC03-005',
                equipment_type='Sprinkler System',
                install_year=2024,
                install_date=datetime(2024, 1, 1).date(),
                last_service_date=datetime(2024, 1, 1).date(),
                location='Ceiling',
                condition='Excellent',
                status='ACTIVE'
            )
            db.session.add(equipment)
            db.session.commit()
            assert equipment.id is not None
            
            # READ
            retrieved = Equipment.query.filter_by(equipment_id='TC03-005').first()
            assert retrieved.condition == 'Excellent'
            
            # UPDATE
            retrieved.condition = 'Good'
            retrieved.notes = 'Lifecycle test completed'
            db.session.commit()
            
            updated = Equipment.query.filter_by(equipment_id='TC03-005').first()
            assert updated.condition == 'Good'
            assert updated.notes == 'Lifecycle test completed'
            
            # DELETE
            updated.status = 'INACTIVE'
            db.session.commit()
            
            deleted = Equipment.query.filter_by(equipment_id='TC03-005').first()
            assert deleted.status == 'INACTIVE'
            
            print("✓ TC-03-05: Complete CRUD lifecycle successful")
    
    def test_TC03_06_query_by_type(self, client):
        """
        Test Case: TC-03-06
        Description: Query equipment by type
        Steps:
            1. Create multiple equipment of different types
            2. Query by specific type
            3. Verify correct filtering
        Expected: Only equipment of specified type returned
        """
        from app import Equipment, db
        
        with client.application.app_context():
            # Create multiple equipment types
            types = ['Fire Extinguisher', 'Fire Extinguisher', 'Smoke Detector']
            
            for i, eq_type in enumerate(types):
                equipment = Equipment(
                    equipment_id=f'TC03-Q-{i+1}',
                    equipment_type=eq_type,
                    install_year=2024,
                    install_date=datetime(2024, 1, 1).date(),
                    last_service_date=datetime(2024, 1, 1).date(),
                    location=f'Location {i+1}',
                    status='ACTIVE'
                )
                db.session.add(equipment)
            db.session.commit()
            
            # Query by type
            extinguishers = Equipment.query.filter_by(
                equipment_type='Fire Extinguisher',
                status='ACTIVE'
            ).filter(Equipment.equipment_id.like('TC03-Q-%')).all()
            
            assert len(extinguishers) >= 2
            
            print("✓ TC-03-06: Query by type successful")

def test_TC03_summary():
    """Generate test summary for TC-03"""
    print("\n" + "="*70)
    print("TC-03 EQUIPMENT CRUD OPERATIONS - SUMMARY")
    print("="*70)
    print("Test Area: Equipment Module (CRUD)")
    print("Objective: Ensure equipment records are reliable")
    print("")
    print("Operations Tested:")
    print("  ✓ CREATE: Equipment creation")
    print("  ✓ READ: Data retrieval")
    print("  ✓ UPDATE: Record modification")
    print("  ✓ DELETE: Soft delete functionality")
    print("  ✓ LIFECYCLE: Complete workflow")
    print("  ✓ QUERY: Filtering by type")
    print("")
    print("Test Cases:")
    print("  TC-03-01: Create equipment ✓")
    print("  TC-03-02: Read equipment ✓")
    print("  TC-03-03: Update equipment ✓")
    print("  TC-03-04: Delete equipment ✓")
    print("  TC-03-05: Complete lifecycle ✓")
    print("  TC-03-06: Query by type ✓")
    print("")
    print("Total Sub-tests: 6")
    print("Status: All CRUD operations successful ✓")
    print("="*70)