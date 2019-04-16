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
*similar to Codable. persisting data to a disk. Depends on Foundation and is used in UIKit and Foundation.*
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NSKeyedArchiver (encode objects and store data) saves data\
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NSKeyedUnarchiver (decode data from a file and decodes it into objects) retrieves data
1. [insert project link](https://github.com/RinniSwift/DataPersistence)

## FileSystem
*file system handles the persistent storage of data files, apps, and the files associated with the operating system itself. Therefore, the file system is one of the fundamental resources used by all processes*\
*At installation of an app, it creates a sandbox directory, each directory containing container directories. There are mostly 3 containers:*\
*The bundle container directory: holds the app bundle, app information*\
*The data container directory: divides into further sub directories:*\
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;*Documents, Temporary, Library, Library cache Directories*\
*The iCloud container directory*\
