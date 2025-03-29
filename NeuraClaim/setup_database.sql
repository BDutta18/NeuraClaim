
CREATE DATABASE IF NOT EXISTS insurance_db;
USE insurance_db;


CREATE TABLE IF NOT EXISTS insurance_records (
    id INT AUTO_INCREMENT PRIMARY KEY,
    insurance_id VARCHAR(12) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    father_name VARCHAR(100) NOT NULL,
    aadhaar_card VARCHAR(16) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    blood_group VARCHAR(5) NOT NULL,
    address TEXT NOT NULL,
    hospital_name VARCHAR(100) NOT NULL,
    doctor_name VARCHAR(100) NOT NULL,
    appointment_time DATETIME NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    amount VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO insurance_records (
    insurance_id, name, father_name, aadhaar_card, gender, blood_group, 
    address, hospital_name, doctor_name, appointment_time, phone_number, amount
) VALUES
('INS12345678', 'Ravi Kumar', 'Mohan Kumar', '1234 5678 9101', 'Male', 'O+', 
 '123, Main Street, Delhi', 'Apollo Hospital', 'Dr. Rajesh Sharma', 
 '2025-03-28 10:30:00', '9876543210', '₹50,000'),

('INS23456789', 'Priya Sharma', 'Rajesh Sharma', '2345 6789 1011', 'Female', 'A-', 
 '45, Green Park, Mumbai', 'Fortis Hospital', 'Dr. Anita Verma', 
 '2025-03-29 11:00:00', '9765432109', '₹70,000'),

('INS34567890', 'Deepak Singh', 'Harish Singh', '3456 7890 1122', 'Male', 'B+', 
 '34, Lakeview Road, Bangalore', 'Manipal Hospital', 'Dr. Suresh Reddy', 
 '2025-03-30 14:15:00', '8123456789', '₹55,000'),

('INS45678901', 'Neha Gupta', 'Sanjay Gupta', '4567 8901 2233', 'Female', 'AB+', 
 '67, Sunrise Avenue, Chennai', 'KMCH Hospital', 'Dr. Priya Kumar', 
 '2025-03-31 09:45:00', '9345678901', '₹65,000'),

('INS56789012', 'Anil Kumar', 'Vinod Kumar', '5678 9012 3344', 'Male', 'O-', 
 '99, MG Road, Pune', 'Ruby Hall Clinic', 'Dr. Sanjay Thakur', 
 '2025-04-01 15:00:00', '9876543212', '₹45,000'),

('INS67890123', 'Ayesha Khan', 'Imran Khan', '6789 0123 4455', 'Female', 'B-', 
 '21, Sector 22, Noida', 'Max Hospital', 'Dr. Shashi Patel', 
 '2025-04-02 11:30:00', '8134567890', '₹60,000'),

('INS78901234', 'Rohit Patel', 'Anand Patel', '7890 1234 5566', 'Male', 'A+', 
 '12, Park Street, Kolkata', 'AMRI Hospitals', 'Dr. Rina Mehta', 
 '2025-04-03 13:00:00', '9745612345', '₹75,000'),

('INS89012345', 'Simran Kaur', 'Gurdip Singh', '8901 2345 6677', 'Female', 'AB-', 
 '30, Jalandhar Road, Ludhiana', 'Dayanand Medical College', 'Dr. Harvinder Singh', 
 '2025-04-04 10:00:00', '9876123456', '₹50,000'),

('INS90123456', 'Kunal Mehta', 'Subhash Mehta', '9012 3456 7788', 'Male', 'O+', 
 '45, Shivaji Nagar, Hyderabad', 'Yashoda Hospital', 'Dr. Anand Gopal', 
 '2025-04-05 12:30:00', '8345678901', '₹80,000'),

('INS01234567', 'Pooja Joshi', 'Anil Joshi', '0123 4567 8899', 'Female', 'A-', 
 '12, Seema Apartment, Jaipur', 'SMS Hospital', 'Dr. Neha Arora', 
 '2025-04-06 14:00:00', '9333456789', '₹95,000');

-- Create index for faster searches
CREATE INDEX idx_insurance_id ON insurance_records(insurance_id);
