// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;


// First basic inheritance type
contract Parent {
    function externalFunction() public pure returns (string memory) {
        return "Hello, from parent!";
    }
}

// Aunt contract
contract Aunt {
    function sayHello() public pure returns (string memory) {
        return "Hello, from Aunt!";
    }
}

// Child contract
contract Child is Parent {
    function sayHelloFromChild() public pure returns (string memory) {
        return "Hello, from child!";
    }
}

// Second inheritance type

contract Parent_f {
    function parentFunction() public pure returns (string memory) {
        return "Called from another contarct";
    }
}

contract Child_f {
    Parent_f externalContract;

    constructor(address _externalContractAddress) {
        externalContract = Parent_f(_externalContractAddress);
    }

    function callExternalFunction() public view returns (string memory) {
        return externalContract.parentFunction();
    }
}

// School system

contract School {
    
    // storage
    string public schoolName;

    constructor(string memory _name) {
        schoolName = _name;
    }

    function getSchoolName() public view returns (string memory) {
        return schoolName;
    }
}

contract StudentSystem is School {

    // Database
    struct Student {
        string name;
        uint mathScore;
        uint scienceScore;
    }

    // Mapping the student id to a student
    mapping(uint => Student) public students;

    // Creating a school within a Schooling System; 
    // Since we are inheriting, we have access to the `school name`
    constructor(string memory _schoolName) School(_schoolName){

    }

    // Add your behaviours or contract actions
    // 1. Adding student
    function addStudent(uint _id, string calldata _name, uint _mathGrade, uint _scienceGrade) public {
        // Creates the student object/struct
        students[_id] = Student(_name, _mathGrade, _scienceGrade);
    }

    // 2. Retrieve the student: Returns Student information, not the actual object.
    function getStudent(uint _id) public view returns (string memory, uint, uint) {
        Student storage student = students[_id];
        return (student.name, student.mathScore, student.scienceScore);
    }
}

// Admin Contract
contract AdminControl {
    address public admin;

    constructor() {
        admin = msg.sender;
    }

    // Create a modifier to restrict access
    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    // 1. Add contract behaviour; change admin
    function changeAdmin(address _newAdmin) public onlyAdmin {
        admin = _newAdmin;
    }
}

// ABC: needs to store string values i.e. beginner, junior, senior
// WTC: needs to store grades 
// GOAL: link them up together. Link them together.

// Exercise: WTC + ABC

contract WTC {

    // storage 
    struct Student {
        string name;
        uint formativeScore;
        uint summativeScore;
    }

    string public schoolName;

    constructor(string memory _name) {
        schoolName = _name;
    }

    mapping(uint => Student) public students;

    // Retrieve institution name
    function getInstitutionName() public view returns (string memory) {
        return schoolName;
    }

    // Add a studenr
    function addStudent(uint _id, string calldata _name, uint _formativeScore, uint _summativeScore) public {
        students[_id] = Student(_name, _formativeScore, _summativeScore);
    }

    // Retrieve student score
    function getStudent(uint _id) public view returns (string memory, uint, uint) {
        Student storage student = students[_id];
        return (student.name, student.formativeScore, student.summativeScore);
    }
}

contract ABC {

    // storage
    string instituteName;

    struct Member {
        string name;
        string academicLevel;
    }

    constructor(string memory _name) {
    }

    mapping(uint => Member) public members;

    // Retrieve institution name
    function getInsituteName() public view returns (string memory) {
        return instituteName;
    }

    // Retrieve 
}




