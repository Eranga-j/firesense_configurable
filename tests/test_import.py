# test_import.py
import sys
import os

def test_can_import_app():
    """Test that we can import app"""
    sys.path.insert(0, os.path.dirname(os.path.dirname(__file__)))
    
    try:
        from app import app
        assert app is not None
        print("✓ Successfully imported app!")
    except ImportError as e:
        print(f"✗ Failed to import: {e}")
        raise

def test_app_name():
    """Test app configuration"""
    sys.path.insert(0, os.path.dirname(os.path.dirname(__file__)))
    
    from app import app
    assert app.name == 'app'