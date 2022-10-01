// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

interface IAuthorizeUpgrade {
     function authorizeUpgrade() external returns (bool);
}