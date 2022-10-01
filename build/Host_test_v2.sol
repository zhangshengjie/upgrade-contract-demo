// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;


//  MIT
interface IAuthorizeUpgrade {
     function authorizeUpgrade() external returns (bool);
}

//  MIT
contract MyContractV2 is IAuthorizeUpgrade {
    bool initialized = false;
    address public owner;

    int256 data = 0;
    int256 data2 = 10;

    constructor() {}

    function initialize(address _owner) public {
        require(!initialized, "already initialized");
        owner = _owner;
        initialized = true;
    }

    function authorizeUpgrade() external view override returns (bool) {
        return msg.sender == owner;
    }

    function transferOwner(address _owner) public {
        require(msg.sender == owner, "not authorized");
        owner = _owner;
    }

    function setData(int256 _data) public {
        data = _data;
    }

    function setData2(int256 _data) public {
        data2 = _data;
    }

    function getData() public view returns (int256) {
        return data;
    }

    function getData2() public view returns (int256) {
        return data2;
    }
}