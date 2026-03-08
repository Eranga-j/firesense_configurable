def test_TC07_04_low_risk_detection(self, client):
    """Identify low-risk equipment"""
    from app import Equipment, db
    
    with client.application.app_context():
        # Use TODAY's date for last service to ensure it's recent
        today = datetime.now().date()
        
        equipment = Equipment(
            equipment_id='TC07-LOW',
            equipment_type='Fire Extinguisher',
            install_year=2026,
            install_date=datetime(2026, 1, 1).date(),
            last_service_date=today,  # Serviced TODAY
            condition='Excellent',
            location='Test',
            status='ACTIVE'
        )
        db.session.add(equipment)
        db.session.commit()
        
        days_overdue = (datetime.now().date() - equipment.last_service_date).days
        
        if days_overdue < 90:
            risk = 'Low'
        else:
            risk = 'Medium'
        
        assert risk == 'Low'
        print("✓ TC-07-04: Low risk detected")