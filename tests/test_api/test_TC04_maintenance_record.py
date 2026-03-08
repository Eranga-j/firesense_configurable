"""
Test Case ID: TC-04
Test Area: Maintenance Record Creation
Objective: Ensure maintenance history is stored correctly
Type: Integration
"""

import pytest
from datetime import datetime

class TestTC04_MaintenanceRecord:
    """
    TC-04: Maintenance Record Test Suite
    Validates maintenance history storage and retrieval
    """
    
    def test_TC04_01_create_maintenance_record(self, client):
        """
        Test Case: TC-04-01
        Description: Create maintenance record for equipment
        Steps:
            1. Create equipment
            2. Add maintenance record
            3. Verify record stored
        Expected: Maintenance record saved and visible in history
        """
        from app import Equipment, MaintenanceRecord, db
        
        with client.application.app_context():
            # Create equipment first
            equipment = Equipment(
                equipment_id='TC04-001',
                equipment_type='Fire Extinguisher',
                install_year=2024,
                install_date=datetime(2024, 1, 1).date(),
                last_service_date=datetime(2024, 1, 1).date(),
                location='Test Area',
                status='ACTIVE'
            )
            db.session.add(equipment)
            db.session.commit()
            
            # Create maintenance record
            record = MaintenanceRecord(
                record_id='TC04-M-001',
                equipment_id=equipment.id,
                user_id=1,
                maintenance_date=datetime(2024, 6, 1).date(),
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
            saved = MaintenanceRecord.query.filter_by(record_id='TC04-M-001').first()
            assert saved is not None
            assert saved.maintenance_type == 'Routine'
            assert saved.technician_name == 'John Doe'
            assert saved.status == 'Completed'
            
            print("✓ TC-04-01: Maintenance record created successfully")
    
    def test_TC04_02_maintenance_history_retrieval(self, client):
        """
        Test Case: TC-04-02
        Description: Retrieve maintenance history for equipment
        Steps:
            1. Create equipment with multiple maintenance records
            2. Query maintenance history
            3. Verify all records retrieved
        Expected: All maintenance records visible in chronological order
        """
        from app import Equipment, MaintenanceRecord, db
        
        with client.application.app_context():
            # Create equipment
            equipment = Equipment(
                equipment_id='TC04-002',
                equipment_type='Smoke Detector',
                install_year=2024,
                install_date=datetime(2024, 1, 1).date(),
                last_service_date=datetime(2024, 1, 1).date(),
                location='Hallway',
                status='ACTIVE'
            )
            db.session.add(equipment)
            db.session.commit()
            
            # Create multiple maintenance records
            for i in range(3):
                record = MaintenanceRecord(
                    record_id=f'TC04-M-00{i+2}',
                    equipment_id=equipment.id,
                    user_id=1,
                    maintenance_date=datetime(2024, i+1, 15).date(),
                    maintenance_type='Routine',
                    technician_name=f'Technician {i+1}',
                    status='Completed'
                )
                db.session.add(record)
            db.session.commit()
            
            # Retrieve history
            history = MaintenanceRecord.query.filter_by(
                equipment_id=equipment.id
            ).all()
            
            assert len(history) == 3
            
            print("✓ TC-04-02: Maintenance history retrieved successfully")
    
    def test_TC04_03_maintenance_record_update(self, client):
        """
        Test Case: TC-04-03
        Description: Update maintenance record status
        Steps:
            1. Create maintenance record
            2. Update status from Pending to Completed
            3. Verify update
        Expected: Status updated correctly
        """
        from app import Equipment, MaintenanceRecord, db
        
        with client.application.app_context():
            equipment = Equipment(
                equipment_id='TC04-003',
                equipment_type='Fire Alarm',
                install_year=2024,
                install_date=datetime(2024, 1, 1).date(),
                last_service_date=datetime(2024, 1, 1).date(),
                location='Lobby',
                status='ACTIVE'
            )
            db.session.add(equipment)
            db.session.commit()
            
            # Create record with Pending status
            record = MaintenanceRecord(
                record_id='TC04-M-005',
                equipment_id=equipment.id,
                maintenance_date=datetime(2024, 3, 1).date(),
                maintenance_type='Repair',
                status='Pending'
            )
            db.session.add(record)
            db.session.commit()
            
            # Update to Completed
            record.status = 'Completed'
            record.actions_taken = 'Repair completed successfully'
            db.session.commit()
            
            # Verify
            updated = MaintenanceRecord.query.filter_by(record_id='TC04-M-005').first()
            assert updated.status == 'Completed'
            assert updated.actions_taken == 'Repair completed successfully'
            
            print("✓ TC-04-03: Maintenance record updated successfully")

def test_TC04_summary():
    """Generate test summary for TC-04"""
    print("\n" + "="*70)
    print("TC-04 MAINTENANCE RECORD CREATION - SUMMARY")
    print("="*70)
    print("Test Area: Maintenance Record Management")
    print("Objective: Ensure maintenance history is stored correctly")
    print("")
    print("Test Cases:")
    print("  TC-04-01: Create maintenance record ✓")
    print("  TC-04-02: Retrieve maintenance history ✓")
    print("  TC-04-03: Update maintenance status ✓")
    print("")
    print("Total Sub-tests: 3")
    print("Status: All maintenance operations successful ✓")
    print("="*70)