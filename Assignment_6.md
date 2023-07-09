# 1. Determining the Highest Normal Form of a Relation Scheme

The given relation scheme "Student Performance" (StudentName, CourseNo, EnrollmentNo, Grade) has the following functional dependencies:

- StudentName, CourseNo → Grade
- EnrollmentNo, CourseNo → Grade
- StudentName → EnrollmentNo
- EnrollmentNo → StudentName

A relation is in 3NF if it is in 2NF and has no transitive dependencies. From the given dependencies, we can observe that there is a transitive dependency between StudentName and EnrollmentNo. This means that StudentName determines EnrollmentNo, and EnrollmentNo determines StudentName.

To eliminate the transitive dependency and achieve 3NF, we need to decompose the relation into two separate relations:

Relation 1: Student (StudentName, EnrollmentNo)
Relation 2: Performance (StudentName, CourseNo, Grade)

By decomposing the relation as mentioned above, we achieve 3NF. Therefore, the highest normal form of the given relation scheme is 3NF.

# 2. Suppose you are given a relation R= (A, B, C, D, E ) with the following functional dependencies:{CE →D, D→B, C →A}

Given the relation R = (A, B, C, D, E) with the following functional dependencies: {CE → D, D → B, C → A}

a. Finding all Candidate Keys:
To determine the candidate keys of relation R, we need to find the minimal superkeys that uniquely identify each tuple. 

In this case, the candidate keys are:
- CE
- CD
- CDE

b. Identifying the Best Normal Form:
To identify the best normal form that relation R satisfies (1NF, 2NF, 3NF, or BCNF), we need to evaluate the functional dependencies and the candidate keys.

From the given functional dependencies, we observe that there are no partial dependencies. Therefore, R is in at least 2NF.

c. Decomposing Relation R into BCNF:
To determine if relation R is in BCNF and if not, decompose it until it becomes BCNF, we need to analyze the functional dependencies and check for violations of BCNF.

In this case, relation R is not in BCNF since the dependency CE → D violates BCNF. To achieve BCNF, we decompose R into two separate relations:

Relation 1: R1 (CE, D)
Relation 2: R2 (D, B, C, E)

After decomposition, we re-compute the keys and the normal forms they satisfy:

Relation 1:
- Candidate Keys: CE
- Normal Form: 3NF

Relation 2:
- Candidate Keys: D
- Normal Form: BCNF

Now, both relations R1 and R2 are in BCNF.

# 3. Given the functional dependencies for relation R(A, B, C, D, E, F):  F = {ABC → D, ABD → E, CD → F, CDF → B, BF → D}

a. Finding all Keys of R:
To find all keys of relation R, we need to determine the minimal superkeys that uniquely identify each tuple.

By analyzing the given functional dependencies, the keys of relation R are:
- ABCEF
- ABDEF
- ACDEF

b. Checking Boyce-Codd Normal Form (BCNF) and Third Normal Form (3NF):
To determine if the relation is in BCNF or 3NF, we need to evaluate the functional dependencies and their implications.

- Boyce-Codd Normal Form (BCNF): A relation is in BCNF if, for every non-trivial functional dependency X → Y, X is a superkey. 

Based on the given functional dependencies, we observe that the dependency CDF → B violates BCNF since CDF is not a superkey. Therefore, the relation is not in BCNF.

- Third Normal Form (3NF): A relation is in 3NF if, for every non-trivial functional dependency X → Y, either X is a superkey or Y is a prime attribute (not part of any candidate key).

From the given functional dependencies, we can see that all the dependencies satisfy the criteria for 3NF. Thus, the relation is in 3NF.

# 4. Advantages and Disadvantages of Normalization

Normalization is a database design technique that helps organize data efficiently and reduce data redundancy. While normalization offers several advantages, it also has some disadvantages. Let's explore them:

## Advantages of Normalization:

1. Data Consistency: Normalization ensures data consistency by reducing redundancy. It eliminates data anomalies, such as update anomalies, where changes to data in one place may be inconsistent with data in other places.

2. Efficient Data Storage: Normalization minimizes data redundancy by organizing data into separate tables. This leads to efficient data storage, as each piece of data is stored only once, reducing storage requirements.

3. Simplified Updates and Maintenance: Normalized databases are easier to update and maintain. With proper table structures, changes and updates can be made to specific tables without affecting other related tables. This improves data integrity and simplifies maintenance tasks.

4. Improved Query Performance: Normalization can enhance query performance in certain cases. By reducing redundant data, queries can be executed against smaller tables, resulting in faster search and retrieval operations.

5. Flexibility and Scalability: Normalization allows for flexible and scalable database designs. As new requirements arise or data evolves, it is easier to modify and extend the database schema without affecting the entire system.

## Disadvantages of Normalization:

1. Increased Join Operations: Normalized databases often require join operations to retrieve data from multiple tables. Join operations can be computationally expensive and may impact query performance, especially when dealing with large datasets.

2. Complex Queries: Normalized databases may require complex queries involving multiple joins to retrieve desired information. This complexity can make query development and maintenance more challenging.

3. Data Integrity Dependencies: Normalization relies on maintaining relationships between tables to ensure data integrity. If these relationships are not properly managed or enforced, it can lead to data inconsistencies.

4. Denormalization Complexity: If performance considerations require denormalization, reverting to a denormalized structure can be complex and time-consuming. It requires careful consideration and planning to reintroduce redundancy without sacrificing data consistency.

5. Storage Overhead: Normalization may introduce some storage overhead due to the need for additional tables and join operations. While storage is generally more affordable today, it is still a factor to consider, especially for large-scale databases.

# 5. Decomposition of Schema R

Given the schema R = (S, T, U, V) and the functional dependencies:
- S → T
- T → U
- U → V
- V → S

We need to determine a decomposition of R into two relations, R1 and R2, such that R1 ∩ R2 ≠ ∅.

To decompose the schema, we can identify a set of relations that cover all the attributes of R and satisfy the given functional dependencies.

One possible decomposition is as follows:

Relation R1: (S, T, U)
Relation R2: (U, V)

In this decomposition, we can observe that R1 ∩ R2 ≠ ∅ since both relations share the attribute U. This intersection is necessary to preserve the functional dependency U → V.

By decomposing R into R1 and R2, we have created two separate relations that collectively represent the original schema R. Each relation maintains a subset of the attributes and satisfies the given functional dependencies.











