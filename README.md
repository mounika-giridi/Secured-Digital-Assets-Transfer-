# Secure Digital Asset Transfer using Solidity

## Summary 

This project is a simple blockchain-based transaction logging system built with Solidity. It simulates secure digital asset transfer recording between authorized users.

The purpose of this project is to demonstrate practical understanding of:

- smart contract development
- access control
- secure transaction logging
- event generation
- basic security considerations in blockchain systems

This project was built as part of my portfolio to complement my academic work in blockchain-based systems and show hands-on implementation experience.

---

## Objective

The contract allows authorized users to record asset transfer entries on-chain with:

- sender
- receiver
- amount
- timestamp
- transaction reference

Note: It does **not** transfer real cryptocurrency. Instead, it creates an auditable on-chain record of transactions.

---

## Features

- owner-based authorization model
- only authorized users can log transfers
- input validation for receiver, amount, and reference
- immutable transfer records
- event logs for auditability
- simple retrieval of recorded transactions

---

## Smart Contract Logic

### 1. Ownership and Authorization 
- The contract deployer becomes the owner  
- The owner can authorize or revoke users  
- Only authorized users are allowed to log transactions  

### 2. Transfer Logging
Authorized users can log a transfer by providing:
- receiver address
- transfer amount
- transaction reference note

Each transfer is stored on-chain with a unique ID.

### 3. Data Storage

Each transaction is stored as a structured record containing:

- ID  
- sender  
- receiver  
- amount  
- timestamp (Unix format)  
- reference note  


---

## Security Considerations

This project includes basic security-focused design decisions:

- **Access control:** only authorized users can log transfers
- **Input validation:** prevents invalid addresses, empty references, and zero-value transfers
- **Auditability:** every logged transfer emits an event
- **No owner revocation bug:** the owner cannot revoke their own access accidentally

### Limitations
This is a portfolio project, not a production-ready financial system.

It does **not** include:
- token standards like ERC-20 or ERC-721
- multisig approval flows
- advanced role-based access control
- upgradeability
- frontend integration
- automated testing framework

---
## Demo Walkthrough

### 1. Contract Deployment
The contract was compiled and deployed successfully using Remix VM.

### 2. Logging Transfers
Authorized users executed the `logTransfer` function to record transactions.

### 3. State Update
The `transactionCount` increased with each successful transaction.

### 4. Data Retrieval
Stored transactions were retrieved using:

- `getTransfer(id)`
- `transfers(id)`

---

### Example Output 

### Transaction Count
transactionCount = 2

### Stored Transfer Record
- Transaction ID: 1
- Sender: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
- Receier: 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
- Amount: 100
- Timestamp: 1776112993
- Reference: invoice_01

---

## Relevance to Digital Assets & Fintech

This project demonstrates how blockchain can be used to:

- create immutable transaction records  
- ensure transparency and traceability  
- enforce access control in distributed systems  
- support audit requirements in financial environments  

It reflects core principles used in digital asset platforms and financial technology systems.

---

## Skills Demonstrated

- Solidity and smart contract development  
- Blockchain transaction modeling  
- Access control implementation  
- Input validation and secure design  
- Event-based logging and auditability  
- Data retrieval from on-chain storage  
- Technical documentation and explanation  

---

## Author

Mounika Bhargavi Giridi  
Zurich, Switzerland
