# test_first.py
import pytest

def test_example():
    """First test to verify pytest works"""
    assert 1 + 1 == 2

def test_firesense():
    """Test string operations"""
    assert "Fire" in "FireSense"

class TestBasic:
    def test_add(self):
        assert 2 + 2 == 4
    
    def test_multiply(self):
        assert 3 * 4 == 12