# 🎵 Music Store Data Analysis - SQL Project

## 📊 Project Overview
Comprehensive SQL analysis of a music store database containing 11 interrelated tables with customer, employee, invoice, and music catalog data. This project demonstrates advanced SQL techniques to extract business insights about customer behavior, sales performance, and music preferences.

## 🗂️ Database Schema
![Database Schema](schema_diagram.jpg)

The database consists of **11 interconnected tables**:
- **Employee**: Employee information and hierarchy
- **Customer**: Customer details with support representative
- **Invoice & Invoice_Line**: Transaction records
- **Track**: Music track details with pricing
- **Album & Artist**: Music catalog organization
- **Genre & Media_Type**: Track categorization
- **Playlist & Playlist_Track**: Curated music collections

## 🎯 Business Questions Solved

### 📗 Easy Level (Question Set 1)
1. **Senior Employee Identification**: Who is the senior most employee based on job title?
2. **Invoice Analysis by Country**: Which countries have the most invoices?
3. **Top Invoice Values**: What are the top 3 values of total invoices?
4. **Best Customer City**: Which city has the highest sum of invoice totals for promotional event planning?
5. **Top Spending Customer**: Who is the best customer based on total spending?

### 📘 Moderate Level (Question Set 2)
1. **Rock Music Listeners**: Return email, first name, last name, and genre of all Rock music listeners ordered alphabetically
2. **Top Rock Artists**: Identify artists who have written the most rock music with total track count
3. **Longer Tracks Analysis**: Return track names with song length longer than average

### 📕 Advanced Level (Question Set 3)
1. **Customer Spending on Artists**: Find how much amount spent by each customer on the best-selling artist
2. **Popular Genre by Country**: Determine the most popular music genre for each country based on purchases
3. **Top Customer by Country**: Identify the customer who has spent the most money in each country

## 🛠️ Technical Skills Demonstrated

### Advanced SQL Techniques Used:
- **Recursive CTEs**: Employee hierarchy traversal to find senior-most employee
- **Window Functions**: `ROW_NUMBER()`, `AVG() OVER()` for ranking and statistical analysis
- **Complex Joins**: Multi-table joins across 5+ tables
- **Subqueries**: Nested and correlated subqueries for complex filtering
- **Aggregation Functions**: `GROUP BY` with `COUNT()`, `SUM()`, `ROUND()`, `MAX()`
- **String Functions**: `CONCAT()` for full name creation
- **Common Table Expressions (CTEs)**: For query readability and optimization
- **Filtering & Sorting**: `WHERE`, `HAVING`, `ORDER BY`, `LIMIT` clauses

## 💡 Key Insights Discovered
- Identified optimal city location for promotional music festival based on revenue analysis
- Analyzed customer spending patterns to identify high-value customers for targeted marketing
- Determined most popular music genres by geographic region for inventory optimization
- Ranked top customers by country to support personalized customer engagement strategies
- Discovered track length patterns and their correlation with purchase behavior

## 📁 Repository Structure
```
Music-Store-SQL-Analysis/
├── README.md                          # Project documentation (this file)
├── Music_store_data_ans.sql          # Complete SQL queries with solutions
├── schema_diagram.jpg                 # Database ERD diagram
├── Music-Store-Analysis-Questions.pdf # Business questions document
└── screenshots/                       # (Optional) Query result screenshots
```

## 🚀 How to Use This Project

### Prerequisites
- MySQL Server (8.0 or higher recommended)
- MySQL Workbench or any SQL client
- Music Store database (dataset)

### Running the Queries
1. Clone this repository:
   ```bash
   git clone https://github.com/[YourUsername]/Music-Store-SQL-Analysis.git
   ```
2. Import the music store database into your MySQL server
3. Open `Music_store_data_ans.sql` in MySQL Workbench
4. Execute queries individually or run the entire script
5. Review results and compare with expected outputs

## 💻 Technologies & Tools
![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)

- **Database**: MySQL
- **Query Language**: SQL
- **Concepts**: Database Design, Normalization, Data Analysis

## 📈 Learning Outcomes
Through this project, I developed proficiency in:
- Writing complex SQL queries for real-world business scenarios
- Analyzing multi-table relational databases
- Optimizing query performance using CTEs and proper indexing
- Translating business questions into actionable SQL statements
- Understanding music industry data structures and relationships

## 🔗 Connect With Me
- **LinkedIn**: [Your LinkedIn Profile]
- **GitHub**: [Your GitHub Profile]
- **Email**: [Your Email]

## 📄 License
This project is open source and available under the [MIT License](LICENSE).

## 🙏 Acknowledgments
- Dataset source: [Mention source if applicable]
- Inspired by real-world music store business intelligence needs

---

⭐ If you found this project helpful, please consider giving it a star!

**Made with ❤️ and SQL**
