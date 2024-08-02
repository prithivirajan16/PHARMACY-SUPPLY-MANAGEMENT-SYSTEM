-- Table 1: Medical Company
CREATE TABLE Medical_Company (
    Mc_id VARCHAR(5) PRIMARY KEY,
    Mc_name VARCHAR(25),
    Location VARCHAR(100), 
);

-- Table 2: CWH
CREATE TABLE CWH (
    CWH_ID VARCHAR(5) PRIMARY KEY,
    Location VARCHAR(100),
    Capacity INT,
    Mc_id VARCHAR(5),
    FOREIGN KEY (Mc_id) REFERENCES Medical_Company(Mc_id)
);

-- Table 3: Factory
CREATE TABLE Factory (
    F_ID VARCHAR(5) PRIMARY KEY,
    F_loc VARCHAR(100),
    Capacity INT,
    Mc_id VARCHAR(5),
    Number_of_Employees INT,
    FOREIGN KEY (Mc_id) REFERENCES Medical_Company(Mc_id)
);

-- Table 4: Agent
CREATE TABLE Agent (
    A_ID VARCHAR(5) PRIMARY KEY,
    A_name VARCHAR(100),
    A_Loc VARCHAR(100),
    CWH_ID VARCHAR(5),
    A_contact VARCHAR(15),
    FOREIGN KEY (CWH_ID) REFERENCES CWH(CWH_ID)
);

-- Table 5: Distributor
CREATE TABLE Distributor (
    D_ID VARCHAR(5) PRIMARY KEY,
    A_ID VARCHAR(5),
    D_Loc VARCHAR(100),
    D_Contact VARCHAR(15),
    O_ID VARCHAR(5),
    FOREIGN KEY (A_ID) REFERENCES Agent(A_ID)
);

-- Table 6: Hospital
CREATE TABLE Hospital (
    H_ID VARCHAR(5) PRIMARY KEY,
    H_Name VARCHAR(100),
    D_ID VARCHAR(5),
    H_Contact VARCHAR(15),
    FOREIGN KEY (D_ID) REFERENCES Distributor(D_ID)
);

-- Table 7: E_Pharmacy
CREATE TABLE E_Pharmacy (
    EPH_ID VARCHAR(5) PRIMARY KEY,
    EPH_Name VARCHAR(100),
    A_ID VARCHAR(5),
    EPH_Contact VARCHAR(15),
    FOREIGN KEY (A_ID) REFERENCES Agent(A_ID)
);

-- Table 8: Customer
CREATE TABLE Customer (
    Cus_ID VARCHAR(5) PRIMARY KEY,
    Cus_name VARCHAR(100),
    Dob DATE,
    Age INT,
    Cus_add VARCHAR(255)
);

-- Table 9: Medicine
CREATE TABLE Medicine (
    M_ID VARCHAR(5) PRIMARY KEY,
    M_Name VARCHAR(100),
    M_Date DATE,
    Price DECIMAL(10, 2),
    F_ID VARCHAR(5),
    Expiry_Date DATE,
    FOREIGN KEY (F_ID) REFERENCES Factory(F_ID)
);

-- Table 10: Orders
CREATE TABLE Orders (
    O_ID VARCHAR(5) PRIMARY KEY,
    M_ID VARCHAR(5),
    A_ID VARCHAR(5),
    Ordered_by VARCHAR(100),
    Quantity INT,
    Order_date DATE,
    Delivery_date DATE,
    Total_price DECIMAL(10, 2),
    FOREIGN KEY (M_ID) REFERENCES Medicine(M_ID),
    FOREIGN KEY (A_ID) REFERENCES Agent(A_ID)
);

-- Table 11: Doctor
CREATE TABLE Doctor (
    Doc_Lisense VARCHAR(50) PRIMARY KEY,
    Doc_name VARCHAR(100),
    Specialization VARCHAR(100),
    Qualification VARCHAR(100),
    H_ID VARCHAR(5),
    FOREIGN KEY (H_ID) REFERENCES Hospital(H_ID)
);

-- Table 12: Employee
CREATE TABLE Employee (
    E_id VARCHAR(5) PRIMARY KEY,
    E_name VARCHAR(100),
    Dob DATE,
    Age INT,
    Salary DECIMAL(10, 2),
    Position VARCHAR(100),
    E_contact VARCHAR(15),
    Calls INT,
    Sales INT
);
