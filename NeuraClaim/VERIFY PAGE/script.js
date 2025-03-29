document.addEventListener('DOMContentLoaded', function() {
    const insuranceIdInput = document.getElementById('insuranceId');
    const searchBtn = document.getElementById('searchBtn');
    const errorMessage = document.getElementById('errorMessage');
    const printBtn = document.getElementById('printBtn');
    const clearBtn = document.getElementById('clearBtn');
    const form = document.getElementById('insuranceForm');
    
    searchBtn.addEventListener('click', function() {
        const insuranceId = insuranceIdInput.value.trim();
        
        if (!insuranceId) {
            showError('Please enter an Insurance ID');
            return;
        }
        hideError();
        
        searchBtn.disabled = true;
        searchBtn.textContent = 'Searching...';
        
        fetch(`http://localhost:8080/NeuraClaim/get_insurance_data.php?id=${encodeURIComponent(insuranceId)}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                if (data.error) {
                    showError(data.error);
                } else {
                    populateForm(data);
                }
            })
            .catch(error => {
                showError('Error fetching data. Please try again.');
                console.error('Fetch error:', error);
            })
            .finally(() => {
                searchBtn.disabled = false;
                searchBtn.textContent = 'Search';
            });
    });
    
    printBtn.addEventListener('click', function() {
        window.print();
    });
    
    clearBtn.addEventListener('click', function() {
        clearForm();
        hideError();
    });
    
    insuranceIdInput.addEventListener('keypress', function(e) {
        if (e.key === 'Enter') {
            e.preventDefault();
            searchBtn.click();
        }
    });
    
    function populateForm(data) {
        document.getElementById('name').value = data.name || '';
        document.getElementById('fatherName').value = data.father_name || '';
        document.getElementById('aadhaarCard').value = data.aadhaar_card || '';
        document.getElementById('gender').value = data.gender || '';
        document.getElementById('bloodGroup').value = data.blood_group || '';
        document.getElementById('address').value = data.address || '';
        document.getElementById('hospitalName').value = data.hospital_name || '';
        document.getElementById('doctorName').value = data.doctor_name || '';
        document.getElementById('appointmentTime').value = data.appointment_time || '';
        document.getElementById('phoneNumber').value = data.phone_number || '';
        document.getElementById('amount').value = data.amount || '';
    }
    
    function clearForm() {
        insuranceIdInput.value = '';
        form.reset();
    }
    
    function showError(message) {
        errorMessage.textContent = message;
        errorMessage.style.display = 'block';
    }
    
    function hideError() {
        errorMessage.textContent = '';
        errorMessage.style.display = 'none';
    }
});
