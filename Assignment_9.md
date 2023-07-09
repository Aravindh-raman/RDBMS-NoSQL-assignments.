# 1. Main Features of Redis

Redis is an open-source, in-memory data structure store that provides high performance, flexibility, and a rich set of features. Here are some of its main features:

## 1. In-Memory Data Storage
- Redis primarily stores data in memory, enabling fast read and write operations. It leverages an optimized data structure called the Redis "key-value store."

## 2. Data Types and Operations
- Redis supports various data types, including strings, lists, sets, sorted sets, hashes, and more. Each data type has specific operations associated with it, allowing for efficient manipulation and retrieval of data.

## 3. Persistence Options
- Redis offers persistence options to ensure data durability. It supports two mechanisms: snapshotting (RDB) and transaction log (AOF). These mechanisms allow data to be saved to disk or append-only log files, enabling data recovery and replication.

## 4. Pub/Sub Messaging
- Redis includes a publish/subscribe messaging system. It enables real-time communication and event-driven architectures, where publishers send messages to channels, and subscribers receive and process those messages.

## 5. Distributed Caching
- Redis is often used as a distributed cache, allowing frequently accessed data to be stored in memory, resulting in reduced database load and improved application performance.

## 6. Atomic Operations
- Redis provides atomic operations, ensuring that commands execute as a single step without interference from other operations. This feature allows developers to build complex and reliable data structures.

## 7. Lua Scripting
- Redis supports Lua scripting, allowing developers to write and execute custom scripts directly on the server. This feature enables complex data manipulations and transaction-like operations.

## 8. High Availability and Replication
- Redis supports replication, allowing data to be replicated across multiple nodes, providing high availability and fault tolerance. It also offers clustering options for horizontal scaling and automatic sharding.

## 9. Geospatial Indexing
- Redis provides geospatial indexing capabilities, allowing for efficient storage and querying of geographic data. It supports operations like distance calculation, radius search, and nearest neighbor search.

These are just some of the main features that make Redis a popular choice for various use cases, including caching, real-time applications, messaging systems, and high-performance data storage.

Please note that Redis continues to evolve, and new features are regularly added to the system, expanding its capabilities and use cases.

# 2. Limitations of Redis

While Redis offers a wide range of features and benefits, it also has some limitations that you should consider when choosing it for your use case. Here are some of the main limitations of Redis:

## 1. Data Size Limitation
- Redis is limited by the amount of available memory since it stores data primarily in memory. The size of data that can be stored in Redis is limited to the available RAM, and it may not be suitable for applications requiring storage of very large datasets.

## 2. Lack of Disk Persistence
- By default, Redis stores data in memory and provides persistence options like snapshotting and transaction log. However, it does not have built-in support for disk-based persistence, which means that data durability relies on these persistence mechanisms. This limitation may impact certain use cases that require strict durability guarantees.

## 3. Limited Querying Capabilities
- Redis is primarily designed for simple key-value operations and does not provide advanced querying capabilities like SQL databases. While it supports data structures and operations for specific use cases, complex queries involving multiple criteria or joins are not directly supported.

## 4. Lack of Strong Consistency
- Redis emphasizes high performance and availability, which sometimes comes at the expense of strong consistency. It offers eventual consistency, meaning that replicas may temporarily have different versions of data until they synchronize. This limitation may not be suitable for applications that require immediate consistency guarantees.

## 5. Single-Threaded Nature
- Redis operates as a single-threaded server, which means that a single Redis instance can handle only one operation at a time. While this design choice provides simplicity and avoids locking and concurrency issues, it may limit the maximum throughput and scalability of Redis in certain scenarios.

## 6. No Built-in Security Features
- Redis does not provide built-in security features like authentication and access control. It relies on external solutions, such as firewalls or virtual private networks (VPNs), to secure the Redis deployment. This limitation may require additional efforts to ensure the security of your Redis environment.

These limitations are important considerations when evaluating Redis for your specific use case. While Redis excels in certain areas like caching and high-performance scenarios, it may not be the best choice for every application, especially when strict consistency, large datasets, or advanced querying capabilities are required.

# 3. Basic CRUD Operation Using Redis

Redis is a powerful in-memory data store that supports various data types and operations. Let's walk through a basic CRUD (Create, Read, Update, Delete) operation using Redis:

## 1. Create (Set)
To create a key-value pair in Redis, you can use the `SET` command. For example, let's create a key called "name" with the value "John Doe":

```
SET name "John Doe"
```

## 2. Read (Get)
To read the value of a key, you can use the `GET` command. Let's retrieve the value of the "name" key we created:
```
GET name
```
This will return the value "John Doe".

## 3. Update (Set)
To update the value of an existing key, you can use the `SET` command again. Let's update the value of the "name" key to "Jane Smith":
```
SET name "Jane Smith"
```
Now, if we retrieve the value of the "name" key again using `GET`, it will return "Jane Smith".

## 4. Delete
To delete a key-value pair from Redis, you can use the `DEL` command. Let's delete the "name" key:
```
DEL name
```
After executing this command, if we try to retrieve the value of the "name" key again, it will return null or an empty result.

# 4.TTL Command in Redis

The TTL (Time to Live) command in Redis is used to determine the remaining time to live for a key, which represents the duration until the key will expire and be automatically removed from the database. The TTL command allows you to check the remaining time for a key without removing it.

The syntax for the TTL command is as follows:
```
TTL key
```

Here's an example to illustrate how the TTL command works:

Suppose we have a Redis database with a key-value pair as follows:
```
SET mykey "Hello, Redis!"
```

To check the remaining time to live for the key "mykey," we can use the TTL command:
```
TTL mykey
```

If the key has not been set to expire, the TTL command will return -1, indicating that the key will never expire. If the key has an expiration time set, the TTL command will return the number of seconds remaining until the key expires. If the key does not exist, the TTL command will return -2.

For example, if the key "mykey" has an expiration time of 60 seconds remaining, the TTL command will return 60.

The TTL command is useful for scenarios where you need to track the remaining time for keys with expiration, allowing you to perform operations based on the key's remaining lifetime.

# 5. Create a transaction in redis to perform the following operations.
```
const redis = require('redis');
const client = redis.createClient();

const main = async () => {
  // Create two keys in a single line and one key differently. (one value
  // should be number)
  await client.multi();
  await client.set('first_name', 'Aravindh');
  await client.set('last_name', 'raman');
  await client.set('age', 22);

  // Read any two value in a single line
  const value1 = await client.get('first_name');
  const value2 = await client.get('last_name');

  // Increment the number value
  await client.incr('age');

  // Expire any two keys after some time
  await client.expire('first_name', 10000);
  await client.expire('last_name', 10000);

  // Execute the transaction
  const results = await client.exec();

  console.log(results);
};

main();
```


