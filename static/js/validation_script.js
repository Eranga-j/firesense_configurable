// Add this JavaScript validation to your add_equipment.html
// Place it in the saveEquipment function BEFORE sending data to server

// Enhanced validation for equipment form
function validateEquipmentDates() {
    const installDate = document.getElementById('installDate').value;
    const lastServiceDate = document.getElementById('lastServiceDate').value;
    
    if (!installDate) {
        showToast('Please select an installation date', 'error');
        return false;
    }
    
    if (!lastServiceDate) {
        showToast('Please select a last service date', 'error');
        return false;
    }
    
    const install = new Date(installDate);
    const lastService = new Date(lastServiceDate);
    const today = new Date();
    today.setHours(0, 0, 0, 0); // Reset time to start of day
    
    // Check if install date is in the future
    if (install > today) {
        showToast('Installation date cannot be in the future', 'error');
        document.getElementById('installDate').focus();
        return false;
    }
    
    // Check if last service date is in the future
    if (lastService > today) {
        showToast('Last service date cannot be in the future', 'error');
        document.getElementById('lastServiceDate').focus();
        return false;
    }
    
    // Check if last service is before installation
    if (lastService < install) {
        const installDateStr = install.toLocaleDateString();
        const serviceDateStr = lastService.toLocaleDateString();
        showToast(
            `Last service date (${serviceDateStr}) cannot be before installation date (${installDateStr})`,
            'error'
        );
        document.getElementById('lastServiceDate').focus();
        return false;
    }
    
    return true;
}

// UPDATE YOUR saveEquipment FUNCTION:
async function saveEquipment(event) {
    event.preventDefault();
    
    // ADD THIS VALIDATION CHECK FIRST
    if (!validateEquipmentDates()) {
        return; // Stop if validation fails
    }
    
    // Rest of your existing code...
    const equipmentData = {
        equipment_type: document.getElementById('equipmentType').value,
        // ... rest of fields
    };
    
    // ... rest of your save logic
}
