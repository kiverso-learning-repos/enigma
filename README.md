# Enigma
  ## Self Assessment
  1. **Functionality - 3**
    All functionality needed for a 3 is complete. My enigma class is able to encrypt and decrypt from the arguments passed,
    and from files that it reads. 
    Encrypt runner file takes arguments of 2 filepaths, it reads the first file, enciphers the contents, and writes
    the enciphered message to the 2nd filepath argument. Decipher takes 4 arguments, reads the file from the first argument,
    decyphers it based on the key given as the 3rd argument and date given as the 4th argument. It then writes the decrypted
    message to the 2nd filepath argument.
      
  2. **OOP - 3**
    The project is broken down into logical components. The Shift class, CipherText class, and PlainText class all
    exist without creating or interacting with other classes from within the class. Enigma contains all interaction between
    classes. Each class has single responsibility, Shift is responsible for generating shift values for encryption. Message 
    and its children, PlainText and CipherText are responsible for shifting the characters in the message to either encrypt 
    or decrypt. Enigma is responsible putting the classes together and building the outputs for the runners. Encrypt and decrypt 
    are runner files for the command line interface.
    
  3. **Ruby Conventions - 3**
    Classes are not excessively long. Methods do not exceed 10 lines. Most enumerables and data structures are most appropriate
    for the job. Hashes are used to build the shift values, with a letter corresponding with the A shift, B Shift, C shift,
    D shift pointing to the corresponding shift value, i.e. `{:A => 1, :B => 2}`.
    
  4.  **TDD - 4** 
    Every method is unit and integration tested. Methods that do multiple things test that each thing it does was completed
    correctly. Stubs are used to test randomness such as in the generation of a key. They are also used for testing user input,
    and for the date as the program is designed to get today's date, which will change each day. Edge cases are addressed such
    as random number generation that does not have 5 digits, and testing messages with non encryptable characters. Test 
    coverage is at 100 percent. Tests are written before methods.
    
  5.  **Version Control - 3**
    Pull requests feature a lot of comments to describe what is changed and why design decisions were made in that branch.
    Pull requests feature related functionality. Code is not committed on master branch. 48 commits were made. Some commits
    feature more than 3 pieces of functionality, although these consist mainly of migrating methods from one class to another.
    
