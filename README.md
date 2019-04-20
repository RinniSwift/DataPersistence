# Data Persistence in iOS development
*includes various options for saving data locally: Core Data, Realm, NSCoder, UserDefaults, and Keychain*

---

## Plist
*A property list XML file that contains key-value data. Used to store small data such as API keys, error messages, and others such as requiring permission for images.*
1. [PracticePlist](https://github.com/RinniSwift/DataPersistence/tree/master/PracticePlist)\
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*how to write function to read from the plist file*

## User Defaults
*An interface to the users defaults database. Used to store small data as key value pairs*
1. [PracticePlist](https://github.com/RinniSwift/DataPersistence/tree/master/PracticePlist)

## Unit Testing
*creating tests with XCTests or UITests*
1. [UnitTestingProj](https://github.com/RinniSwift/DataPersistence/tree/master/UnitTestingProj)

## Keychain
*keychains store sensitive information. They can be shared within different apps. these keys are saved in a container which is saved in the OS. Information can be created, updated, and deleted*
1. [KeyChainProject](https://github.com/RinniSwift/DataPersistence/tree/master/KeyChainProject)\
Used KeychainSwift library to implement helper functions to retrieve and save data to keychain.\
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[KeychainSwift library](https://github.com/evgenyneu/keychain-swift#keychain_access_groups) implementation:\
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. 'pod init' into the project\
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. add text in the podfile indicated in the link\
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3. 'pod install'\
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4. open the workspace and start using the helper functions by 'import KeychainSwift' in the file.

## NSCoding
*similar to Codable. persisting data to a disk. Depends on Foundation an is used in UIKit and Foundation.*
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NSKeyedArchiver (encode objects and store data) saves data\
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NSKeyedUnarchiver (decode data from a file and decodes it into objects) retrieves data
1. [insert project link](https://github.com/RinniSwift/DataPersistence)

## FileSystem
*file system handles the persistent storage of data files, apps, and the files associated with the operating system itself. Therefore, the file system is one of the fundamental resources used by all processes*\
*At installation of an app, it creates a sandbox directory, each directory containing container directories. There are mostly 3 containers:*\
*The bundle container directory: holds the app bundle, app information*\
*The data container directory: divides into further sub directories:*\
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*Documents, Temporary, Library, Library cache Directories*\
*The iCloud container directory*

## Core Data
Core data is a framework that allows storing and retrieving data from a database in an object oriented way. Core data allows easy to access to map objects in your apps to the data base without knowing SQL. This object-oriented application contains interrelated objects where objects are linked to each other by owning, containing, or holding a reference to another object. This web of objects is called an **object graph** -- an abstract structure that can be used to describe an applications state at a particular point in time.\
Core data provides a layer of abstraction on top of the database (SQLite) that provides a convenient API for mainting the relationships between records stored in the database. And in the context of apple's *MVC*, Core data fits in the '*M*' acting as the model as it manages the entire database.

#### Components
* NSManagedObjectModel
* NSManagedObjectContext
* NSPersistentStoreCoordinator
* NSManagedObject **:** Defines the data Each entity is an NSManagedObject which contains attributes for each
* NSPersistentContainer **:** Deals with the boilerplate code. Sets up all the contents to use core data.
* NSPersistentStore **:** Connected with the persistent store coordinator Used to declare what format to persist data in: *SQLite*, *Atomic*, *XML*, *In-memory*


**Star components in the Core Data stack are**

| managed object model  | managed object context  | persistent store coordinator |
| --------------------- |:-----------------------:| :---------------------------:|
| One single instance within the application, represents the data model | The scratchboard when accessing data, manages a collection of NSManagedObjects| The heart of the core data stack. It is accessed and interacted by the managed object context. Responsible for reading from and writing to the disk|

| NSPersistentContainer: |
|:----------------------------------------------|
| formulates the following                      |
|1. creates new object model from our data model |
|2. creates persistent store coordinator object  |
|3. sets up url pointer of where the data is in the database|
|4. loads database into the persistent store coordinator |
|5. creates a managed object context and points it to the persistent store coordinator|
