# 🏦 Bank Database Project

<img src="https://media.istockphoto.com/photos/carved-stone-bank-sign-above-a-door-picture-id476244284?k=6&m=476244284&s=612x612&w=0&h=XEbQ54I2MCmQ6sSJkobXW8Ax1mCD_jeEwXvgLDc0l6o=">

## Overview

Welcome to the Bank Database Project repository! This project focuses on creating a robust relational database for a bank, complete with tables, dummy data, stored procedures, triggers, and transactions. Additionally, a simple interface using Flask, HTML, and CSS has been developed to interact with the database and execute queries.

## Table of Contents

- 🏗 [Database Structure](#database-structure)
- 📁 [Files](#files)
- 📝 [Queries](#queries)
- 🔄 [Stored Procedures](#stored-procedures)
- ⚡ [Triggers](#triggers)
- 💼 [Transactions](#transactions)
- 💻 [Interface](#interface)
- 🚀 [Getting Started](#getting-started)
- 🤝 [Contributing](#contributing)

## Database Structure

<p align="center">
  <img src="https://github.com/mahfeshar/Bank-DB-project/blob/main/Diagrams/er_bank.png" width="350" alt="ER Diagram">
  <img src="https://github.com/mahfeshar/Bank-DB-project/blob/main/Diagrams/Relational.png" width="400" alt="Relational">
</p>

The relational database is designed to capture essential banking entities such as customers, accounts, transactions, and more. The ER diagram and Relational Diagram above illustrates the relationships between different tables.

## Files

1. *DDL.sql*: Contains Data Definition Language (DDL) statements to create the necessary tables.
2. *InsertData.sql*: Includes SQL statements to insert dummy data into the created tables.
3. *Queries*: Contains three files (query1.sql, query2.sql, and query3.sql) for testing various queries.
4. *Diagrams*: This folder holds graphical representations of the database structure using diagrams.
5. *Advanced*: This folder holds advanced database components, including stored procedures, triggers, and transactions.
6. *Interface*: This folder contains files related to the user interface, including HTML, CSS, and Python code for implementing a simple web interface.

## Queries

Explore and test different queries using the files in the queries_folder. Each file is named according to its purpose.

## Stored Procedures

The project includes stored procedures to streamline complex database operations. Check the stored_procedures.sql file for more details.

## Triggers

Triggers are implemented to automate actions based on specific events. Refer to the triggers.sql file for trigger definitions.

## Transactions

Transactions ensure the integrity of the database by grouping multiple SQL operations into a single, atomic unit. The transactions.sql file demonstrates the use of transactions in the banking context.

## Interface

A simple web interface has been developed using Flask, HTML, and CSS. This allows users to interact with the database and execute queries seamlessly.


## Getting Started

Follow these steps to set up the project locally:

1. Clone the repository: git clone https://github.com/mahfeshar/bank-db-project.git
2. Execute DDL.sql to create the database tables.
3. Run InsertData.sql to populate the tables with dummy data.
4. Explore the queries_folder and execute queries as needed.
5. Check out the interface by navigating to the Interface folder.

## Contributing

If you'd like to contribute to the project, feel free to fork the repository and submit a pull request. Please follow the established coding and documentation conventions.

---

Feel free to reach out if you have any questions or feedback! Happy coding! 🚀
