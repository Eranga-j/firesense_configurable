[pytest]
testpaths = tests
python_files = test_*.py
python_classes = Test*
python_functions = test_*

# Show verbose output
addopts = -v --tb=short

# Markers for test organization
markers =
    database: Tests that require database
    unit: Unit tests (no database)
    api: API endpoint tests
    slow: Slow running tests