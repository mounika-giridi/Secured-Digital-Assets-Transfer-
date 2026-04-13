// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SecureAssetTransfer {
    address public owner;
    uint256 public transactionCount;

    struct TransferRecord {
        uint256 id;
        address sender;
        address receiver;
        uint256 amount;
        uint256 timestamp;
        string referenceNote;
    }

    mapping(uint256 => TransferRecord) public transfers;
    mapping(address => bool) public authorizedUsers;

    event UserAuthorized(address indexed user);
    event UserRevoked(address indexed user);
    event TransferLogged(
        uint256 indexed id,
        address indexed sender,
        address indexed receiver,
        uint256 amount,
        string referenceNote
    );

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }

    modifier onlyAuthorized() {
        require(authorizedUsers[msg.sender], "Not an authorized user");
        _;
    }

    constructor() {
        owner = msg.sender;
        authorizedUsers[msg.sender] = true;
    }


    function authorizeUser(address user) external onlyOwner {
        require(user != address(0), "Invalid address");
        require(!authorizedUsers[user], "User already authorized");

        authorizedUsers[user] = true;
        emit UserAuthorized(user);
    }

    /**
     * @notice Revoke a user's permission to log transfers.
     * @param user Address to revoke.
     */
    function revokeUser(address user) external onlyOwner {
        require(user != address(0), "Invalid address");
        require(user != owner, "Cannot revoke owner");

        authorizedUsers[user] = false;
        emit UserRevoked(user);
    }


    function logTransfer(
        address receiver,
        uint256 amount,
        string calldata referenceNote
    ) external onlyAuthorized {
        require(receiver != address(0), "Invalid receiver");
        require(receiver != msg.sender, "Sender and receiver cannot be the same");
        require(amount > 0, "Amount must be greater than zero");
        require(bytes(referenceNote).length > 0, "Reference cannot be empty");
        require(bytes(referenceNote).length <= 100, "Reference too long");

        transactionCount++;

        transfers[transactionCount] = TransferRecord({
            id: transactionCount,
            sender: msg.sender,
            receiver: receiver,
            amount: amount,
            timestamp: block.timestamp,
            referenceNote: referenceNote
        });

        emit TransferLogged(
            transactionCount,
            msg.sender,
            receiver,
            amount,
            referenceNote
        );
    }


    function getTransfer(uint256 id) external view returns (TransferRecord memory) {
        require(id > 0 && id <= transactionCount, "Transfer does not exist");
        return transfers[id];
    }

    function isAuthorized(address user) external view returns (bool) {
        return authorizedUsers[user];
    }
}
