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

