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





