//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Library {
    struct Book {
        uint256 id;
        string name;
        uint256 year;
        string author;
        bool finished;
    }

    Book[] private bookList;

    // mapping book id to the wallet address of the owner
    mapping(uint256 => address) bookToOwner;

    event AddBook(address recipient, uint bookId);

    function addBook(
        string memory name,
        uint16 year,
        string memory author,
        bool finished
    ) external {
        uint bookId = bookList.length;
        bookList.push(Book(bookId, name, year, author, finished));
        bookToOwner[bookId] = msg.sender;
        emit AddBook(msg.sender, bookId);
    }
}
