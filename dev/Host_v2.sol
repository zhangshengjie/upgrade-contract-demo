// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

// OpenZeppelin Contracts (last updated v4.7.0) (utils/StorageSlot.sol)
library StorageSlot {
    struct AddressSlot {
        address value;
    }

    /**
     * @dev Returns an `AddressSlot` with member `value` located at `slot`.
     */
    function getAddressSlot(bytes32 slot)
        internal
        pure
        returns (AddressSlot storage r)
    {
        /// @solidity memory-safe-assembly
        assembly {
            r.slot := slot
        }
    }
}

contract MyContract {
    /**
     * @dev Storage slot with the admin of the contract.
     * This is the keccak-256 hash of "eip1967.proxy.admin" subtracted by 1, and is
     * validated in the constructor.
     */
    bytes32 internal constant _ADMIN_SLOT =
        0xb53127684a568b3173ae13b9f8a6016e243e63b6e8ee1178d6a717850b5d6103;

    int256 data = 0;

    int256 data2 = 10;

    constructor() {}

    function initialize(address _owner) public {
        require(_owner != address(0), "owner cannot be zero address");
        require(
            StorageSlot.getAddressSlot(_ADMIN_SLOT).value == address(0),
            "already initialized"
        );
        StorageSlot.getAddressSlot(_ADMIN_SLOT).value = _owner;
    }

    function transferOwner(address _owner) public {
        require(
            msg.sender == StorageSlot.getAddressSlot(_ADMIN_SLOT).value,
            "not authorized"
        );
        StorageSlot.getAddressSlot(_ADMIN_SLOT).value = _owner;
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
